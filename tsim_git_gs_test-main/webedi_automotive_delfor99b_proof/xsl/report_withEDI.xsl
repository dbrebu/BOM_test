<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:XmlTransform="java:de.axway.converter.xml.xsltextensions.XsltExtensions" xmlns:svrl="http://purl.oclc.org/dsdl/svrl" exclude-result-prefixes="XmlTransform">
	<xsl:import href="report.xsl"/>
	<xsl:variable name="newline" select="'&#xa;'"/>
	<xsl:variable name="tab" select="'&#x9;'"/>
	<xsl:param name="resultfile" select="'noFile'"/>
	<xsl:param name="reportfile" select="'noFile'"/>
	<xsl:variable name="resultfile_url">
		<xsl:choose>
			<xsl:when test="$resultfile!='noFile' and starts-with($resultfile,'file://')">
				<xsl:value-of select="$resultfile"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('file:///',$resultfile)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="reportfile_url">
		<xsl:choose>
			<xsl:when test="$reportfile!='noFile' and starts-with($reportfile,'file://')">
				<xsl:value-of select="$reportfile"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:value-of select="concat('file:///',$reportfile)"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:variable>
	<xsl:variable name="checkResult" select="'File contains errors','No errors or warnings found'"/>
	<!-- 
	
	-->
	<xsl:template match="/">
		<!-- Auflesen aller relvanten Informationen -->
		<xsl:variable name="transmissionnumber" select="//svrl:text[starts-with(.,'TRANSMISSION NUMBER: ')]"/>
		<xsl:variable name="messagenumber" select="//svrl:text[starts-with(.,'MESSAGE NUMBER: ')]"/>
		<xsl:variable name="rule" select="concat('--------------------------------------------------------------',$newline)"/>
		<xsl:variable name="title" select="concat($newline,'REPORT: ',//svrl:schematron-output/@title,$newline)"/>
		<xsl:variable name="header" select="concat($transmissionnumber,$newline,$messagenumber,$newline)"/>
		<xsl:variable name="error">
			<xsl:for-each select="//svrl:failed-assert">
				<xsl:if test="name(preceding-sibling::*[1]) = 'svrl:active-pattern'">
					<xsl:value-of select="concat(preceding-sibling::*[1]/@name,$newline)"/>
				</xsl:if>
				<xsl:text>- </xsl:text>
				<xsl:value-of select="concat(svrl:text,$newline,$tab,@location)"/>
				<xsl:value-of select="$newline"/>
			</xsl:for-each>
		</xsl:variable>
		<xsl:variable name="prot">
			<!-- Fehlerprotokoll lesbar aufbereiten -->
			<xsl:value-of select="$title"/>
			<xsl:value-of select="$rule"/>
		</xsl:variable>
		<!-- 
		
		-->
		<!-- Fehler in eine lesbar aufbereitete EDI-Nachricht schreiben -->
		<xsl:variable name="ediMessage">
			<xsl:copy-of select="//write-input-to-output/*"/>
		</xsl:variable>
		<xsl:variable name="edi">
			<xsl:apply-templates select="$ediMessage//*" mode="edi">
				<xsl:with-param name="prot">
					<xsl:copy-of select="."/>
				</xsl:with-param>
			</xsl:apply-templates>
		</xsl:variable>
		<!-- 
		
		-->
		<!-- Protokoll in eine Datei schreiben -->
		<xsl:if test="$reportfile!='noFile'">
			<xsl:result-document href="{$reportfile_url}" method="text">
				<xsl:value-of select="$prot"/>
			</xsl:result-document>
		</xsl:if>
		<!-- 
		
		-->
		<!-- Handhabung der eventuell möglichen Zustände -->
		<xsl:choose>
			<!-- ERROR = MELDUNG + ABBRUCH -->
			<xsl:when test="//svrl:failed-assert">
				<!-- Der erste gefundene Fehler wird in das resultfile reportiert sofern das angegeben wurde -->
				<xsl:variable name="errorcode" select="substring-before(//svrl:failed-assert[1]/svrl:text,':')"/>
				<xsl:variable name="errormessage" select="substring-after(//svrl:failed-assert[1]/svrl:text,': ')"/>
				<xsl:if test="$reportfile!='noFile'">
					<xsl:value-of select="XmlTransform:EI_MKPAR(string($resultfile), string('ERRORCODE'),$errorcode)"/>
					<xsl:value-of select="XmlTransform:EI_MKPAR(string($resultfile), string('ERRORMESSAGE'),$errormessage)"/>
				</xsl:if>
				<!-- Ausgabe des Fehlerprotokolls in das protfile -->
				<xsl:message select="concat('File contains ', count(//svrl:failed-assert), ' error(s)',$prot,$edi, $newline, $newline, 'File contains ', count(//svrl:failed-assert), ' error(s)')"/>
				<!-- Protokoll und EDI-Nachricht in die Ausgabe schreiben -->
				<xsl:value-of select="concat('File contains ', count(//svrl:failed-assert), ' error(s)')"/>
				<xsl:value-of select="$prot"/>
				<xsl:value-of select="$edi"/>
			</xsl:when>
			<xsl:otherwise>
				<!-- Keine Fehler gefunden -->
				<!-- Ausgabe des Fehlerprotokolls in das protfile -->
				<xsl:message select="$checkResult[2]"/>
			</xsl:otherwise>
		</xsl:choose>
		<!-- 
		
		-->
	</xsl:template>
</xsl:stylesheet>
