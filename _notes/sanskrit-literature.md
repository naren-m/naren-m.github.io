---
title: Sanskrit Literature & Philosophy
layout: note
---

# Sanskrit Literature & Philosophy

> Vedic texts, classical literature, grammar, philosophy, and spiritual traditions.

## 📚 Overview

### 📖 Classical Texts

{% assign classical_texts = site.notes | where_exp: "note", "note.path contains 'sanskrit-literature/'" | sort: "title" %}
{% if classical_texts.size > 0 %}
<ul>
{% for note in classical_texts %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% else %}
_No notes available yet in this section._
{% endif %}

### 🔤 Language & Grammar
- Sanskrit grammar fundamentals
- Vedic etymology
- Linguistic analysis

### 🧘 Philosophy & Practice
- Yogic philosophy and practice
- Vedic concepts and worldview
- Spiritual traditions

### 📚 Related People
Notable scholars and contributors:
- [[Panini]] - Sanskrit grammarian
- Classical commentators and philosophers

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover specific notes in this domain.

## 🏷️ Tags

`#sanskrit` `#vedic` `#grammar` `#philosophy` `#yoga` `#classical-literature`

---

[← Back to Home](/)
