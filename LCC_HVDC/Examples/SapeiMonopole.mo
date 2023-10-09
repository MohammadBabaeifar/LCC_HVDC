within LCC_HVDC.Examples;
model SapeiMonopole
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation (
    Placement(visible = true, transformation(extent = {{-86, 22}, {-78, 30}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
    Placement(transformation(origin = {-186, 42}, extent = {{-8, -8}, {8, 8}}, rotation = 180)));
  Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
    Placement(transformation(origin = {-194, -1}, extent = {{-7, -6}, {7, 6}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground groundS annotation (
    Placement(transformation(extent = {{-200, -44}, {-188, -32}})));
  Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(2.9, 3)) annotation (
    Placement(transformation(extent = {{-174, 36}, {-162, 48}})));
  Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.0925, 3), inductor(i(fixed={false,true,true}))) annotation (
    Placement(transformation(extent = {{-158, 34}, {-144, 50}})));
  Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
    Placement(visible = true, transformation(origin = {-115, -25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  LCC_HVDC.Models.HVDCpole FiumeSanto1(BlockTime=0.111247, Inverter=0, transformer(tertiaryInductance(inductor(i(fixed={true,false,true}))),
          primaryInductance(inductor(i(fixed={true,false,true})))), smoothingL(
          i(fixed=true)))
    annotation (Placement(transformation(extent={{-132,32},{-106,54}})));
  LCC_HVDC.Models.Cable cable(r=0.011, Vnom=500)
    annotation (Placement(transformation(extent={{-72,34},{-52,52}})));
  LCC_HVDC.Models.HVDCpole Latina1(BlockTime=0.131840, Inverter=1, transformer(tertiaryInductance(inductor(i(fixed={true,false,true}))),
          primaryInductance(inductor(i(fixed={true,false,true})))), smoothingL(
          i(fixed=true)))
    annotation (Placement(transformation(
        extent={{-13,-11},{13,11}},
        rotation=180,
        origin={-9,43})));
  Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource1(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
    Placement(transformation(origin = {64, 44}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.Star starS1(m = 3) annotation (
    Placement(transformation(origin = {74, 3}, extent = {{-7, -6}, {7, 6}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground groundS1 annotation (
    Placement(transformation(extent = {{68, -40}, {80, -28}})));
  Modelica.Electrical.Polyphase.Basic.Resistor LatinaR(R = fill(1.1217, 3)) annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {46, 44})));
  Modelica.Electrical.Polyphase.Basic.Inductor LatinaL(L = fill(0.0356, 3), inductor(i(fixed={false,true,true}))) annotation (
    Placement(transformation(extent = {{-7, -8}, {7, 8}}, rotation = 180, origin = {29, 44})));
  Modelica.Blocks.Sources.Step vRefS2(height = -0.1, offset = 1, startTime = 0.3) annotation (
    Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 180, origin = {-11, -25})));
  LCC_HVDC.Models.IdcController poleControl1(
    Ti=0.08,
    k=0.5,
    uMin=0.45e6,
    uMax=0.55e6,
    y_start=0.8,
    IdcBase=1000) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=180,
        origin={-117,-1})));
  LCC_HVDC.Models.VdcController poleControl2(
    Ti=0.07,
    k=0.7,
    y_start=-0.8,
    VdcBase=0.5e6) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-11,-1})));
equation
  connect(starS.pin_n, groundS.p) annotation (
    Line(points = {{-194, -8}, {-194, -32}}, color = {0, 0, 255}));
  connect(FS_R.plug_p, Vsource.plug_p) annotation (
    Line(points = {{-174, 42}, {-178, 42}}, color = {0, 0, 255}));
  connect(FS_R.plug_n, FS_L.plug_p) annotation (
    Line(points = {{-162, 42}, {-158, 42}}, color = {0, 0, 255}));
  connect(Vsource.plug_n, starS.plug_p) annotation (
    Line(points = {{-194, 42}, {-194, 6}}, color = {0, 0, 255}));
  connect(FS_L.plug_n, FiumeSanto1.ac) annotation (
    Line(points = {{-144, 42}, {-138, 42}, {-138, 43.44}, {-132.26, 43.44}}, color = {0, 0, 255}));
  connect(cable.pin_P, FiumeSanto1.pin_p) annotation (Line(points={{-73.1,
          48.49},{-78,48.49},{-78,45.75},{-104.57,45.75}}, color={0,0,255}));
  connect(cable.pin_N, FiumeSanto1.pin_n) annotation (Line(points={{-73,
          38.14},{-78,38.14},{-78,39.81},{-104.57,39.81}}, color={0,0,255}));
  connect(starS1.pin_n, groundS1.p) annotation (
    Line(points = {{74, -4}, {74, -28}}, color = {0, 0, 255}));
  connect(starS1.plug_p, Vsource1.plug_n) annotation (
    Line(points = {{74, 10}, {74, 44}, {72, 44}}, color = {0, 0, 255}));
  connect(LatinaR.plug_p, Vsource1.plug_p) annotation (
    Line(points = {{52, 44}, {56, 44}}, color = {0, 0, 255}));
  connect(LatinaL.plug_p, LatinaR.plug_n) annotation (
    Line(points = {{36, 44}, {40, 44}}, color = {0, 0, 255}));
  connect(LatinaL.plug_n, Latina1.ac) annotation (
    Line(points = {{22, 44}, {22, 42.56}, {4.26, 42.56}}, color = {0, 0, 255}));
  connect(cable.pin_P1, Latina1.pin_n) annotation (Line(points={{-50.9,
          48.13},{-44,48.13},{-44,46.19},{-23.43,46.19}}, color={0,0,255}));
  connect(cable.pin_N1, Latina1.pin_p) annotation (Line(points={{-51,37.96},
          {-51,38},{-44,38},{-44,40.25},{-23.43,40.25}}, color={0,0,255}));
  connect(Ground1.p, FiumeSanto1.pin_n) annotation (
    Line(points = {{-82, 30}, {-82, 39.81}, {-104.57, 39.81}}, color = {0, 0, 255}));
  connect(poleControl1.pref, refPowS1.y) annotation (Line(points={{-107.01,
          -6.13},{-102,-6.13},{-102,-25},{-109.5,-25}}, color={0,0,127}));
  connect(FiumeSanto1.vdc, poleControl1.vdc) annotation (Line(points={{-104.31,
          34.75},{-100,34.75},{-100,-0.28},{-107.1,-0.28}}, color={0,0,127}));
  connect(FiumeSanto1.idc, poleControl1.idc) annotation (Line(points={{-104.31,
          50.59},{-96,50.59},{-96,4.94},{-107.1,4.94}}, color={0,0,127}));
  connect(poleControl1.alpha, FiumeSanto1.alpha) annotation (Line(points={{
          -127.26,-1.18},{-142,-1.18},{-142,36.18},{-133.3,36.18}}, color={
          0,0,127}));
  connect(poleControl2.vdcRef, vRefS2.y) annotation (Line(points={{-20.99,
          3.41},{-32,3.41},{-32,-25},{-16.5,-25}}, color={0,0,127}));
  connect(Latina1.vdc, poleControl2.vdc) annotation (Line(points={{-23.69,
          51.25},{-30,51.25},{-30,-5.59},{-20.99,-5.59}}, color={0,0,127}));
  connect(poleControl2.alpha,Latina1.alpha)  annotation (Line(points={{
          -0.47,-0.37},{12,-0.37},{12,49.82},{5.3,49.82}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -60}, {80, 80}})),
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
  <p>This example is an implementation of SAPEI HVDC link in Modelica.</p><a href=\"modelica://HVDC.Models.ReferenceInfo\">[See ReferenceInfo: 2]</a>
  <p>It is recommended to chek these outputs:</p>
  <ul>
    <li>Pole currrent: <code>FiumeSanto1.iMean.u</code></li>
    <li>Pole voltage: <code>FiumeSanto1.vMean.u, FiumeSanto1.vMean.y, Latina1.vMean.u, Latina1.vMean.y</code></li>
  </ul>
</body>
</html>"));
end SapeiMonopole;
