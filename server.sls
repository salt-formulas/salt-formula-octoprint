{%- if pillar.octoprint.server.enabled %}

{% set os = salt['grains.item']('os')['os'] %}

{#{%- if type.source|regexreplace("@.*+","") == "git" %}
include:
  - git
#}

include:
  - git

repo_octoprint:
  git.latest:
  {%- if pillar.octoprint.server.source is defined %}
  - name: {{ pillar.octoprint.server.source }}
  {%- else %}
  - name: https://github.com/foosel/OctoPrint.git
  {%- endif %}
  - target: /srv/octoprint/
  - runas: root
  {%- if pillar.octoprint.server.rev is defined %}
  - rev: {{ pillar.octoprint.server.rev }}
  {%- else %}
  - rev: master
  {%- endif %}
  - require:
    - pkg: git

/srv/octoprint/octoprint:
  virtualenv.manage:
    - no_site_packages: True
    - requirements: salt://print/conf/requirements.txt
    - require:
      - git: repo_octoprint

/srv/octoprint/octoprint/config.yaml:
  file:
  - managed
  - source: salt://octoprint/conf/config.yaml
  - template: jinja
  - defaults:
    type: "{{ pillar.octoprint.server.type }}"
    features: "[temp, webcam]"
  - require:
    - git: repo_octoprint

{%- endif %}