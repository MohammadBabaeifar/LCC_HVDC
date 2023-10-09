within LCC_HVDC.Examples;
model TestFilterFreqDomain
  extends Modelica.Icons.Example;
  output Real abs_y = bode.abs_y "Magnitude of voltage ratio";
  output Modelica.Units.SI.AmplitudeLevelDifference dB_y=bode.dB_y
    "Log10 of magnitude of voltage ratio in dB";
  output Modelica.Units.SI.Angle arg_y=bode.arg_y "Angle of voltage ratio";
  Modelica.Blocks.Sources.LogFrequencySweep frequencySweep(
    duration=1,
    wMin=0.2,
    wMax=2000)
              annotation (Placement(transformation(origin={-84,-80}, extent={{-10,
            -10},{10,10}})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Basic.Ground ground
    annotation (Placement(transformation(extent={{-48,-100},{-28,-80}})));
  Modelica.ComplexBlocks.Sources.ComplexConstant complexConst(k=Complex(1,
        0))
    annotation (Placement(transformation(extent={{-94,2},{-74,22}})));
  Modelica.ComplexBlocks.ComplexMath.Bode bode annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=180,
        origin={-86,76})));
  Models.HpFilterFreqDomain hpFilter
    annotation (Placement(transformation(extent={{58,-38},{84,-14}})));
  Models.BpFilterFreqDomain bpFilter(Qc=50e6)
    annotation (Placement(transformation(extent={{58,-76},{84,-52}})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Ideal.IdealClosingSwitch
    switch3
    annotation (Placement(transformation(extent={{24,-74},{42,-56}})));
  Modelica.Blocks.Sources.BooleanExpression Enable3(y=true) annotation (
      Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={1,-49})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Ideal.IdealClosingSwitch
    switch1 annotation (Placement(transformation(extent={{26,2},{44,20}})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Ideal.IdealClosingSwitch
    switch2
    annotation (Placement(transformation(extent={{26,-34},{44,-16}})));
  Modelica.Blocks.Sources.BooleanExpression Enable1(y=true) annotation (
      Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={3,27})));
  Modelica.Blocks.Sources.BooleanExpression Enable2(y=true) annotation (
      Placement(transformation(
        extent={{-7,-7},{7,7}},
        rotation=0,
        origin={1,-9})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Sources.VariableVoltageSource
    voltageSource annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={-44,-24})));
  Modelica.Electrical.QuasiStatic.SinglePhase.Sensors.CurrentSensor currentSensor1
    annotation (Placement(transformation(
        extent={{7,-7},{-7,7}},
        rotation=180,
        origin={-27,11})));
  Models.ChpFilterFreqDomain c_HpFilter(Qc=60e6)
    annotation (Placement(transformation(extent={{58,0},{84,24}})));
equation
  connect(bode.divisor,complexConst. y) annotation (Line(points={{-74,70},{
          -60,70},{-60,12},{-73,12}},                                                                color={85,170,255}));
  connect(bpFilter.pin_N, ground.pin) annotation (Line(points={{84,-64},{94,
          -64},{94,-80},{-38,-80}}, color={85,170,255}));
  connect(hpFilter.pin_N, ground.pin) annotation (Line(points={{84,-26},{94,
          -26},{94,-80},{-38,-80}}, color={85,170,255}));
  connect(switch3.pin_n, bpFilter.pin_P) annotation (Line(points={{42,-65},
          {41,-65},{41,-64.48},{58,-64.48}}, color={85,170,255}));
  connect(switch2.pin_n, hpFilter.pin_P) annotation (Line(points={{44,-25},
          {44,-26.48},{58,-26.48}}, color={85,170,255}));
  connect(Enable3.y, switch3.control) annotation (Line(points={{8.7,-49},{
          33,-49},{33,-54.2}}, color={255,0,255}));
  connect(Enable1.y, switch1.control) annotation (Line(points={{10.7,27},{
          35,27},{35,21.8}}, color={255,0,255}));
  connect(Enable2.y, switch2.control) annotation (Line(points={{8.7,-9},{35,
          -9},{35,-14.2}}, color={255,0,255}));
  connect(voltageSource.pin_n, ground.pin) annotation (Line(points={{-44,
          -34},{-44,-80},{-38,-80}}, color={85,170,255}));
  connect(voltageSource.f, frequencySweep.y) annotation (Line(points={{-56,
          -30},{-60,-30},{-60,-80},{-73,-80}}, color={0,0,127}));
  connect(voltageSource.V, complexConst.y) annotation (Line(points={{-56,
          -18},{-60,-18},{-60,12},{-73,12}}, color={85,170,255}));
  connect(currentSensor1.pin_p, voltageSource.pin_p) annotation (Line(
        points={{-34,11},{-44,11},{-44,-14}}, color={85,170,255}));
  connect(currentSensor1.pin_n, switch1.pin_p) annotation (Line(points={{
          -20,11},{3,11},{3,11},{26,11}}, color={85,170,255}));
  connect(switch2.pin_p, switch1.pin_p) annotation (Line(points={{26,-25},{
          26,-26},{12,-26},{12,11},{26,11}}, color={85,170,255}));
  connect(switch3.pin_p, switch1.pin_p) annotation (Line(points={{24,-65},{
          22,-65},{22,-66},{12,-66},{12,11},{26,11}}, color={85,170,255}));
  connect(currentSensor1.i, bode.u) annotation (Line(points={{-27,18.7},{
          -27,82},{-74,82}}, color={85,170,255}));
  connect(c_HpFilter.pin_N, ground.pin) annotation (Line(points={{84,12},{
          94,12},{94,-80},{-38,-80}}, color={85,170,255}));
  connect(c_HpFilter.pin_P, switch1.pin_n) annotation (Line(points={{58,
          11.52},{51,11.52},{51,11},{44,11}}, color={85,170,255}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
  <p>This example shows the admittance (with gain and phase) of harmonic filters in frequency domain (fundamental frequency is 50 Hz).</p>
  <p>The example is comprised of three filters namely:</p> 
  <ul>
  <li>Single-tuned band pass with Q<sub>c</sub> = 50 Mvar to filter the 5th harmonic</li>
  <li>High pass with Q<sub>c</sub> = 40 Mvar to filter the 12th harmonic</li>
  <li>C-type high pass with Q<sub>c</sub> = 60 Mvar to filter the 3rd harmonic</li>
  </ul>
  <p>To do this test, a voltage source with variable frequency and constant voltage (1 V) is applied to the filters. The frequency is varied by a logarithmic ramp</p>
  <p>The output shows the bode diagrams of the ratio of the current flowing to the filter(filters) divided by the input voltage i.e. its admittance versus frequency.</p>
  <p>You can see the admittance of each filter individually by setting its switch-enable to true and other enables to false. You can also see the total admittance of three parallel filters by setting all enables to true.</p>
  <p>To see the admittance on a logarithmic scale, plot the following variables versus <code>voltageSource.f</code>:</p>
  <ul>
  <li>The gain of the admittance: <code>abs_y</code></li> 
  <li>The phase of admittance: <code>arg_y</code></li>
  </ul>
  <p>At fundamental frequency (f = 50 Hz), with all three filters connected, you can see that <code>abs_y</code> is equal to:  0.9375 mS (At fundamental frequency, harmonic filters are capacitive. So, <code>abs_y</code> is the susceptance i.e. B<sub>c</sub> or 1/X<sub>c</sub>).</p>
  <p>This implies a toltal reactive power of  Qc = V<sup>2</sup> / X<sub>c</sub> = V<sup>2</sup> . B<sub>c</sub> = (400e3)<sup>2</sup> (0.0009375) = 150 Mvar as expected.</p>

</body>
</html>"));
end TestFilterFreqDomain;
