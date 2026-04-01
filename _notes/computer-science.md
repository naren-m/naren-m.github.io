---
title: Computer Science & Engineering
layout: note
---

# Computer Science & Engineering

> Technical notes covering cryptography, security, algorithms, design patterns, and software engineering concepts.

## 📚 All Notes

{% assign cs_notes = site.notes | where_exp: "note", "note.path contains 'computer-science/'" | sort: "title" %}
{% if cs_notes.size > 0 %}
This collection contains **{{ cs_notes.size }} notes**:

<ul>
{% for note in cs_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% else %}
_No notes available yet in this section._
{% endif %}

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover specific notes in this domain.

## 🏷️ Tags

`#security` `#cryptography` `#hashing` `#encryption` `#authentication` `#algorithms` `#design-patterns` `#coding`

---

[← Back to Home](/)
