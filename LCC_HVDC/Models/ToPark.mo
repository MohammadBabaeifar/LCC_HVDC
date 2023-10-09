within LCC_HVDC.Models;
model ToPark
  parameter Integer p "number of pole pairs";
  Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotator annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}})));
  Modelica.Blocks.Interfaces.RealOutput y[2] annotation (
    Placement(transformation(extent = {{100, -10}, {120, 10}}), iconTransformation(extent = {{100, -10}, {120, 10}})));
  Modelica.Blocks.Interfaces.RealInput X[3] annotation (
    Placement(transformation(extent = {{-140, -20}, {-100, 20}}), iconTransformation(extent = {{-140, -20}, {-100, 20}})));
  Modelica.Blocks.Interfaces.RealInput phi annotation (
    Placement(transformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -116}), iconTransformation(extent = {{-20, -20}, {20, 20}}, rotation = 90, origin = {0, -118})));
  Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor toSpacePhasor annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-40, 0})));
  Modelica.Blocks.Math.Gain gain(k = p) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {0, -44})));
equation
  connect(toSpacePhasor.y, rotator.u) annotation (
    Line(points = {{-29, 0}, {-12, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(rotator.y, y) annotation (
    Line(points = {{11, 0}, {110, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(toSpacePhasor.u, X) annotation (
    Line(points = {{-52, 0}, {-120, 0}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.y, rotator.angle) annotation (
    Line(points = {{0, -33}, {0, -12}}, color = {0, 0, 127}, smooth = Smooth.None));
  connect(gain.u, phi) annotation (
    Line(points = {{0, -56}, {0, -116}}, color = {0, 0, 127}, smooth = Smooth.None));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = true)),
    experiment(StopTime = 5, Interval = 0.001),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
<p> This block converts the time domain components of a three-phase system to an orthogonal rotating raference frame(dq).</p>

</body>
</html>"),
    __Dymola_experimentSetupOutput,
    Icon(graphics={  Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 127}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-100, 100}, {100, -100}}, lineColor = {0, 0, 127}), Text(extent = {{-96, 32}, {96, -22}}, lineColor = {0, 0, 127}, textString = "=>P"), Text(extent = {{-106, 144}, {104, 106}}, lineColor = {0, 0, 255}, textString = "%name")}));
end ToPark;
