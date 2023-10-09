within LCC_HVDC.Examples;
model PllBridge
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
  Modelica.Electrical.Analog.Sources.RampVoltage rampVoltage(V = 0, duration = 0.08, offset = 440) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 90, origin = {44, -20})));
  LCC_HVDC.Models.Bridge bridge(iniOff={true,true,true,false,false,true},
      vThyMax=(400)*(sqrt(2))) annotation (Placement(visible=true,
        transformation(
        origin={-10.5714,13},
        extent={{-9.42861,-11},{12.5714,11}},
        rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage1(phase = iniAngle1, f = f, V = VAC*sqrt(2/3)) annotation (
    Placement(visible = true, transformation(extent = {{-116, 22}, {-136, 42}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage2(f = f, phase = iniAngle1 - 2/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
    Placement(visible = true, transformation(extent = {{-116, 2}, {-136, 22}}, rotation = 0)));
  Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage3(f = f, phase = iniAngle1 - 4/3*Modelica.Constants.pi, V = VAC*sqrt(2/3)) annotation (
    Placement(visible = true, transformation(extent = {{-116, -18}, {-136, 2}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor2(i(start = -iStart), L = inductor1.L) annotation (
    Placement(visible = true, transformation(extent = {{-72, 2}, {-52, 22}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(i(start = iStart), L = Lc) annotation (
    Placement(visible = true, transformation(origin = {-62.138, 31.6276}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor inductor3(L = inductor1.L) annotation (
    Placement(visible = true, transformation(origin = {-61.061, -7.8754}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor i1 annotation (
    Placement(visible = true, transformation(extent = {{-108, 42}, {-88, 22}}, rotation = 0)));
  Modelica.Blocks.Math.RootMeanSquare I1rmsM(f = 50) annotation (
    Placement(visible = true, transformation(origin = {-98, 58}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin1(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-108, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin2(k = 2) annotation (
    Placement(visible = true, transformation(origin = {-96, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p toPin3(k = 3) annotation (
    Placement(visible = true, transformation(origin = {-86, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  LCC_HVDC.Models.PllPolePulser pLLPulser(BlockTime=0.111247, vNom=400)
    annotation (Placement(visible=true, transformation(
        origin={-8,-40.4616},
        extent={{-12,-5.53843},{12,18.4616}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant Fire(k = 140) annotation (
    Placement(visible = true, transformation(origin = {-49, -59}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
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
    Line(points = {{44, 60}, {20, 60}, {20, 19.6}, {2.88, 19.6}}, color = {0, 0, 255}));
  connect(bridge.pin_n, rampVoltage.p) annotation (
    Line(points = {{2.88, 6.18}, {20, 6.18}, {20, -30}, {44, -30}}, color = {0, 0, 255}));
  connect(inductor3.p, sineVoltage3.p) annotation (
    Line(points = {{-71.061, -7.8754}, {-94, -7.8754}, {-94, -8}, {-116, -8}}));
  connect(sineVoltage1.n, sineVoltage2.n) annotation (
    Line(points = {{-136, 32}, {-136, 12}}, color = {0, 0, 255}));
  connect(sineVoltage2.n, sineVoltage3.n) annotation (
    Line(points = {{-136, 12}, {-136, -8}}, color = {0, 0, 255}));
  connect(sineVoltage2.p, inductor2.p) annotation (
    Line(points = {{-116, 12}, {-72, 12}}, color = {0, 0, 255}));
  connect(sineVoltage1.p, i1.p) annotation (
    Line(points = {{-116, 32}, {-108, 32}}, color = {0, 0, 255}));
  connect(inductor1.p, i1.n) annotation (
    Line(points = {{-72.138, 31.6276}, {-80, 31.6276}, {-80, 32}, {-88, 32}}, color = {0, 0, 255}));
  connect(I1rmsM.u, i1.i) annotation (
    Line(points = {{-98, 46}, {-98, 43}}, color = {0, 0, 127}));
  connect(toPin2.pin_p, inductor2.p) annotation (
    Line(points = {{-96, -20}, {-96, 12}, {-72, 12}}, color = {0, 0, 255}));
  connect(toPin1.pin_p, i1.p) annotation (
    Line(points = {{-108, -20}, {-108, 32}}, color = {0, 0, 255}));
  connect(toPin3.pin_p, sineVoltage3.p) annotation (
    Line(points = {{-86, -20}, {-86, -7.8754}, {-91.646, -7.8754}, {-91.646, -8}, {-116, -8}}, color = {0, 0, 255}));
  connect(toPin1.plug_p, toPin3.plug_p) annotation (
    Line(points = {{-108, -24}, {-108, -34}, {-86, -34}, {-86, -24}}, color = {0, 0, 255}));
  connect(toPin2.plug_p, toPin3.plug_p) annotation (
    Line(points = {{-96, -24}, {-96, -34}, {-86, -34}, {-86, -24}}, color = {0, 0, 255}));
  connect(bridge.pin2, inductor2.n) annotation (
    Line(points={{-20.88,13},{-38,13},{-38,12},{-52,12}},          color = {0, 0, 255}));
  connect(bridge.pin3, inductor3.n) annotation (
    Line(points={{-20.88,8.38},{-38,8.38},{-38,-7.8754},{-51.061,-7.8754}},          color = {0, 0, 255}));
  connect(bridge.pin1, inductor1.n) annotation (
    Line(points={{-20.88,17.62},{-38,17.62},{-38,31.6276},{-52.138,31.6276}},          color = {0, 0, 255}));
  connect(Fire.y,pLLPulser.alpha)  annotation (
    Line(points={{-36.9,-59},{-36.9,-60},{-7.88,-60},{-7.88,-47.56}},          color = {0, 0, 127}));
  connect(pLLPulser.pY, bridge.P) annotation (
    Line(points = {{5.44, -26.8}, {12, -26.8}, {12, 13}, {3.54, 13}}, color = {255, 0, 255}));
  connect(pLLPulser.ac3Phase, toPin2.plug_p) annotation (
    Line(points={{-20.24,-34},{-96,-34},{-96,-24}},        color = {0, 0, 255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -80}, {100, 80}})),
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

<p>In this example, the performance of two models namely PllPolePulser and Bridge are tested. PllPolePulser contains PLL and pulse generator. Here the bridge is operated in inverter mode (alpha=140 degrees).</p>
<p>It is recommended to check the following.</p>
<ul>
<li>Voltage: <code>mean.u</code>, <code>mean.y</code></li>
<li>Current: <code>Rdc.i</code></li>
</ul>
<p> To see the accuracy of pulse timing you can check:</p>
<ul>
<li><code>bridge.thyristor1.fire</code></li>
<li><code>bridge.thyristor1.v</code></li>
<li><code>bridge.Vrs</code></li>
<li><code>bridge.Vts</code></li>
</ul>

</body>
</html>"));
end PllBridge;
