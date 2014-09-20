{%- from "octoprint/map.jinja" import server with context %}
{%- if server.enabled %}

include:
  - git

include:
  - git
  - python

octoprint_user:
  user.present:
  - name: octoprint
#  - system: True
  - shell: /bin/bash
  - home: /srv/octoprint

/srv/octoprint:
  file.directory:
  - user: octoprint
  - group: octoprint
  - mode: 755
  - makedirs: True
  - require:
    - user: octoprint_user

/var/log/octoprint:
  file.directory:
  - user: octoprint
  - group: octoprint
  - mode: 755
  - makedirs: True
  - require:
    - user: octoprint_user

/srv/octoprint/base:
  file.directory:
  - user: octoprint
  - group: octoprint
  - mode: 755
  - require:
    - file: /srv/octoprint

octoprint_repo:
  git.latest:
  {%- if server.source.address is defined %}
  - name: {{ server.source.address }}
  {%- else %}
  - name: https://github.com/foosel/OctoPrint.git
  {%- endif %}
  - target: /srv/octoprint/server
  - runas: root
  {%- if server.source.rev is defined %}
  - rev: {{ server.source.rev }}
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
  file.managed:
  - source: salt://octoprint/conf/config.yaml
  - template: jinja
  - require:
    - git: octoprint_repo
    - file: /srv/octoprint

{%- endif %}