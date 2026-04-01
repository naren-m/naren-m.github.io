---
title: History & Cultural Studies
layout: note
---

# History & Cultural Studies

> Historical analysis, cultural studies, and Indological research.

## 📚 All Notes

{% assign history_notes = site.notes | where_exp: "note", "note.path contains 'history/'" | sort: "title" %}
{% if history_notes.size > 0 %}
This collection contains **{{ history_notes.size }} notes**:

<ul>
{% for note in history_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% else %}
_No notes available yet in this section._
{% endif %}

### 🔗 Related Domains

- **[[sanskrit-literature|Sanskrit Literature]]**: Classical texts and historical context
- **[[people|People]]**: Historical figures and scholars

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover historical notes.

## 🏷️ Tags

`#history` `#india` `#indology` `#cultural-studies`

---

[← Back to Home](/)
