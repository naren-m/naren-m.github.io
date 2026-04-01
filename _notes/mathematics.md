---
title: Mathematics
layout: note
---

# Mathematics

> Mathematical concepts, foundations, and connections to Sanskrit knowledge.

## 📚 All Notes

{% assign math_notes = site.notes | where_exp: "note", "note.path contains 'mathematics/'" | sort: "title" %}
{% if math_notes.size > 0 %}
This collection contains **{{ math_notes.size }} notes**:

<ul>
{% for note in math_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% else %}
_No notes available yet in this section._
{% endif %}

### 🔗 Cross-Domain Connections

Mathematics intersects with:
- **[[computer-science|Computer Science]]**: Algorithms and cryptography
- **[[sanskrit-literature|Sanskrit Literature]]**: Ancient mathematical texts and concepts

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover specific mathematical notes.

## 🏷️ Tags

`#mathematics` `#statistics` `#algorithms` `#ancient-mathematics`

---

[← Back to Home](/)
