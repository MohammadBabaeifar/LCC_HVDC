within LCC_HVDC.Examples;
model TestCable
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation (
    Placement(visible = true, transformation(extent = {{26, 12}, {36, 22}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
    Placement(transformation(origin = {-178, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
    Placement(transformation(origin = {-189, -7}, extent = {{-11, -9}, {11, 9}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground groundS annotation (
    Placement(transformation(extent = {{-196, -44}, {-182, -30}})));
  Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
    Placement(transformation(extent = {{-166, 32}, {-148, 48}})));
  Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3)) annotation (
    Placement(transformation(extent = {{-144, 30}, {-124, 50}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 480e3) annotation (
    Placement(visible = true, transformation(origin = {31, 39}, extent = {{-7, -7}, {7, 7}}, rotation = 270)));
  Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {-28, -40})));
  LCC_HVDC.Models.PoleControl poleControl
    annotation (Placement(transformation(extent={{-86,-34},{-58,-12}})));
  Modelica.Blocks.Sources.Constant vRefS1(k = 0.90) annotation (
    Placement(visible = true, transformation(origin = {-28, -22}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  LCC_HVDC.Models.HVDCpole hVDCpole(BlockTime=0.111247, Inverter=0)
    annotation (Placement(transformation(extent={{-88,26},{-52,54}})));
  LCC_HVDC.Models.Cable cable(r=0.011, Vnom=500)
    annotation (Placement(transformation(extent={{-20,30},{4,50}})));
equation
  connect(starS.pin_n, groundS.p) annotation (
    Line(points = {{-189, -18}, {-189, -30}}, color = {0, 0, 255}));
  connect(FS_R.plug_p, Vsource.plug_p) annotation (
    Line(points = {{-166, 40}, {-168, 40}}, color = {0, 0, 255}));
  connect(FS_R.plug_n, FS_L.plug_p) annotation (
    Line(points = {{-148, 40}, {-144, 40}}, color = {0, 0, 255}));
  connect(Vsource.plug_n, starS.plug_p) annotation (
    Line(points = {{-188, 40}, {-188, 4}, {-189, 4}}, color = {0, 0, 255}));
  connect(poleControl.powerRef, refPowS1.y) annotation (
    Line(points = {{-56.18, -30.15}, {-52, -30.15}, {-52, -40}, {-34.6, -40}}, color = {0, 0, 127}));
  connect(poleControl.firingANGLE,hVDCpole.alpha)  annotation (
    Line(points = {{-87.68, -23}, {-106, -23}, {-106, 31.32}, {-89.8, 31.32}}, color = {0, 0, 127}));
  connect(FS_L.plug_n, hVDCpole.ac) annotation (
    Line(points = {{-124, 40}, {-102, 40}, {-102, 40.56}, {-88.36, 40.56}}, color = {0, 0, 255}));
  connect(hVDCpole.vdc, poleControl.vDC) annotation (Line(points={{-49.66,
          29.5},{-44,29.5},{-44,-16.73},{-56.18,-16.73}}, color={0,0,127}));
  connect(poleControl.iDC, hVDCpole.idc) annotation (Line(points={{-56.18,-25.75},
          {-40,-25.75},{-40,49.66},{-49.66,49.66}}, color={0,0,127}));
  connect(constantVoltage.p, cable.pin_P1) annotation (Line(points={{31,46},
          {31,52},{14,52},{14,45.7},{5.32,45.7}}, color={0,0,255}));
  connect(constantVoltage.n, cable.pin_N1) annotation (Line(points={{31,32},
          {31,28},{14,28},{14,34.4},{5.2,34.4}}, color={0,0,255}));
  connect(cable.pin_P, hVDCpole.pin_p) annotation (Line(points={{-21.32,
          46.1},{-28,46.1},{-28,43.5},{-50.02,43.5}}, color={0,0,255}));
  connect(cable.pin_N, hVDCpole.pin_n) annotation (Line(points={{-21.2,34.6},
          {-28,34.6},{-28,35.94},{-50.02,35.94}}, color={0,0,255}));
  connect(Ground1.p, cable.pin_N1) annotation (Line(points={{31,22},{31,28},
          {14,28},{14,34.4},{5.2,34.4}}, color={0,0,255}));
  connect(poleControl.vdcRef, vRefS1.y) annotation (
    Line(points = {{-56.18, -21.13}, {-45.39, -21.13}, {-45.39, -22}, {-34.6, -22}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -60}, {40, 80}})),
    experiment(StopTime = 0.7, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05));
end TestCable;
