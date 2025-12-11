---
layout: page
title: Home
id: home
permalink: /
---

# Naren Mudivarthy's Digital Garden 🌱

Welcome to my digital garden - a collection of interconnected notes, thoughts, and learnings.

## About This Space

This digital garden combines:
- **Literature Notes**: Research and learning from books, articles, and courses
- **Converted Posts**: Previous blog posts transformed into evergreen notes
- **Knowledge Graph**: Visualize connections between ideas

<p style="padding: 1.5em; background: #f5f7ff; border-radius: 4px; margin: 2em 0;">
  💡 <strong>Tip:</strong> Explore notes by clicking links or using the knowledge graph visualization below.
</p>

## Recently Updated Notes

<ul>
  {% assign recent_notes = site.notes | sort: "last_modified_at_timestamp" | reverse %}
  {% for note in recent_notes limit: 10 %}
    <li>
      {{ note.last_modified_at | date: "%Y-%m-%d" }} — <a class="internal-link" href="{{ site.baseurl }}{{ note.url }}">{{ note.title }}</a>
    </li>
  {% endfor %}
</ul>

## Knowledge Domains

Explore notes organized by domain:
- **Computer Science**: Security, cryptography, design patterns
- **Mathematics**: Fibonacci, statistics, algorithms
- **Sanskrit Literature**: Vedic texts, philosophy
- **Books**: Summaries and highlights
- **People**: Biographical notes

<style>
  .wrapper {
    max-width: 46em;
  }
</style>
