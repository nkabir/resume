{% extends "section.md" %}
{% macro render_pub(pub) -%}
"{{ pub.title }}." {{ pub.authors }}. {{ pub.venuetype }} {{ pub.venue }}{% if pub.venueshort is defined %} ({{ pub.venueshort }}){% endif %}{% if pub.venuelocation is defined %}, {{ pub.venuelocation }}{% endif %}. {{ pub.month }} {{ pub.year }}.
{%- endmacro %}

{% block body %}
{% for pub in items %}
{{ render_pub(pub) | wordwrap }}

{% endfor %}
{% endblock body %}
