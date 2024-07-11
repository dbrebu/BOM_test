<?xml version="1.0" encoding="UTF-8"?>
<!--
#
# $Header: /home/businesscontent/actis/bom/global/xsl/schematron/errorhandling.xsl,v 1.14 2014-01-29 15:55:43 hs Exp $
#
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:XmlTransform="java:de.axway.converter.xml.xsltextensions.XsltExtensions" exclude-result-prefixes="XmlTransform" xmlns:iso="http://purl.oclc.org/dsdl/schematron">
	<xsl:output method="xml" version="1.0" encoding="UTF-8"/>
	<!-- Sprache der Fehlermeldungen einlesen -->
	<xsl:param name="LANGUAGE"/>
	<xsl:variable name="lang">
	  <xsl:choose>
		<xsl:when test="$LANGUAGE != ''">
		  <xsl:choose>
			<xsl:when test="document('../xml/errors.xml')/errors/Message[@ErrorClass='Language']/message[@lang=upper-case($LANGUAGE)] != ''">
			  <xsl:value-of select="upper-case($LANGUAGE)"/>
			</xsl:when>
			<xsl:otherwise>
			  <xsl:value-of select="'EN'"/>
			</xsl:otherwise>
		  </xsl:choose>
		</xsl:when>
		<xsl:otherwise>
		  <xsl:value-of select="'EN'"/>
		</xsl:otherwise>
	  </xsl:choose>
	</xsl:variable>
	<!--  
	
	-->
	<xsl:include href="../xsl/generalFunctions.xsl"/>

	<iso:pattern id="Structure">
		<iso:rule context="STRUCT_ERROR">
			<iso:assert test="not(POSITION)">
				<xsl:value-of select="document('../xml/errors.xml')/errors/Error[@ErrorClass='STR']/message[@lang=$lang]"/>
			</iso:assert>
		</iso:rule>
	</iso:pattern>
	<!--  
	
	-->
	<iso:pattern id="check">
		<iso:rule context="/">
			<xsl:call-template name="check">
				<xsl:with-param name="lang" select="$lang"/>
			</xsl:call-template>
		</iso:rule>
	</iso:pattern>
	<!--  
	
	-->
	<iso:pattern name="write-input-to-output" id="write-input-to-output">
		<iso:rule context="/">
			<xsl:call-template name="write-input-to-output"/>
		</iso:rule>
	</iso:pattern>
	<!--  
	
	-->
	<xsl:template name="write-input-to-output">
		<write-input-to-output>
			<xsl:copy-of select="."/>
		</write-input-to-output>
	</xsl:template>
	<!--  
	
	-->
	<xsl:template name="check">
		<xsl:param name="lang"/>
		<xsl:choose>
			<xsl:when test="$lang=('DE','EN')">
				<xsl:message>
					<xsl:value-of select="concat(document('../xml/errors.xml')/errors/Message[@ErrorClass='UsedLanguage']/message[@lang='DE'],': ',$lang)"/>
				</xsl:message>
			</xsl:when>
			<xsl:otherwise>
				<xsl:message terminate="yes">
					<xsl:value-of select="concat(document('../xml/errors.xml')/errors/Message[@ErrorClass='Language']/message[@lang='DE'],': ',$lang)"/>
				</xsl:message>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!--  
	
	-->
	<xsl:template name="errormessage">
		<xsl:param name="ErrorClass"/>
		<xsl:param name="ObjectName"/>
		<xsl:param name="ObjectValue"/>
		<xsl:choose>
			<xsl:when test="document('../xml/errors.xml')/errors/Error[@ErrorClass=$ErrorClass]/message[@lang=$lang]">
				<xsl:value-of select="concat(document('../xml/errors.xml')/errors/Error[@ErrorClass='0']/message[@lang=$lang], ' ')"/>
				<xsl:value-of select="$ObjectName"/>
				<xsl:value-of select="': '"/>
				<xsl:value-of select="document('../xml/errors.xml')/errors/Error[@ErrorClass=$ErrorClass]/message[@lang=$lang]"/>
				<xsl:if test="$ErrorClass = ('ONC', 'OL', 'Undef')">
					<xsl:value-of select="concat(' &quot;',
											   $ObjectValue,
											   '&quot;')"/>
				</xsl:if>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat($ObjectName, ' ')"/>
				<xsl:if test="$ErrorClass = 'ONC'">
					<xsl:value-of select="concat('= ',
 											   $ObjectValue,
											   '. ')"/>
				</xsl:if>
				<xsl:value-of select="document('../xml/errors.xml')/errors/Error[@ErrorClass='Undef']/message[@lang=$lang]"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<!-- 
	
	-->
	<iso:pattern abstract="true" id="scannerError">
		<!-- 
		Dieser abstract pattern beinhaltet die asserts fuer Fehlermeldungen aus dem
		Scanner (TFX). Pro Fehlercode kann hier ein assert definiert werden mit 
		der entsprechenden Fehlermeldung.
		Aufruf im Schematron dann wie folgt:
		<iso:pattern is-a="scannerError" id="idPattern">
			<iso:param name="object" value="XPATH"/>
		</iso:pattern>		
		-->
		<iso:rule context="$object">
			<iso:assert test="not(@ERRORCODE = ('41172', '41173', '41174', '41175', '41176', '41177')) or not(@ERRORCODE)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'OL'"/>
					<xsl:with-param name="ObjectName" select="name(.)"/>
					<xsl:with-param name="ObjectValue" select="."/>
				</xsl:call-template>
			</iso:assert>
			<!-- weitere asserts -->
		</iso:rule>
	</iso:pattern>

	<iso:pattern id="validateDate">
	  <iso:rule context="//S_DTM/C_C507[not(../../S_RFF/C_C506[D_1153 = 'AAU']/D_1154 = (' ', '0'))]">
		<xsl:variable name="isValid">
		  <xsl:choose>
			<xsl:when test="not(D_2379)">
			  <xsl:value-of select="'valid'"/>
			</xsl:when>
			<xsl:otherwise>
			  <xsl:call-template name="validateDate">
				<xsl:with-param name="Date" select="D_2380"/>
				<xsl:with-param name="DateFormat" select="D_2379"/>
			  </xsl:call-template>
			</xsl:otherwise>
		  </xsl:choose>
		</xsl:variable>

		<iso:assert test="$isValid = ('valid', 'not decidable') or not(D_2380)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'DTM_2380'"/>
					<xsl:with-param name="ObjectValue" select="D_2380"/>
				</xsl:call-template>
		</iso:assert>
	  </iso:rule>
	</iso:pattern>
</xsl:stylesheet>
