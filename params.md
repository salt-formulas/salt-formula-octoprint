
The following example config should explain the available options, most of which can also be configured via the settings dialog within OctoPrint:

### Serial

Use the following settings to configure the serial connection to the printer 

    serial:
      # Use the following option to define the default serial port, defaults to unset (= AUTO)
      port: /dev/ttyACM0

      # Use the following option to define the default baudrate, defaults to unset (= AUTO)
      baudrate: 115200

      # Whether to automatically connect to the printer on server startup (if available)
      autoconnect: false

      # Whether to log whole communication to serial.log (warning: might decrease performance)
      log: false

      # Timeouts used for the serial connection to the printer, you might want to adjust these if you are
      # experiencing connection problems
      timeout:

        # Timeout for waiting for a response from the currently tested port during autodetect, in seconds.
        # Defaults to 0.5 sec
        detection: 0.5

        # Timeout for waiting to establish a connection with the selected port, in seconds.
        # Defaults to 2 sec
        connection: 2

        # Timeout during serial communication, in seconds.
        # Defaults to 5 sec
        communication: 5

      # Use this to define additional patterns to consider for serial port listing. Must be a valid
      # "glob" pattern (see http://docs.python.org/2/library/glob.html). Defaults to not set.
      additionalPorts:
      - /dev/myPrinterSymlink

### Server

Use the following settings to configure the server

    server:
      # Use this option to define the host to which to bind the server, defaults to "0.0.0.0" (= all interfaces)
      host: 0.0.0.0

      # Use this option to define the port to which to bind the server, defaults to 5000
      port: 5000

      # [devel] Use this option to define an optional baseUrl (with a leading /, so absolute to your
      # server's root) under which to run OctoPrint. This should only be needed if you want to run 
      # OctoPrint behind a reverse proxy under a different root endpoint than `/` and can't configure 
      # said reverse proxy to send `X-Script-Name` and `X-Scheme` HTTP headers with 
      # forwarded requests (see below). Defaults to an empty string and therefore the server root.
      baseUrl: /octoprint

      # [devel] Use this option to define an optional URL scheme under which to run OctoPrint.
      # Should only be needed for use with reverse proxies, see above.
      scheme: http

      # will be automatically set to false once the first-run-wizard has been completed
      firstRun: true

----

**Note:** If you want to run OctoPrint behind a reverse proxy such as HAProxy or Nginx and use a different base URL than the server root `/` you have two options to achieve this. One approach is using the configuration settings `baseUrl` and `scheme` mentioned above in which OctoPrint will only work under the configured base URL.

The second and better approach is to make your proxy send a couple of custom headers with each forwarded requests:

  * `X-Script-Name`: should contain your custom baseUrl (absolute server path), e.g. `/octoprint`
  * `X-Scheme`: should contain your custom URL scheme to use (if different from `http`), e.g. `https`

