within LCC_HVDC.Examples;
model TestController
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(extent = {{66, -66}, {82, -50}}, rotation = 0)));
  Modelica.Blocks.Math.Mean vMean(f = 600, x0 = 0.5e6) annotation (
    Placement(visible = true, transformation(origin = {34, 2}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 225e-3, i(start = 0)) annotation (
    Placement(visible = true, transformation(origin = {74, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 0.1) annotation (
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LCC_HVDC.Models.Bridge bridgeHV(iniOff={true,true,true,false,false,true})
    annotation (Placement(visible=true, transformation(
        origin={-34.8572,38},
        extent={{-11.1428,-12},{14.8572,12}},
        rotation=0)));
  LCC_HVDC.Models.PllPolePulser converterUnitControl(BlockTime=0.111247,
      vNom=400e3) annotation (Placement(visible=true, transformation(
        origin={-104,-40},
        extent={{-14,-5.99996},{14,20}},
        rotation=0)));
  Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
    Placement(transformation(origin = {-180, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
    Placement(transformation(origin = {-191, -13}, extent = {{-11, -9}, {11, 9}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground groundS annotation (
    Placement(transformation(extent = {{-198, -50}, {-184, -36}})));
  Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
    Placement(transformation(extent = {{-168, 26}, {-150, 42}})));
  Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3)) annotation (
    Placement(transformation(extent = {{-146, 24}, {-126, 44}})));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p r1(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-65, 52}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p s1(k = 2) annotation (
    Placement(visible = true, transformation(origin = {-65, 38}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p t1(k = 3) annotation (
    Placement(visible = true, transformation(origin = {-65, 24}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  LCC_HVDC.Models.ThreeWindingTransformer transformer
    annotation (Placement(transformation(extent={{-118,20},{-88,48}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 480e3) annotation (
    Placement(visible = true, transformation(origin = {88, 16}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Inductor Ldc1(L = 225e-3, i(start = 0)) annotation (
    Placement(visible = true, transformation(origin = {64, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Rdc1(R = 0.1) annotation (
    Placement(visible = true, transformation(origin = {38, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor UDC annotation (
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 270, origin = {16, 22})));
  LCC_HVDC.Models.Bridge bridgeHV1(iniOff={true,true,true,false,false,true})
    annotation (Placement(visible=true, transformation(
        origin={-34.8572,-4},
        extent={{-11.1428,-12},{14.8572,12}},
        rotation=0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p r2(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-65, 10}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p s2(k = 2) annotation (
    Placement(visible = true, transformation(origin = {-65, -4}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p t2(k = 3) annotation (
    Placement(visible = true, transformation(origin = {-65, -18}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
    Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 180, origin = {-27, -91})));
  LCC_HVDC.Models.PoleControl poleControl annotation (Placement(visible=
          true, transformation(
        origin={-3.875,-2},
        extent={{-88.125,-78},{-58.125,-56}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant vRefS1(k = 0.90) annotation (
    Placement(visible = true, transformation(origin = {-27, -59}, extent = {{-7, -7}, {7, 7}}, rotation = 180)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
    Placement(transformation(extent = {{20, 62}, {36, 78}})));
  Modelica.Blocks.Math.Mean iMean(f = 600) annotation (
    Placement(visible = true, transformation(origin = {42, 48}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression V_dc(y = vMean.y) annotation (
    Placement(visible = true, transformation(origin = {-26, -46}, extent = {{-10, -8}, {10, 8}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression i_dc(y = iMean.y) annotation (
    Placement(visible = true, transformation(origin = {-28, -74}, extent = {{-10, -8}, {10, 8}}, rotation = 180)));
equation
  connect(starS.pin_n, groundS.p) annotation (
    Line(points = {{-191, -24}, {-191, -36}}, color = {0, 0, 255}));
  connect(FS_R.plug_p, Vsource.plug_p) annotation (
    Line(points = {{-168, 34}, {-170, 34}}, color = {0, 0, 255}));
  connect(FS_R.plug_n, FS_L.plug_p) annotation (
    Line(points = {{-150, 34}, {-146, 34}}, color = {0, 0, 255}));
  connect(Vsource.plug_n, starS.plug_p) annotation (
    Line(points = {{-190, 34}, {-190, -2}, {-191, -2}}, color = {0, 0, 255}));
  connect(r1.plug_p, t1.plug_p) annotation (
    Line(points = {{-66.8, 52}, {-74, 52}, {-74, 24}, {-66.8, 24}}, color = {0, 0, 255}));
  connect(s1.plug_p, t1.plug_p) annotation (
    Line(points = {{-66.8, 38}, {-74, 38}, {-74, 24}, {-66.8, 24}}, color = {0, 0, 255}));
  connect(r1.pin_p, bridgeHV.pin1) annotation (
    Line(points = {{-63.2, 52}, {-58, 52}, {-58, 43.04}, {-47.04, 43.04}}, color = {0, 0, 255}));
  connect(s1.pin_p, bridgeHV.pin2) annotation (
    Line(points = {{-63.2, 38}, {-47.04, 38}}, color = {0, 0, 255}));
  connect(bridgeHV.pin3, t1.pin_p) annotation (
    Line(points = {{-47.04, 32.96}, {-58, 32.96}, {-58, 24}, {-63.2, 24}}, color = {0, 0, 255}));
  connect(FS_L.plug_n,transformer.primary3phase)  annotation (
    Line(points = {{-126, 34}, {-118, 34}}, color = {0, 0, 255}));
  connect(transformer.secondary3phase, t1.plug_p) annotation (
    Line(points = {{-87.7, 38.2}, {-87.7, 38}, {-74, 38}, {-74, 24}, {-66.8, 24}}, color = {0, 0, 255}));
  connect(converterUnitControl.ac3Phase, FS_L.plug_n) annotation (
    Line(points={{-118.28,-33},{-125.66,-33},{-125.66,34},{-126,34}},          color = {0, 0, 255}));
  connect(Ldc.p, Rdc.n) annotation (
    Line(points = {{64, 70}, {60, 70}}, color = {0, 0, 255}));
  connect(Ldc1.p, Rdc1.n) annotation (
    Line(points = {{54, -40}, {48, -40}}, color = {0, 0, 255}));
  connect(constantVoltage.p, Ldc.n) annotation (
    Line(points = {{88, 26}, {88, 70}, {84, 70}}, color = {0, 0, 255}));
  connect(constantVoltage.n, Ldc1.n) annotation (
    Line(points = {{88, 6}, {88, -40}, {74, -40}}, color = {0, 0, 255}));
  connect(UDC.v, vMean.u) annotation (
    Line(points = {{7.2, 22}, {6, 22}, {6, 2}, {24.4, 2}}, color = {0, 0, 127}));
  connect(s2.pin_p, bridgeHV1.pin2) annotation (
    Line(points = {{-63.2, -4}, {-47.04, -4}}, color = {0, 0, 255}));
  connect(bridgeHV1.pin1, r2.pin_p) annotation (
    Line(points = {{-47.04, 1.04}, {-58, 1.04}, {-58, 10}, {-63.2, 10}}, color = {0, 0, 255}));
  connect(bridgeHV1.pin3, t2.pin_p) annotation (
    Line(points = {{-47.04, -9.04}, {-58, -9.04}, {-58, -18}, {-63.2, -18}}, color = {0, 0, 255}));
  connect(r2.plug_p, t2.plug_p) annotation (
    Line(points = {{-66.8, 10}, {-72, 10}, {-72, -18}, {-66.8, -18}}, color = {0, 0, 255}));
  connect(s2.plug_p, t2.plug_p) annotation (
    Line(points = {{-66.8, -4}, {-72, -4}, {-72, -18}, {-66.8, -18}}, color = {0, 0, 255}));
  connect(transformer.tertiary3phase, t2.plug_p) annotation (
    Line(points = {{-87.7, 29.8}, {-80, 29.8}, {-80, -4}, {-72, -4}, {-72, -18}, {-66.8, -18}}, color = {0, 0, 255}));
  connect(converterUnitControl.pY, bridgeHV.P) annotation (
    Line(points = {{-88.32, -25.2}, {-2, -25.2}, {-2, 38}, {-18.18, 38}}, color = {255, 0, 255}));
  connect(converterUnitControl.pD, bridgeHV1.P) annotation (
    Line(points={{-88.32,-41.06},{-8,-41.06},{-8,-4},{-18.18,-4}},          color = {255, 0, 255}));
  connect(bridgeHV.pin_n, bridgeHV1.pin_p) annotation (
    Line(points = {{-18.96, 30.56}, {-12, 30.56}, {-12, 3.2}, {-18.96, 3.2}}, color = {0, 0, 255}));
  connect(Rdc1.p, bridgeHV1.pin_n) annotation (
    Line(points = {{28, -40}, {10, -40}, {10, -11.44}, {-18.96, -11.44}}, color = {0, 0, 255}));
  connect(ground1.p, Ldc1.n) annotation (
    Line(points = {{74, -50}, {74, -40}}, color = {0, 0, 255}));
  connect(UDC.n, bridgeHV1.pin_n) annotation (
    Line(points = {{16, 14}, {16, -40}, {10, -40}, {10, -11.44}, {-18.96, -11.44}}, color = {0, 0, 255}));
  connect(currentSensor.n, Rdc.p) annotation (
    Line(points = {{36, 70}, {40, 70}}, color = {0, 0, 255}));
  connect(currentSensor.p, bridgeHV.pin_p) annotation (
    Line(points = {{20, 70}, {10, 70}, {10, 45.2}, {-18.96, 45.2}}, color = {0, 0, 255}));
  connect(iMean.u, currentSensor.i) annotation (
    Line(points = {{32.4, 48}, {28, 48}, {28, 61.2}}, color = {0, 0, 127}));
  connect(UDC.p, bridgeHV.pin_p) annotation (
    Line(points = {{16, 30}, {16, 70}, {10, 70}, {10, 45.2}, {-18.96, 45.2}}, color = {0, 0, 255}));
  connect(poleControl.firingANGLE,converterUnitControl.alpha)  annotation (
    Line(points={{-93.8,-69},{-103.86,-69},{-103.86,-47.69}},        color = {0, 0, 127}));
  connect(poleControl.vdcRef, vRefS1.y) annotation (
    Line(points = {{-60.05, -67.13}, {-50.6731, -67.13}, {-50.6731, -59}, {-34.7, -59}}, color = {0, 0, 127}));
  connect(poleControl.powerRef, refPowS1.y) annotation (
    Line(points = {{-60.05, -76.15}, {-50, -76.15}, {-50, -91}, {-34.7, -91}}, color = {0, 0, 127}));
  connect(poleControl.vDC, V_dc.y) annotation (
    Line(points = {{-60.05, -62.73}, {-54, -62.73}, {-54, -46}, {-37, -46}}, color = {0, 0, 127}));
  connect(i_dc.y, poleControl.iDC) annotation (
    Line(points = {{-39, -74}, {-44, -74}, {-44, -71.75}, {-60.05, -71.75}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -110}, {100, 100}})),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 80}})),
    experiment(StopTime = 0.7, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
<h1>Background</h1>
<p>In LCC HVDC systems, voltage and current of converter can be controlled by
either changing the firing angle α (fast control) or the
transformer secondary voltage (Vs) through onload tap
changer (slow control). The figure in the below depicts
the basic control characteristics of an LCC_HVDC link. Rectifier
can control either αmin (AB) or current (BC). Also, inverter
can control ɣmin (DE) or current (EF). In normal operation, the
rectifier controls the current by changing alpha and the
inverter controls the minimum gamma. This control strategy
could yield a lower reactive power consumption due to low
values of gamma (by inverter) and alpha (to deliver maximum
power by rectifier).</p>
<a href=\"modelica://LCC_HVDC.Models.ReferenceInfo\">[See ReferenceInfo: 4]</a>

<p><img src=\"modelica://LCC_HVDC/Resources/Images/ConverterCharacteristics.png\" alt=\"Basic control characteristics of an HVDC link\"></p>

<p>This example illustrates a 12 pulse converter that operates in the rectifier mode. According to above-mentioned background, here the rectifier is responsible for current control. A ramp-based function is applied to the controller as the reference of active power. The controller therefore varies alpha to generate enough DC voltage to meet the active power demand.</p>
<p>You can see the following variables:</P>
  <ul>
    <li>Firing angle: <code>poleControl.firingANGLE</code></li>
    <li>DC current: <code>Rdc.i</code></li>
  </ul>
</body>
</html>"));
end TestController;
