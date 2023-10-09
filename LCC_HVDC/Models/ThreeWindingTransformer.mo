within LCC_HVDC.Models;
model ThreeWindingTransformer
  parameter Modelica.Units.SI.Inductance L1 = 0.00875 "Primary inductance";
  parameter Modelica.Units.SI.Inductance L2 = 0.09625 "Secondary inductance referred to the primary";
  parameter Modelica.Units.SI.Inductance L3 = 0.09625 "Tertiary inductance referred to the primary";
  parameter Modelica.Units.SI.Resistance R1 = 0.041 "Primary resistance";
  parameter Modelica.Units.SI.Resistance R2 = 0.467 "Secondary resistance referred to the primary";
  parameter Modelica.Units.SI.Resistance R3 = 0.467 "Tertiary resistance referred to the primary";
  parameter Real n12 = (400e3)/(207.7e3) "Transformer ratio: primary to secondary voltage";
  parameter Real n13 = (400e3)/((207.7e3)*sqrt(3)) "Transformer ratio: primary to tertiary voltage";
  Modelica.Electrical.Polyphase.Ideal.IdealTransformer idealTransformer(m = 3, Lm1 = fill(300e3, 3), n = fill(n12, 3)) annotation (
    Placement(transformation(extent = {{18, 54}, {38, 74}})));
  Modelica.Electrical.Polyphase.Basic.Star starT2(m = 3) annotation (
    Placement(transformation(origin = {38, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Polyphase.Ideal.IdealTransformer idealTransformer1(m = 3, Lm1 = fill(300e3, 3), n = fill(n13, 3)) annotation (
    Placement(transformation(extent = {{20, -8}, {40, 12}})));
  Modelica.Electrical.Polyphase.Basic.Star starT3(m = 3) annotation (
    Placement(transformation(origin = {18, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Polyphase.Basic.Delta deltaT2(m = 3) annotation (
    Placement(transformation(origin = {58, 2}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Electrical.Polyphase.Basic.Inductor tertiaryInductance(L = fill(L3, 3)) "Referred to the primary" annotation (
    Placement(transformation(extent = {{2, 2}, {16, 22}})));
  Modelica.Electrical.Polyphase.Basic.Inductor secondaryInductance(L = fill(L2, 3)) "Referred to the primary" annotation (
    Placement(transformation(extent = {{-4, 64}, {10, 84}})));
  Modelica.Electrical.Polyphase.Basic.Inductor primaryInductance(L = fill(L1, 3)) annotation (
    Placement(transformation(extent = {{-52, 64}, {-38, 84}})));
  Modelica.Electrical.Polyphase.Basic.Resistor secondaryResistance(R = fill(R2, 3)) "Referred to the primary" annotation (
    Placement(transformation(extent = {{-22, 68}, {-10, 80}})));
  Modelica.Electrical.Polyphase.Basic.Resistor tertiaryResistance(R = fill(R3, 3)) "Referred to the primary" annotation (
    Placement(transformation(extent = {{-20, 6}, {-8, 18}})));
  Modelica.Electrical.Polyphase.Basic.Resistor primaryResistnce(R = fill(R1, 3)) annotation (
    Placement(transformation(extent = {{-70, 68}, {-58, 80}})));
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug primary3phase annotation (
    Placement(transformation(extent = {{-92, 62}, {-68, 86}}), iconTransformation(extent = {{-112, -12}, {-88, 12}})));
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug tertiary3phase annotation (
    Placement(transformation(extent = {{68, 0}, {92, 24}}), iconTransformation(extent = {{90, -42}, {114, -18}})));
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug secondary3phase annotation (
    Placement(transformation(extent = {{68, 62}, {92, 86}}), iconTransformation(extent = {{90, 18}, {114, 42}})));
equation
  connect(starT2.plug_p, idealTransformer.plug_n2) annotation (
    Line(points = {{38, 48}, {38, 54}}, color = {0, 0, 255}));
  connect(idealTransformer1.plug_n1, starT3.plug_p) annotation (
    Line(points = {{20, -8}, {18, -8}, {18, -18}}, color = {0, 0, 255}));
  connect(deltaT2.plug_n, idealTransformer1.plug_n2) annotation (
    Line(points = {{58, -8}, {40, -8}}, color = {0, 0, 255}));
  connect(tertiaryInductance.plug_n, idealTransformer1.plug_p1) annotation (
    Line(points = {{16, 12}, {20, 12}}, color = {0, 0, 255}));
  connect(secondary3phase, idealTransformer.plug_p2) annotation (
    Line(points = {{80, 74}, {38, 74}}, color = {0, 0, 255}));
  connect(idealTransformer1.plug_p2, deltaT2.plug_p) annotation (
    Line(points = {{40, 12}, {58, 12}}, color = {0, 0, 255}));
  connect(tertiary3phase, deltaT2.plug_p) annotation (
    Line(points = {{80, 12}, {58, 12}}, color = {0, 0, 255}));
  connect(idealTransformer.plug_n1, starT3.plug_p) annotation (
    Line(points = {{18, 54}, {-28, 54}, {-28, -18}, {18, -18}}, color = {0, 0, 255}));
  connect(secondaryInductance.plug_n, idealTransformer.plug_p1) annotation (
    Line(points = {{10, 74}, {18, 74}}, color = {0, 0, 255}));
  connect(primaryResistnce.plug_n,primaryInductance. plug_p) annotation (
    Line(points = {{-58, 74}, {-52, 74}}, color = {0, 0, 255}));
  connect(primaryResistnce.plug_p,primary3phase)  annotation (
    Line(points = {{-70, 74}, {-80, 74}}, color = {0, 0, 255}));
  connect(secondaryResistance.plug_n,secondaryInductance. plug_p) annotation (
    Line(points = {{-10, 74}, {-4, 74}}, color = {0, 0, 255}));
  connect(secondaryResistance.plug_p,primaryInductance. plug_n) annotation (
    Line(points = {{-22, 74}, {-38, 74}}, color = {0, 0, 255}));
  connect(tertiaryResistance.plug_n,tertiaryInductance. plug_p) annotation (
    Line(points = {{-8, 12}, {2, 12}}, color = {0, 0, 255}));
  connect(tertiaryResistance.plug_p,primaryInductance. plug_n) annotation (
    Line(points = {{-20, 12}, {-32, 12}, {-32, 74}, {-38, 74}}, color = {0, 0, 255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-0.2072, -5.342}, textColor = {0, 0, 220}, extent = {{-97.7928, 147.342}, {100.207, 113.342}}, textString = "%name"), Rectangle(extent = {{-72, 68}, {74, -68}}), Rectangle(lineColor = {28, 108, 200}, fillColor = {28, 108, 200}, pattern = LinePattern.None, extent = {{-32, 72}, {-32, 18}}), Line(points = {{-32, 14}, {-22, 0}, {-12, 14}}, thickness = 0.5), Line(points = {{-22, -14}, {-22, 0}}, thickness = 0.5), Ellipse(lineThickness = 1, extent = {{-50, 30}, {6, -26}}), Polygon(lineThickness = 0.5, points = {{6, -34}, {30, -34}, {18, -14}, {6, -34}}), Ellipse(lineThickness = 1, extent = {{-12, 8}, {44, -50}}), Ellipse(lineThickness = 1, extent = {{-10, 48}, {46, -8}}), Line(points = {{8, 40}, {18, 26}, {28, 40}}, thickness = 0.5), Line(points = {{18, 12}, {18, 26}}, thickness = 0.5)}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -40}, {80, 100}})),
    Documentation(info="<html><head></head><body><p><font size=\"5\">The figure below shows a possible equivalent circuit of (star connection of longitudinal impedances) a three winding transformer in a three-phase form, when transverse reactance is neglected. The three winding transformer of this package is built following the connection diagram of the mentioned figure. The elements are chosen from Modelica.Electrical.Polyphase.</font></p>
<p><img src=\"modelica://LCC_HVDC/Resources/Images/ThreePhaseThreeWindingTrans.png\" alt=\"Three-phase conncetion of a three-winding transformer\"> </p>
</body></html>"));
end ThreeWindingTransformer;
