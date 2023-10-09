within LCC_HVDC.Examples;
model TestPole
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation (
    Placement(visible = true, transformation(extent = {{16, -4}, {32, 12}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
    Placement(transformation(origin = {-170, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
    Placement(transformation(origin = {-181, -7}, extent = {{-11, -9}, {11, 9}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground groundS annotation (
    Placement(transformation(extent = {{-188, -44}, {-174, -30}})));
  Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
    Placement(transformation(extent = {{-158, 32}, {-140, 48}})));
  Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3), inductor(i(fixed={false,true,true}))) annotation (
    Placement(transformation(extent = {{-136, 30}, {-116, 50}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 480e3) annotation (
    Placement(visible = true, transformation(origin = {24, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-20, -40})));
  LCC_HVDC.Models.PoleControl poleControl
    annotation (Placement(transformation(extent={{-86,-34},{-58,-12}})));
  Modelica.Blocks.Sources.Constant vRefS1(k = 0.90) annotation (
    Placement(visible = true, transformation(origin = {-20, -22}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  LCC_HVDC.Models.HVDCpole hVDCpole(BlockTime=0.111247, Inverter=0, transformer(tertiaryInductance(inductor(i(fixed={true,false,true})))),
        smoothingL(i(fixed=true)))
    annotation (Placement(transformation(extent={{-86,26},{-52,54}})));
equation
  connect(starS.pin_n, groundS.p) annotation (
    Line(points = {{-181, -18}, {-181, -30}}, color = {0, 0, 255}));
  connect(FS_R.plug_p, Vsource.plug_p) annotation (
    Line(points = {{-158, 40}, {-160, 40}}, color = {0, 0, 255}));
  connect(FS_R.plug_n, FS_L.plug_p) annotation (
    Line(points = {{-140, 40}, {-136, 40}}, color = {0, 0, 255}));
  connect(Vsource.plug_n, starS.plug_p) annotation (
    Line(points = {{-180, 40}, {-180, 4}, {-181, 4}}, color = {0, 0, 255}));
  connect(poleControl.vdcRef, vRefS1.y) annotation (
    Line(points = {{-56.18, -21.13}, {-54.6231, -21.13}, {-54.6231, -22}, {-26.6, -22}}, color = {0, 0, 127}));
  connect(poleControl.powerRef, refPowS1.y) annotation (
    Line(points = {{-56.18, -30.15}, {-46, -30.15}, {-46, -40}, {-26.6, -40}}, color = {0, 0, 127}));
  connect(poleControl.firingANGLE,hVDCpole.alpha)  annotation (
    Line(points = {{-87.68, -23}, {-94, -23}, {-94, 31.32}, {-87.7, 31.32}}, color = {0, 0, 127}));
  connect(FS_L.plug_n, hVDCpole.ac) annotation (
    Line(points = {{-116, 40}, {-94, 40}, {-94, 40.56}, {-86.34, 40.56}}, color = {0, 0, 255}));
  connect(constantVoltage.n, hVDCpole.pin_n) annotation (
    Line(points = {{24, 28}, {24, 18}, {-22, 18}, {-22, 35.94}, {-50.13, 35.94}}, color = {0, 0, 255}));
  connect(constantVoltage.p, hVDCpole.pin_p) annotation (
    Line(points = {{24, 48}, {24, 62}, {-22, 62}, {-22, 43.5}, {-50.13, 43.5}}, color = {0, 0, 255}));
  connect(hVDCpole.vdc, poleControl.vDC) annotation (Line(points={{-49.79,
          29.5},{-44,29.5},{-44,-16.73},{-56.18,-16.73}}, color={0,0,127}));
  connect(poleControl.iDC, hVDCpole.idc) annotation (Line(points={{-56.18,-25.75},
          {-40,-25.75},{-40,49.66},{-49.79,49.66}}, color={0,0,127}));
  connect(Ground1.p, hVDCpole.pin_n) annotation (
    Line(points = {{24, 12}, {24, 18}, {-22, 18}, {-22, 35.94}, {-50.13, 35.94}}, color = {0, 0, 255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -60}, {40, 80}})),
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
  <p>Check <code>poleControl.firingANGLE</code>  to see alpha i.e. the controler output.</p>
  <p>Also, check:</p>
  <ul>
    <li>Pole currrent: <code>hVDCpole.iMean.u</code></li>
    <li>Pole voltage: <code>hVDCpole.vMean.u, hVDCpole.vMean.y</code></li>
  </ul>
</body>
</html>"));
end TestPole;
