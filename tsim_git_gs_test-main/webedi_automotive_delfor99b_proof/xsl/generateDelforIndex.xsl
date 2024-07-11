<?xml version="1.0" encoding="UTF-8"?>
<!--
#
# $Header: /home/businesscontent/actis/bom/workspace/product_TFXSLT/webedi/automotive/delfor/webedi_automotive_delfor99b_proof/xsl/generateDelforIndex.xsl,v 1.3 2014-06-27 10:12:37 hs Exp $
#
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:XmlTransform="java:de.axway.converter.xml.xsltextensions.XsltExtensions">
	<xsl:output method="text"/>
	<!-- 
		
	-->
	<xsl:template match="/M_DELFOR_D99B">
	  <xsl:variable name="newLine" select="'&#xa;'"/>
	  <xsl:text>DATETIME=</xsl:text>
	  <xsl:value-of select="concat(S_UNB/C_S004/D_0017, S_UNB/C_S004/D_0019, $newLine)"/>

	  <xsl:text>MESSAGE_NUMBER=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/S_BGM/C_C106/D_1004, $newLine)"/>

	  <xsl:text>SUPPLIER_NUMBER=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG2/S_NAD[D_3035 = 'SU']/C_C082/D_3039, $newLine)"/>

	  <xsl:text>CARRIER_NO=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG2/S_NAD[D_3035 = 'CA']/C_C082/D_3039, $newLine)"/>

	  <xsl:text>CARRIER_NAME=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG2/S_NAD[D_3035 = 'CA']/C_C080/D_3036, $newLine)"/>

	  <xsl:text>CARRIER_STREET_NO=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG2/S_NAD[D_3035 = 'CA']/C_C059/D_3042, $newLine)"/>

	  <xsl:text>CARRIER_CITY=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG2/S_NAD[D_3035 = 'CA']/D_3164, $newLine)"/>

	  <xsl:text>CARRIER_ZIP=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG2/S_NAD[D_3035 = 'CA']/D_3251, $newLine)"/>

	  <xsl:text>CARRIER_COUNTRY=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG2/S_NAD[D_3035 = 'CA']/D_3207, $newLine)"/>

	  <xsl:text>PLANT_NUMBER=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG7/S_NAD[D_3035 = 'CN']/C_C082/D_3039, $newLine)"/>

	  <xsl:text>ORG_CODE=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG7/S_NAD[D_3035 = 'CN']/C_C058/D_3124[1], $newLine)"/>

	  <xsl:text>NAME_OF_ORG=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG7/S_NAD[D_3035 = 'CN']/C_C058/D_3124[2], $newLine)"/>

	  <xsl:text>NAME_OF_PLANT=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG7/S_NAD[D_3035 = 'CN']/C_C080/D_3036[1], $newLine)"/>

	  <xsl:text>UNLOADING_POINT=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG7[S_NAD/D_3035 = 'CN']/S_LOC[D_3227 = '11']/C_C517/D_3225, $newLine)"/>

	  <xsl:text>ITEM_NUMBER=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG12/S_LIN/C_C212/D_7140, $newLine)"/>

	  <xsl:text>ITEM_NUMBER_DESC=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG12/S_IMD[D_7077 = 'F']/C_C273/D_7008[1], $newLine)"/>

	  <xsl:text>ORDER_NUMBER=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG12/G_SG13/S_RFF/C_C506[D_1153 = 'ON']/D_1154, $newLine)"/>

	  <xsl:text>ORDER_POS=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG12/G_SG13/S_RFF/C_C506[D_1153 = 'ON']/D_1156, $newLine)"/>

	  <xsl:text>QUANTITY_UNIT=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG12/G_SG17[G_SG18/S_QTY/C_C186/D_6063 = '113'][1]/G_SG18/S_QTY[C_C186/D_6063 = '113']/C_C186/D_6411, $newLine)"/>

	  <xsl:text>PACKAGE_NUMBER_1=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG12/G_SG20/S_PAC[C_C531/D_7075 = '1']/C_C202/D_7064, $newLine)"/>

	  <xsl:text>PACKAGE_NUMBER_2=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG12/G_SG20/S_PAC[C_C531/D_7075 = '2']/C_C202/D_7064, $newLine)"/>

	  <xsl:text>PACKAGE_NUMBER_3=</xsl:text>
	  <xsl:value-of select="concat(G_SG0/G_SG6/G_SG12/G_SG20/S_PAC[C_C531/D_7075 = '3']/C_C202/D_7064, $newLine)"/>

	</xsl:template>
</xsl:stylesheet>
