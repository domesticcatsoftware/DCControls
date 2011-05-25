DCControls
==========

DCControls provides some custom controls for use in iOS 3.2+.  These controls are the same as used in our app [Midi Touch](http://domesticcat.com.au/apps).

You can follow me on Twitter: [@catdomestic](http://twitter.com/catdomestic), and check out our commercial apps at [domesticcat.com.au](http://domesticcat.com.au/apps).

DCKnob (subclass of DCControl)
------------------------------

![DCKnob Demo Image](http://domesticcat.com.au/projects/dcknob/dcknob-small.png)

A rotary knob with all custom drawing.  Highly customizable, including:

*   Color
*   Bi-directional or normal modes
*   Arc start angle, cutout size, width
*   Gestures (double and triple tap)
*   Min/Max values
*   Label font, color, offset, or no label at all

DCSlider (subclass of DCControl)
--------------------------------

![DCSlider Demo Image](http://domesticcat.com.au/projects/dcslider/dcslider-small.png)

A slider with all custom drawing.  Properties include:

*   Color
*   Bi-directional or normal modes
*   Corner radius
*   Min/Max values
*   Label font and color, or no label at all

Usage
-----

Does not require any external frameworks.  Simply add DCControl, DCKnob & DCSlider to your project (depending on what you want to use).

Create a control using initWithDelegate, then implement controlValueDidChange:sender: to receive control updates.

License
-------

All work is under MIT license.

More Info
---------

For more info, see [domesticcat.com.au/projects/](http://domesticcat.com.au/projects/).