within LCC_HVDC.Models;
model PoleControl
  parameter Integer ControlType = 1 "1 for current control and 2 for voltage control";
  Modelica.Blocks.Sources.BooleanExpression controllerType(y=if ControlType
         == 1 then true else false) annotation (Placement(visible=true,
        transformation(
        origin={7,20},
        extent={{13,-10},{-13,10}},
        rotation=0)));
  Modelica.Blocks.Logical.Switch switch3 annotation (
    Placement(visible = true, transformation(origin = {-34, 20}, extent = {{16, 16}, {-16, -16}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput firingANGLE annotation (
    Placement(transformation(extent = {{-12, -12}, {12, 12}}, rotation = 180, origin = {-92, 20}), iconTransformation(extent = {{-12, -12}, {12, 12}}, rotation = 180, origin = {-112, 0})));
  Modelica.Blocks.Interfaces.RealInput iDC annotation (
    Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 180, origin = {195, 1}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 180, origin = {113, -25})));
  Modelica.Blocks.Interfaces.RealInput vDC annotation (
    Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 180, origin = {195, 85}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 180, origin = {113, 57})));
  Modelica.Blocks.Interfaces.RealInput vdcRef annotation (
    Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 180, origin = {195, 41}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 180, origin = {113, 17})));
  Modelica.Blocks.Interfaces.RealInput powerRef annotation (
    Placement(transformation(extent = {{-17, -17}, {17, 17}}, rotation = 180, origin = {195, -41}), iconTransformation(extent = {{-13, -13}, {13, 13}}, rotation = 180, origin = {113, -65})));
  IdcController idcController(
    Ti=0.08,
    k=0.5,
    uMin=0.45e6,
    uMax=0.55e6,
    y_start=0.8,
    IdcBase=1000) annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=180,
        origin={121,-23})));
  VdcController vdcController(
    Ti=0.07,
    k=0.7,
    y_start=-0.8,
    VdcBase=0.5e6) annotation (Placement(transformation(
        extent={{-19,-19},{19,19}},
        rotation=180,
        origin={121,81})));
equation
  connect(controllerType.y, switch3.u2)
    annotation (Line(points={{-7.3,20},{-14.8,20}}, color={255,0,255}));
  connect(switch3.y, firingANGLE) annotation (
    Line(points = {{-51.6, 20}, {-92, 20}}, color = {0, 0, 127}));
  connect(idcController.pref, powerRef) annotation (Line(points={{142.09,-33.83},
          {166,-33.83},{166,-41},{195,-41}}, color={0,0,127}));
  connect(idcController.vdc, vDC) annotation (Line(points={{141.9,-21.48},{
          166,-21.48},{166,85},{195,85}}, color={0,0,127}));
  connect(idcController.idc, iDC) annotation (Line(points={{141.9,-10.46},{
          174,-10.46},{174,1},{195,1}}, color={0,0,127}));
  connect(idcController.alpha, switch3.u1) annotation (Line(points={{99.34,
          -23.38},{20,-23.38},{20,7.2},{-14.8,7.2}}, color={0,0,127}));
  connect(vdcController.vdc, vDC) annotation (Line(points={{142.09,90.69},{
          164,90.69},{164,85},{195,85}}, color={0,0,127}));
  connect(vdcController.vdcRef, vdcRef) annotation (Line(points={{142.09,
          71.69},{160,71.69},{160,41},{195,41}}, color={0,0,127}));
  connect(vdcController.alpha, switch3.u3) annotation (Line(points={{98.77,
          79.67},{20,79.67},{20,32.8},{-14.8,32.8}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio = false, extent = {{-100, -100}, {100, 100}}), graphics={  Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(textColor = {0, 0, 184}, extent = {{-80, 44}, {86, -32}}, textString = "Pole Control"), Text(origin = {-34.6566, 47.345}, textColor = {0, 0, 184}, extent = {{-67.3434, 98.655}, {138.656, 68.655}}, textString = "%name")}),
    Diagram(coordinateSystem(preserveAspectRatio = false, extent = {{-80, -80}, {180, 120}})),
    Documentation(info="<html>
<head>
  <style>
    body {
      font-family: \"Courier New\", Courier, monospace;
    }
  </style>
</head>
<body>
<p> Pole control is comprised of a voltage controller as well as a current controller. The users can choose their desired control type by choosing 1 for current control or 2 for voltage control on the mask of this model.</p>
<a href=\"modelica://LCC_HVDC.Models.ReferenceInfo\">[See ReferenceInfo: 2]</a>
</body>
</html>"));
end PoleControl;
