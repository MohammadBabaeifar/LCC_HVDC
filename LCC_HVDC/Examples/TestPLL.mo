within LCC_HVDC.Examples;
model TestPLL
  import PI = Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Step step[3](height = fill(0.5, 3), startTime = fill(0.5, 3)) annotation (
    Placement(transformation(extent = {{-58, -38}, {-38, -18}})));
  Modelica.Blocks.Math.Add add[3] annotation (
    Placement(transformation(extent = {{-20, -2}, {0, 18}})));
  Modelica.Blocks.Math.Gain gain[3](k = fill(pLL.vNom, 3)) annotation (
    Placement(transformation(extent = {{10, -2}, {30, 18}})));
  Modelica.Blocks.Sources.Sine sines[3](amplitude = fill(1, 3), f = fill(50, 3), phase = {0, -2/3*PI, 2/3*PI}, offset = fill(0, 3), startTime = fill(0, 3)) annotation (
    Placement(transformation(extent = {{-62, 8}, {-42, 28}})));
  LCC_HVDC.Models.PLL pLL(vNom=1)
    annotation (Placement(transformation(extent={{46,-2},{66,18}})));
equation
  connect(step.y, add.u2) annotation (
    Line(points = {{-37, -28}, {-32, -28}, {-32, 2}, {-22, 2}}, color = {0, 0, 127}));
  connect(gain.u, add.y) annotation (
    Line(points = {{8, 8}, {1, 8}}, color = {0, 0, 127}));
  connect(sines.y, add.u1) annotation (
    Line(points = {{-41, 18}, {-32, 18}, {-32, 14}, {-22, 14}}, color = {0, 0, 127}));
  connect(pLL.u, gain.y) annotation (
    Line(points = {{44, 8}, {31, 8}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -60}, {80, 60}}, initialScale = 0.1)),
    experiment(StopTime = 0.7, StartTime = 0, Tolerance = 1e-06, Interval = 0.0014),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>

<p>This examples intends to show that this PLL models ensures the accurcy of frequency and phase measrement even in case a a step increase in the voltage supply.</p>
<p>It is recommended to check the following.</p>
<ul>
<li>Phase: <code>pLL.thetaRad</code></li>
<li>Frequency: <code>pLL.fHz</code></li>
<li>Input voltage of PLL: <code>add[].y</code></li>
</ul>

</body>
</html>"));
end TestPLL;
