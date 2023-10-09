within LCC_HVDC.Models;
model RampsGeneratorY
  import Modelica.Constants.pi;
  Modelica.Blocks.Interfaces.RealInput omega_t[6] annotation (
    Placement(transformation(extent = {{-138, -20}, {-98, 20}}), iconTransformation(extent = {{-138, -20}, {-98, 20}})));
  Modelica.Blocks.Math.Add add[6] annotation (
    Placement(transformation(extent = {{-32, -16}, {0, 16}})));
  Modelica.Blocks.Math.Gain radToDegree[6](k = fill(180/pi, 6)) annotation (
    Placement(transformation(extent = {{54, -10}, {74, 10}})));
  Modelica.Blocks.Sources.Constant phase1[6](k = {pi/6, pi/2, 5*pi/6, 7*pi/6, 9*pi/6, 11*pi/6}) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-82, -50})));
  Mod mod[6] annotation (
    Placement(transformation(extent = {{18, -10}, {38, 10}})));
  Modelica.Blocks.Interfaces.RealOutput ramps[6] annotation (
    Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -14}, {126, 12}})));
equation
  connect(radToDegree.y,ramps)  annotation (
    Line(points = {{75, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(phase1.y, add.u2) annotation (
    Line(points = {{-71, -50}, {-68, -50}, {-68, -10}, {-35.2, -10}, {-35.2, -9.6}}, color = {0, 0, 127}));
  connect(omega_t, add.u1) annotation (
    Line(points = {{-118, 0}, {-82, 0}, {-82, 9.6}, {-35.2, 9.6}}, color = {0, 0, 127}));
  connect(mod.y,radToDegree. u) annotation (
    Line(points = {{39, 0}, {52, 0}}, color = {0, 0, 127}));
  connect(mod.u, add.y) annotation (
    Line(points = {{16, 0}, {1.6, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-21.0429, 122.25}, textColor = {0, 0, 227}, extent = {{-66.9571, 23.75}, {127.043, -14.25}}, textString = "%name"), Line(points = {{-60, -20}, {-20, 20}, {-20, -20}, {20, 20}, {20, -20}, {60, 20}, {60, -20}}, color = {0, 0, 239}, thickness = 0.5)}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -80}, {100, 40}})),
    Documentation(info = "<html><head></head><body><font size=\"5\">This block generates a set of 6 ramps from the input wt. There is a 60-degrees phase difference among them. These ramps can be used to generate pulses. This ramp generator leads the set of ramps by 30 degrees with respect to its input phase (wt).</font><div><font size=\"5\">&nbsp;<a href=\"modelica://HVDC.Models.ReferenceInfo\">[MATLAB-Simulink]</a>:</font><p></p>
<div><div><br></div></div></div></body></html>"));
end RampsGeneratorY;
