within LCC_HVDC.Models;
model PulseGeneratorD
  import Modelica.Constants.pi;
  parameter Real PulseWidth = 110 "Pulse width";
  parameter Real BlockTime = 0 "Pulse initial blocking time";
  Modelica.Blocks.Logical.GreaterEqual greaterEqual[6] annotation (
    Placement(transformation(extent = {{40, 48}, {62, 72}})));
  Modelica.Blocks.Logical.LessEqual lessEqual[6] annotation (
    Placement(transformation(extent = {{38, -24}, {60, -2}})));
  Modelica.Blocks.Math.Add add1[6] annotation (
    Placement(transformation(extent = {{-2, -90}, {18, -70}})));
  Modelica.Blocks.Logical.And and1[6] annotation (
    Placement(transformation(extent = {{78, -16}, {96, 2}})));
  Modelica.Blocks.Sources.Constant const[6](k = fill(PulseWidth, 6)) annotation (
    Placement(visible = true, transformation(origin = {-31, -87}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Modelica.Blocks.Logical.Not not1[6] annotation (
    Placement(transformation(extent = {{-112, -54}, {-92, -34}})));
  Modelica.Blocks.Math.BooleanToReal booleanToReal[6] annotation (
    Placement(transformation(extent = {{-76, -52}, {-60, -36}})));
  Models.SampleHold sampleHold annotation (
    Placement(transformation(extent = {{-44, -50}, {-24, -30}})));
  Modelica.Blocks.Sources.Step blockTime[6](height = fill(-1, 6), offset = fill(1, 6), startTime = fill(BlockTime, 6)) annotation (
    Placement(transformation(extent = {{40, -66}, {56, -50}})));
  Modelica.Blocks.Math.RealToBoolean realToBoolean[6] annotation (
    Placement(transformation(extent = {{68, -66}, {84, -50}})));
  Modelica.Blocks.Logical.Not not2[6] annotation (
    Placement(transformation(extent = {{94, -66}, {110, -50}})));
  Modelica.Blocks.Logical.And and2[6] annotation (
    Placement(transformation(extent = {{108, -16}, {124, 0}})));
  RampsGeneratorD02 ramps annotation (
    Placement(transformation(extent = {{-114, 50}, {-92, 70}})));
  Modelica.Blocks.Interfaces.RealInput wt[6] annotation (Placement(
        transformation(extent={{-180,16},{-140,56}}), iconTransformation(
          extent={{-134,14},{-100,48}})));
  Modelica.Blocks.Interfaces.RealInput firingAngle[6] "Connector of second Real input signal" annotation (
    Placement(transformation(extent = {{-180, -40}, {-140, 0}}), iconTransformation(extent = {{-134, -42}, {-100, -8}})));
  Modelica.Blocks.Interfaces.BooleanOutput y[6] "Pulse" annotation (
    Placement(transformation(extent = {{140, -22}, {176, 14}}), iconTransformation(extent = {{100, -20}, {136, 16}})));
equation
  connect(not1.u, greaterEqual.y) annotation (
    Line(points = {{-114, -44}, {-126, -44}, {-126, -24}, {-84, -24}, {-84, 38}, {63.1, 38}, {63.1, 60}}, color = {255, 0, 255}));
  connect(firingAngle, greaterEqual.u2) annotation (
    Line(points = {{-160, -20}, {-100, -20}, {-100, 46}, {-48, 46}, {-48, 50.4}, {37.8, 50.4}}, color = {0, 0, 127}));
  connect(greaterEqual.y, and1.u1) annotation (
    Line(points = {{63.1, 60}, {70, 60}, {70, -7}, {76.2, -7}}, color = {255, 0, 255}));
  connect(add1.y, lessEqual.u2) annotation (
    Line(points = {{19, -80}, {24, -80}, {24, -21.8}, {35.8, -21.8}}, color = {0, 0, 127}));
  connect(not1.y, booleanToReal.u) annotation (
    Line(points = {{-91, -44}, {-77.6, -44}}, color = {255, 0, 255}));
  connect(const.y, add1.u2) annotation (
    Line(points = {{-18.9, -87}, {-12.45, -87}, {-12.45, -86}, {-4, -86}}, color = {0, 0, 127}));
  connect(lessEqual.y, and1.u2) annotation (
    Line(points = {{61.1, -13}, {71.55, -13}, {71.55, -14.2}, {76.2, -14.2}}, color = {255, 0, 255}));
  connect(booleanToReal.y, sampleHold.u2)
    annotation (Line(points={{-59.2,-44},{-46,-44}}, color={0,0,127}));
  connect(sampleHold.u1, firingAngle) annotation (Line(points={{-46,-36},{-58,
          -36},{-58,-20},{-160,-20}}, color={0,0,127}));
  connect(sampleHold.y, add1.u1) annotation (
    Line(points = {{-21.9, -39.9}, {-14, -39.9}, {-14, -74}, {-4, -74}}, color = {0, 0, 127}));
  connect(blockTime.y, realToBoolean.u) annotation (
    Line(points = {{56.8, -58}, {66.4, -58}}, color = {0, 0, 127}));
  connect(and1.y, and2.u1) annotation (
    Line(points = {{96.9, -7}, {96.9, -8}, {106.4, -8}}, color = {255, 0, 255}));
  connect(realToBoolean.y, not2.u) annotation (
    Line(points = {{84.8, -58}, {92.4, -58}}, color = {255, 0, 255}));
  connect(not2.y, and2.u2) annotation (
    Line(points = {{110.8, -58}, {118, -58}, {118, -20}, {102, -20}, {102, -14.4}, {106.4, -14.4}}, color = {255, 0, 255}));
  connect(and2.y, y) annotation (
    Line(points = {{124.8, -8}, {134, -8}, {134, -4}, {158, -4}}, color = {255, 0, 255}));
  connect(lessEqual.u1,ramps.ramps)  annotation (
    Line(points = {{35.8, -13}, {22, -13}, {22, 60.1}, {-90.57, 60.1}}, color = {0, 0, 127}));
  connect(ramps.omega_t, wt) annotation (Line(points={{-115.98,60},{-130,60},
          {-130,36},{-160,36}}, color={0,0,127}));
  connect(ramps.ramps, greaterEqual.u1) annotation (
    Line(points = {{-90.57, 60.1}, {-26.45, 60.1}, {-26.45, 60}, {37.8, 60}}, color = {0, 0, 127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-1.38718, 128.286}, textColor = {0, 0, 255}, extent = {{-134.613, 29.7142}, {141.387, -22.2858}}, textString = "%name"), Line(points = {{-60, -20}, {-20, -20}, {-20, 20}, {20, 20}, {20, -20}, {46, -20}}, thickness = 1), Line(points = {{-60, 20}, {-60, -20}}, thickness = 1), Line(points = {{-84, 20}, {-60, 20}}, thickness = 1), Ellipse(lineThickness = 1, extent = {{44, 32}, {88, -16}}), Polygon(lineThickness = 1, points = {{52, 0}, {80, 0}, {66, 24}, {52, 0}})}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-140, -100}, {140, 80}})),
    Documentation(info="<html><head></head><body><p><font face=\"MS shell Dlg 2\" size=\"5\">This pulse generator receives its input (wt) from a phase locked loop (PLL). Here in HVDC models, the inputs of PLL are provided by a delta or star connection (E.g. Modelica 4.0.0/Electrical/Polyphase/Basic/MultiDelta). This pulse generator applies the pulses with 30 degrees delay. It can be used to generate pulses for a bridge which is suppiled by the delta winding of a transformer. This 30 degees delay is required since in the delta winding of YD transformers, the voltage of delta has 30 dgrees lagging with respect to Y.<a href=\"modelica://HVDC.Models.ReferenceInfo\">[See ReferenceInfo]</a></font></p>
</body></html>"));
end PulseGeneratorD;
