# K40 Shroud

This part is a shroud to assist with mounting a 60 mm fan to the cooling duct of the
passively cooled [nVidia Tesla K40][tsla] GPU, so the card can be used in a workstation
without overheating. With room air at 24°C, the reference implementation reaches a
steady-state temperature of 84°C: high, but stable.

![shroud after printing and assembly][part]

To use this part, you will need:

- A Tesla K40, preferably provided by your employer through a friendly sysadmin.
- Calipers or a ruler to measure its internal cooling channel geometry.
- A 60 mm × 25 mm case fan. Don't go for the "slim" or "quiet" variety: you need airflow.
- A miter saw (or any safe cutting implement of your choice), to remove one of the four
  corners of the fan mount. Otherwise, it will crash into the motherboard and prevent
  the K40 from seating in the PCI slot.
- [OpenSCAD][scad] to customize for your card and hardware.
- Slicing software (*e.g.* [Cura][cura]) to generate [gcode][gcod] for your printer.
- A 3D printer and filament of your choosing.
- Three CD-ROM screws, to mount the shroud to the K40.
- Two or three fan screws, to mount the fan to the shroud.

The part has been oriented at a tilt relative to the coordinate axes, to minimize
ringing during printing. Print it using whatever settings you're comfortable with:
this is a functional "bracket" type thing, not a work of art.

- I used a Lulzbot TAZ 5 at work, sliced with Lulzbot Cura, with Standard settings
  (0.25 mm layer height).
- Make sure you generate supports, so the cylindrical cavity doesn't collapse.
- I chose to print in PLA using a 205°C hotend and 60°C bed. 

After printing, mount the shroud so that the three holes on the raised pad are
flush with the mounting plate on the K40. The clipped corner of the square mounting
plate should be on the side with the PCI pins. Screw it all together, plug in the
fan power connector and both K40 power connectors, and do some science with it!

<!--References-->
[cura]: https://ultimaker.com/en/products/ultimaker-cura-software/list
[gcod]: https://en.wikipedia.org/wiki/G-code
[part]: ../media/K40-shroud.png
[scad]: http://www.openscad.org
[tsla]: https://www.nvidia.com/content/PDF/kepler/nvidia-tesla-k40.pdf
