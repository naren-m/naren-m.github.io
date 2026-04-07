---
title: Finances
layout: note
---

# Finances

> Personal finance strategies, investment planning, and wealth-building concepts.

## 📚 Topics

- [[three_bucket_investment_strategy]] - Three Bucket Strategy for retirement income

{% assign finance_notes = site.notes | where_exp: "note", "note.path contains 'finances/'" | sort: "title" %}
{% if finance_notes.size > 0 %}
### All Notes
<ul>
{% for note in finance_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% endif %}

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover specific notes in this domain.

## 🏷️ Tags

`#finance` `#investing` `#retirement` `#FIRE` `#wealth`

---

[← Back to Home](/)
