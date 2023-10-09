within LCC_HVDC.Examples;
model SixPulseInverter
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Inductance Lc = 0.2e-3 "commutation inductance";
  parameter Modelica.Units.SI.Angle iniAngle1 = 0 "Initial sine 1 angle";
  parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
  parameter Modelica.Units.SI.Voltage VAC = 400 "RMS line-to-line";
  parameter Modelica.Units.SI.Frequency f = 50 "line frequency";
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(extent = {{34, -62}, {54, -42}}, rotation = 0)));
  Modelica.Blocks.Math.Mean mean(f = 300) annotation (
    Placement(visible = true, transformation(origin = {84, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 0.005, i(fixed = true, start = 0)) annotation (
    Placement(visible = true, transformation(origin = {44, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 0.1) annotation (
    Placement(visible = true, transformation(origin = {44, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Sensors.PotentialSensor uDC_ annotation (
    Placement(visible = true, transformation(extent = {{44, 50}, {64, 70}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator1(nout = 6) annotation (
    Placement(visible = true, transformation(origin = {-72, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Routing.Replicator replicator2(nout = 6) annotation (
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {-72, -88})));
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(V = 0, duration = 0.08, offset = 440) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {44, -20})));
  LCC_HVDC.Models.PulseGeneratorY pulserY(BlockTime=0.111247) annotation (
      Placement(visible=true, transformation(
        origin={-32.0466,-59},
        extent={{-11.917,-11},{11.917,11}},
        rotation=0)));
  LCC_HVDC.Models.Bridge bridge(
    iniOff={true,true,true,false,false,true},
    Goff=1e-6,
    vThyMax=(400)*(sqrt(2))) annotation (Placement(visible=true,
        transformation(
        origin={-34.1714,12},
        extent={{-10.6286,-12},{14.1714,12}},
        rotation=0)));
  LCC_HVDC.Models.PLL pLL(vNom=400, Ti=60/1400) annotation (Placement(
        visible=true, transformation(
        origin={-2,0},
        extent={{-112,-70},{-92,-50}},
        rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1(phase = iniAngle1, f = f, V = VAC*sqrt(2/3)) annotation (
    Placement(visible = true, transformation(extent = {{-170, 22}, {-190, 42}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage2(f = f, phase = iniAngle1 - 2/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
    Placement(visible = true, transformation(extent = {{-170, 2}, {-190, 22}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage3(f = f, phase = iniAngle1 - 4/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
    Placement(visible = true, transformation(extent = {{-170, -18}, {-190, 2}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start = -iStart), L = inductor1.L) annotation (
    Placement(visible = true, transformation(extent = {{-126, 2}, {-106, 22}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start = iStart), L = Lc) annotation (
    Placement(visible = true, transformation(origin = {-116.138, 31.6276}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor3(L = inductor1.L) annotation (
    Placement(visible = true, transformation(origin = {-115.061, -7.8754}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor i1 annotation (
    Placement(visible = true, transformation(extent = {{-162, 42}, {-142, 22}}, rotation = 0)));
  Modelica.Blocks.Math.RootMeanSquare I1rmsM(f = 50) annotation (
    Placement(visible = true, transformation(origin = {-152, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin1(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-162, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin2(k = 2) annotation (
    Placement(visible = true, transformation(origin = {-150, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin3(k = 3) annotation (
    Placement(visible = true, transformation(origin = {-140, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Polyphase.Basic.MultiDelta delta(final m = 3) "Delta connection" annotation (
    Placement(visible = true, transformation(origin = {-152, -60}, extent = {{8, -8}, {-8, 8}}, rotation = 90)));
  Modelica.Electrical.Polyphase.Sensors.VoltageSensor voltageSensor(final m = 3) "Voltage sensor" annotation (
    Placement(visible = true, transformation(origin = {-134, -60}, extent = {{8, 8}, {-8, -8}}, rotation = 270)));
  Modelica.Blocks.Sources.Constant Fire(k = 140) annotation (
    Placement(visible = true, transformation(origin = {-106, -88}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(uDC_.p, Rdc.p) annotation (
    Line(points = {{44, 60}, {44, 48}}, color = {0, 0, 255}));
  connect(Rdc.n, Ldc.p) annotation (
    Line(points = {{44, 28}, {44, 20}}, color = {0, 0, 255}));
  connect(mean.u, uDC_.phi) annotation (
    Line(points = {{72, 34}, {68, 34}, {68, 60}, {65, 60}}, color = {0, 0, 127}));
  connect(Ldc.n, rampVoltage.n) annotation (
    Line(points = {{44, 0}, {44, -10}}, color = {0, 0, 255}));
  connect(rampVoltage.p,ground1. p) annotation (
    Line(points = {{44, -30}, {44, -42}}, color = {0, 0, 255}));
  connect(uDC_.p, bridge.pin_p) annotation (
    Line(points = {{44, 60}, {20, 60}, {20, 19.2}, {-19.008, 19.2}}, color = {0, 0, 255}));
  connect(bridge.pin_n, rampVoltage.p) annotation (
    Line(points = {{-19.008, 4.56}, {20, 4.56}, {20, -30}, {44, -30}}, color = {0, 0, 255}));
  connect(pLL.thetaRad, replicator1.u) annotation (
    Line(points = {{-93, -66}, {-88, -66}, {-88, -60}, {-84, -60}}, color = {0, 0, 127}));
  connect(inductor3.p, sineVoltage3.p) annotation (
    Line(points = {{-125.061, -7.8754}, {-148, -7.8754}, {-148, -8}, {-170, -8}}));
  connect(sineVoltage1.n, sineVoltage2.n) annotation (
    Line(points = {{-190, 32}, {-190, 12}}, color = {0, 0, 255}));
  connect(sineVoltage2.n, sineVoltage3.n) annotation (
    Line(points = {{-190, 12}, {-190, -8}}, color = {0, 0, 255}));
  connect(sineVoltage2.p, inductor2.p) annotation (
    Line(points = {{-170, 12}, {-126, 12}}, color = {0, 0, 255}));
  connect(sineVoltage1.p, i1.p) annotation (
    Line(points = {{-170, 32}, {-162, 32}}, color = {0, 0, 255}));
  connect(inductor1.p, i1.n) annotation (
    Line(points = {{-126.138, 31.6276}, {-134, 31.6276}, {-134, 32}, {-142, 32}}, color = {0, 0, 255}));
  connect(I1rmsM.u, i1.i) annotation (
    Line(points = {{-152, 46}, {-152, 43}}, color = {0, 0, 127}));
  connect(toPin2.pin_p, inductor2.p) annotation (
    Line(points = {{-150, -32}, {-150, 12}, {-126, 12}}, color = {0, 0, 255}));
  connect(toPin1.pin_p, i1.p) annotation (
    Line(points = {{-162, -32}, {-162, 32}}, color = {0, 0, 255}));
  connect(toPin3.pin_p, sineVoltage3.p) annotation (
    Line(points = {{-140, -32}, {-140, -7.8754}, {-145.646, -7.8754}, {-145.646, -8}, {-170, -8}}, color = {0, 0, 255}));
  connect(voltageSensor.plug_p, delta.plug_n) annotation (
    Line(points = {{-134, -68}, {-152, -68}}, color = {0, 0, 255}));
  connect(toPin1.plug_p, toPin3.plug_p) annotation (
    Line(points = {{-162, -36}, {-162, -42}, {-140, -42}, {-140, -36}}, color = {0, 0, 255}));
  connect(toPin2.plug_p, toPin3.plug_p) annotation (
    Line(points = {{-150, -36}, {-150, -42}, {-140, -42}, {-140, -36}}, color = {0, 0, 255}));
  connect(voltageSensor.plug_n, delta.plug_p) annotation (
    Line(points = {{-134, -52}, {-152, -52}}, color = {0, 0, 255}));
  connect(delta.plug_n, toPin3.plug_p) annotation (
    Line(points = {{-152, -68}, {-162, -68}, {-162, -42}, {-140, -42}, {-140, -36}}, color = {0, 0, 255}));
  connect(voltageSensor.v, pLL.u) annotation (
    Line(points = {{-125.2, -60}, {-116, -60}}, color = {0, 0, 127}));
  connect(bridge.pin2, inductor2.n) annotation (
    Line(points = {{-45.792, 12}, {-106, 12}}, color = {0, 0, 255}));
  connect(bridge.pin3, inductor3.n) annotation (
    Line(points = {{-45.792, 6.96}, {-60, 6.96}, {-60, -7.8754}, {-105.061, -7.8754}}, color = {0, 0, 255}));
  connect(bridge.pin1, inductor1.n) annotation (
    Line(points = {{-45.792, 17.04}, {-60, 17.04}, {-60, 31.6276}, {-106.138, 31.6276}}, color = {0, 0, 255}));
  connect(pulserY.wt, replicator1.y) annotation (Line(points={{-45.9895,-55.59},
          {-60,-55.59},{-60,-60},{-61,-60}}, color={0,0,127}));
  connect(bridge.P, pulserY.y) annotation (
    Line(points={{-18.264,12},{0,12},{0,-59},{-17.9845,-59}},          color = {255, 0, 255}));
  connect(pulserY.firingAngle, replicator2.y) annotation (
    Line(points = {{-45.9895, -62.19}, {-54, -62.19}, {-54, -88}, {-63.2, -88}}, color = {0, 0, 127}));
  connect(Fire.y, replicator2.u) annotation (
    Line(points = {{-99.4, -88}, {-81.6, -88}}, color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 80}})),
    experiment(StopTime = 0.3, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>

<p>This examples is created with a combination of <code>bridge</code> and <code>PLL</code>. Here the bridge is operated in inverter mode (alpha=140 degrees).</p>
<p>It is recommended to check the following:</p>
<ul>
<li>Voltage: <code>mean.u</code>, <code>mean.y</code></li>
<li>Current: <code>Rdc.i</code></li>
</ul>

</body>
</html>"));
end SixPulseInverter;
