<!--
============================================

 poslog.xsl
 Formatting file for Position Logging
==========================================
 Formats Position Logging XML files for
 quick viewing in the Internet Explorer.
===========================================
 02.06.2004 Eisensehr     creation

=============================================
-->

<?xml version="1.0"?>
<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<xsl:template match="/">
   <html>
   <body style="font-size:67%">
   <nobr>
      POSITION LOG FILE <br /><br />
      <xsl:apply-templates select="poslog" />
   </nobr>
   </body>
   </html>
</xsl:template>

<xsl:template match="poslog">
   <span style="color:black">
   ROBOT SERIAL NUMBER=<xsl:value-of select="@serialno" /><br />
   TRAFO=<xsl:value-of select="@trafo" /><br />
   DATE=<xsl:value-of select="@date" /><br />
   TIME=<xsl:value-of select="@time" /><br />
   TICK=<xsl:value-of select="@tick" /><br />
   TIMESTAMP=<xsl:value-of select="@timestamp" /><br />
   TRIGGER=<xsl:value-of select="@trigger" /><br />
   <br />
   </span>
   <xsl:apply-templates />
</xsl:template>

<xsl:template match="syn_motion">
   <span style="color:orange">
   SYN_MOTION:
   PROGRAM=
   <xsl:value-of select="program" />
   LINE=
   <xsl:value-of select="line" />
   NAME=
   <xsl:value-of select="name" />
   <xsl:apply-templates select="base" />
   <xsl:apply-templates select="tool" />
   <xsl:apply-templates select="ipo_mode" />
   <xsl:apply-templates select="load" />
   BCOMOTION=
   <xsl:value-of select="bco_motion" />
   INTERRUPT=
   <xsl:value-of select="interrupt" />
   IPOCYCLE=
   <xsl:value-of select="ipo_cycle" />
   <br />
   </span>
</xsl:template>

<xsl:template match="move">
   <span style="color:orange">
   MOVE:
   <xsl:apply-templates select="key_image" />
   <xsl:apply-templates select="mouse_override" />
   MODE=
   <xsl:value-of select="mode" />
   <xsl:apply-templates select="coord_sys" />
   <xsl:apply-templates select="base" />
   <xsl:apply-templates select="tool" />
   <xsl:apply-templates select="ipo_mode" />
   IPOCYCLE=
   <xsl:value-of select="ipo_cycle" />
   <br />
   </span>
</xsl:template>

<xsl:template match="asy_motion">
   <span style="color:orange">
   ASY_MOTION:
   PROGRAM=
   <xsl:value-of select="program" />
   LINE=
   <xsl:value-of select="line" />
   NAME=
   <xsl:value-of select="name" />
   INTERRUPT=
   <xsl:value-of select="interrupt" />
   IPOCYCLE=
   <xsl:value-of select="ipo_cycle" />
   <br />
   </span>
</xsl:template>

<xsl:template match="ajog">
   <span style="color:orange">
   AJOG:
   <xsl:apply-templates select="key_image" />
   IPOCYCLE=
   <xsl:value-of select="ipo_cycle" />
   <br />
   </span>
</xsl:template>

<xsl:template match="value">
   <xsl:apply-templates select="planned" />
   <xsl:apply-templates select="actual" />
   IPOCYCLE=
   <xsl:value-of select="ipo_cycle" />
   <br />
</xsl:template>

<xsl:template match="base">
   BASE=
   <xsl:apply-templates select="pos" />
</xsl:template>

<xsl:template match="tool">
   TOOL=
   <xsl:apply-templates select="pos" />
</xsl:template>

<xsl:template match="ipo_mode">
   IPO_MODE=
   <xsl:value-of select="//ipo_mode" />
</xsl:template>

<xsl:template match="load">
   MASS=
   <xsl:value-of select="mass" />
</xsl:template>

<xsl:template match="coord_sys">
   COORD_SYS=
   <xsl:apply-templates select="pos" />
</xsl:template>

<xsl:template match="pos">
   (
   <xsl:value-of select="@x" />
   ,
   <xsl:value-of select="@y" />
   ,
   <xsl:value-of select="@z" />
   ,
   <xsl:value-of select="@a" />
   ,
   <xsl:value-of select="@b" />
   ,
   <xsl:value-of select="@c" />
   )
