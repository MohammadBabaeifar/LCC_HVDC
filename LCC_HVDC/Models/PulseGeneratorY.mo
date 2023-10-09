within LCC_HVDC.Models;
model PulseGeneratorY
  import Modelica.Constants.pi;
  parameter Real PulseWidth = 110 "Pulse width";
  parameter Real BlockTime = 0 "Pulse initial blocking time";
  Modelica.Blocks.Logical.GreaterEqual greaterEqual[6] annotation (
    Placement(transformation(extent = {{40, 50}, {64, 74}})));
  Modelica.Blocks.Logical.LessEqual lessEqual[6] annotation (
    Placement(transformation(extent = {{38, -14}, {58, 6}})));
  Modelica.Blocks.Math.Add add1[6] annotation (
    Placement(transformation(extent = {{-10, -56}, {14, -32}})));
  Modelica.Blocks.Logical.And and1[6] annotation (
    Placement(transformation(extent = {{78, -14}, {98, 6}})));
  Modelica.Blocks.Sources.Constant pulseWidth[6](k = fill(PulseWidth, 6)) annotation (
    Placement(visible = true, transformation(origin = {-43, -79}, extent = {{-13, -13}, {13, 13}}, rotation = 0)));
  Modelica.Blocks.Logical.Not not1[6] annotation (
    Placement(transformation(extent = {{-128, -60}, {-108, -40}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal[6] annotation (
    Placement(transformation(extent = {{-98, -60}, {-78, -40}})));
  Models.RampsGeneratorY ramps annotation (
    Placement(transformation(extent = {{-108, 48}, {-82, 74}})));
  Models.SampleHold sampleHold annotation (
    Placement(transformation(extent = {{-56, -58}, {-28, -32}})));
  Modelica.Blocks.Sources.Step blockTime[6](height = fill(-1, 6), offset = fill(1, 6), startTime = fill(BlockTime, 6)) annotation (
    Placement(transformation(extent = {{42, -56}, {62, -36}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean[6] annotation (
    Placement(transformation(extent = {{80, -56}, {100, -36}})));
  Modelica.Blocks.Logical.Not not2[6] annotation (
    Placement(transformation(extent = {{110, -56}, {130, -36}})));
  Modelica.Blocks.Logical.And and2[6] annotation (
    Placement(transformation(extent = {{110, -14}, {130, 6}})));
  Modelica.Blocks.Interfaces.RealInput wt[6] annotation (Placement(
        transformation(extent={{-170,16},{-130,56}}), iconTransformation(
          extent={{-134,14},{-100,48}})));
  Modelica.Blocks.Interfaces.RealInput firingAngle[6] "Connector of second Real input signal" annotation (
    Placement(transformation(extent = {{-176, -40}, {-136, 0}}), iconTransformation(extent = {{-134, -46}, {-100, -12}})));
  Modelica.Blocks.Interfaces.BooleanOutput y[6] "Pulse" annotation (
    Placement(transformation(extent = {{140, -22}, {176, 14}}), iconTransformation(extent = {{100, -18}, {136, 18}})));
equation
  connect(not1.u, greaterEqual.y) annotation (
    Line(points = {{-130, -50}, {-134, -50}, {-134, 20}, {65.2, 20}, {65.2, 62}}, color = {255, 0, 255}));
  connect(firingAngle, greaterEqual.u2) annotation (
    Line(points = {{-156, -20}, {-156, -16}, {-148, -16}, {-148, 22}, {28, 22}, {28, 52.4}, {37.6, 52.4}}, color = {0, 0, 127}));
  connect(lessEqual.u1, greaterEqual.u1) annotation (
    Line(points = {{36, -4}, {20, -4}, {20, 62}, {37.6, 62}}, color = {0, 0, 127}));
  connect(greaterEqual.y, and1.u1) annotation (
    Line(points = {{65.2, 62}, {70, 62}, {70, -4}, {76, -4}}, color = {255, 0, 255}));
  connect(add1.y, lessEqual.u2) annotation (
    Line(points = {{15.2, -44}, {20, -44}, {20, -12}, {36, -12}}, color = {0, 0, 127}));
  connect(not1.y, booleanToReal.u) annotation (
    Line(points = {{-107, -50}, {-100, -50}}, color = {255, 0, 255}));
  connect(pulseWidth.y, add1.u2) annotation (
    Line(points = {{-28.7, -79}, {-22, -79}, {-22, -51.2}, {-12.4, -51.2}}, color = {0, 0, 127}));
  connect(lessEqual.y, and1.u2) annotation (
    Line(points = {{59, -4}, {66, -4}, {66, -12}, {76, -12}}, color = {255, 0, 255}));
  connect(booleanToReal.y, sampleHold.u2) annotation (Line(points={{-77,-50},
          {-76,-50},{-76,-50.2},{-58.8,-50.2}}, color={0,0,127}));
  connect(sampleHold.u1, firingAngle) annotation (Line(points={{-58.8,-39.8},
          {-70,-39.8},{-70,-20},{-156,-20}}, color={0,0,127}));
  connect(sampleHold.y, add1.u1) annotation (
    Line(points = {{-25.06, -44.87}, {-20, -44.87}, {-20, -36.8}, {-12.4, -36.8}}, color = {0, 0, 127}));
  connect(blockTime.y, realToBoolean.u) annotation (
    Line(points = {{63, -46}, {78, -46}}, color = {0, 0, 127}));
  connect(and1.y, and2.u1) annotation (
    Line(points = {{99, -4}, {108, -4}}, color = {255, 0, 255}));
  connect(realToBoolean.y, not2.u) annotation (
    Line(points = {{101, -46}, {108, -46}}, color = {255, 0, 255}));
  connect(not2.y, and2.u2) annotation (
    Line(points = {{131, -46}, {136, -46}, {136, -20}, {108, -20}, {108, -12}}, color = {255, 0, 255}));
  connect(and2.y, y) annotation (
    Line(points = {{131, -4}, {158, -4}}, color = {255, 0, 255}));
  connect(wt, ramps.omega_t) annotation (Line(points={{-150,36},{-120,36},{
          -120,61},{-110.34,61}}, color={0,0,127}));
  connect(ramps.ramps, greaterEqual.u1) annotation (
    Line(points = {{-80.31, 60.87}, {-78.4318, 60.87}, {-78.4318, 62}, {37.6, 62}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Line(points = {{-60, -20}, {-20, -20}, {-20, 20}, {20, 20}, {20, -20}, {48, -20}}, thickness = 0.35), Text(origin = {-1.38718, 128.286}, textColor = {0, 0, 255}, extent = {{-134.613, 29.7142}, {141.387, -22.2858}}, textString = "%name"), Line(points = {{-60, 20}, {-60, -20}}, thickness = 0.35), Line(points = {{-88, 20}, {-60, 20}}, thickness = 0.35), Ellipse(lineThickness = 0.35, extent = {{38, 36}, {88, -16}}), Line(origin = {-22, 8.33}, points = {{72, 14}, {86, 0}, {100, 14}}, thickness = 0.35), Line(points = {{64, -8}, {64, 8}}, thickness = 0.35)}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 100}})),
    Documentation(info = "<html><head></head><body><p><font size=\"5\">This pulse generator receives its input (wt) from a phase locked loop (PLL). Here in HVDC models, the inputs of PLL are provided by a delta or star connection (E.g. Modelica 4.0.0/Electrical/Polyphase/Basic/MultiDelta). The output of delta connection lags its input by 30 degrees. Therefore, this pulse generator applies the pulses to thyristors 30 degrees earlier to compesate the phase shift of the aforementioned delta conncetion.<a href=\"modelica://HVDC.Models.ReferenceInfo\">[See ReferenceInfo: 1]</a></font></p>
</body></html>"));
end PulseGeneratorY;
