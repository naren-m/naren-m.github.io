# frozen_string_literal: true

require 'fileutils'
require 'open3'
require 'pathname'
require 'jekyll-last-modified-at'

module Recents
  # Generate change information for all markdown pages
  class Generator < Jekyll::Generator
    LITERATURE_NOTES_MAPPINGS = {
      '_notes/computer-science/' => 'content/domains/computer-science/',
      '_notes/sanskrit-literature/' => 'content/domains/humanities/sanskrit-literature/',
      '_notes/history/' => 'content/domains/humanities/history/',
      '_notes/mathematics/' => 'content/domains/mathematics/',
      '_notes/media/' => 'content/media/',
      '_notes/people/' => 'content/people/',
      '_notes/music/' => 'music/',
      '_notes/pages/' => 'pages/',
      '_notes/finances/' => 'finances/',
      '_notes/wellness/' => 'content/domains/wellness/'
    }.freeze

    def generate(site)
      items = site.collections['notes'].docs
      items.each do |page|
        relative_path = relative_path_for(site, page)
        timestamp = git_timestamp(site.source, relative_path) ||
                    literature_notes_timestamp(site.source, relative_path) ||
                    jekyll_last_modified_at(site.source, page.path)

        page.data['last_modified_at'] = timestamp
        page.data['last_modified_at_timestamp'] = timestamp
      end
    end

    private

    def relative_path_for(site, page)
      return page.relative_path if page.respond_to?(:relative_path)

      path = Pathname.new(page.path)
      source = Pathname.new(site.source)
      path.absolute? ? path.relative_path_from(source).to_s : path.to_s
    end

    def git_timestamp(repo_path, relative_path)
      return nil unless relative_path

      output, _error, status = Open3.capture3(
        'git', '-C', repo_path, 'log', '-1', '--follow',
        '--format=%cI', '--', relative_path
      )
      return nil unless status.success?

      timestamp = output.strip
      timestamp.empty? ? nil : timestamp
    end

    def literature_notes_timestamp(site_source, relative_path)
      literature_path = literature_notes_path(relative_path)
      return nil unless literature_path

      submodule_path = File.join(site_source, 'literature-notes')
      return nil unless File.directory?(submodule_path)
      return nil unless File.exist?(File.join(submodule_path, literature_path))

      git_timestamp(submodule_path, literature_path)
    end

    def literature_notes_path(relative_path)
      LITERATURE_NOTES_MAPPINGS.each do |notes_prefix, literature_prefix|
        next unless relative_path.start_with?(notes_prefix)

        return relative_path.sub(notes_prefix, literature_prefix)
      end

      nil
    end

    def jekyll_last_modified_at(site_source, page_path)
      Jekyll::LastModifiedAt::Determinator.new(site_source, page_path, '%FT%T%:z').to_s
    end
  end
end
