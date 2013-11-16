{%- if pillar.octoprint.server.enabled %}

{% set os = salt['grains.item']('os')['os'] %}

{#{%- if type.source|regexreplace("@.*+","") == "git" %}
include:
  - git
#}

include:
  - git
  - python

/srv/octoprint:
  file.directory

/srv/octoprint/base:
  file.directory:
  - require:
    - file: /srv/octoprint

octoprint_repo:
  git.latest:
  {%- if pillar.octoprint.server.source.address is defined %}
  - name: {{ pillar.octoprint.server.source.address }}
  {%- else %}
  - name: https://github.com/foosel/OctoPrint.git
  {%- endif %}
  - target: /srv/octoprint/server
  - runas: root
  {%- if pillar.octoprint.server.source.rev is defined %}
  - rev: {{ pillar.octoprint.server.source.rev }}
  {%- else %}
  - rev: master
  {%- endif %}
  - require:
    - pkg: git_packages
    - file: /srv/octoprint

/srv/octoprint/env:
  virtualenv.manage:
  - no_site_packages: True
  - requirements: salt://octoprint/conf/requirements.txt
  - require:
    - git: octoprint_repo
    - file: /srv/octoprint
    - pkg: python_packages

/srv/octoprint/config.yaml:
  file:
  - managed
  - source: salt://octoprint/conf/config.yaml
  - template: jinja
  - defaults:
    features: "[temp, webcam]"
  - require:
    - git: octoprint_repo
    - file: /srv/octoprint

{%- endif %}