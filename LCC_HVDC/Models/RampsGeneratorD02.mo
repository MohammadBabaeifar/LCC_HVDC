within LCC_HVDC.Models;
model RampsGeneratorD02
  import Modelica.Constants.pi;
  Modelica.Blocks.Interfaces.RealInput omega_t[6] annotation (
    Placement(transformation(extent = {{-138, -20}, {-98, 20}}), iconTransformation(extent = {{-138, -20}, {-98, 20}})));
  Modelica.Blocks.Math.Add add[6] annotation (
    Placement(transformation(extent = {{-32, -16}, {0, 16}})));
  Modelica.Blocks.Math.Gain radToDegree[6](k = fill(180/pi, 6)) annotation (
    Placement(transformation(extent = {{54, -10}, {74, 10}})));
  Modelica.Blocks.Sources.Constant phase1[6](k = {0, pi/3, 2*pi/3, pi, 4*pi/3, 5*pi/3}) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-86, -50})));
  Mod mod[6] annotation (
    Placement(transformation(extent = {{18, -10}, {38, 10}})));
  Modelica.Blocks.Interfaces.RealOutput ramps[6] annotation (
    Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -12}, {126, 14}})));
equation
  connect(radToDegree.y,ramps)  annotation (
    Line(points = {{75, 0}, {110, 0}}, color = {0, 0, 127}));
  connect(phase1.y, add.u2) annotation (
    Line(points = {{-75, -50}, {-72, -50}, {-72, -10}, {-35.2, -10}, {-35.2, -9.6}}, color = {0, 0, 127}));
  connect(omega_t, add.u1) annotation (
    Line(points = {{-118, 0}, {-82, 0}, {-82, 9.6}, {-35.2, 9.6}}, color = {0, 0, 127}));
  connect(mod.u, add.y) annotation (
    Line(points = {{16, 0}, {1.6, 0}}, color = {0, 0, 127}));
  connect(mod.y,radToDegree. u) annotation (
    Line(points = {{39, 0}, {52, 0}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{-60, -20}, {-20, 20}, {-20, -20}, {20, 20}, {20, -20}, {60, 20}, {60, -20}}, color = {0, 0, 239}, thickness = 0.5), Text(origin = {-24, 122.5}, textColor = {0, 0, 227}, extent = {{-76, 28}, {144, -16}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -80}, {100, 40}})),
    Documentation(info = "<html><head></head><body><span style=\"font-family: 'MS Shell Dlg 2'; font-size: 12px;\">T</span><font size=\"5\"><span style=\"font-family: 'MS Shell Dlg 2';\">his block generates a set of 6 ramps from the input wt. There is 60 degrees phase difference among them. These ramps can be used to generate pulses.&nbsp;<br></span>
<a href=\"modelica://HVDC.Models.ReferenceInfo\">[MATLAB-Simulink]</a>:</font><p></p></body></html>"));
end RampsGeneratorD02;
