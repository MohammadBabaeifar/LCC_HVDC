within LCC_HVDC.Examples;
model TestFilter
  import Modelica.Constants.pi;
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.Units.SI.Current iStart = 30 "Initial current: flows in load and source";
  Real vrs =transformer.primary3phase.pin[1].v  -transformer.primary3phase.pin[
      2].v;
  Modelica.Electrical.Analog.Basic.Ground ground1 annotation (
    Placement(visible = true, transformation(extent={{76,-90},{92,-74}},      rotation = 0)));
  Modelica.Blocks.Math.Mean mean(f = 600) annotation (
    Placement(visible = true, transformation(origin={44,20},     extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Inductor Ldc(L = 225e-3, i(start = 0)) annotation (
    Placement(visible = true, transformation(origin={74,68},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Rdc(R = 0.1) annotation (
    Placement(visible = true, transformation(origin={48,68},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  LCC_HVDC.Models.Bridge bridgeHV(iniOff={true,true,true,false,false,true})
    annotation (Placement(visible=true, transformation(
        origin={-24.8572,60},
        extent={{-11.1428,-12},{14.8572,12}},
        rotation=0)));
  LCC_HVDC.Models.PllPolePulser converterUnitControl(BlockTime=0.111247,
      vNom=400e3) annotation (Placement(visible=true, transformation(
        origin={-94,-76.4615},
        extent={{-14,-5.53847},{14,18.4615}},
        rotation=0)));
  Modelica.Blocks.Sources.Constant Fire(k = 10) annotation (
    Placement(visible = true, transformation(origin={-136,-90},    extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Sources.SineVoltage Vsource(V = fill((400e3)*sqrt(2/3), 3), f = fill(50, 3), m = 3) annotation (
    Placement(transformation(origin={-180,56},    extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Electrical.Polyphase.Basic.Star starS(m = 3) annotation (
    Placement(transformation(origin={-191,9},      extent = {{-11, -9}, {11, 9}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Ground groundS annotation (
    Placement(transformation(extent={{-198,-74},{-184,-60}})));
  Modelica.Electrical.Polyphase.Basic.Resistor FS_R(R = fill(1.45, 3)) annotation (
    Placement(transformation(extent={{-168,48},{-150,64}})));
  Modelica.Electrical.Polyphase.Basic.Inductor FS_L(L = fill(0.046, 3)) annotation (
    Placement(transformation(extent={{-146,46},{-126,66}})));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p r1(k = 1) annotation (
    Placement(visible = true, transformation(origin={-55,74},    extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p s1(k = 2) annotation (
    Placement(visible = true, transformation(origin={-55,60},    extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p t1(k = 3) annotation (
    Placement(visible = true, transformation(origin={-55,46},   extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  LCC_HVDC.Models.ThreeWindingTransformer transformer
    annotation (Placement(transformation(extent={{-104,42},{-76,68}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V = 490e3) annotation (
    Placement(visible = true, transformation(origin={88,-12},    extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Electrical.Analog.Basic.Inductor Ldc1(L = 225e-3, i(start = 0)) annotation (
    Placement(visible = true, transformation(origin={74,-64},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Resistor Rdc1(R = 0.1) annotation (
    Placement(visible = true, transformation(origin={48,-64},    extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.VoltageSensor UDC annotation (
    Placement(transformation(extent = {{-8, -8}, {8, 8}}, rotation = 270, origin={28,40})));
  LCC_HVDC.Models.Bridge bridgeHV1(iniOff={true,true,true,false,false,true})
    annotation (Placement(visible=true, transformation(
        origin={-24.8572,12},
        extent={{-11.1428,-12},{14.8572,12}},
        rotation=0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p r2(k = 1) annotation (
    Placement(visible = true, transformation(origin={-55,26},     extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p s2(k = 2) annotation (
    Placement(visible = true, transformation(origin={-55,12},     extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Polyphase.Basic.PlugToPin_p t2(k = 3) annotation (
    Placement(visible = true, transformation(origin={-55,-2},     extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground gnd
    annotation (Placement(transformation(extent={{-108,-50},{-100,-42}})));
  Models.BpFilterTimeDomain filter2(Qc=80e6, Nh=11)
    annotation (Placement(transformation(extent={{-88,-40},{-70,-24}})));
  Modelica.Electrical.Analog.Basic.Ground gnd1
    annotation (Placement(transformation(extent={{-82,-50},{-74,-42}})));
  Models.BpFilterTimeDomain filter3(Qc=80e6, Nh=13)
    annotation (Placement(transformation(extent={{-62,-40},{-44,-24}})));
  Modelica.Electrical.Analog.Basic.Ground gnd2
    annotation (Placement(transformation(extent={{-56,-50},{-48,-42}})));
  Modelica.Electrical.Polyphase.Ideal.IdealClosingSwitch switch annotation (
      Placement(transformation(
        extent={{-7,-8},{7,8}},
        rotation=270,
        origin={-118,21})));
  Modelica.Blocks.Sources.BooleanExpression Time[3](y=fill(time > 0.1, 3))
    annotation (Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=180,
        origin={-93,21})));
  Models.ChpFilterTimeDomain filter1(Qc=80e6)
    annotation (Placement(transformation(extent={{-114,-40},{-96,-24}})));
equation
  connect(starS.pin_n, groundS.p) annotation (
    Line(points={{-191,-2},{-191,-60}},       color = {0, 0, 255}));
  connect(FS_R.plug_p, Vsource.plug_p) annotation (
    Line(points={{-168,56},{-170,56}},      color = {0, 0, 255}));
  connect(FS_R.plug_n, FS_L.plug_p) annotation (
    Line(points={{-150,56},{-146,56}},      color = {0, 0, 255}));
  connect(Vsource.plug_n, starS.plug_p) annotation (
    Line(points={{-190,56},{-190,20},{-191,20}},          color = {0, 0, 255}));
  connect(r1.plug_p, t1.plug_p) annotation (
    Line(points={{-56.8,74},{-64,74},{-64,46},{-56.8,46}},        color = {0, 0, 255}));
  connect(s1.plug_p, t1.plug_p) annotation (
    Line(points={{-56.8,60},{-64,60},{-64,46},{-56.8,46}},        color = {0, 0, 255}));
  connect(r1.pin_p, bridgeHV.pin1) annotation (
    Line(points={{-53.2,74},{-48,74},{-48,65.04},{-37.04,65.04}},          color = {0, 0, 255}));
  connect(s1.pin_p, bridgeHV.pin2) annotation (
    Line(points={{-53.2,60},{-37.04,60}},      color = {0, 0, 255}));
  connect(bridgeHV.pin3, t1.pin_p) annotation (
    Line(points={{-37.04,54.96},{-48,54.96},{-48,46},{-53.2,46}},      color = {0, 0, 255}));
  connect(FS_L.plug_n,transformer.primary3phase)  annotation (
    Line(points={{-126,56},{-104,56},{-104,55}},       color = {0, 0, 255}));
  connect(transformer.secondary3phase, t1.plug_p) annotation (
    Line(points={{-75.72,58.9},{-75.72,60},{-64,60},{-64,46},{-56.8,46}},          color = {0, 0, 255}));
  connect(converterUnitControl.ac3Phase, FS_L.plug_n) annotation (
    Line(points={{-108.28,-70},{-125.66,-70},{-125.66,56},{-126,56}},          color = {0, 0, 255}));
  connect(Ldc.p, Rdc.n) annotation (
    Line(points={{64,68},{58,68}},      color = {0, 0, 255}));
  connect(Rdc.p, bridgeHV.pin_p) annotation (
    Line(points={{38,68},{18,68},{18,67.2},{-8.96,67.2}},         color = {0, 0, 255}));
  connect(Ldc1.p, Rdc1.n) annotation (
    Line(points={{64,-64},{58,-64}},      color = {0, 0, 255}));
  connect(constantVoltage.p, Ldc.n) annotation (
    Line(points={{88,-2},{88,68},{84,68}},        color = {0, 0, 255}));
  connect(constantVoltage.n, Ldc1.n) annotation (
    Line(points={{88,-22},{88,-64},{84,-64}},        color = {0, 0, 255}));
  connect(UDC.v, mean.u) annotation (
    Line(points={{19.2,40},{20,40},{20,20},{34.4,20}},           color = {0, 0, 127}));
  connect(s2.pin_p, bridgeHV1.pin2) annotation (
    Line(points={{-53.2,12},{-37.04,12}},        color = {0, 0, 255}));
  connect(bridgeHV1.pin1, r2.pin_p) annotation (
    Line(points={{-37.04,17.04},{-48,17.04},{-48,26},{-53.2,26}},              color = {0, 0, 255}));
  connect(bridgeHV1.pin3, t2.pin_p) annotation (
    Line(points={{-37.04,6.96},{-48,6.96},{-48,-2},{-53.2,-2}},                color = {0, 0, 255}));
  connect(r2.plug_p, t2.plug_p) annotation (
    Line(points={{-56.8,26},{-62,26},{-62,-2},{-56.8,-2}},              color = {0, 0, 255}));
  connect(s2.plug_p, t2.plug_p) annotation (
    Line(points={{-56.8,12},{-62,12},{-62,-2},{-56.8,-2}},              color = {0, 0, 255}));
  connect(transformer.tertiary3phase, t2.plug_p) annotation (
    Line(points={{-75.72,51.1},{-70,51.1},{-70,12},{-62,12},{-62,-2},{-56.8,-2}},                color = {0, 0, 255}));
  connect(converterUnitControl.pY, bridgeHV.P) annotation (
    Line(points={{-78.32,-62.8},{8,-62.8},{8,60},{-8.18,60}},             color = {255, 0, 255}));
  connect(converterUnitControl.pD, bridgeHV1.P) annotation (
    Line(points={{-78.32,-77.44},{2,-77.44},{2,12},{-8.18,12}},               color = {255, 0, 255}));
  connect(bridgeHV.pin_n, bridgeHV1.pin_p) annotation (
    Line(points={{-8.96,52.56},{-2,52.56},{-2,19.2},{-8.96,19.2}},              color = {0, 0, 255}));
  connect(Rdc1.p, bridgeHV1.pin_n) annotation (
    Line(points={{38,-64},{20,-64},{20,4.56},{-8.96,4.56}},               color = {0, 0, 255}));
  connect(UDC.p, bridgeHV.pin_p) annotation (
    Line(points={{28,48},{28,68},{18,68},{18,67.2},{-8.96,67.2}},          color = {0, 0, 255}));
  connect(ground1.p, Ldc1.n) annotation (
    Line(points={{84,-74},{84,-64}},      color = {0, 0, 255}));
  connect(UDC.n, bridgeHV1.pin_n) annotation (
    Line(points={{28,32},{28,-42},{20,-42},{20,4.56},{-8.96,4.56}},                  color = {0, 0, 255}));
  connect(converterUnitControl.alpha, Fire.y) annotation (
    Line(points={{-93.86,-83.56},{-93.86,-90},{-129.4,-90}},          color = {0, 0, 127}));
  connect(gnd1.p,filter2.gnd)  annotation (Line(points={{-78,-42},{-78,
          -41.08},{-79,-41.08},{-79,-40.16}},
                                     color={0,0,255}));
  connect(gnd2.p,filter3.gnd)  annotation (Line(points={{-52,-42},{-52,
          -41.08},{-53,-41.08},{-53,-40.16}},
                                     color={0,0,255}));
  connect(switch.plug_p,transformer.primary3phase)  annotation (Line(points={{-118,
          28},{-118,56},{-104,56},{-104,55}}, color={0,0,255}));
  connect(filter2.positivePlug, switch.plug_n) annotation (Line(points={{-87.91,
          -32.24},{-92,-32.24},{-92,-16},{-118,-16},{-118,14}}, color={0,0,255}));
  connect(filter3.positivePlug, switch.plug_n) annotation (Line(points={{-61.91,
          -32.24},{-66,-32.24},{-66,-16},{-118,-16},{-118,14}}, color={0,0,255}));
  connect(Time.y, switch.control)
    annotation (Line(points={{-100.7,21},{-108.4,21}}, color={255,0,255}));
  connect(filter1.gnd, gnd.p) annotation (Line(points={{-105,-40.16},{-105,
          -42},{-104,-42}}, color={0,0,255}));
  connect(filter1.positivePlug, switch.plug_n) annotation (Line(points={{
          -113.91,-32.24},{-118,-32.24},{-118,14}}, color={0,0,255}));
  annotation (
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-200, -100}, {100, 80}})),
    experiment(StopTime = 0.3, StartTime = 0, Tolerance = 1e-06, Interval = 6e-05),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>This example shows the performance of 3-phase shunt harmonic filters.</p>
  <p>To see the effect of filters, plot these signals:</p>
  <ul>
    <li>The current flowing into the ac grid impedance: <code>FS_L.i[1]</code></li>
    <li>The current flowing into the transformer: <code>transformer.primary3phase.pin[1].i</code></li>
    <li>AC voltage at the primary side of the transformer: <code>transformer.primary3phase.pin[1].v</code></li>
  </ul>
  <p>The filters provide a path for the harmonic currents. Thus, the current flowing into the grid is closer to a sinusoidal waveform.<p>
  <P>Run the simulation for the second time with filters disconnected. To do so, increase the switch time to more than your simulation time, e.g. time >0.4<p>
  <p>Now, compare the above-mentioned signals for the two simulations. You will see the impact of filters on current and voltage. Also, you can observe a lower DC current in the absence of filter:<p>
  <ul>  
    <li>DC current: <code>Rdc.i</code></li>
  </ul>
  
</body>
</html>"));
end TestFilter;
