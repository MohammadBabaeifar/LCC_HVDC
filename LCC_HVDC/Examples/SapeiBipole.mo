within LCC_HVDC.Examples;
model SapeiBipole
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
  Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
    Placement(transformation(origin = {-186, 26}, extent = {{-8, -8}, {8, 8}}, rotation = 180)));
  Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
    Placement(transformation(origin = {-194, 7}, extent = {{-7, -6}, {7, 6}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground groundS annotation (
    Placement(transformation(extent = {{-200, -24}, {-188, -12}})));
  Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(2.9, 3)) annotation (
    Placement(transformation(extent = {{-176, 20}, {-164, 32}})));
  Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.0925, 3), inductor(i(fixed={false,true,true}))) annotation (
    Placement(transformation(extent = {{-162, 18}, {-148, 34}})));
  LCC_HVDC.Models.HVDCpole FiumeSanto1(BlockTime=0.111247, Inverter=0, transformer(tertiaryInductance(inductor(i(fixed={true,false,
                  true}))), primaryInductance(inductor(i(fixed={true,false,
                  true})))), smoothingL(i(fixed=true)))
    annotation (Placement(transformation(extent={{-136,56},{-110,74}})));
  LCC_HVDC.Models.Cable twinCable(r=0.011, Vnom=1000) annotation (Placement(
        visible=true, transformation(
        origin={0,0},
        extent={{-72,22},{-48,40}},
        rotation=0)));
  LCC_HVDC.Models.HVDCpole Latina1(BlockTime=0.131840, Inverter=1,transformer(tertiaryInductance(inductor(i(fixed={true,false,
                  true}))), primaryInductance(inductor(i(fixed={true,false,
                  true})))), smoothingL(i(fixed=true)))
    annotation (Placement(visible=true, transformation(
        origin={1.16667,62},
        extent={{-10.8333,-12},{15.1667,6}},
        rotation=180)));
  Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource1(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
    Placement(transformation(origin = {64, 26}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.Star starS1(m = 3) annotation (
    Placement(transformation(origin = {74, 7}, extent = {{-7, -6}, {7, 6}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground groundS1 annotation (
    Placement(transformation(extent = {{68, -24}, {80, -12}})));
  Modelica.Electrical.Polyphase.Basic.Resistor LatinaR(R = fill(1.1217, 3)) annotation (
    Placement(transformation(extent = {{-6, -6}, {6, 6}}, rotation = 180, origin = {48, 26})));
  Modelica.Electrical.Polyphase.Basic.Inductor LatinaL(L = fill(0.0356, 3), inductor(i(fixed={false,true,true}))) annotation (
    Placement(transformation(extent = {{-7, -8}, {7, 8}}, rotation = 180, origin = {31, 26})));
  LCC_HVDC.Models.HVDCpole FiumeSanto2(BlockTime=0.111247, Inverter=0, transformer(tertiaryInductance(inductor(i(fixed={true,false,
                  true}))), primaryInductance(inductor(i(fixed={true,false,
                  true})))), smoothingL(i(fixed=true)))
    annotation (Placement(transformation(extent={{-136,-14},{-110,4}})));
  LCC_HVDC.Models.HVDCpole Latina2(BlockTime=0.131840, Inverter=1, transformer(tertiaryInductance(inductor(i(fixed={true,false,
                  true}))), primaryInductance(inductor(i(fixed={true,false,
                  true})))), smoothingL(i(fixed=true)))
    annotation (Placement(transformation(
        extent={{-13,-9},{13,9}},
        rotation=180,
        origin={-1,-5})));
  Modelica.Electrical.Analog.Basic.Ground ground annotation (
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-92, 18}, {-82, 28}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp refPowS1(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
    Placement(visible = true, transformation(origin = {-119, 19}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp refPowS2(height = 500e6, duration = 1/3, offset = 0, startTime = 0.3) annotation (
    Placement(visible = true, transformation(origin = {-119, -49}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Step vRefS1(height = -0.1, offset = 1, startTime = 0.3) annotation (
    Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 180, origin = {-3, 17})));
  Modelica.Blocks.Sources.Step vRefS2(height = -0.1, offset = 1, startTime = 0.3) annotation (
    Placement(transformation(extent = {{-5, -5}, {5, 5}}, rotation = 180, origin = {-3, -51})));
  LCC_HVDC.Models.IdcController poleControl1(
    Ti=0.08,
    k=0.5,
    uMin=0.45e6,
    uMax=0.55e6,
    y_start=0.8,
    IdcBase=1000) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=180,
        origin={-121,41})));
  LCC_HVDC.Models.IdcController poleControl2(
    Ti=0.08,
    k=0.5,
    uMin=0.45e6,
    uMax=0.55e6,
    y_start=0.8,
    IdcBase=1000) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=180,
        origin={-121,-27})));
  LCC_HVDC.Models.VdcController poleControl3(
    Ti=0.07,
    k=0.7,
    y_start=-0.8,
    VdcBase=0.5e6) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-3,37})));
  LCC_HVDC.Models.VdcController poleControl4(
    Ti=0.07,
    k=0.7,
    y_start=-0.8,
    VdcBase=0.5e6) annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={-3,-33})));
