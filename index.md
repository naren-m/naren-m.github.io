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

### [Computer Science & Engineering](/CSE/) (55+ notes)
- [Cryptography](/CSE/Cryptography/) - Encryption, Hashing, Security
- [Coding & Algorithms](/CSE/coding/)
- [Design Patterns](/CSE/design_patterns/)

### [Sanskrit Literature & Philosophy](/sanskrit-lit/) (44 notes)
- [Concepts](/sanskrit-lit/Concepts/)
- [Yoga Sutras](/sanskrit-lit/yoga_sutras/)
- [Vedic Texts & Grammar](/sanskrit-lit/)

### [Book Highlights](/highlights/) (36 highlights)
- [Books](/highlights/Books/) - Atomic Habits, Elon Musk, Philosophy & more
- [Articles](/highlights/Articles/) - Technical papers, RFCs

### [Books Reference](/books/) (8 texts)
- [Reading Lists by Category](/books/Books/)
- [Ashtanga Hridayam](/books/ashtangahrydayam/) - Ayurvedic Medicine

### [People & Biographies](/people/) (9 notes)
Notable thinkers: Panini, Brian Kernighan, Andrew Huberman, Max Muller

### [India & Indology](/india/) (3 notes)
Cultural studies and historical analysis

### [Security](/Security/) (2 notes)
- [Authentication](/Security/Authentication/)
- [Security Vulnerabilities](/Security/Security-Vulnerabilities/)

### [Statistics](/Statistics/) (2 notes)
- [ARIMA](/Statistics/ARIMA/)
- [Exponential Smoothing](/Statistics/Exponential-Smoothing/)

### [Mathematics](/math/) (2 notes)
Foundational concepts and Sanskrit mathematics

### [Converted Blog Posts](/converted-posts/) (6 notes)
Technical tutorials and cultural explorations

## Recently Updated Notes

<ul>
  {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
  {% for note in recent_notes limit: 10 %}
    <li>
      {{ note.last_modified_at | date: "%Y-%m-%d" }} — <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
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
