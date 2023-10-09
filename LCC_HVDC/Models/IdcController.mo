within LCC_HVDC.Models;
model IdcController
  import Modelica.Constants.pi;
  parameter Modelica.Units.SI.Time Ti = 0.001 "integral time constant";
  parameter Modelica.Units.SI.Time Td = 0 "derivative time constant";
  parameter Real k = 10 "proportional gain";
  parameter Real yMin = -0.96 "Min PI output";
  parameter Real yMax = 0.998 "Max PI output";
  parameter Real uMin = 801 "Min of Vdc limiter";
  parameter Real uMax = 1035 "Max of Vdc limiter";
  parameter Real y_start = 0.1 "Initial value of PI output";
  parameter Real IdcBase = 240 "Idc base";
  Modelica.Blocks.Math.Gain perunit1(k = 1/IdcBase) annotation (
    Placement(visible = true, transformation(origin = {-7, 9}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Continuous.LimPID PI(Ni = 0.1, Td = Td, Ti = Ti, controllerType = Modelica.Blocks.Types.SimpleController.PI, homotopyType = Modelica.Blocks.Types.LimiterHomotopy.NoHomotopy, initType = Modelica.Blocks.Types.Init.InitialOutput, k = k, limiter(u(start = 0)), yMax = yMax, yMin = yMin, y_start = y_start) annotation (
    Placement(visible = true, transformation(origin = {18, 36}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Math.Acos acos annotation (
    Placement(visible = true, transformation(origin = {50, 36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Gain perunit(k = 1/IdcBase) annotation (
    Placement(visible = true, transformation(origin = {-6, 36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput pref annotation (Placement(
      visible=true,
      transformation(
        origin={-84,40},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={-111,57},
        extent={{-15,-15},{15,15}},
        rotation=0)));
  Modelica.Blocks.Interfaces.RealInput vdc annotation (
    Placement(visible = true, transformation(origin = {-89, 1}, extent = {{-11, -11}, {11, 11}}, rotation = 0), iconTransformation(origin = {-110, -8}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput alpha "degree" annotation (
      Placement(
      visible=true,
      transformation(
        origin={98,36},
        extent={{-10,-10},{10,10}},
        rotation=0),
      iconTransformation(
        origin={114,2},
        extent={{-16,-16},{16,16}},
        rotation=0)));
  Modelica.Blocks.Math.Abs abs1 annotation (
    Placement(transformation(extent = {{-7, -7}, {7, 7}}, rotation = 0, origin = {-67, 1})));
  Modelica.Blocks.Nonlinear.Limiter limiter(uMax = uMax, uMin = uMin) annotation (
    Placement(transformation(extent = {{-54, -6}, {-40, 8}})));
  Modelica.Blocks.Math.Division division annotation (
    Placement(transformation(extent = {{-30, 30}, {-18, 42}})));
  Modelica.Blocks.Interfaces.RealInput idc annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 0, origin = {-90, -22}), iconTransformation(extent = {{-124, -80}, {-96, -52}})));
  Modelica.Blocks.Math.Gain toDegree(k=180/pi) annotation (Placement(
        visible=true, transformation(
        origin={70,36},
        extent={{-4,-4},{4,4}},
        rotation=0)));
equation
  connect(acos.u, PI.y) annotation (
    Line(points = {{42.8, 36}, {26.8, 36}}, color = {0, 0, 127}));
  connect(perunit1.y, PI.u_m) annotation (
    Line(points = {{-1.5, 9}, {18, 9}, {18, 26.4}}, color = {0, 0, 127}));
  connect(abs1.u,vdc)  annotation (
    Line(points = {{-75.4, 1}, {-89, 1}}, color = {0, 0, 127}));
  connect(limiter.u, abs1.y) annotation (
    Line(points = {{-55.4, 1}, {-59.3, 1}}, color = {0, 0, 127}));
  connect(limiter.y, division.u2) annotation (
    Line(points = {{-39.3, 1}, {-36, 1}, {-36, 32.4}, {-31.2, 32.4}}, color = {0, 0, 127}));
  connect(pref, division.u1) annotation (Line(points={{-84,40},{-56,40},{-56,
          39.6},{-31.2,39.6}}, color={0,0,127}));
  connect(perunit.u, division.y) annotation (
    Line(points = {{-13.2, 36}, {-17.4, 36}}, color = {0, 0, 127}));
  connect(perunit.y, PI.u_s) annotation (
    Line(points = {{0.6, 36}, {8.4, 36}}, color = {0, 0, 127}));
  connect(idc,perunit1. u) annotation (
    Line(points = {{-90, -22}, {-18, -22}, {-18, 9}, {-13, 9}}, color = {0, 0, 127}));
  connect(alpha, alpha)
    annotation (Line(points={{98,36},{98,36}}, color={0,0,127}));
  connect(toDegree.y, alpha)
    annotation (Line(points={{74.4,36},{98,36}}, color={0,0,127}));
  connect(toDegree.u, acos.y)
    annotation (Line(points={{65.2,36},{56.6,36}}, color={0,0,127}));
  annotation (
    Diagram(coordinateSystem(extent = {{-80, -40}, {100, 60}})),
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(extent = {{-94, 156}, {96, 106}}, textColor = {0, 0, 255}, textString = "%name"), Line(points = {{-24, 46}, {-44, 46}}, color = {0, 0, 0}, thickness = 1), Line(points = {{24, 46}, {44, 46}}, color = {0, 0, 0}, thickness = 1), Line(points = {{44, 46}, {44, -26}, {44, -46}, {24, -46}}, color = {0, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}), Line(points = {{-24, -46}, {-44, -46}, {-44, 46}}, color = {0, 0, 0}, thickness = 1, arrow = {Arrow.None, Arrow.Open}), Rectangle(extent = {{-24, 58}, {24, 30}}, lineColor = {0, 0, 0}, lineThickness = 1, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Rectangle(extent = {{-24, -30}, {24, -58}}, lineColor = {0, 0, 0}, lineThickness = 1, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid), Text(extent = {{-58, 26}, {58, -20}}, textColor = {0, 0, 163}, textStyle = {TextStyle.Bold}, textString = "idc")}),
    Documentation(info = "<html><head></head><body><font size=\"5\">The controller calculates the reference currrent through division of reference active power (Pref) by the voltage of dc terminals (Vdc). The reference is then compared with feedback of dc current (idc) and the error is sent to a PI controller. The output is alpha (firing angle) which is used as an input for pulse generator.</font></body></html>"));
end IdcController;
