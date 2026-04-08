---
title: Mathematics
layout: note
---

# Mathematics

> Mathematical concepts, foundations, and connections to Sanskrit knowledge.

## 📐 Topics

### Statistics
- [[ARIMA]] - Autoregressive Integrated Moving Average models
- [[Exponential Smoothing]] - Time series forecasting

### Foundational Concepts
- [[Pythagorean Theorem]]
- [[Bhuja koti karani nyayam]] - Ancient Indian mathematical theorem

### 🔗 Cross-Domain Connections

Mathematics intersects with:
- **[[computer-science|Computer Science]]**: Algorithms and cryptography
- **[[sanskrit-literature|Sanskrit Literature]]**: Ancient mathematical texts and concepts

## 📚 All Notes

{% assign math_notes = site.notes | where_exp: "note", "note.path contains 'mathematics/'" | sort: "title" %}
{% if math_notes.size > 0 %}
<ul>
{% for note in math_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% endif %}

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover specific mathematical notes.

## 🏷️ Tags

`#mathematics` `#statistics` `#algorithms` `#ancient-mathematics`

---

[← Back to Home](/)
