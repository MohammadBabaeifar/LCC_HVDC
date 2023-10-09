package LCC_HVDC
extends Modelica.Icons.Package;

  annotation (
    uses(Modelica(version = "4.0.0"), SCR(version = "1"), HVDCePLL(version = "1"), HVDCPulseGeneratorAndPLL(version = "3"), HVDC93(version = "3"),
      Complex(version="4.0.0")),
    version = "3",
    conversion(from(version = "", script = "modelica://HVDCPulseGeneratorAndPLL/ConvertFromHVDCPulseGeneratorAndPLL_.mos", to = "1"), from(version = "1", script = "modelica://HVDCPulseGeneratorAndPLL/ConvertFromHVDCPulseGeneratorAndPLL_1.mos"), noneFromVersion = "2"),
    Icon(graphics={
        Polygon(
          points={{-92,46},{-48,110},{-8,46},{-48,86},{-92,46}},
          lineColor={28,108,200},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Line(
          points={{92,92},{-92,-92}},
          color={244,125,35},
          thickness=1,
          smooth=Smooth.Bezier),
        Polygon(
          points={{-86,30},{-76,34},{-72,20},{-68,-2},{-86,30}},
          lineColor={56,167,56},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={56,167,56},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-100,-14},{-92,-24},{-76,-6},{-70,4},{-100,-14}},
          lineColor={56,167,56},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={56,167,56},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-58,-10},{-44,-18},{-42,-8},{-72,4},{-58,-10}},
          lineColor={56,167,56},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={56,167,56},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-42,-32},{2,32},{42,-32},{2,8},{-42,-32}},
          lineColor={28,108,200},
          lineThickness=1,
          smooth=Smooth.Bezier,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          origin={10,44},
          rotation=180),
        Polygon(
          points={{-70,-4},{-64,-44},{-78,-44},{-70,-4}},
          lineColor={56,167,56},
          lineThickness=1,
          smooth=Smooth,
          fillColor={56,167,56},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-6,-24},{88,-38}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-6,-58},{30,-70}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{52,-58},{88,-70}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{-72,2},{-68,-2}},
          lineColor={62,186,62},
          lineThickness=1,
          fillColor={62,186,62},
          fillPattern=FillPattern.Solid)}));
end LCC_HVDC;
