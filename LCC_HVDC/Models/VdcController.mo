within LCC_HVDC.Models;
model VdcController
  import Modelica.Constants.pi;
  parameter Modelica.Units.SI.Time Ti = 0.001 "integral time constant";
  parameter Modelica.Units.SI.Time Td = 0 "derivative time constant";
  parameter Real k = 10 "proportional gain";
  parameter Real yMin = -0.96 "Min PI output";
  parameter Real yMax = 0.998 "Max PI output";
  parameter Real y_start = -0.4 "Initial value of PI output( - for inverter and + for rectifier)";
  parameter Real mode = -1 "Operation mode (-1 for inverter and +1 for rectifier)";
  parameter Real VdcBase = 780 "Vdc base";
  Modelica.Blocks.Math.Gain gain2(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-7, -1}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain operationMode(k = mode) "Inverter/rectifier mode" annotation (
    Placement(visible = true, transformation(origin = {-26, 20}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PI(Ni = 0.1, Td = Td, Ti = Ti, controllerType = Modelica.Blocks.Types.SimpleController.PI, homotopyType = Modelica.Blocks.Types.LimiterHomotopy.NoHomotopy, initType = Modelica.Blocks.Types.Init.InitialOutput, k = k, limiter(u(start = 0)), yMax = yMax, yMin = yMin, y_start = y_start) annotation (
    Placement(visible = true, transformation(origin = {4, 20}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Gain toDegree(k=180/pi) annotation (Placement(
        visible=true, transformation(
        origin={42,20},
        extent={{-4,-4},{4,4}},
        rotation=0)));
  Modelica.Blocks.Math.Acos acos annotation (
    Placement(visible = true, transformation(origin = {26, 20}, extent = {{-4, -4}, {4, 4}}, rotation = 0)));
  Modelica.Blocks.Math.Gain perUnit(k = 1/VdcBase) annotation (
    Placement(visible = true, transformation(origin = {-27, -1}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput vdcRef annotation (Placement(
      visible=true,
      transformation(
        origin={-66,20},
        extent={{-12,-12},{12,12}},
        rotation=0),
      iconTransformation(
        origin={-111,49},
        extent={{-17,-17},{17,17}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput vdc annotation (
    Placement(visible = true, transformation(origin = {-45, -23}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {-111, -51}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput alpha annotation (
    Placement(visible = true, transformation(origin = {64, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {117, 7}, extent = {{-17, -17}, {17, 17}}, rotation = 0)));
equation
  connect(toDegree.u, acos.y)
    annotation (Line(points={{37.2,20},{30.4,20}}, color={0,0,127}));
  connect(operationMode.y, PI.u_s) annotation (
    Line(points = {{-19.4, 20}, {-5.6, 20}}, color = {0, 0, 127}));
  connect(acos.u, PI.y) annotation (
    Line(points = {{21.2, 20}, {12.8, 20}}, color = {0, 0, 127}));
  connect(perUnit.y, gain2.u) annotation (
    Line(points = {{-21.5, -1}, {-13, -1}}, color = {0, 0, 127}));
  connect(gain2.y, PI.u_m) annotation (
    Line(points = {{-1.5, -1}, {4, -1}, {4, 10.4}}, color = {0, 0, 127}));
  connect(vdcRef, operationMode.u)
    annotation (Line(points={{-66,20},{-33.2,20}}, color={0,0,127}));
  connect(perUnit.u,vdc)  annotation (
    Line(points = {{-33, -1}, {-45, -1}, {-45, -23}}, color = {0, 0, 127}));
  connect(alpha, alpha) annotation (
    Line(points={{64,20},{64,20}},      color = {0, 0, 127}));
  connect(toDegree.y, alpha)
    annotation (Line(points={{46.4,20},{64,20}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-60, -20}, {60, 40}})),
    Icon(graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(textColor = {0, 0, 236}, extent = {{-98, 144}, {94, 108}}, textString = "%name"), Line(points = {{-24, 46}, {-44, 46}}, thickness = 1), Line(points = {{24, 46}, {44, 46}}, thickness = 1), Line(points = {{44, 46}, {44, -26}, {44, -46}, {24, -46}}, thickness = 1, arrow = {Arrow.None, Arrow.Open}), Line(points = {{-24, -46}, {-44, -46}, {-44, 46}}, thickness = 1, arrow = {Arrow.None, Arrow.Open}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-24, 58}, {24, 30}}), Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 1, extent = {{-24, -30}, {24, -58}}), Text(textColor = {0, 0, 163}, extent = {{-60, 24}, {56, -22}}, textString = "vdc", textStyle = {TextStyle.Bold})}, coordinateSystem(extent = {{-100, -100}, {100, 100}})),
    Documentation(info = "<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>The reference is then compared with feedback of dc voltage (vdc) and the error is sent to a PI controller. The output is alpha (firing angle) which is used as an input for pulse generator.</p>
</body>
</html>"));
end VdcController;
