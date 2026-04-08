---
title: History & Cultural Studies
layout: note
---

# History & Cultural Studies

> Historical analysis, cultural studies, and Indological research.

## 🏛️ Topics

- [[Angkor Wat]] - Historical architecture and cultural significance
- [[Aryan Invasion Theory]] - Historical debate and analysis
- [[Indology]] - Academic study of Indian culture and history

## 🔗 Related Domains

- **[[sanskrit-literature|Sanskrit Literature]]**: Classical texts and historical context
- **[[people|People]]**: Historical figures and scholars

## 📚 All Notes

{% assign history_notes = site.notes | where_exp: "note", "note.path contains 'history/'" | sort: "title" %}
{% if history_notes.size > 0 %}
<ul>
{% for note in history_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% endif %}

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover historical notes.

## 🏷️ Tags

`#history` `#india` `#indology` `#cultural-studies`

---

[← Back to Home](/)