</xsl:template>

<xsl:template match="planned">
   PLANNED=
   <xsl:apply-templates select="robot_axis" />
   <xsl:apply-templates select="external_axis" />
</xsl:template>

<xsl:template match="actual">
   ACTUAL=
   <xsl:apply-templates select="robot_axis" />
   <xsl:apply-templates select="external_axis" />
</xsl:template>

<xsl:template match="robot_axis">
   <xsl:value-of select="@a1" /><span style="color:white">-</span>
   <xsl:value-of select="@a2" /><span style="color:white">-</span>
   <xsl:value-of select="@a3" /><span style="color:white">-</span>
   <xsl:value-of select="@a4" /><span style="color:white">-</span>
   <xsl:value-of select="@a5" /><span style="color:white">-</span>
   <xsl:value-of select="@a6" /><span style="color:white">-</span>
</xsl:template>

<xsl:template match="external_axis">
   <xsl:value-of select="@e1" /><span style="color:white">-</span>
   <xsl:value-of select="@e2" /><span style="color:white">-</span>
   <xsl:value-of select="@e3" /><span style="color:white">-</span>
   <xsl:value-of select="@e4" /><span style="color:white">-</span>
   <xsl:value-of select="@e5" /><span style="color:white">-</span>
   <xsl:value-of select="@e6" />
</xsl:template>

<xsl:template match="key_image">
   <xsl:if test="@k1 != '' or @k2 != '' or @k3 != '' or @k4 != '' or @k5 != '' or @k6 != '' or @k7 != '' or @k8 != '' or @k9 != '' or @k10 != '' or @k11 != '' or @k12 != ''">
   KEY IMAGE=(
   <xsl:if test="contains(@k1,'+')">1+</xsl:if>
   <xsl:if test="contains(@k1,'-')">1-</xsl:if>
   <xsl:if test="contains(@k2,'+')">2+</xsl:if>
   <xsl:if test="contains(@k2,'-')">2-</xsl:if>
   <xsl:if test="contains(@k3,'+')">3+</xsl:if>
   <xsl:if test="contains(@k3,'-')">3-</xsl:if>
   <xsl:if test="contains(@k4,'+')">4+</xsl:if>
   <xsl:if test="contains(@k4,'-')">4-</xsl:if>
   <xsl:if test="contains(@k5,'+')">5+</xsl:if>
   <xsl:if test="contains(@k5,'-')">5-</xsl:if>
   <xsl:if test="contains(@k6,'+')">6+</xsl:if>
   <xsl:if test="contains(@k6,'-')">6-</xsl:if>
   <xsl:if test="contains(@k7,'+')">7+</xsl:if>
   <xsl:if test="contains(@k7,'-')">7-</xsl:if>
   <xsl:if test="contains(@k8,'+')">8+</xsl:if>
   <xsl:if test="contains(@k8,'-')">8-</xsl:if>
   <xsl:if test="contains(@k9,'+')">9+</xsl:if>
   <xsl:if test="contains(@k9,'-')">9-</xsl:if>
   <xsl:if test="contains(@k10,'+')">10+</xsl:if>
   <xsl:if test="contains(@k10,'-')">10-</xsl:if>
   <xsl:if test="contains(@k11,'+')">11+</xsl:if>
   <xsl:if test="contains(@k11,'-')">11-</xsl:if>
   <xsl:if test="contains(@k12,'+')">12+</xsl:if>
   <xsl:if test="contains(@k12,'-')">12-</xsl:if>
   )
   </xsl:if>
</xsl:template>

<xsl:template match="mouse_override">
   <xsl:if test="@m1 != 0 or @m2 != 0 or @m3 != 0 or @m4 != 0 or @m5 != 0 or @m6 != 0">
      MOUSE OVERRIDE=(
      <xsl:value-of select="@m1" />
      ,
      <xsl:value-of select="@m2" />
      ,
      <xsl:value-of select="@m3" />
      ,
      <xsl:value-of select="@m4" />
      ,
      <xsl:value-of select="@m5" />
      ,
      <xsl:value-of select="@m6" />
      )
   </xsl:if>
</xsl:template>

</xsl:stylesheet>