
=================
Octoprint formula
=================

The responsive web interface for 3D printer


Sample pillars
==============

OctoPrint web UI with printers.

.. code-block:: yaml

    octoprint:
      server:
        enabled: true
        source:
          engine: git
          address 'https://github.com/foosel/OctoPrint.git'
          rev: "master"
        printer:
          engine: serial
          webcam: true
        webcam:
          host: localhost
          port: 1234


Read more
=========

* http://octoprint.org/
* https://github.com/foosel/OctoPrint
