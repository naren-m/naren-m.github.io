---
layout: page
title: Home
id: home
permalink: /
---

# Naren Mudivarthy's Digital Garden

## Search Notes

{% include search.html %}

## Knowledge Domains

### [Computer Science & Engineering](/computer-science/) (59 notes)
Cryptography, security, algorithms, design patterns, and software engineering concepts.

### [Sanskrit Literature & Philosophy](/sanskrit-literature/) (44 notes)
Vedic texts, philosophy, grammar, and classical literature.

### [Media](/media/) (38+ items)
Books, articles, videos, podcasts, and curated content highlights.

### [People & Biographies](/people/) (9 notes)
Notable thinkers: Panini, Brian Kernighan, Andrew Huberman, Max Müller.

### [Mathematics](/mathematics/) (4 notes)
Mathematical concepts, statistics, and foundations.

### [History](/history/) (3 notes)
Cultural studies, Indian history, and Indological research.

### [Converted Blog Posts](/converted-posts/) (6 notes)
Technical tutorials and cultural explorations

## Recently Updated Notes

<ul>
  {% assign all_notes = site.notes %}
  {% assign notes_with_dates = all_notes | where_exp: "note", "note.date" | sort: "date" | reverse %}
  {% assign notes_without_dates = all_notes | where_exp: "note", "note.date == nil" | sort: "last_modified_at_timestamp" | reverse %}
  {% assign recent_notes = notes_with_dates | concat: notes_without_dates %}

  {% for note in recent_notes limit: 10 %}
    {% if note.date %}
      {% assign display_date = note.date | date: "%Y-%m-%d" %}
    {% else %}
      {% assign display_date = note.last_modified_at | date: "%Y-%m-%d" %}
    {% endif %}
    <li>
      {{ display_date }} — <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
    </li>
  {% endfor %}
</ul>

## Knowledge Graph

Explore connections between notes visually. Click nodes to navigate, hover to see relationships.

{% include notes_graph.html %}

<style>
  .wrapper {
    max-width: 46em;
  }
</style>
