within LCC_HVDC.Models;
model Cable
  parameter Modelica.Units.SI.Inductance l = 0.158e-3 "H/km";
  parameter Modelica.Units.SI.Resistance r = 0.02413793 "Ohm/km";
  parameter Modelica.Units.SI.Capacitance c = 0.275e-6 "F/km";
  parameter Real km = 435 "km";
  parameter Real Vnom = 1000 "kV";
  Modelica.Electrical.Analog.Basic.Resistor resistor(R = 0.1) annotation (
    Placement(transformation(extent = {{-72, 30}, {-52, 50}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L = l*km) annotation (
    Placement(transformation(extent = {{8, 30}, {28, 50}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(v(fixed = true, start = Vnom/2*1000), C = c*km/2) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {36, 18})));
  Modelica.Electrical.Analog.Basic.Resistor resistor1(R = 0.1) annotation (
    Placement(transformation(extent = {{54, 30}, {74, 50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor2(R = r*km) annotation (
    Placement(transformation(extent = {{-26, 30}, {-6, 50}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor3(R = 0.1) annotation (
    Placement(transformation(extent = {{-72, -50}, {-52, -30}})));
  Modelica.Electrical.Analog.Basic.Inductor inductor1(L = l*km) annotation (
    Placement(transformation(extent = {{8, -50}, {28, -30}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor4(R = 0.1) annotation (
    Placement(transformation(extent = {{54, -50}, {74, -30}})));
  Modelica.Electrical.Analog.Basic.Resistor resistor5(R = r*km) annotation (
    Placement(transformation(extent = {{-28, -50}, {-8, -30}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor1(v(fixed = true, start = Vnom/2*1000), C = c*km/2) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {36, -18})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor2(v(fixed = true, start = Vnom/2*1000), C = c*km/2) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-36, 18})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor3(v(fixed = true, start = Vnom/2*1000), C = c*km/2) annotation (
    Placement(transformation(extent = {{-10, -10}, {10, 10}}, rotation = 270, origin = {-36, -18})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_N annotation (
      Placement(transformation(extent={{-108,-50},{-88,-30}}),
        iconTransformation(extent={{-122,-66},{-98,-42}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_P annotation (
      Placement(transformation(extent={{-90,50},{-110,30}}),
        iconTransformation(extent={{-100,72},{-122,50}})));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_P1 annotation (
      Placement(transformation(extent={{90,30},{110,50}}),
        iconTransformation(extent={{100,46},{122,68}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_N1 annotation (
      Placement(transformation(extent={{90,-50},{110,-30}}),
        iconTransformation(extent={{98,-68},{122,-44}})));
equation
  connect(resistor.n, resistor2.p) annotation (
    Line(points = {{-52, 40}, {-26, 40}}, color = {0, 0, 255}));
  connect(resistor2.n, inductor.p) annotation (
    Line(points = {{-6, 40}, {8, 40}}, color = {0, 0, 255}));
  connect(inductor.n, resistor1.p) annotation (
    Line(points = {{28, 40}, {54, 40}}, color = {0, 0, 255}));
  connect(resistor3.n, resistor5.p) annotation (
    Line(points = {{-52, -40}, {-28, -40}}, color = {0, 0, 255}));
  connect(resistor5.n, inductor1.p) annotation (
    Line(points = {{-8, -40}, {8, -40}}, color = {0, 0, 255}));
  connect(inductor1.n, resistor4.p) annotation (
    Line(points = {{28, -40}, {54, -40}}, color = {0, 0, 255}));
  connect(capacitor.p, resistor1.p) annotation (
    Line(points = {{36, 28}, {36, 40}, {54, 40}}, color = {0, 0, 255}));
  connect(capacitor2.p, resistor2.p) annotation (
    Line(points = {{-36, 28}, {-36, 40}, {-26, 40}}, color = {0, 0, 255}));
  connect(capacitor3.n, resistor5.p) annotation (
    Line(points = {{-36, -28}, {-36, -40}, {-28, -40}}, color = {0, 0, 255}));
  connect(capacitor1.n, resistor4.p) annotation (
    Line(points = {{36, -28}, {36, -40}, {54, -40}}, color = {0, 0, 255}));
  connect(capacitor1.p, capacitor.n) annotation (
    Line(points = {{36, -8}, {36, 8}}, color = {0, 0, 255}));
  connect(capacitor3.p, capacitor2.n) annotation (
    Line(points = {{-36, -8}, {-36, 8}}, color = {0, 0, 255}));
  connect(resistor1.n, pin_P1)
    annotation (Line(points={{74,40},{100,40}}, color={0,0,255}));
  connect(resistor4.n, pin_N1)
    annotation (Line(points={{74,-40},{100,-40}}, color={0,0,255}));
  connect(resistor3.p, pin_N)
    annotation (Line(points={{-72,-40},{-98,-40}}, color={0,0,255}));
  connect(resistor.p, pin_P)
    annotation (Line(points={{-72,40},{-100,40}}, color={0,0,255}));
  connect(pin_N1, pin_N1)
    annotation (Line(points={{100,-40},{100,-40}}, color={0,0,255}));
  connect(capacitor3.p, capacitor1.p) annotation (
    Line(points = {{-36, -8}, {36, -8}}, color = {0, 0, 255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{-76, 74}, {-40, 20}}), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{-72, 68}, {-46, 28}}), Ellipse(fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-66, 58}, {-54, 40}}), Line(points = {{-58, 74}, {56, 80}}, thickness = 0.5), Line(points = {{-56, 20}, {58, 28}}, thickness = 0.5), Line(points = {{-144, 66}}, thickness = 1, smooth = Smooth.Bezier), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{40, 80}, {70, 28}}), Rectangle(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.6, extent = {{36, 78}, {54, 30}}), Text(origin = {0.175848, 10.32}, textColor = {0, 0, 197}, extent = {{-104.176, 141.68}, {105.824, 97.68}}, textString = "%name"), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{-78, -28}, {-42, -82}}), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{-74, -34}, {-48, -74}}), Ellipse(fillPattern = FillPattern.Solid, lineThickness = 0.5, extent = {{-68, -44}, {-56, -62}}), Line(points = {{-60, -28}, {54, -22}}, thickness = 0.5), Line(points = {{-58, -82}, {56, -74}}, thickness = 0.5), Ellipse(fillColor = {255, 255, 255}, lineThickness = 0.5, extent = {{38, -22}, {68, -74}}), Rectangle(lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, lineThickness = 0.6, extent = {{34, -24}, {52, -72}})}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -60}, {100, 60}})),
    Documentation(info = "<html><head></head><body><font size=\"5\">This is a twin cable which is suitable for bipolar HVDC configurations. In case of failure, the remained cable can ensure the continuity of power delivering.&nbsp;</font></body></html>"));
end Cable;
