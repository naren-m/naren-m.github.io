---
title: Computer Science & Engineering
layout: note
---

# Computer Science & Engineering

> Technical notes covering cryptography, security, algorithms, design patterns, and software engineering concepts.

## 🔐 Cryptography

Security concepts, encryption algorithms, hashing, threat models, and cryptographic principles:

- [[CIA Triad]] - Confidentiality, Integrity, Availability
- [[Cryptography]] - Overview of cryptographic concepts
- [[Block Cipher]] and [[Encryption]] algorithms
- [[Hashing]], [[Hash Algorithms]], and [[Checksum]]
- [[HMAC]] and [[Message Authentication Code]]
- [[Digital signatures]] and [[Public Key]] cryptography
- [[Key exchange]] and [[Initialization Vector]]
- [[Confidentiality]], [[Integrity]], [[Availability]]
- [[Data encryption]] and [[Data Sensitivity]]
- [[STRIDE]] threat modeling framework
- [[Spoofing]], [[Tampering]], [[Repudiation]], [[Information Disclosure]], [[Denial of Service]], [[Elevation of Privilege]]
- [[Side Channel Attack]], [[Buffer Overflows]], [[Rowhammer]], [[Cold Boot]], [[Cache prefetching]]
- [[Strong Authentication]] and [[Token Authentication]]
- [[Multifernet]], [[ENTROPY]], [[Fingerprint]], [[ECC memory]]
- [[DLL Preloading Attack]], [[LOJAX]], [[Zero Day Attack]], [[Zero-Trust]]
- [[Root of trust]] and [[idempotent]]

## 💻 Coding Practices

Programming fundamentals, testing principles, and code maintenance:

- [[Test Driven Dev]] - TDD methodology
- [[Testing Principles]] and [[Testing Pyramid]]
- [[Maintaining code base]] - Code maintenance strategies
- [[Unix philosophy]]
- [[Hello World]] and [[Friday cleaning]]

## 🏗️ Design Patterns

Software architecture patterns and distributed systems design:

- [[Decorator Pattern]]
- [[DesigningDistributedSystems]]
- [[design_patterns]] - Overview of design patterns

## 🛡️ Security

Security vulnerabilities, authentication mechanisms, and protection strategies:

- [[Authentication]] - Authentication mechanisms
- [[Security Vulnerabilities]] - Common vulnerabilities

## 📚 All Notes

{% assign cs_notes = site.notes | where_exp: "note", "note.path contains 'computer-science/'" | sort: "title" %}
{% if cs_notes.size > 0 %}
This collection contains **{{ cs_notes.size }} notes**:

<ul>
{% for note in cs_notes %}
  <li><a class="internal-link" href="{{ note.url }}">{{ note.title }}</a></li>
{% endfor %}
</ul>
{% endif %}

## 🏷️ Tags

`#security` `#cryptography` `#hashing` `#encryption` `#authentication` `#algorithms` `#design-patterns` `#coding`

---

[← Back to Home](/)
