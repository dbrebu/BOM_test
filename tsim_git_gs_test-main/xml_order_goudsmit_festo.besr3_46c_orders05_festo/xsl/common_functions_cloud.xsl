<?xml version="1.0" encoding="UTF-8"?>
<!--
# $Header: /home/cvs/actis/bom/workspace/individ/festo_tmp/xml_order_goudsmit_festo.besr3_46c_orders05_festo/xsl/common_functions_cloud.xsl,v 1.1 2015/07/12 20:46:07 sse Exp $
# $Log: common_functions_cloud.xsl,v $
# Revision 1.1  2015/07/12 20:46:07  sse
# update
#
#mk#trygit please. it is awesome
-->
<xsl:stylesheet version="2.0" 
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
				xmlns:axw = "own_functions" 
				xmlns:XmlTransform="java:de.axway.converter.xml.xsltextensions.XsltExtensions" 
				exclude-result-prefixes="XmlTransform">

	<xsl:output method="xml" indent="yes" encoding="UTF-8"/>

<!-- 
	<xsl:param name="ACTISEDI" select="''"/>
	<xsl:param name="PPATH" select="''"/>
	<xsl:variable name="systemdate" select="XmlTransform:getDate('yyyyMMdd')"/>
	<xsl:variable name="systemtime" select="XmlTransform:getDate('HHmmss')"/>
-->


	<!-- MAIN -->
	<xsl:template match="own_functions">
		<xsl:value-of select=" '' "/>
	</xsl:template>

	<xsl:function name="axw:getProperty">
		<xsl:param name="customer_code"/>
		<xsl:param name="search_string"/>
		<xsl:param name="tftab_table"/>
		<xsl:param name="tftab_dir"/>
		<xsl:param name="tftab_extension"/>
		
		<xsl:variable name="found_string">
			<xsl:value-of select="XmlTransform:getProperty(concat($tftab_dir,'/',$tftab_table, $tftab_extension), string($search_string))"/>
		</xsl:variable>
		
		<xsl:choose>
			<xsl:when test="$found_string != '' ">
<!--				<xsl:message select=" 'Wert:',string($search_string),'ersetzt mit Wert: ',$found_string "/>-->
				<xsl:value-of select="$found_string"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message select=" '' "/>
				<xsl:message select=" 'Wert:',string($search_string),'nicht gefunden' "/>
				<xsl:message select=" 'Pfad:',concat($tftab_dir,'/')"/>
				<xsl:message select=" 'Ersetzunstabelle:',concat($tftab_table, $tftab_extension)"/>
				<xsl:message select=" '' "/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:function>

</xsl:stylesheet>