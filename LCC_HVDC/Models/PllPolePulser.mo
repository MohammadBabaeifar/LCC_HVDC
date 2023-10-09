within LCC_HVDC.Models;
model PllPolePulser "Converter unit control"
  parameter Real BlockTime = 0 "Pulse initial blocking time";
  parameter Modelica.Units.SI.Voltage vNom = 400e3 "expected voltage amplitude";
  LCC_HVDC.Models.PLL pLL(vNom=vNom)
    annotation (Placement(transformation(extent={{-36,70},{-16,90}})));
  LCC_HVDC.Models.PulseGeneratorY pulserY(BlockTime=BlockTime)
    "For rectifiers supplied by Y transformer winding"
    annotation (Placement(transformation(extent={{50,50},{78,74}})));
  Modelica.Blocks.Routing.Replicator replicator1(nout = 6) annotation (
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {22, 74})));
  Modelica.Electrical.Polyphase.Basic.Delta delta(final m = 3) "Delta connection" annotation (
    Placement(transformation(extent = {{9, -11}, {-9, 11}}, rotation = 90, origin = {-79, 79})));
  Modelica.Electrical.Polyphase.Sensors.VoltageSensor voltageSensor(final m = 3) "Voltage sensor" annotation (
    Placement(transformation(extent = {{9, 9}, {-9, -9}}, rotation = 270, origin = {-57, 79})));
  LCC_HVDC.Models.PLL pLL2(vNom=vNom)
    annotation (Placement(transformation(extent={{-36,26},{-16,46}})));
  Modelica.Blocks.Routing.Replicator replicator2(nout = 6) annotation (
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {22, 30})));
  Modelica.Blocks.Routing.Replicator replicator3(nout = 6) annotation (
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {22, 8})));
  Modelica.Blocks.Routing.Replicator replicator4(nout = 6) annotation (
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 0, origin = {22, 52})));
  LCC_HVDC.Models.PulseGeneratorD pulserD(BlockTime=BlockTime)
    annotation (Placement(transformation(extent={{50,16},{78,40}})));
  Modelica.Blocks.Interfaces.RealInput alpha annotation (
    Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 90, origin = {1, -31}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 90, origin = {1, -113})));
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug ac3Phase annotation (
    Placement(transformation(extent = {{-114, 32}, {-86, 60}}), iconTransformation(extent = {{-110, -8}, {-94, 8}})));
  Modelica.Blocks.Interfaces.BooleanOutput pY[6] annotation (
    Placement(transformation(extent = {{96, 46}, {128, 78}}), iconTransformation(extent = {{100, 48}, {124, 72}})));
  Modelica.Blocks.Interfaces.BooleanOutput pD[6] annotation (
    Placement(transformation(extent = {{92, 12}, {124, 44}}), iconTransformation(extent = {{100, -74}, {124, -50}})));
equation
  connect(voltageSensor.plug_p, delta.plug_n) annotation (
    Line(points = {{-57, 70}, {-79, 70}}, color = {0, 0, 255}));
  connect(delta.plug_p, voltageSensor.plug_n) annotation (
    Line(points = {{-79, 88}, {-57, 88}}, color = {0, 0, 255}));
  connect(pY, pulserY.y) annotation (
    Line(points = {{112, 62}, {112, 62}, {80.52, 62}}, color = {255, 0, 255}));
  connect(pulserD.y,pD)  annotation (
    Line(points = {{80.52, 27.76}, {108, 27.76}, {108, 28}}, color = {255, 0, 255}));
  connect(delta.plug_n,ac3Phase)  annotation (
    Line(points = {{-79, 70}, {-90, 70}, {-90, 46}, {-100, 46}}, color = {0, 0, 255}));
  connect(alpha, replicator3.u) annotation (
    Line(points = {{1, -31}, {1, 8}, {12.4, 8}}, color = {0, 0, 127}));
  connect(alpha, replicator4.u) annotation (
    Line(points = {{1, -31}, {1, 8}, {6, 8}, {6, 52}, {12.4, 52}}, color = {0, 0, 127}));
  connect(voltageSensor.v, pLL.u) annotation (
    Line(points = {{-47.1, 79}, {-41.55, 79}, {-41.55, 80}, {-38, 80}}, color = {0, 0, 127}));
  connect(pLL.thetaRad, replicator1.u) annotation (
    Line(points = {{-15, 74}, {12.4, 74}}, color = {0, 0, 127}));
  connect(pLL2.thetaRad, replicator2.u) annotation (
    Line(points = {{-15, 30}, {12.4, 30}}, color = {0, 0, 127}));
  connect(replicator1.y, pulserY.wt) annotation (Line(points={{30.8,74},{34,
          74},{34,65.72},{47.62,65.72}}, color={0,0,127}));
  connect(pulserY.firingAngle, replicator4.y) annotation (
    Line(points = {{47.62, 58.52}, {36, 58.52}, {36, 52}, {30.8, 52}}, color = {0, 0, 127}));
  connect(pulserD.wt, replicator2.y) annotation (Line(points={{47.62,31.72},
          {36,31.72},{36,30},{30.8,30}}, color={0,0,127}));
  connect(pulserD.firingAngle, replicator3.y) annotation (
    Line(points = {{47.62, 25}, {40, 25}, {40, 8}, {30.8, 8}}, color = {0, 0, 127}));
  connect(pLL2.u, voltageSensor.v) annotation (
    Line(points = {{-38, 36}, {-47.1, 36}, {-47.1, 79}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(textColor = {0, 0, 184}, extent = {{-102, 146}, {102, 108}}, textString = "%name"), Line(points = {{20, -12}, {38, -12}, {38, 14}, {66, 14}, {66, -12}, {86, -12}}, thickness = 0.35), Ellipse(lineThickness = 0.35, extent = {{44, 86}, {88, 42}}), Line(origin = {-20, 60.33}, points = {{74, 13.67}, {86, 1.67}, {98, 13.67}}, thickness = 0.35), Line(points = {{66, 48}, {66, 62}}, thickness = 0.35), Polygon(lineThickness = 0.5, points = {{54, -72}, {82, -72}, {68, -48}, {54, -72}}), Ellipse(lineThickness = 0.5, extent = {{46, -42}, {90, -86}}), Text(extent = {{-100, 14}, {34, -8}}, textString = "PLL=>")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -30}, {100, 100}})),
    Documentation(info = "<html><head></head><body><font size=\"5\">This block is created to comply with the requirements of IEC TR 60919-1 for VDC arrangement. It should be used in HVDC pole. Its input is a three phase plug and should be preferably taken from the primary winding of transformer to avoid the effect of distortions as much as possible. The outputs are two sets of pulses. One set conforms with a bridge that is fed by a Y connection of transformer and the other set is suitable for those bridges supplied by D connection.</font></body></html>"));
end PllPolePulser;