If you use these headers OctoPrint will work both via the reverse proxy as well as when called directly. Take a look [here](https://github.com/foosel/OctoPrint/wiki/Reverse-proxy-configuration-examples) on a couple of examples on how to configure this.

----

### Webcam

Use the following settings to configure webcam support

    webcam:
      # Use this option to enable display of a webcam stream in the UI, e.g. via MJPG-Streamer.
      # Webcam support will be disabled if not set
      stream: http://<stream host>:<stream port>/?action=stream

      # Use this option to enable timelapse support via snapshot, e.g. via MJPG-Streamer.
      # Timelapse support will be disabled if not set
      snapshot: http://<stream host>:<stream port>/?action=snapshot

      # Path to ffmpeg binary to use for creating timelapse recordings.
      # Timelapse support will be disabled if not set
      ffmpeg: /path/to/ffmpeg

      # The bitrate to use for rendering the timelapse video. This gets directly passed to ffmpeg.
      bitrate: 5000k
      
      # Whether to include a "created with OctoPrint" watermark in the generated timelapse movies
      watermark: true

      # The default timelapse settings.
      timelapse:

        # The timelapse type. Can be either "off", "zchange" or "timed". Defaults to "off"
        type: timed

        # Additional options depending on the timelapse type. Currently only the "timed" timelapse takes
        # the interval which to leave between images as option "interval", given in seconds. This example
        # therefore configures a "Timed" timelapse with an interval of 2s. Defaults to empty.
        options:
          interval: 2


### Feature

Use the following settings to enable or disable OctoPrint features

    feature:
      # Whether to enable the gcode viewer in the UI or not
      gCodeVisualizer: true

      # Whether to enable the temperature graph in the UI or not
      temperatureGraph: true

      # Specifies whether OctoPrint should wait for the start response from the printer before trying to send commands
      # during connect. 
      waitForStartOnConnect: false

      # Specifies whether OctoPrint should send linenumber + checksum with every command. Needed for
      # successful communication with Repetier firmware
      alwaysSendChecksum: false

      # Whether to ignore the first ok after a resend response. Needed for successful communication with
      # Repetier firmware
      swallowOkAfterResend: false

      # Specifies whether support for SD printing and file management should be enabled
      sdSupport: true

### Folder

Use the following settings to set custom paths for folders used by OctoPrint

    folder:
      # Absolute path where to store gcode uploads. Defaults to the uploads folder in the OctoPrint settings folder
      uploads: /path/to/upload/folder

      # Absolute path where to store finished timelapse recordings. Defaults to the timelapse folder in the OctoPrint
      # settings dir
      timelapse: /path/to/timelapse/folder

      # Absolute path where to store temporary timelapse files. Defaults to the timelapse/tmp folder in the OctoPrint
      # settings dir
      timelapse_tmp: /path/to/timelapse/tmp/folder

      # Absolute path where to store log files. Defaults to the logs folder in the OctoPrint settings dir
      logs: /path/to/logs/folder

      # Absolute path to the virtual printer's simulated SD card. Only useful for development, just ignore
      # it otherwise
      virtualSd: /path/to/virtualSd/folder

### Temperature

Use the following settings to configure temperature profiles which will be displayed in the temperature tab.

    temperature:
      profiles:
      - name: ABS
        extruder: 210
        bed: 100
      - name: PLA
        extruder: 180
        bed: 60

### Printer parameters

Use the following settings to configure printer parameters

    printerParameters:
      # Use this to define the movement speed on X, Y, Z and E to use for the controls on the controls tab
      movementSpeed:
        x: 6000
        y: 6000
        z: 200
        e: 300

### Appearance

Use the following settings to tweak OctoPrint's appearance a bit to better distinguish multiple instances/printers appearance:

    appearance:
      # Use this to give your printer a name. It will be displayed in the title bar (as "<Name> [OctoPrint]") and in the
      # navigation bar (as "OctoPrint: <Name>")
      name: My Printer Model

      # Use this to color the navigation bar. Supported colors are red, orange, yellow, green, blue, violet and default.
      color: blue

### Controls

Use the following settings to add custom controls to the "Controls" tab within OctoPrint

Controls consist at least of a name, a type and type-specific further attributes. Currently recognized types are
- `section`: Creates a visual section in the UI, you can use this to separate functional blocks
- `command`: Creates a button that sends a defined GCODE command to the printer when clicked
- `commands`: Creates a button that sends multiple defined GCODE commands to the printer when clicked
- `parametric_command`: Creates a button that sends a parameterized GCODE command to the printer, parameters needed for the command are added to the UI as input fields, are named and can such be referenced from the command, using Python's [string formatting](http://docs.python.org/2/library/stdtypes.html#string-formatting)
- `parametric_commands`: Like `parametric_command`, but supports multiple commands
- `feedback_command`: Like `command`, but you can defined a regular expression that will be checked against messages sent by the printer and allow displaying the extracted groups in the UI, e.g. `M114` -> `ok C: X:10.00 Y:3.20 Z:5.20 E:1.24` -> `Current position is (10.00, 3.20, 5.20), E = 1.24`. Uses Python's [str.format](http://docs.python.org/2/library/string.html#format-string-syntax) method to merge the matched sub groups from the given regex (`(...)`) into the template format string.
- `feedback`: Like `feedback_command`, but instead of a button to click you'll get just a display of the result of parsing the defined regex into the template. You can use this for matching against responses from the printer that come in regularly on their own (such as temperature information if you need this on the control tab as well) or are triggered by another button (e.g. for displaying variouse parameters picked from a response to an `M503` command for reading EEPROM values).

----

**Note**: Be careful with the excessive use of `feedback_command` and `feedback`. Every line that gets received from the printer will be matched against any of those types of custom controls that you define, and using an excessive amount of them will most probably slow down the serial printing communication, since the regex parsing is not decoupled from the communication loop.

----

The following example defines a control for enabling the cooling fan with a variable speed defined 
by the user (default 255) and a control for disabling the fan, all within a section named "Fan", 
two example controls with multiple commands in a section "Example for multiple commands" and a
command with printer feedback evaluation for the result of the `M114` "Get Position" gcode inside 
a section named "Reporting".

    controls:
      - name: Fan
        type: section
        children:
          - name: Enable Fan
            type: parametric_command
            command: M106 S%(speed)s
            input:
              - name: Speed (0-255)
                parameter: speed
                default: 255
          - name: Disable Fan
            type: command
            command: M107
      - name: Example for multiple commands
        type: section
        children:
        - name: Move X (static)
          type: commands
          commands:
          - G91
          - G1 X10 F3000
          - G90
        - name: Move X (parametric)
          type: parametric_commands
          commands:
          - G91
          - G1 X%(distance)s F%(speed)s
          - G90
          input:
          - default: 10
            name: Distance
            parameter: distance
          - default: 3000
            name: Speed
            parameter: speed
      - name: Reporting
        type: section
        children:
        - command: M114
          name: Get Position
          type: feedback_command
          regex: "X:([0-9.]+) Y:([0-9.]+) Z:([0-9.]+) E:([0-9.]+)"
          template: "Position: X={0}, Y={1}, Z={2}, E={3}"

### System

Use the following settings to add custom system commands to the "System" dropdown within OctoPrint's top bar 

Commands consist of a name, an action identifier, the commandline to execute and an optional confirmation message to display before actually executing the command (should be set to False if a confirmation dialog is not desired).

The following example defines a command for shutting down the system under Linux. It assumes that the user under which OctoPrint is running is allowed to do this without password entry.

    system:
      actions:
      - name: Shutdown
        action: shutdown
        command: sudo shutdown -h now
        confirm: You are about to shutdown the system.

### Access Control

Use the following settings to enable access control.

    accessControl:
      # whether to enable access control or not. Defaults to true
      enabled: true

      # The user manager implementation to use for accessing user information. Currently only a filebased
      # user manager is implemented which stores configured accounts in a YAML file (Default: users.yaml 
      # in the default configuration folder, see below)
      userManager: octoprint.users.FilebasedUserManager

      # The YAML user file to use. If left out defaults to users.yaml in the default configuration folder.
      userFile: /path/to/users.yaml
      
      # If set to true, will automatically log on clients originating from any of the networks defined in
      # "localNetworks" as the user defined in "autologinAs". Defaults to false.
      autologinLocal: true

      # The name of the user to automatically log on clients originating from "localNetworks" as. Must
      # be the name of one of your configured users.
      autologinAs: someUser
    
      # A list of networks or IPs for which an automatic logon as the user defined in "autologinAs" will 
      # take place. If available OctoPrint will evaluate the "X-Forwarded-For" HTTP header for determining 
      # the client's IP address (see https://code.google.com/p/haproxy-docs/wiki/forwardfor on how to
      # configure the sending of this header in HAProxy). Defaults to 127.0.0.0/8 (so basically anything      
      # originating from localhost).
      localNetworks:
      - 127.0.0.0/8
      - 192.168.1.0/24

### Events

Use the following settings to add shell/gcode commands to be executed on certain events. For a list of available events see [here](https://github.com/foosel/OctoPrint/wiki/Available-Events)

    events:
      # settings for the event listener that executes system shell commands
      systemCommandTrigger:
        # whether to enable this event listener
        enabled: True
        
        # list of event subscriptions and shell command to be executed
        subscriptions:
            # example event consumer that prints a message to the system log if the printer is disconnected
            - event: Disconnected
              command: "logger 'Printer got disconnected'"

      # settings for the event listener that executes gcode commands
      gcodeCommandTrigger:
        # whether to enable this event listener
        enabled: True

        # list of event subscriptions and GCODE command to be executed
        subscriptions:
            # example event consumer that queries printer information from the firmware, prints a "Connected"
            # message to the LCD and homes the print head upon established printer connection
            - event: Connected
              command: M115,M17 printer connected!,G28

### Terminal Filters

Use the following settings to define a set of terminal filters to display in the terminal tab for filtering certain lines from the display terminal log. Use [Javascript regular expressions](https://developer.mozilla.org/en/docs/Web/JavaScript/Guide/Regular_Expressions).

    # A list of filters to display in the terminal tab. Defaults to the filters shown below
    terminalFilters:
    - name: Suppress M105 requests/responses
      regex: '(Send: M105)|(Recv: ok T:)'
    - name: Suppress M27 requests/responses
      regex: '(Send: M27)|(Recv: SD printing byte)'

### API

Settings for the REST API

    api:
      # whether to enable the API
      enabled: True

      # current API key needed for accessing the API
      apikey: ...

### Development settings

The following settings are only relevant to you if you want to do OctoPrint development. They currently only allow configuration of the virtual printer.

    # Settings only relevant for development
    devel:

      # Settings for the virtual printer
      virtualPrinter:

        # Whether to enable the virtual printer and include it in the list of available serial connections.
        # Defaults to false.
        enabled: true

        # Whether to send an additional "ok" after a resend request (like Repetier)
        okAfterResend: false

        # Whether to force checksums and line number in the communication (like Repetier), if set to true 
        # printer will only accept commands that come with linenumber and checksum and throw an error for
        # lines that don't. Defaults to false
        forceChecksum: false

        # Whether to send "ok" responses with the line number that gets acknowledged by the "ok". Defaults
        # to false.
        okWithLinenumber: false