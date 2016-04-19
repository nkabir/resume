{% extends "section.md" %}

{% block body %}
{% for school in items %}
**{{ school.school }}** - _{{ school.date }}_  
{{ school.major }}  
{% if school.notes is defined %}{{ school.notes }}{% endif %}


{% endfor %}
{% endblock body %}
