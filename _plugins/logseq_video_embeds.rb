# frozen_string_literal: true

require 'cgi'
require 'uri'

# Notes come from a Logseq vault, which embeds videos with `{{video URL}}`.
# Liquid reads `{{ ... }}` as its own syntax, warns, and drops the line.
#
# 1. Before rendering, swap each macro for an HTML comment placeholder, so
#    Liquid never sees it and kramdown passes it through untouched.
# 2. After Markdown conversion, swap each placeholder for the real HTML.
#    (kramdown escapes an <iframe> written inside a list item, which is
#    where these macros usually sit.)
#
# YouTube URLs become a youtube-nocookie player; anything else a plain link.
module LogseqVideoEmbeds
  MACRO = /\{\{\s*video\s+(\S+?)\s*\}\}/
  PLACEHOLDER = /<!--logseq-video:(\S+?)-->/
  YOUTUBE_ID = /\A[\w-]{11}\z/

  module_function

  def html_for(url)
    id, start = youtube_id_and_start(url)
    escaped = CGI.escapeHTML(url)
    return %(<a href="#{escaped}">#{escaped}</a>) unless id

    src = "https://www.youtube-nocookie.com/embed/#{id}"
    src += "?start=#{start}" if start
    %(<span class="video-embed"><iframe src="#{src}" title="YouTube video" loading="lazy" ) +
      %(allow="encrypted-media; picture-in-picture" allowfullscreen></iframe></span>)
  end

  def youtube_id_and_start(url)
    uri = URI.parse(url)
    host = uri.host.to_s.sub(/\Awww\./, '').sub(/\Am\./, '')
    params = URI.decode_www_form(uri.query.to_s).to_h
    id =
      case host
      when 'youtu.be' then uri.path.delete_prefix('/')
      when 'youtube.com' then params['v'] || uri.path[%r{\A/(?:shorts|embed|live)/([\w-]+)}, 1]
      end
    return nil unless id&.match?(YOUTUBE_ID)

    start = (params['t'] || params['start']).to_s[/\A(\d+)s?\z/, 1]
    [id, start]
  rescue URI::InvalidURIError, ArgumentError
    nil
  end

  class Generator < Jekyll::Generator
    priority :high

    def generate(site)
      (site.collections['notes'].docs + site.pages).each do |doc|
        next unless doc.content&.include?('{{')

        doc.content = doc.content.gsub(MACRO) do
          "<!--logseq-video:#{CGI.escape(Regexp.last_match(1))}-->"
        end
      end
    end
  end
end

Jekyll::Hooks.register [:notes, :pages], :post_convert do |doc|
  next unless doc.content&.include?('<!--logseq-video:')

  doc.content = doc.content.gsub(LogseqVideoEmbeds::PLACEHOLDER) do
    LogseqVideoEmbeds.html_for(CGI.unescape(Regexp.last_match(1)))
  end
end
