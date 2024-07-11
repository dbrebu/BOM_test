<?xml version="1.0" encoding="UTF-8"?>
<!-- Header:$Id: generalFunctions.xsl,v 1.8 2013-08-01 10:44:23 hs Exp $ -->
<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
				xmlns:XmlTransform="java:de.axway.converter.xml.xsltextensions.XsltExtensions">

  <xsl:variable name="DateFormats">
    <Formats>
      <Format DateFormat="102">yyyyMMdd</Format>
      <Format DateFormat="203">yyyyMMddHHmm</Format>
      <Format DateFormat="715">yywwyyww</Format>
      <Format DateFormat="717">yyMMddyyMMdd</Format>
      <Format DateFormat="204">yyyyMMddHHmmss</Format>
    </Formats>
  </xsl:variable>

  <xsl:template name="validateDate">
    <xsl:param name="Date"/>
    <xsl:param name="DateFormat"/>
    <xsl:variable name="Pattern" select="$DateFormats/Formats/Format[@DateFormat = $DateFormat]"/>
    <xsl:choose>
      <xsl:when test="$Pattern != ''">
        <xsl:choose>
          <xsl:when test="XmlTransform:isValidDate(D_2380, $Pattern, 'de', 'de') = 'true'">
            <xsl:value-of select="'valid'"/>
          </xsl:when>
          <xsl:otherwise>
            <xsl:choose>
              <xsl:when test="$DateFormat = '715'">
                <xsl:if test="$Date = ('13011301', '14011401')">
                  <xsl:value-of select="'valid'"/>
                </xsl:if>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="'not valid'"/>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:when>
      <xsl:otherwise>
        <xsl:value-of select="'not decidable'"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <!-- this template allots the text "Text" in a Length
	   of Textlength to so much as needed Tags with name="TagName" -->
  <xsl:template name="allotFreeText">
    <xsl:param name="Text"/>
    <xsl:param name="TagName"/>
    <xsl:param name="TextLength"/>

    <xsl:element name="{$TagName}">
      <xsl:value-of select="substring($Text, 1, $TextLength)"/>
    </xsl:element>

    <xsl:variable name="remaindingText" select="substring($Text, $TextLength + 1)"/>
    <xsl:if test="$remaindingText != ''">
      <xsl:call-template name="allotFreeText">
        <xsl:with-param name="Text" select="$remaindingText"/>
        <xsl:with-param name="TagName" select="$TagName"/>
        <xsl:with-param name="TextLength" select="$TextLength"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
</xsl:stylesheet>