<?xml version="1.0" encoding="UTF-8"?>
<!-- Header:$Id: functions.xsl,v 1.2 2009-09-09 13:06:23 hs Exp $ -->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:XmlTransform="java:de.axway.converter.xml.xsltextensions.XsltExtensions">

  <xsl:key name="EDL44_EXIDV"
		   match="*[name() = 'E1EDL44' or name() = 'E1EDT43']"
		   use="EXIDV"/>
  <xsl:key name="EDL37_EXIDV"
		   match="*[name() = 'E1EDL37' or name() = 'E1EDT37']"
		   use="EXIDV"/> 

  <xsl:template name="Replace">
	<xsl:param name="Element"/>
	<xsl:param name="Value"/>
	<xsl:variable name="Replacement">
	  <xsl:call-template name="TAB">
		<xsl:with-param name="Element" select="$Element"/>
		<xsl:with-param name="Value" select="$Value"/>
		<xsl:with-param name="ReplaceTab" select="'../../tftab/tftab.xml'"/>
	  </xsl:call-template>
	</xsl:variable>
	<xsl:value-of select="$Replacement"/>  
  </xsl:template>

  <xsl:template name="TAB">
	<xsl:param name="Element"/>
	<xsl:param name="Value"/>
	<xsl:param name="ReplaceTab"/>
	<xsl:variable name="Replacement"
				  select="document($ReplaceTab)/Codes/*[local-name(.)=$Element]
				                                       [@Value=$Value]"/>
	<xsl:choose>
	  <xsl:when test="$Replacement!=''">
		<xsl:value-of select="$Replacement"/>
	  </xsl:when>
	  <xsl:otherwise>
		<xsl:value-of select="$Value"/>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>

  <!-- ################### -->
  <!--   getOuterPackage   -->
  <!-- ################### -->

  <!-- finds out the outer package number to 
	   the package with $PackageNumber as package number -->
  <xsl:template name="getOuterPackage">
	<xsl:param name="PackageNumber"/>
	<xsl:param name="Counter" select="0"/>

	<xsl:choose>
	  <xsl:when test="key('EDL44_EXIDV', $PackageNumber)">
		<!-- only the one matching EDL44/EDT43 is selected -->
		<xsl:for-each select="key('EDL44_EXIDV', $PackageNumber)"> 
		  <xsl:call-template name="getOuterPackage">
			<xsl:with-param name="PackageNumber" select="../EXIDV"/>
			<xsl:with-param name="Counter" select="$Counter + 1"/>
		  </xsl:call-template>
		</xsl:for-each>
	  </xsl:when>

	  <xsl:otherwise>
		<!-- assignment to the variable around getOuterPackage  -->
		<xsl:choose>
		  <xsl:when test="$Counter = 0">
			<xsl:for-each select="key('EDL37_EXIDV', $PackageNumber)">
			  <xsl:choose>
				<xsl:when test="E1EDL44/VELIN = '1'">freeSingle</xsl:when>
				<xsl:when test="E1EDT43/VELIN = '1'">freeSingle</xsl:when>
				<xsl:otherwise>Outer</xsl:otherwise>
			  </xsl:choose>
			</xsl:for-each>
		  </xsl:when>

		  <xsl:otherwise>
			<xsl:value-of select="$PackageNumber"/>
		  </xsl:otherwise>
		</xsl:choose>
	  </xsl:otherwise>
	</xsl:choose>
  </xsl:template>

</xsl:stylesheet>
