within LCC_HVDC.Examples;
model TestPulser
  extends Modelica.Icons.Example;
  Modelica.Blocks.Continuous.Integrator integrator1[6] annotation (
    Placement(transformation(extent={{-82,-2},{-62,18}})));
  Modelica.Blocks.Sources.Constant const5[6](k = fill(50, 6)) annotation (
    Placement(visible = true, transformation(origin={-106,8},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain toRad1[6](k = fill(2*Modelica.Constants.pi, 6)) annotation (
    Placement(transformation(extent={{-48,-2},{-28,18}})));
  Modelica.Blocks.Sources.Constant ConstantFire[6](k = fill(20, 6)) "degree" annotation (
    Placement(visible = true, transformation(origin={-106,-30},   extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LCC_HVDC.Models.PulseGeneratorY pulserY
    annotation (Placement(transformation(extent={{14,-6},{40,18}})));
  LCC_HVDC.Models.Mod mod1[6]
    annotation (Placement(transformation(extent={{-18,-2},{2,18}})));
  Modelica.Blocks.Sources.Constant ConstantFire1[6](k = {7.5, 6, 4.5, 3, 1.5, 0}) "degree" annotation (
    Placement(visible = true, transformation(origin={68,-28},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add pulseTrain[6](each k1 = +1, each k2 = +1) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin={110,0})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal[6] annotation (
    Placement(transformation(extent={{58,-4},{78,16}})));
equation
  connect(const5.y, integrator1.u) annotation (
    Line(points={{-95,8},{-84,8}},      color = {0, 0, 127}));
  connect(integrator1.y, toRad1.u) annotation (
    Line(points={{-61,8},{-50,8}},      color = {0, 0, 127}));
  connect(ConstantFire.y,pulserY.firingAngle)  annotation (
    Line(points={{-95,-30},{6,-30},{6,2.52},{11.79,2.52}},            color = {0, 0, 127}));
  connect(toRad1.y, mod1.u) annotation (
    Line(points={{-27,8},{-20,8}},     color = {0, 0, 127}));
  connect(mod1.y, pulserY.wt) annotation (Line(points={{3,8},{6,8},{6,9.72},
          {11.79,9.72}}, color={0,0,127}));
  connect(pulserY.y, booleanToReal.u) annotation (
    Line(points={{42.34,6},{56,6}},      color = {255, 0, 255}));
  connect(booleanToReal.y,pulseTrain. u1) annotation (
    Line(points={{79,6},{98,6}},       color = {0, 0, 127}));
  connect(ConstantFire1.y,pulseTrain. u2) annotation (
    Line(points={{79,-28},{90,-28},{90,-6},{98,-6}},             color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false,   extent={{-120,-60},{120,
            40}})),
    experiment(StopTime = 0.4, StartTime = 0, Tolerance = 1e-06, Interval = 10e-05),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>

<p>The objective of this examples is to show the output of this Pulse generator i.e. a set of six pulses with among which there is a 60-degree phase difference.</p>
<p>The phase input is a not a taken from an actual voltage source but it is a based on a fixed 50 Hz frequency.</p>
<p>It is recommended to check the following:</p>
<ul>
<li><code>pulserY.y[j]</code> (j=1,2,..6)</li>
</ul>

</body>
</html>
________"));
end TestPulser;
