# Octoprint

The responsive web interface for 3D printer

## Sample pillars

### OctoPrint web UI with printers

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

## Read more

* http://octoprint.org/
* https://github.com/foosel/OctoPrint