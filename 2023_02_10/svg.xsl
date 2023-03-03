<!-- <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
        <xsl:output method="xml" indent="yes"/>

        <xsl:template match="root">
          <svg width="{графика/@ширина}" height="{графика/@высота}">
            <xsl:apply-templates select="графика/эллипс"/>
          </svg>
        </xsl:template>

        <xsl:template match="эллипс">
          <ellipse id="{@id}" fill="{@заливка}" stroke="{@ободок}" stroke-width="{@ширина-ободка}" cx="{@cx}" cy="{@cy}" rx="{@rx}" ry="{@ry}"/>
        </xsl:template>
      </xsl:stylesheet> -->

<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/2000/svg">
    <xsl:attribute-set name="svg-style">
        <xsl:attribute name="width"><xsl:value-of select="@ширина" /></xsl:attribute>
        <xsl:attribute name="height"><xsl:value-of select="@высота" /></xsl:attribute>
    </xsl:attribute-set>
    <xsl:attribute-set name="ellipse-style">
        <xsl:attribute name="id"><xsl:value-of select="@id" /></xsl:attribute>
        <xsl:attribute name="fill"><xsl:value-of select="@заливка" /></xsl:attribute>
        <xsl:attribute name="stroke"><xsl:value-of select="@ободок" /></xsl:attribute>
        <xsl:attribute name="stroke-width"><xsl:value-of select="@ширина-ободка" /></xsl:attribute>
        <xsl:attribute name="cx"><xsl:value-of select="@cx"/></xsl:attribute>
        <xsl:attribute name="cy"><xsl:value-of select="@cy"/></xsl:attribute>
        <xsl:attribute name="rx"><xsl:value-of select="@rx"/></xsl:attribute>
        <xsl:attribute name="ry"><xsl:value-of select="@ry"/></xsl:attribute>

    </xsl:attribute-set>

    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
    <xsl:template match="графика" >
        <svg xsl:use-attribute-sets="svg-style">
            <xsl:apply-templates select="@*|node()" />
        </svg>
    </xsl:template>
    <xsl:template match="эллипс">
        <ellipse xsl:use-attribute-sets="ellipse-style">
        </ellipse>
    </xsl:template>
</xsl:stylesheet>
