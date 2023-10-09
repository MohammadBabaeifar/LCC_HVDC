within LCC_HVDC.Models;
model HVDCpole "Two 6-pulse equidistant bridges with 3 winding transformer"
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Inductance Lsmooth = 225e-3 "Smoothing inductor";
  parameter Modelica.Units.SI.Resistance Rsmooth = 0.1 "Resistance of smoothing inductor";
  parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
  //Note that setting an initial current, if we do not want wrong initial voltage, must be combined with initial SCR state.
  parameter Modelica.Units.SI.Frequency f = 50 "line frequency";
  parameter Real BlockTime = 0 "Pulse initial blocking time";
  parameter Real Inverter = 1 "1 for inverter and 0 for rectifier operation";

  Modelica.Electrical.Polyphase.Basic.PlugToPin_p r1(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-98, 47}, extent = {{-14, -15}, {14, 15}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p s1(k = 2) annotation (
    Placement(visible = true, transformation(origin = {-96, 23}, extent = {{-12, -15}, {12, 15}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p t1(k = 3) annotation (
    Placement(visible = true, transformation(origin = {-97, 0}, extent = {{-13, -14}, {13, 14}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation (
    Placement(transformation(extent = {{54, 46}, {90, 82}})));
  Modelica.Electrical.Analog.Sensors.VoltageSensor UDC annotation (
    Placement(transformation(extent = {{-16, -16}, {16, 16}}, rotation = 270, origin = {54, -42})));
  ThreeWindingTransformer transformer annotation (
    Placement(transformation(extent = {{-208, -76}, {-140, -12}})));
  LCC_HVDC.Models.PllPolePulser converterControl(BlockTime=BlockTime)
    annotation (Placement(visible=true, transformation(
        origin={-175,-166.154},
        extent={{-33,-13.8463},{33,46.155}},
        rotation=0)));
  Bridge bridge2(iniOff = {false, false, false, false, true, true})                               annotation (
    Placement(transformation(extent = {{-70, -108}, {-6, -48}})));
  Bridge bridge1(iniOff = {false, false, false, false, true, true})                               annotation (
    Placement(transformation(extent = {{-70, -6}, {-6, 52}})));
  Modelica.Blocks.Math.Mean vMean(f = 600, x0 = -(0.5e6)*(Inverter) + (0.5e6)*(1 - Inverter)) annotation (
    Placement(visible = true, transformation(origin = {114, -82}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor smoothingR(R = Rsmooth) annotation (
    Placement(visible = true, transformation(origin = {188, 64}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor smoothingL(L = Lsmooth) annotation (
    Placement(visible = true, transformation(origin = {122, 64}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor smoothingR1(R = Rsmooth) annotation (
    Placement(visible = true, transformation(origin = {185, -181}, extent = {{-25, -25}, {25, 25}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor smoothingL1(L = Lsmooth) annotation (
    Placement(visible = true, transformation(origin = {112, -182}, extent = {{-26, -26}, {26, 26}}, rotation = 0)));
  Modelica.Blocks.Math.Mean iMean(f = 600) annotation (
    Placement(visible = true, transformation(origin = {110, -6}, extent = {{-24, -24}, {24, 24}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p r2(k = 1) annotation (
    Placement(visible = true, transformation(origin = {-94, -57}, extent = {{-14, -15}, {14, 15}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p s2(k = 2) annotation (
    Placement(visible = true, transformation(origin = {-94, -78}, extent = {{-12, -16}, {12, 16}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p t2(k = 3) annotation (
    Placement(visible = true, transformation(origin = {-94, -98}, extent = {{-12, -14}, {12, 14}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Interfaces.PositivePlug ac annotation (
    Placement(transformation(extent = {{-270, -72}, {-210, -12}}), iconTransformation(extent = {{-114, -8}, {-90, 16}})));
  Modelica.Blocks.Interfaces.RealInput alpha annotation (
    Placement(visible = true, transformation(origin = {-255, -199}, extent = {{-43, -43}, {43, 43}}, rotation = 0), iconTransformation(origin = {-110, -62}, extent = {{-14, -14}, {14, 14}}, rotation = 0)));
  Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation (
    Placement(transformation(extent = {{-24, -24}, {24, 24}}, rotation = 180, origin = {238, 62}), iconTransformation(extent = {{100, 14}, {122, 36}})));
  Modelica.Blocks.Interfaces.RealOutput vdc annotation (Placement(
        transformation(extent={{224,-114},{288,-50}}), iconTransformation(
          extent={{100,-88},{126,-62}})));
  Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation (
    Placement(transformation(extent = {{216, -202}, {264, -154}}), iconTransformation(extent = {{100, -40}, {122, -18}})));
  Modelica.Blocks.Interfaces.RealOutput idc annotation (Placement(
        transformation(extent={{226,-38},{288,24}}), iconTransformation(
          extent={{100,56},{126,82}})));
equation
  connect(r1.plug_p, t1.plug_p) annotation (
    Line(points = {{-100.8, 47}, {-110, 47}, {-110, 0}, {-99.6, 0}}, color = {0, 0, 255}));
  connect(s1.plug_p, t1.plug_p) annotation (
    Line(points = {{-98.4, 23}, {-110, 23}, {-110, 0}, {-99.6, 0}}, color = {0, 0, 255}));
  connect(pin_p, pin_p) annotation (
    Line(points={{238,62},{238,62}},      color = {0, 0, 255}));
  connect(ac,transformer.primary3phase)  annotation (
    Line(points = {{-240, -42}, {-224, -42}, {-224, -44}, {-208, -44}}, color = {0, 0, 255}));
  connect(ac, ac) annotation (
    Line(points={{-240,-42},{-240,-42}},      color = {0, 0, 255}));
  connect(smoothingR.p, smoothingL.n) annotation (
    Line(points = {{164, 64}, {146, 64}}, color = {0, 0, 255}));
  connect(smoothingL.p, currentSensor.n) annotation (
    Line(points = {{98, 64}, {90, 64}}, color = {0, 0, 255}));
  connect(pin_n, pin_n) annotation (
    Line(points={{240,-178},{240,-178}},      color = {0, 0, 255}));
  connect(smoothingR1.p,smoothingL1. n) annotation (
    Line(points = {{160, -181}, {160, -182}, {138, -182}}, color = {0, 0, 255}));
  connect(UDC.p, currentSensor.p) annotation (
    Line(points = {{54, -26}, {54, 64}}, color = {0, 0, 255}));
  connect(UDC.n,smoothingL1. p) annotation (
    Line(points = {{54, -58}, {54, -182}, {86, -182}}, color = {0, 0, 255}));
  connect(iMean.u, currentSensor.i) annotation (
    Line(points = {{81.2, -6}, {72, -6}, {72, 44.2}}, color = {0, 0, 127}));
  connect(r1.pin_p,bridge1. pin1) annotation (
    Line(points = {{-95.2, 47}, {-86, 47}, {-86, 35.18}, {-72.56, 35.18}}, color = {0, 0, 255}));
  connect(s1.pin_p,bridge1. pin2) annotation (
    Line(points = {{-93.6, 23}, {-72.56, 23}}, color = {0, 0, 255}));
  connect(t1.pin_p,bridge1. pin3) annotation (
    Line(points = {{-94.4, 0}, {-86, 0}, {-86, 10.82}, {-72.56, 10.82}}, color = {0, 0, 255}));
  connect(transformer.secondary3phase, s1.plug_p) annotation (
    Line(points = {{-139.32, -34.4}, {-112, -34.4}, {-112, 0}, {-110, 0}, {-110, 23}, {-98.4, 23}}, color = {0, 0, 255}));
  connect(s2.pin_p,bridge2. pin2) annotation (
    Line(points = {{-91.6, -78}, {-72.56, -78}}, color = {0, 0, 255}));
  connect(r2.plug_p, t2.plug_p) annotation (
    Line(points = {{-96.8, -57}, {-106, -57}, {-106, -98}, {-96.4, -98}}, color = {0, 0, 255}));
  connect(s2.plug_p, t2.plug_p) annotation (
    Line(points = {{-96.4, -78}, {-106, -78}, {-106, -98}, {-96.4, -98}}, color = {0, 0, 255}));
  connect(transformer.tertiary3phase, s2.plug_p) annotation (
    Line(points = {{-139.32, -53.6}, {-114, -53.6}, {-114, -78}, {-96.4, -78}}, color = {0, 0, 255}));
  connect(vMean.u, UDC.v) annotation (
    Line(points = {{85.2, -82}, {38, -82}, {38, -42}, {36.4, -42}}, color = {0, 0, 127}));
  connect(smoothingR1.n, pin_n) annotation (
    Line(points = {{210, -181}, {210, -182}, {240, -182}, {240, -178}}, color = {0, 0, 255}));
  connect(smoothingR.n, pin_p) annotation (
    Line(points = {{212, 64}, {238, 64}, {238, 62}}, color = {0, 0, 255}));
  connect(converterControl.ac3Phase, ac) annotation (
    Line(points={{-208.66,-150},{-240,-150},{-240,-42}},        color = {0, 0, 255}));
  connect(t2.pin_p,bridge2. pin3) annotation (
    Line(points = {{-91.6, -98}, {-82, -98}, {-82, -90.6}, {-72.56, -90.6}}, color = {0, 0, 255}));
  connect(converterControl.pD,bridge2. P) annotation (
    Line(points={{-138.04,-168.6},{-116,-168.6},{-116,-124},{6,-124},{6,-78},
          {-1.52,-78}},                                                                                 color = {255, 0, 255}));
  connect(iMean.y, idc) annotation (Line(points={{136.4,-6},{166,-6},{166,-7},
          {257,-7}}, color={0,0,127}));
  connect(vMean.y, vdc)
    annotation (Line(points={{140.4,-82},{256,-82}}, color={0,0,127}));
  connect(r2.pin_p,bridge2. pin1) annotation (
    Line(points = {{-91.2, -57}, {-91.2, -58}, {-82, -58}, {-82, -65.4}, {-72.56, -65.4}}, color = {0, 0, 255}));
  connect(bridge1.pin_p, currentSensor.p) annotation (
    Line(points = {{-3.44, 40.4}, {6, 40.4}, {6, 64}, {54, 64}}, color = {0, 0, 255}));
  connect(bridge1.pin_n,bridge2. pin_p) annotation (
    Line(points = {{-3.44, 5.02}, {6, 5.02}, {6, -60}, {-3.44, -60}}, color = {0, 0, 255}));
  connect(bridge2.pin_n,smoothingL1. p) annotation (
    Line(points = {{-3.44, -96.6}, {54, -96.6}, {54, -182}, {86, -182}}, color = {0, 0, 255}));
  connect(converterControl.pY,bridge1. P) annotation (
    Line(points={{-138.04,-131.999},{-62,-131.999},{-62,-132},{14,-132},{14,
          23},{-1.52,23}},                                                                                color = {255, 0, 255}));
  connect(converterControl.alpha,alpha)  annotation (
    Line(points={{-174.67,-183.9},{-174.67,-199},{-255,-199}},        color = {0, 0, 127}));
  annotation (
    Placement(transformation(origin = {-314, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 180)),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-240, 100}, {240, -240}})),
    experiment(StopTime = 0.6, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
    Documentation(revisions = "<html>
    <p><b>Release Notes:</b></p>
    <ul>
    <li><i>Mai 7, 2004   </i>
         by Anton Haumer<br> realized<br>
         </li>
    </ul>
    </html>",
          info = "<html><head></head><body><p><font size=\"5\">This block is created to is give the possibility of arranging HVDC systems, either monopolar or bipolar, acording to IEC TR 60919-1. This results in a redundancy in the arrangement of HVDC systems so that if one pole is tripped or is under maintenance, the other pole continues to deliver power.&nbsp;<a href=\"modelica://HVDC.Models.ReferenceInfo\">[See ReferenceInfo: 3]</a></font></p>
</body></html>"),
    __Dymola_experimentSetupOutput,
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}, preserveAspectRatio = false), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {6, 4}, rotation = 180, textColor = {0, 0, 217}, extent = {{-84, 22}, {84, -22}}, textString = "HVDC Pole", fontName = "MS"), Text(origin = {14.6819, 99.5795}, textColor = {0, 0, 227}, extent = {{-114.685, 48.418}, {89.3181, 8.42046}}, textString = "%name", fontName = "MS")}));
end HVDCpole;
