within LCC_HVDC.Examples;
model TestTransformer
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
  Real vrs =transformer.primary3phase.pin[1].v  -transformer.primary3phase.pin[
      2].v;
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(extent = {{66, -90}, {82, -74}}, rotation = 0)));
  Modelica.Blocks.Math.Mean mean(f = 600) annotation (
    Placement(visible = true, transformation(origin = {34, -22}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 225e-3, i(start = 0)) annotation (
    Placement(visible = true, transformation(origin = {64, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 0.1) annotation (
    Placement(visible = true, transformation(origin = {38, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LCC_HVDC.Models.Bridge bridgeHV(iniOff={true,true,true,false,false,true})
    annotation (Placement(visible=true, transformation(
        origin={-34.8572,14},
        extent={{-11.1428,-12},{14.8572,12}},
        rotation=0)));
  LCC_HVDC.Models.PllPolePulser converterUnitControl(BlockTime=0.111247,
      vNom=400e3) annotation (Placement(visible=true, transformation(
        origin={-104,-70.4615},
        extent={{-14,-5.53847},{14,18.4615}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant Fire(k = 10) annotation (
    Placement(visible = true, transformation(origin = {-146, -90}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
    Placement(transformation(origin = {-180, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
    Placement(transformation(origin = {-191, -37}, extent = {{-11, -9}, {11, 9}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground groundS annotation (
    Placement(transformation(extent = {{-198, -74}, {-184, -60}})));
  Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
    Placement(transformation(extent = {{-168, 2}, {-150, 18}})));
  Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3)) annotation (
    Placement(transformation(extent = {{-146, 0}, {-126, 20}})));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p r1(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-65, 28}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p s1(k = 2) annotation (
    Placement(visible = true, transformation(origin = {-65, 14}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p t1(k = 3) annotation (
    Placement(visible = true, transformation(origin = {-65, 0}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  LCC_HVDC.Models.ThreeWindingTransformer transformer
    annotation (Placement(transformation(extent={{-118,-4},{-90,22}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 490e3) annotation (
    Placement(visible = true, transformation(origin = {78, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Inductor Ldc1(L = 225e-3, i(start = 0)) annotation (
    Placement(visible = true, transformation(origin = {64, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Rdc1(R = 0.1) annotation (
    Placement(visible = true, transformation(origin = {38, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor UDC annotation (
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 270, origin = {18, -2})));
  LCC_HVDC.Models.Bridge bridgeHV1(iniOff={true,true,true,false,false,true})
    annotation (Placement(visible=true, transformation(
        origin={-34.8572,-34},
        extent={{-11.1428,-12},{14.8572,12}},
        rotation=0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p r2(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-65, -20}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p s2(k = 2) annotation (
    Placement(visible = true, transformation(origin = {-65, -34}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p t2(k = 3) annotation (
    Placement(visible = true, transformation(origin = {-65, -48}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
equation
  connect(starS.pin_n, groundS.p) annotation (
    Line(points = {{-191, -48}, {-191, -60}}, color = {0, 0, 255}));
  connect(FS_R.plug_p, Vsource.plug_p) annotation (
    Line(points = {{-168, 10}, {-170, 10}}, color = {0, 0, 255}));
  connect(FS_R.plug_n, FS_L.plug_p) annotation (
    Line(points = {{-150, 10}, {-146, 10}}, color = {0, 0, 255}));
  connect(Vsource.plug_n, starS.plug_p) annotation (
    Line(points = {{-190, 10}, {-190, -26}, {-191, -26}}, color = {0, 0, 255}));
  connect(r1.plug_p, t1.plug_p) annotation (
    Line(points = {{-66.8, 28}, {-74, 28}, {-74, 0}, {-66.8, 0}}, color = {0, 0, 255}));
  connect(s1.plug_p, t1.plug_p) annotation (
    Line(points = {{-66.8, 14}, {-74, 14}, {-74, 0}, {-66.8, 0}}, color = {0, 0, 255}));
  connect(r1.pin_p, bridgeHV.pin1) annotation (
    Line(points = {{-63.2, 28}, {-58, 28}, {-58, 19.04}, {-47.04, 19.04}}, color = {0, 0, 255}));
  connect(s1.pin_p, bridgeHV.pin2) annotation (
    Line(points = {{-63.2, 14}, {-47.04, 14}}, color = {0, 0, 255}));
  connect(bridgeHV.pin3, t1.pin_p) annotation (
    Line(points = {{-47.04, 8.96}, {-58, 8.96}, {-58, 0}, {-63.2, 0}}, color = {0, 0, 255}));
  connect(FS_L.plug_n,transformer.primary3phase)  annotation (
    Line(points = {{-126, 10}, {-118, 10}, {-118, 9}}, color = {0, 0, 255}));
  connect(transformer.secondary3phase, t1.plug_p) annotation (
    Line(points = {{-89.72, 12.9}, {-89.72, 14}, {-74, 14}, {-74, 0}, {-66.8, 0}}, color = {0, 0, 255}));
  connect(converterUnitControl.ac3Phase, FS_L.plug_n) annotation (
    Line(points={{-118.28,-64},{-125.66,-64},{-125.66,10},{-126,10}},          color = {0, 0, 255}));
  connect(Ldc.p, Rdc.n) annotation (
    Line(points = {{54, 46}, {48, 46}}, color = {0, 0, 255}));
  connect(Rdc.p, bridgeHV.pin_p) annotation (
    Line(points = {{28, 46}, {8, 46}, {8, 21.2}, {-18.96, 21.2}}, color = {0, 0, 255}));
  connect(Ldc1.p, Rdc1.n) annotation (
    Line(points = {{54, -64}, {48, -64}}, color = {0, 0, 255}));
  connect(constantVoltage.p, Ldc.n) annotation (
    Line(points = {{78, -2}, {78, 46}, {74, 46}}, color = {0, 0, 255}));
  connect(constantVoltage.n, Ldc1.n) annotation (
    Line(points = {{78, -22}, {78, -64}, {74, -64}}, color = {0, 0, 255}));
  connect(UDC.v, mean.u) annotation (
    Line(points = {{9.2, -2}, {10, -2}, {10, -22}, {24.4, -22}}, color = {0, 0, 127}));
  connect(s2.pin_p, bridgeHV1.pin2) annotation (
    Line(points = {{-63.2, -34}, {-47.04, -34}}, color = {0, 0, 255}));
  connect(bridgeHV1.pin1, r2.pin_p) annotation (
    Line(points = {{-47.04, -28.96}, {-58, -28.96}, {-58, -20}, {-63.2, -20}}, color = {0, 0, 255}));
  connect(bridgeHV1.pin3, t2.pin_p) annotation (
    Line(points = {{-47.04, -39.04}, {-58, -39.04}, {-58, -48}, {-63.2, -48}}, color = {0, 0, 255}));
  connect(r2.plug_p, t2.plug_p) annotation (
    Line(points = {{-66.8, -20}, {-72, -20}, {-72, -48}, {-66.8, -48}}, color = {0, 0, 255}));
  connect(s2.plug_p, t2.plug_p) annotation (
    Line(points = {{-66.8, -34}, {-72, -34}, {-72, -48}, {-66.8, -48}}, color = {0, 0, 255}));
  connect(transformer.tertiary3phase, t2.plug_p) annotation (
    Line(points = {{-89.72, 5.1}, {-80, 5.1}, {-80, -34}, {-72, -34}, {-72, -48}, {-66.8, -48}}, color = {0, 0, 255}));
  connect(converterUnitControl.pY, bridgeHV.P) annotation (
    Line(points = {{-88.32, -56.8}, {-2, -56.8}, {-2, 14}, {-18.18, 14}}, color = {255, 0, 255}));
  connect(converterUnitControl.pD, bridgeHV1.P) annotation (
    Line(points={{-88.32,-71.44},{-8,-71.44},{-8,-34},{-18.18,-34}},          color = {255, 0, 255}));
  connect(bridgeHV.pin_n, bridgeHV1.pin_p) annotation (
    Line(points = {{-18.96, 6.56}, {-12, 6.56}, {-12, -26.8}, {-18.96, -26.8}}, color = {0, 0, 255}));
  connect(Rdc1.p, bridgeHV1.pin_n) annotation (
    Line(points = {{28, -64}, {10, -64}, {10, -41.44}, {-18.96, -41.44}}, color = {0, 0, 255}));
  connect(UDC.p, bridgeHV.pin_p) annotation (
    Line(points = {{18, 6}, {18, 46}, {8, 46}, {8, 21.2}, {-18.96, 21.2}}, color = {0, 0, 255}));
  connect(ground1.p, Ldc1.n) annotation (
    Line(points = {{74, -74}, {74, -64}}, color = {0, 0, 255}));
  connect(UDC.n, bridgeHV1.pin_n) annotation (
    Line(points = {{18, -10}, {18, -64}, {10, -64}, {10, -41.44}, {-18.96, -41.44}}, color = {0, 0, 255}));
  connect(converterUnitControl.alpha, Fire.y) annotation (
    Line(points={{-103.86,-77.56},{-103.86,-90},{-139.4,-90}},        color = {0, 0, 127}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 80}})),
    experiment(StopTime = 0.3, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
    Documentation(info = "<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>This example shows the performance of the 3-phase three winding transformer model of this package.</p>
  <p>To see the effect of your chosen value of transformer ratio and to observe the 30-degree phase shift between the Y and D voltages of the secondary and tertiary, you can check:</p>
  <ul>
    <li>L-L voltage of primary side: <code>vrs</code></li>
    <li>L-L voltage of secondary side: <code>bridgeHV.Vrs</code></li>
    <li>L-L voltage of tertiary side: <code>bridgeHV1.Vrs</code></li>
  </ul>
</body>
</html>"));
end TestTransformer;
