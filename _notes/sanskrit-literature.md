---
title: Sanskrit Literature & Philosophy
layout: note
---

# Sanskrit Literature & Philosophy

> Vedic texts, classical literature, grammar, philosophy, and spiritual traditions.

## 📖 Classical Texts & Vedic Literature

- [[Ashtadhyayi]] - Panini's Sanskrit grammar
- [[Niruktha]] - Vedic etymology and interpretation
- [[YogaSutras]] - Patanjali's philosophical framework
- [[NyayaSutra]] and [[VaishshikaSutra]]
- [[Vaiseshika Darshanam]]
- [[Upanishads]] and [[Atharvanaveda]]
- [[Itheriya brahmana]]
- [[Sulba Sutras]] and [[Sutra]]
- [[Amarakosham]] and [[Sangitaratnakaram]]
- [[Brihadesi]] and [[SivaSurta]]

## 🙏 Devotional & Spiritual

- [[VishnuSahasranamam]] and [[VishnuSahasranamamByDusyanthSridhar]]
- [[NirvanaShatakam]]
- [[HanumaStuthi]] and [[Hanuman Chalisa]]
- [[HowToSpeakLikeHanuma]]

## 🔤 Language & Concepts

- [[Akshara]], [[Nada]], [[Dharma]], [[Prana]], [[Vayu]]
- [[Manas]], [[chitta]], [[Vikalpa]], [[karma]]
- [[Agni]], [[Rudra]], [[kavi]], [[acharya]]
- [[eye]], [[speech]], [[tithi]]
- [[krishna]] and [[mathsya purana]]
- [[PanchaVayu]]
- [[Ayurvedam]] and [[AyurvedicRemedies]]

## 📚 Related People

- [[Panini]] - Sanskrit grammarian
- Classical commentators and philosophers

## 📚 All Notes

{% assign classical_texts = site.notes | where_exp: "note", "note.path contains 'sanskrit-literature/'" | sort: "title" %}
{% if classical_texts.size > 0 %}
<ul>
{% for note in classical_texts %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% endif %}

## 🔍 Explore

Use the **search bar** or **knowledge graph** on the [homepage](/) to discover specific notes in this domain.

## 🏷️ Tags

`#sanskrit` `#vedic` `#grammar` `#philosophy` `#yoga` `#classical-literature`

---

[← Back to Home](/)
