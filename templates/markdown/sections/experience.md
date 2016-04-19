{% extends "section.md" %}

{% block body %}
{% for item in items %}
{% set info %}**{{ item.employer }}{% if item.location is defined %}, {{ item.location }}{% endif %}** - _{{ item.about }}_ - {{ item.date }}{% endset %}
{{ info | wordwrap(width=80) }}

{% if item.notes is defined %}
{% for note in item.notes %}
  - {{ note | wordwrap(width=76, wrapstring='\n    ') }}
{% endfor %}
{% endif %}

{% endfor %}
{% endblock body %}
