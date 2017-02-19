
=================
Octoprint formula
=================

The snappy web interface for your 3D printer.


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


External links
==============

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
