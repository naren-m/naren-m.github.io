---
title: Media Collection
layout: note
---

# Media Collection

> Books, articles, videos, podcasts, and curated content highlights.

## 📚 All Notes

{% assign media_notes = site.notes | where_exp: "note", "note.path contains 'media/'" | sort: "title" %}
{% if media_notes.size > 0 %}
This collection contains **{{ media_notes.size }} items**:

<ul>
{% for note in media_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% else %}
_No notes available yet in this section._
{% endif %}

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover specific media notes.

## 🏷️ Tags

`#books` `#highlights` `#articles` `#videos` `#podcasts` `#reading-notes`

---

[← Back to Home](/)
