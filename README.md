# Octoprint

The responsive web interface for 3D printer

## Sample pillars

### OctoPrint web UI with printers

    octoprint:
      server:
        enabled: true
        type: both #serial | http
        source:
          engine: git
          address 'https://github.com/foosel/OctoPrint.git'
          rev: "master"
        printers:
        - name: printer1
          connection: virtual
          webcam: true
        - name: printer2
          connection: serial
          webcam: true

## Read more

* http://octoprint.org/
* https://github.com/foosel/OctoPrint