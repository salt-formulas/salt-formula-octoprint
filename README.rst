
=================
Octoprint formula
=================

The web interface for your 3D printer.


Sample pillars
==============

Single printer [deprecated]

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

Multi printers setup

.. code-block:: yaml

    octoprint:
      server:
        enabled: true
        source:
          engine: git
          address 'https://github.com/foosel/OctoPrint.git'
          rev: "master"
        printer:
          printer01:
            bind:
              address: 0.0.0.0
              port: 5001
            device:
              bus: serial
              port: /dev/ACM01
              model: prusa-mk2
            camera:
              protocol: mjpg
              url: localhost
              port: 1234
          printer02:
            device:
              bus: serial
              port: /dev/ACM02
              model: prusa-clone
            bind:
              address: 0.0.0.0
              port: 5002


More Information
================

* http://octoprint.org/
* https://github.com/foosel/OctoPrint


Documentation and Bugs
======================

To learn how to install and update salt-formulas, consult the documentation
available online at:

    http://salt-formulas.readthedocs.io/

In the unfortunate event that bugs are discovered, they should be reported to
the appropriate issue tracker. Use Github issue tracker for specific salt
formula:

    https://github.com/salt-formulas/salt-formula-octoprint/issues

For feature requests, bug reports or blueprints affecting entire ecosystem,
use Launchpad salt-formulas project:

    https://launchpad.net/salt-formulas

You can also join salt-formulas-users team and subscribe to mailing list:

    https://launchpad.net/~salt-formulas-users

Developers wishing to work on the salt-formulas projects should always base
their work on master branch and submit pull request against specific formula.

    https://github.com/salt-formulas/salt-formula-octoprint

Any questions or feedback is always welcome so feel free to join our IRC
channel:

    #salt-formulas @ irc.freenode.net
