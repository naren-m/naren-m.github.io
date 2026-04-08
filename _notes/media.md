---
title: Media Collection
layout: note
---

# Media Collection

> Books, articles, videos, podcasts, and curated content highlights.

## 📖 Books

- [[Books]] - Reading list and references
- [[Atomic Habits]], [[Grit]], [[Outliers]], [[Make Your Bed]]
- [[Elon Musk]], [[Benjamin Franklin]], [[Shoe Dog]]
- [[The 7 Habits of Highly Effective People]], [[The 4-Hour Workweek]]
- [[No Rules Rules]], [[The Code of the Extraordinary Mind]]
- [[The Ride of a Lifetime]], [[The Book of Joy]]
- [[A Promised Land]], [[The Silk Roads]]
- [[Unlimited Memory]], [[Speed Reading]], [[Moonwalking With Einstein]]
- [[Why We Sleep]], [[Astrophysics for People in a Hurry]]
- [[A Short History of Nearly Everything]], [[What If]]
- [[12 Rules for Life]], [[The Subtle Art of Not Giving a Fck]]
- [[Norse Mythology]], [[Introducing Game Theory]]
- [[Essential Calculus Skills Practice Workbook With Full Solutions]]
- [[Music Theory]], [[150 Screen-Free Activities for Kids]]
- [[India]], [[Early Indians]]
- [[Brahma Sutra Bhasya]], [[AshtangaHrydayam]], [[Navneetakam]], [[Suthrasthana]]
- [[Maharana Bappa Rawal]]

## 📄 Articles

- [[Rfc793]] and [[Rfc1831]] - Network protocol RFCs
- [[RFC 7950 - The YANG 1.1 Data Modeling Language]]
- [[How to Publish Your Own Python Package on PyPi]]
- [[Machine Learning Is Fun Part 4 Modern Face Recognition With Deep Learning]]

## 🎙️ Podcasts

- [[India Before Invasions - Explained By Sandeep Balakrishna]]
- [[jyothisha_rajvedam_beerbiceps]]

## 🎥 Videos

- [[sangam_history_of_indian_science]]

## 📚 All Notes

{% assign media_notes = site.notes | where_exp: "note", "note.path contains 'media/'" | sort: "title" %}
{% if media_notes.size > 0 %}
<ul>
{% for note in media_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% endif %}

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover specific media notes.

## 🏷️ Tags

`#books` `#highlights` `#articles` `#videos` `#podcasts` `#reading-notes`

---

[← Back to Home](/)
