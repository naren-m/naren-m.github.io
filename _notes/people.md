---
title: People & Biographies
layout: note
---

# People & Biographies

> Notable thinkers, scholars, scientists, and contributors across various domains.

## 📖 Notable People

- [[Panini]] - Ancient Sanskrit grammarian and linguist
- [[Brian Kernighan]] - Computer scientist, Unix pioneer
- [[Andrew Huberman]] - Neuroscientist and science communicator
- [[Max Muller]] - Sanskrit scholar and philologist
- [[Alexander Cunningham]] - Archaeologist and historian
- [[Ashoka]] - Maurya Emperor
- [[Bill joy]] - Computer scientist and Sun Microsystems co-founder
- [[Marthanda Varma]] - King of Travancore
- [[Brian Kernighan interview]] - Interview notes

### 🎯 Domains Represented

- **[[sanskrit-literature|Sanskrit & Linguistics]]**: Classical scholars and grammarians
- **[[computer-science|Computer Science]]**: Pioneers in programming and Unix

## 📚 All Notes

{% assign people_notes = site.notes | where_exp: "note", "note.path contains 'people/'" | sort: "title" %}
{% if people_notes.size > 0 %}
<ul>
{% for note in people_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% endif %}

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover biographical notes.

## 🏷️ Tags

`#biography` `#scholars` `#scientists` `#thinkers` `#contributors`

---

[← Back to Home](/)
