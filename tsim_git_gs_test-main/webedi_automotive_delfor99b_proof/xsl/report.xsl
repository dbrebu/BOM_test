<?xml version="1.0" encoding="UTF-8"?>
<!--
#
# $Header: /home/businesscontent/actis/bom/global/xsl/schematron/report.xsl,v 1.3 2010-10-28 12:29:28 jte Exp $
#
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:XmlTransform="java:de.axway.converter.xml.xsltextensions.XsltExtensions" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" exclude-result-prefixes="XmlTransform">
	<xsl:output method="text"/>
	<xsl:variable name="indent" select="'          '"/>
	<!-- 
		
	-->
	<xsl:template match="*" mode="edi">
		<xsl:param name="prot"/>
		<!-- Wenn aktuelles Element ein Segment ist, dann Inhalt des Segmentes formatiert rausschreiben -->
		<xsl:if test="@segcnt!=''">
			<xsl:variable name="segmentcounter" select="format-number(@segcnt, '0000')"/>
			<xsl:variable name="content" select="@segvalue"/>
			<xsl:value-of select="concat($newline,$segmentcounter,' ',$content)"/>
		</xsl:if>
		<!-- Wenn das erste Kind vom aktuellen Element ein Segment ist, dann eventuelle Fehlermeldungen
		     zum aktuellen Element nicht rausschreiben. Element ist dann Segmentgruppe und die Fehler zu 
		     dieser Gruppe sollten erst nach dem gruppenoeffnenden Element geschrieben werden -->
		<xsl:if test="not(child::*[1]/@segcnt!='')">
			<xsl:variable name="pfad">
				<xsl:apply-templates select="current()" mode="schematron-get-full-path"/>
			</xsl:variable>
			<xsl:for-each select="$prot//svrl:failed-assert[@location=$pfad]">
				<xsl:value-of select="concat($newline,$indent,svrl:text)"></xsl:value-of>
			</xsl:for-each>
		</xsl:if>
		<!-- Wenn das aktuelle Element ein Segment ist und dazu noch das erste
		     Unterelement seines Elternelements, dann werden die Fehlermeldungen
		     zum Elternelement an die Fehlermeldungen zum aktuellen Element
		     angefuegt. Das aktuelle Element oeffnet dann eine Segmentgruppe. -->
		<xsl:if test="current() = parent::*/child::*[1][@segcnt!='']">
			<xsl:variable name="pfad">
				<xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
			</xsl:variable>
			<xsl:for-each select="$prot//svrl:failed-assert[@location=$pfad]">
				<xsl:value-of select="concat($newline,$indent,svrl:text)"></xsl:value-of>
			</xsl:for-each>
		</xsl:if>
	</xsl:template>
	<!-- 
		
	-->
	<xsl:template match="*" mode="schematron-get-full-path">
		<xsl:apply-templates select="parent::*" mode="schematron-get-full-path"/>
		<xsl:text>/</xsl:text>
		<xsl:choose>
			<xsl:when test="namespace-uri()=''">
				<xsl:value-of select="name()"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:text>*:</xsl:text>
				<xsl:value-of select="local-name()"/>
				<xsl:text>[namespace-uri()='</xsl:text>
				<xsl:value-of select="namespace-uri()"/>
				<xsl:text>']</xsl:text>
			</xsl:otherwise>
		</xsl:choose>
		<xsl:variable name="preceding" select="count(preceding-sibling::*[local-name()=local-name(current()) and namespace-uri() = namespace-uri(current())])"/>
		<xsl:text>[</xsl:text>
		<xsl:value-of select="1+ $preceding"/>
		<xsl:text>]</xsl:text>
	</xsl:template>
</xsl:stylesheet>