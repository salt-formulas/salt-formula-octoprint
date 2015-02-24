{%- if pillar.octoprint is defined %}
include:
{%- if pillar.octoprint.server is defined %}
- octoprint.server
{%- endif %}
{%- endif %}