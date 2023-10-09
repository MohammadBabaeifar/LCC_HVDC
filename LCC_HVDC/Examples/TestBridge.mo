within LCC_HVDC.Examples;
model TestBridge
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Inductance Lc = 0.002 "commutation inductance";
  parameter Modelica.Units.SI.Angle iniAngle1 = 0 "Initial sine 1 angle";
  parameter Modelica.Units.SI.Voltage VAC = 400 "RMS line-to-line";
  parameter Modelica.Units.SI.Frequency f = 50 "line frequency";
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(extent = {{50, -62}, {70, -42}}, rotation = 0)));
  Modelica.Blocks.Math.Mean mean(f = 100) annotation (
    Placement(visible = true, transformation(origin = {100, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 0.1, i(start = 0)) annotation (
    Placement(visible = true, transformation(origin = {60, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 5) annotation (
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sensors.PotentialSensor uDC_ annotation (
    Placement(visible = true, transformation(extent = {{60, 30}, {80, 50}}, rotation = 0)));
  LCC_HVDC.Models.Bridge bridge(iniOff={false,false,true,true,true,true},
      vThyMax=(400)*(sqrt(2))) annotation (Placement(visible=true,
        transformation(
        origin={1.42859,11},
        extent={{-9.42859,-11},{12.5714,11}},
        rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1(phase = iniAngle1, f = f, V = VAC*sqrt(2/3)) annotation (
    Placement(visible = true, transformation(extent = {{-106, 22}, {-126, 42}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage2(f = f, phase = iniAngle1 - 2/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
    Placement(visible = true, transformation(extent = {{-106, 2}, {-126, 22}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage3(f = f, phase = iniAngle1 - 4/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
    Placement(visible = true, transformation(extent = {{-106, -18}, {-126, 2}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start = 0), L = inductor1.L) annotation (
    Placement(visible = true, transformation(extent = {{-66, 2}, {-46, 22}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start = 0), L = Lc) annotation (
    Placement(visible = true, transformation(origin = {-56.138, 31.6276}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor3(L = inductor1.L) annotation (
    Placement(visible = true, transformation(origin = {-55.061, -7.8754}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor i1 annotation (
    Placement(visible = true, transformation(extent = {{-98, 42}, {-78, 22}}, rotation = 0)));
  Modelica.Blocks.Math.RootMeanSquare I1rmsM(f = 50) annotation (
    Placement(visible = true, transformation(origin = {-88, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.RealToBoolean realToBoolean[6] annotation (
    Placement(transformation(extent = {{-12, -50}, {8, -30}})));
  Modelica.Blocks.Sources.Pulse pulse6[6](width = fill(100*(110/360), 6), period = fill(0.02, 6), startTime = {6, 0, 30, 24, 18, 12}/1800) annotation (
    Placement(transformation(extent = {{-42, -50}, {-22, -30}})));
equation
  connect(uDC_.p, Rdc.p) annotation (
    Line(points = {{60, 40}, {60, 30}}, color = {0, 0, 255}));
  connect(Rdc.n, Ldc.p) annotation (
    Line(points = {{60, 10}, {60, 2}}, color = {0, 0, 255}));
  connect(mean.u, uDC_.phi) annotation (
    Line(points = {{88, 16}, {84, 16}, {84, 40}, {81, 40}}, color = {0, 0, 127}));
  connect(uDC_.p, bridge.pin_p) annotation (
    Line(points={{60,40},{36,40},{36,17.6},{14.88,17.6}},          color = {0, 0, 255}));
  connect(inductor3.p, sineVoltage3.p) annotation (
    Line(points = {{-65.061, -7.8754}, {-84, -7.8754}, {-84, -8}, {-106, -8}}));
  connect(sineVoltage1.n, sineVoltage2.n) annotation (
    Line(points = {{-126, 32}, {-126, 12}}, color = {0, 0, 255}));
  connect(sineVoltage2.n, sineVoltage3.n) annotation (
    Line(points = {{-126, 12}, {-126, -8}}, color = {0, 0, 255}));
  connect(sineVoltage2.p, inductor2.p) annotation (
    Line(points = {{-106, 12}, {-66, 12}}, color = {0, 0, 255}));
  connect(sineVoltage1.p, i1.p) annotation (
    Line(points = {{-106, 32}, {-98, 32}}, color = {0, 0, 255}));
  connect(inductor1.p, i1.n) annotation (
    Line(points = {{-66.138, 31.6276}, {-74, 31.6276}, {-74, 32}, {-78, 32}}, color = {0, 0, 255}));
  connect(I1rmsM.u, i1.i) annotation (
    Line(points = {{-88, 46}, {-88, 43}}, color = {0, 0, 127}));
  connect(bridge.pin2, inductor2.n) annotation (
    Line(points = {{-8.88, 11}, {-28, 11}, {-28, 12}, {-46, 12}}, color = {0, 0, 255}));
  connect(bridge.pin3, inductor3.n) annotation (
    Line(points = {{-8.88, 6.38}, {-32, 6.38}, {-32, -7.8754}, {-45.061, -7.8754}}, color = {0, 0, 255}));
  connect(bridge.pin1, inductor1.n) annotation (
    Line(points = {{-8.88, 15.62}, {-32, 15.62}, {-32, 31.6276}, {-46.138, 31.6276}}, color = {0, 0, 255}));
  connect(realToBoolean.y, bridge.P) annotation (
    Line(points={{9,-40},{22,-40},{22,11},{15.54,11}},          color = {255, 0, 255}));
  connect(Ldc.n, bridge.pin_n) annotation (
    Line(points={{60,-18},{60,-30},{36,-30},{36,4.18},{14.88,4.18}},            color = {0, 0, 255}));
  connect(ground1.p, bridge.pin_n) annotation (
    Line(points={{60,-42},{60,-30},{36,-30},{36,4.18},{14.88,4.18}},            color = {0, 0, 255}));
  connect(pulse6.y, realToBoolean.u) annotation (
    Line(points = {{-21, -40}, {-14, -40}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -60}, {120, 80}})),
    experiment(StopTime = 0.1, Interval = 6e-05, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>

<p>This examples is created with a combination of bridge and PLL. Here the bridge is operated in inverter mode (alpha=140 degrees).</p>
<p>It is recommended to check the following.</p>
<ul>
<li>Voltage: <code>mean.u</code>, <code>mean.y</code></li>
<li>Current: <code>Rdc.i</code></li>
</ul>

</body>
</html>"));
end TestBridge;