equation
  connect(starS.pin_n, groundS.p) annotation (
    Line(points = {{-194, -8.88178e-16}, {-194, -12}}, color = {0, 0, 255}));
  connect(FS_R.plug_p, Vsource.plug_p) annotation (
    Line(points = {{-176, 26}, {-178, 26}}, color = {0, 0, 255}));
  connect(FS_R.plug_n, FS_L.plug_p) annotation (
    Line(points = {{-164, 26}, {-162, 26}}, color = {0, 0, 255}));
  connect(Vsource.plug_n, starS.plug_p) annotation (
    Line(points = {{-194, 26}, {-194, 14}}, color = {0, 0, 255}));
  connect(starS1.pin_n, groundS1.p) annotation (
    Line(points = {{74, -8.88178e-16}, {74, -12}}, color = {0, 0, 255}));
  connect(starS1.plug_p, Vsource1.plug_n) annotation (
    Line(points = {{74, 14}, {74, 26}, {72, 26}}, color = {0, 0, 255}));
  connect(LatinaR.plug_p, Vsource1.plug_p) annotation (
    Line(points = {{54, 26}, {56, 26}}, color = {0, 0, 255}));
  connect(LatinaL.plug_p, LatinaR.plug_n) annotation (
    Line(points = {{38, 26}, {42, 26}}, color = {0, 0, 255}));
  connect(FiumeSanto1.pin_p, twinCable.pin_P) annotation (Line(points={{-108.57,
          67.25},{-78,67.25},{-78,36.49},{-73.32,36.49}}, color={0,0,255}));
  connect(Latina1.pin_n, twinCable.pin_P1) annotation (Line(points={{-15.43,
          67.61},{-42,67.61},{-42,36.13},{-46.68,36.13}}, color={0,0,255}));
  connect(FiumeSanto1.pin_n, FiumeSanto2.pin_p) annotation (
    Line(points = {{-108.57, 62.39}, {-92, 62.39}, {-92, -2.75}, {-108.57, -2.75}}, color = {0, 0, 255}));
  connect(twinCable.pin_N, FiumeSanto2.pin_n) annotation (Line(points={{-73.2,
          26.14},{-78,26.14},{-78,-7.61},{-108.57,-7.61}}, color={0,0,255}));
  connect(Latina1.pin_p, Latina2.pin_n) annotation (
    Line(points={{-15.43,62.75},{-30,62.75},{-30,-2.39},{-15.43,-2.39}},          color = {0, 0, 255}));
  connect(twinCable.pin_N1, Latina2.pin_p) annotation (Line(points={{-46.8,
          25.96},{-46.8,26},{-42,26},{-42,-7.25},{-15.43,-7.25}}, color={0,
          0,255}));
  connect(LatinaL.plug_n, Latina1.ac) annotation (
    Line(points={{24,26},{20,26},{20,64.64},{12.26,64.64}},          color = {0, 0, 255}));
  connect(LatinaL.plug_n, Latina2.ac) annotation (
    Line(points = {{24, 26}, {20, 26}, {20, -5.36}, {12.26, -5.36}}, color = {0, 0, 255}));
  connect(FS_L.plug_n, FiumeSanto1.ac) annotation (
    Line(points = {{-148, 26}, {-144, 26}, {-144, 65.36}, {-136.26, 65.36}}, color = {0, 0, 255}));
  connect(FS_L.plug_n, FiumeSanto2.ac) annotation (
    Line(points = {{-148, 26}, {-144, 26}, {-144, -4.64}, {-136.26, -4.64}}, color = {0, 0, 255}));
  connect(ground.p, FiumeSanto2.pin_p) annotation (
    Line(points = {{-87, 28}, {-87, 32}, {-92, 32}, {-92, -2.75}, {-108.57, -2.75}}, color = {0, 0, 255}));
  connect(refPowS1.y, poleControl1.pref) annotation (Line(points={{-113.5,
          19},{-104,19},{-104,35.87},{-111.01,35.87}}, color={0,0,127}));
  connect(poleControl1.vdc, FiumeSanto1.vdc) annotation (Line(points={{-111.1,
          41.72},{-104,41.72},{-104,58.25},{-108.31,58.25}}, color={0,0,127}));
  connect(poleControl1.idc, FiumeSanto1.idc) annotation (Line(points={{-111.1,
          46.94},{-100,46.94},{-100,71.21},{-108.31,71.21}}, color={0,0,127}));
  connect(poleControl1.alpha, FiumeSanto1.alpha) annotation (Line(points={{
          -131.26,40.82},{-142,40.82},{-142,59.42},{-137.3,59.42}}, color={
          0,0,127}));
  connect(poleControl2.pref, refPowS2.y) annotation (Line(points={{-111.01,
          -32.13},{-106,-32.13},{-106,-49},{-113.5,-49}}, color={0,0,127}));
  connect(poleControl2.vdc, FiumeSanto2.vdc) annotation (Line(points={{-111.1,
          -26.28},{-102,-26.28},{-102,-11.75},{-108.31,-11.75}}, color={0,0,
          127}));
  connect(poleControl2.idc, FiumeSanto2.idc) annotation (Line(points={{-111.1,
          -21.06},{-100,-21.06},{-100,1.21},{-108.31,1.21}}, color={0,0,127}));
  connect(poleControl2.alpha, FiumeSanto2.alpha) annotation (Line(points={{
          -131.26,-27.18},{-142,-27.18},{-142,-10.58},{-137.3,-10.58}},
        color={0,0,127}));
  connect(poleControl3.vdcRef, vRefS1.y) annotation (Line(points={{-12.99,
          41.41},{-20,41.41},{-20,17},{-8.5,17}}, color={0,0,127}));
  connect(Latina1.vdc, poleControl3.vdc) annotation (Line(points={{-15.69,
          71.75},{-15.69,72},{-26,72},{-26,32.41},{-12.99,32.41}}, color={0,
          0,127}));
  connect(poleControl3.alpha,Latina1.alpha)  annotation (Line(points={{7.53,
          37.63},{26,37.63},{26,70.58},{13.3,70.58}}, color={0,0,127}));
  connect(poleControl4.vdcRef, vRefS2.y) annotation (Line(points={{-12.99,-28.59},
          {-20,-28.59},{-20,-51},{-8.5,-51}}, color={0,0,127}));
  connect(poleControl4.vdc, Latina2.vdc) annotation (Line(points={{-12.99,-37.59},
          {-26,-37.59},{-26,1.75},{-15.69,1.75}}, color={0,0,127}));
  connect(poleControl4.alpha,Latina2.alpha)  annotation (Line(points={{7.53,
          -32.37},{26,-32.37},{26,0.58},{13.3,0.58}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}})),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -60}, {80, 80}})),
    experiment(StopTime = 0.7, Interval = 6e-05, Tolerance = 1e-06, __Dymola_Algorithm = "Dassl"),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
<p> SAPEI is a bipolar link with the nominal voltage of ± 500
kV and rated power of 1000 MW. The sending converter
station is in Fiume Santo in Sardinia and the receiving end is
Latina converter station in the region of Lazio in Italian
mainland. On each side of the link, three single-phase
three-winding transformers are connected in Y, Y and D form
on the primary, secondary, and tertiary side to supply each
pole of the converter station from the 400 kV ac grid.</p>
<p> A paper is published and presented at AEIT HVDC 2023 conference about the simulation of SAPEI. Please check:</p>
<a href=\"modelica://LCC_HVDC.Models.ReferenceInfo\"><font size=\"5\">[ReferenceInfo: 2]</font></a>

</body>
</html>
"));
end SapeiBipole;
