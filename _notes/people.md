---
title: People & Biographies
layout: note
---

# People & Biographies

> Notable thinkers, scholars, scientists, and contributors across various domains.

## 📚 All Notes

{% assign people_notes = site.notes | where_exp: "note", "note.path contains 'people/'" | sort: "title" %}
{% if people_notes.size > 0 %}
This collection contains **{{ people_notes.size }} biographical notes**:

<ul>
{% for note in people_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% else %}
_No notes available yet in this section._
{% endif %}

### 🎯 Domains Represented

- **[[sanskrit-literature|Sanskrit & Linguistics]]**: Classical scholars and grammarians
- **[[computer-science|Computer Science]]**: Pioneers in programming and Unix
- **Science**: Researchers and communicators
- **Philosophy**: Thinkers and spiritual leaders

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover biographical notes.

## 🏷️ Tags

`#biography` `#scholars` `#scientists` `#thinkers` `#contributors`

---

[← Back to Home](/)
