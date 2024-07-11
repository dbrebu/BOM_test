<?xml version="1.0" encoding="UTF-8"?>
<iso:schema xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:saxon="http://saxon.sf.net/" defaultPhase="Struktur" xmlns:XmlTransform="java:de.actis.converter.xml.xsltextensions.XsltExtensions" queryBinding="xslt2">
<!-- iso:schema xmlns="http://www.ascc.net/xml/schematron" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:iso="http://purl.oclc.org/dsdl/schematron" xmlns:saxon="http://saxon.sf.net/" xmlns:XmlTransform="java:de.actis.converter.xml.xsltextensions.XsltExtensions" defaultPhase="Struktur" queryBinding="xslt2"
XmlTransform:isValidDate()
-->
	<iso:include href="../xsl/errorhandling.xsl"/>
	<iso:title>DELFOR OBP</iso:title>
	<iso:let name="QTYCodes" value="('EA', 'MTR', 'MTK', 'MTQ', 'LTR', 'TNE', 'KGM', 'KTM', 'GRM', 'MMT', 'SET', 'PR', 'DAY', 'HUR')"/>
	<iso:let name="PACCodes" value="('BX', 'CT', 'PC', 'PE', 'CG', 'CS', 'CN', 'EN', 'PK', 'DR', 'BA', 'BG', 'CR', 'SW', 'RL', 'TU', 'NE')"/>
	<!-- 
	
	-->
	<iso:phase id="Struktur">
		<iso:active pattern="Structure"/>
		<iso:active pattern="write-input-to-output"/>
		<iso:active pattern="HeadAndFoot"/>
		<iso:active pattern="NameAndAddressExist"/>
		<iso:active pattern="NameAndAddressContent"/>
		<iso:active pattern="S_GIS"/>
		<iso:active pattern="S_LIN"/>
		<iso:active pattern="S_PIA"/>
		<iso:active pattern="S_IMD"/>
		<iso:active pattern="S_MEA"/>
		<iso:active pattern="S_ALI"/>
		<iso:active pattern="S_FTX"/>
		<iso:active pattern="S_DTM"/>
		<iso:active pattern="S_RFF"/>
		<iso:active pattern="S_QTY"/>
		<iso:active pattern="S_SCC"/>
		<iso:active pattern="S_PAC"/>
		<iso:active pattern="validateDate"/>
		<iso:active pattern="LengthError"/>
	</iso:phase>

	<iso:pattern is-a="scannerError" id="LengthError">
	  <iso:param name="object" value="*"/>
	</iso:pattern>		


	<iso:pattern name="abstractRules" id="abstractRules">
	  <iso:rule id="S_DTM_Proof" abstract="true">
			<iso:assert test="D_2380 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'DTM_2380'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_2379 = '102'">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'DTM_2379'"/>
					<xsl:with-param name="ObjectValue" select="D_2379"/>
				</xsl:call-template>
			</iso:assert>
	  </iso:rule>

	  <iso:rule id="S_QTY_Proof" abstract="true">		
			<iso:assert test="D_6060 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'QTY_6060'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="string-length(D_6060) &lt; 20">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'OL'"/>
					<xsl:with-param name="ObjectName" select="'QTY_6060'"/>
					<xsl:with-param name="ObjectValue" select="D_6060"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_6411 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'QTY_6411'"/>
				</xsl:call-template>
			</iso:assert>
	  </iso:rule>

	  <iso:rule id="S_QTY_REPmore" abstract="true">		
		<iso:assert test="not(.)">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'REPmore'"/>
			<xsl:with-param name="ObjectName" select="concat('QTY_', current()/S_QTY/C_C186/D_6063)"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule id="S_SCC_REPmore" abstract="true">		
		<iso:assert test="not(.)">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'REPmore'"/>
			<xsl:with-param name="ObjectName" select="concat('SCC_', current()/S_SCC/D_4017)"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule id="S_RFF_Proof" abstract="true">		
		<iso:assert test="D_1154 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'RFF_1154'"/>
		  </xsl:call-template>
		</iso:assert>		
	  </iso:rule>

	  <iso:rule id="NameAndAdress" abstract="true">
		<iso:assert test="C_C082/D_3039 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'NAD_3039'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="C_C082/D_3055 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'NAD_3055'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="C_C080[D_3036 != '']">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'NAD_3036'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="C_C059[D_3042 != '']">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'NAD_3042'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="D_3164 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'NAD_3164'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="D_3251 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'NAD_3251'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>
	</iso:pattern>

	<iso:pattern name="HeadAndFoot" id="HeadAndFoot">
		<iso:rule context="S_UNB">
			<iso:assert test="C_S001/D_0001 = 'UNOC'">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0001'"/>
					<xsl:with-param name="ObjectValue" select="C_S001/D_0001"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="C_S001/D_0002 = '3'">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0002'"/>
					<xsl:with-param name="ObjectValue" select="C_S001/D_0002"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="C_S002/D_0004 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0004'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="C_S003/D_0010 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0010'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="C_S004/D_0017 != '' and C_S004/D_0019 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0017'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="(string-length(C_S004/D_0017) = 6) and (string(number(C_S004/D_0017)) != 'NaN')">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0017'"/>
					<xsl:with-param name="ObjectValue" select="C_S004/D_0017"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="(string-length(C_S004/D_0019) = 4) and (string(number(C_S004/D_0019)) != 'NaN')">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0019'"/>
					<xsl:with-param name="ObjectValue" select="C_S004/D_0019"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_0020 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0020'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0[2]">
			<iso:assert test="not(.)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'REPmore'"/>
					<xsl:with-param name="ObjectName" select="'UNH'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>
		<iso:rule context="G_SG0/S_FTX[D_4451 = 'ADU']
									[position() &gt; 1]">
			<iso:assert test="not(.)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'REPmore'"/>
					<xsl:with-param name="ObjectName" select="'FTX_ADU'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/S_UNH">
			<iso:assert test="D_0062 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'UNH_0062'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_0062 = ../S_UNT/D_0062 or D_0062 = '' or not(D_0062)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNH_0062'"/>
					<xsl:with-param name="ObjectValue" select="D_0062"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/S_UNT">
			<iso:assert test="D_0074 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'UNH_0074'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_0074 = count(..//*[@segcnt])">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'D_0074'"/>
					<xsl:with-param name="ObjectValue" select="D_0074"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/S_UNH/C_S009">
			<iso:assert test="D_0065 = 'DELFOR'">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNH_0065'"/>
					<xsl:with-param name="ObjectValue" select="D_0065"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_0052 = 'D'">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNH_0052'"/>
					<xsl:with-param name="ObjectValue" select="D_0052"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_0054 = '99B'">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNH_0054'"/>
					<xsl:with-param name="ObjectValue" select="D_0054"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_0051 = 'UN'">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNH_0051'"/>
					<xsl:with-param name="ObjectValue" select="D_0051"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/S_BGM">
			<iso:assert test="C_C002/D_1001 = '241'">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'BGM_1001'"/>
					<xsl:with-param name="ObjectValue" select="C_C002/D_1001"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="C_C106/D_1004 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'BGM_1004'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="//S_FTX/C_C108/D_4440">
			<iso:assert test="string-length(.) &lt; 71">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'OL'"/>
					<xsl:with-param name="ObjectName" select="'FTX_4440'"/>
					<xsl:with-param name="ObjectValue" select="."/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="S_UNZ">
			<iso:assert test="D_0036 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0036'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_0036 = count(../G_SG0)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0036'"/>
					<xsl:with-param name="ObjectValue" select="D_0036"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_0020 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0020'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_0020 = ../S_UNB/D_0020">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'UNB_0020'"/>
					<xsl:with-param name="ObjectValue" select="D_0020"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="NameAndAddressContent" id="NameAndAddressContent">
	  <iso:let name="Qualifier" value="('SU', 'BY', 'IV', 'CA')"/>

		<iso:rule context="G_SG0/G_SG2[(S_NAD/D_3035=$Qualifier) and
				                       S_NAD/D_3035 = current()/S_NAD/D_3035]
									  [position() &gt; 1]">
			<iso:assert test="not(.)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'REPmore'"/>
					<xsl:with-param name="ObjectName" select="concat('NAD_', current()/S_NAD/D_3035)"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG2/S_NAD[D_3035 = $Qualifier]">
		  <iso:extends rule="NameAndAdress"/>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG6/G_SG7/S_NAD[D_3035 = 'CN']">
		  <iso:extends rule="NameAndAdress"/>
		  <iso:assert test="C_C058/D_3124[1] != ''">
			<xsl:call-template name="errormessage">
			  <xsl:with-param name="ErrorClass" select="'ONA'"/>
			  <xsl:with-param name="ObjectName" select="'NAD_3124[1]'"/>
			</xsl:call-template>
		  </iso:assert>
		  <iso:assert test="C_C058/D_3124[2] != ''">
			<xsl:call-template name="errormessage">
			  <xsl:with-param name="ErrorClass" select="'ONA'"/>
			  <xsl:with-param name="ObjectName" select="'NAD_3124[2]'"/>
			</xsl:call-template>
		  </iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG2[S_NAD/D_3035=('BY', 'IV')]
				                    /G_SG4[S_CTA/D_3139 = ('DL', 'PD') and
                                           D_3139 = current()/S_CTA/D_3139]
				                          [position() &gt; 1]">
			<iso:assert test="not(.)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'REPmore'"/>
					<xsl:with-param name="ObjectName" select="concat('CTA_', current()/S_CTA/D_3139)"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG2[S_NAD/D_3035=('BY', 'IV')]
				                    /G_SG4[S_CTA/D_3139 = 'DL']/S_COM[C_C076/D_3155 = ('TE', 'FX', 'EM') and 
                                                 C_C076/D_3155 = current()/C_C076/D_3155]
				                          [position() &gt; 1]">
			<iso:assert test="not(.)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'REPmore'"/>
					<xsl:with-param name="ObjectName" select="concat('COM_', current()/C_C076/D_3155)"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG2[S_NAD/D_3035=('BY', 'IV')]
				                    /G_SG4[S_CTA/D_3139 = 'DL']/S_COM[C_C076/D_3155 = ('TE', 'FX', 'EM')]">
			<iso:assert test="C_C076/D_3148 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'D_3148'"/>
				</xsl:call-template>
			</iso:assert>
		  
		</iso:rule>

		<iso:rule context="G_SG0/G_SG6/G_SG7[S_NAD/D_3035 = 'CN']">
		  <iso:assert test="S_LOC[D_3227 = '11']">
			<xsl:call-template name="errormessage">
			  <xsl:with-param name="ErrorClass" select="'ONA'"/>
			  <xsl:with-param name="ObjectName" select="'LOC_11'"/>
			</xsl:call-template>
		  </iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG6/G_SG7[S_NAD/D_3035 = 'CN']/S_LOC[D_3227 = ('11', '18', '159')]">
		  <iso:assert test="C_C517/D_3225 != ''">
			<xsl:call-template name="errormessage">
			  <xsl:with-param name="ErrorClass" select="'ONA'"/>
			  <xsl:with-param name="ObjectName" select="'NAD_3225'"/>
			</xsl:call-template>
		  </iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="NameAndAddressExist" id="NameAndAddressExist">
		<iso:rule context="G_SG0">
			<iso:assert test="G_SG2[S_NAD/D_3035='SU']">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'NAD_SU'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="G_SG2[S_NAD/D_3035='BY']">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'NAD_BY'"/>
				</xsl:call-template>
			</iso:assert>
	  </iso:rule>
	  <iso:rule context="G_SG0/G_SG6">
			<iso:assert test="G_SG7[S_NAD/D_3035='CN']">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'NAD_CN'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="S_GIS" id="S_GIS">
		<iso:rule context="G_SG0">
			<iso:assert test="G_SG6">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'GIS'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG6[position() &gt; 1]">
			<iso:assert test="not(.)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'REPmore'"/>
					<xsl:with-param name="ObjectName" select="'GIS'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG6/S_GIS">
			<iso:assert test ="C_C529/D_7365 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'GIS_7365'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="S_LIN" id="S_LIN">
		<iso:rule context="G_SG0/G_SG6/G_SG12[position() &gt; 1]">
			<iso:assert test="not(.)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'REPmore'"/>
					<xsl:with-param name="ObjectName" select="'LIN'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/S_LIN">
			<iso:assert test="D_1082 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'LIN_1082'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="D_1229 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'LIN_1229'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="C_C212/D_7140 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'LIN_7140'"/>
				</xsl:call-template>
			</iso:assert>
			<iso:assert test="C_C212/D_7143 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'LIN_7143'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>
	  
		<iso:rule context="G_SG0/G_SG6/G_SG12/S_LIN/D_1229">
			<iso:assert test=". = ('9', '3')">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONC'"/>
					<xsl:with-param name="ObjectName" select="'LIN_1229'"/>
					<xsl:with-param name="ObjectValue" select="."/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG6/G_SG12/S_LIN/C_C212/D_7143">
		  <iso:assert test=". = 'IN'">
			<xsl:call-template name="errormessage">
			  <xsl:with-param name="ErrorClass" select="'ONC'"/>
			  <xsl:with-param name="ObjectName" select="'LIN_7143'"/>
			  <xsl:with-param name="ObjectValue" select="."/>
			</xsl:call-template>
		  </iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="S_PIA" id="S_PIA">
		<iso:rule context="G_SG0/G_SG6/G_SG12/S_PIA[D_4347 = '1']/C_C212[D_7143 = ('EC', 'SA')]">
			<iso:assert test="D_7140 != ''">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'PIA_7140'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>
	</iso:pattern>

	<iso:pattern name="S_IMD" id="S_IMD">
	  <iso:rule context="G_SG0/G_SG6/G_SG12">
		<iso:assert test="S_IMD/D_7077 = 'F'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'IMD_F'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/S_IMD[D_7077 = 'F'][position() &gt; 1]">
		<iso:assert test="not(.)">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'REPmore'"/>
			<xsl:with-param name="ObjectName" select="'IMD_F'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/S_IMD[D_7077 = 'F']">
		<iso:assert test="C_C273/D_7008 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'IMD_7008'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>
	</iso:pattern>

	<iso:pattern name="S_MEA" id="S_MEA">
	  <iso:rule context="G_SG0/G_SG6/G_SG12/S_MEA[D_6311 = 'AAX' and C_C502/D_6313 = 'AAF']">
		<iso:assert test="C_C174/D_6411 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'MEA_6411'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="C_C174/D_6314 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'MEA_6314'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="string(number(C_C174/D_6314)) != 'NaN'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONC'"/>
			<xsl:with-param name="ObjectName" select="'MEA_6314'"/>
			<xsl:with-param name="ObjectValue" select="C_C174/D_6314"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG20[S_PAC/C_C531/D_7075 = ('1', '2', '3')]
				                            /S_MEA[D_6311 = 'AAY' and C_C502/D_6313 = 'AAD']
											/C_C174/D_6314">
			<iso:assert test="string-length(.) &lt; 11">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'OL'"/>
					<xsl:with-param name="ObjectName" select="'MEA_6314'"/>
					<xsl:with-param name="ObjectValue" select="."/>
				</xsl:call-template>
			</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG20[S_PAC/C_C531/D_7075 = ('1', '2', '3')]
				                            /S_MEA[D_6311 = 'AAY' and C_C502/D_6313 = 'AAD']
											/C_C174">
		<iso:assert test="D_6411 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'MEA_6411'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>
	</iso:pattern>

	<iso:pattern name="S_ALI" id="S_ALI">
	  <iso:rule context="G_SG0/G_SG6/G_SG12/S_ALI[position() &gt; 1]">
		<iso:assert test="not(.)">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'REPmore'"/>
			<xsl:with-param name="ObjectName" select="ALI"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/S_ALI">
		<iso:assert test="D_4183 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'ALI_4183'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="string-length(D_4183) &lt; 2">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'OL'"/>
			<xsl:with-param name="ObjectName" select="'ALI_4183'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>
	</iso:pattern>

	<iso:pattern name="S_FTX" id="S_FTX">
	  <iso:rule context="G_SG0/G_SG6/G_SG12/S_FTX[D_4451 = 'AAI']">
		<iso:assert test="C_C108/D_4440 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'FTX_4440'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>
	</iso:pattern>

	<iso:pattern name="S_DTM" id="S_DTM">
		<iso:rule context="G_SG0">
			<iso:assert test="S_DTM[C_C507/D_2005 = '137']">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'ONA'"/>
					<xsl:with-param name="ObjectName" select="'DTM_137'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/S_DTM/C_C507[D_2005 = '137']">
		  <iso:extends rule="S_DTM_Proof"/>
		</iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG13[S_RFF/C_C506/D_1153 = 'AAN']">
		<iso:assert test="S_DTM/C_C507/D_2005 = '137'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'DTM_137'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG13[S_RFF/C_C506/D_1153 = ('AAN', 'AIF')]/S_DTM/C_C507[D_2005 = '137']">
		<iso:extends rule="S_DTM_Proof"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG13/S_RFF[C_C506/D_1153 = 'AIF']">
		<iso:assert test="../S_DTM/C_C507 or C_C506/D_1154 = ' ' or C_C506/D_1154 = '0' or not(C_C506/D_1154)">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'DTM'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15[S_QTY/C_C186/D_6063 ='48']/G_SG16/S_DTM
				         [C_C507/D_2005 = '137' and
						  C_C507/D_2005 = current()/C_C507/D_2005]
						  [position() &gt; 1]">
		<iso:assert test="not(.)">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'REPmore'"/>
			<xsl:with-param name="ObjectName" select="concat('DTM_', current()/C_C507/D_2005)"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15[S_QTY/C_C186/D_6063 ='48']/G_SG16[S_RFF/C_C506/D_1153 = 'AAU']">
		<iso:assert test="S_RFF/C_C506/D_1154 = (' ', '0') or
					      S_DTM/C_C507/D_2005 = '137'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'DTM_137'"/>
		  </xsl:call-template>
		</iso:assert>		
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15[S_QTY/C_C186/D_6063 ='48']/G_SG16[S_RFF/C_C506/D_1153 = 'AAU']/S_DTM/C_C507[D_2005 = '137']">
		<xsl:if test="not(../../S_RFF/C_C506/D_1154 = (' ', '0'))">
		  <iso:extends rule="S_DTM_Proof"/>
		</xsl:if>
	</iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15[S_QTY/C_C186/D_6063 = '70']/S_DTM/C_C507[D_2005 = '51']">
		<iso:extends rule="S_DTM_Proof"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = '1']/G_SG18[S_QTY/C_C186/D_6063 = '113']/S_DTM/C_C507[D_2005 = '64']">
		<iso:extends rule="S_DTM_Proof"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = '1']/G_SG18[S_QTY/C_C186/D_6063 = '113']">
		<iso:assert test="S_DTM/C_C507[D_2005 = '64']">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'DTM_64'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('2', '3')]
				                           /G_SG18[S_QTY/C_C186/D_6063 = '66']
										          [position() &gt; 1]">
		<iso:assert test="S_QTY/C_C186/D_6060 = '' and S_DTM/C_C507/D_2005 = '161'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'REPmore'"/>
			<xsl:with-param name="ObjectName" select="'DTM_161'"/>
		  </xsl:call-template>
		</iso:assert>		
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('2', '3')]
				                           /G_SG18[S_QTY/C_C186/D_6063 = '66']
										   /S_DTM/C_C507[D_2005 = '161']">
		<xsl:if test="S_QTY/C_C186[D_6063 = '66']/D_6060 = (' ', '0')">
		  <iso:extends rule="S_DTM_Proof"/>
		</xsl:if>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = '4']/G_SG18[S_QTY/C_C186/D_6063 = '113']">
		<iso:assert test="S_DTM/C_C507/D_2005 = '76'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'DTM_76'"/>
		  </xsl:call-template>
		</iso:assert>		
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = '4']/G_SG18[S_QTY/C_C186/D_6063 = '113']/S_DTM/C_C507[D_2005 = '76']">
		<iso:assert test="D_2380 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'DTM_2380'"/>
		  </xsl:call-template>
		</iso:assert>

		<iso:assert test="D_2379 = ('715', '717', '102')">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONC'"/>
			<xsl:with-param name="ObjectName" select="'DTM_2379'"/>
			<xsl:with-param name="ObjectValue" select="D_2379"/>
		  </xsl:call-template>
		</iso:assert>		
	  </iso:rule>
	</iso:pattern>

	<iso:pattern name="S_RFF" id="S_RFF">
		<iso:rule context="G_SG0/G_SG2[S_NAD/D_3035=('BY', 'IV')]
				                      /G_SG3[S_RFF/C_C506/D_1153 = 'VA']
				                      [position() &gt; 1]">
			<iso:assert test="not(.)">
				<xsl:call-template name="errormessage">
					<xsl:with-param name="ErrorClass" select="'REPmore'"/>
					<xsl:with-param name="ObjectName" select="'RFF_VA'"/>
				</xsl:call-template>
			</iso:assert>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG2[S_NAD/D_3035=('BY', 'IV')]
				                      /G_SG3/S_RFF/C_C506[D_1153 = 'VA']">
		  <iso:extends rule="S_RFF_Proof"/>
		</iso:rule>

		<iso:rule context="G_SG0/G_SG6/G_SG7[S_NAD/D_3035 = 'CN']/G_SG8/S_RFF/C_C506[D_1153 = 'VA']">
		  <iso:extends rule="S_RFF_Proof"/>
		</iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12">
		<iso:assert test="G_SG13">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'RFF'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="G_SG13/S_RFF/C_C506/D_1153 = 'AAN'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'RFF_AAN'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="G_SG13/S_RFF/C_C506/D_1153 = 'AIF'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'RFF_AIF'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="G_SG13/S_RFF/C_C506/D_1153 = 'ON'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'RFF_ON'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG13[S_RFF/C_C506/D_1153 = ('AAN', 'AIF', 'ON') and
				                                   S_RFF/C_C506/D_1153 = current()/S_RFF/C_C506/D_1153]
												  [position() &gt; 1]">
		<iso:assert test="not(.)">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'REPmore'"/>
			<xsl:with-param name="ObjectName" select="concat('RFF_', current()/S_RFF/C_C506/D_1153)"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG13/S_RFF/C_C506[D_1153 = ('AAN', 'AIF', 'ON')]">
		<iso:extends rule="S_RFF_Proof"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15[S_QTY/C_C186/D_6063 ='48']
				                                  /G_SG16[S_RFF/C_C506/D_1153 = 'AAU']
												         [position() &gt; 1]">
		<iso:assert test="not(.)">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'REPmore'"/>
			<xsl:with-param name="ObjectName" select="'RFF_AAU'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15[S_QTY/C_C186/D_6063 ='48']">
		<xsl:if test="not(G_SG16/S_DTM/C_C507/D_2005 = '137') or G_SG16/S_DTM/C_C507[D_2005 = '137']/D_2380 = ''">
		  <iso:assert test="G_SG16/S_RFF/C_C506/D_1153 = 'AAU'">
			<xsl:call-template name="errormessage">
			  <xsl:with-param name="ErrorClass" select="'ONA'"/>
			  <xsl:with-param name="ObjectName" select="'RFF_AAU'"/>
			</xsl:call-template>
		  </iso:assert>
		</xsl:if>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15[S_QTY/C_C186/D_6063 ='48']
                                                  /G_SG16/S_RFF/C_C506[D_1153 = 'AAU']">
		<iso:extends rule="S_RFF_Proof"/>
	  </iso:rule>
	</iso:pattern>

	<iso:pattern name="S_QTY" id="S_QTY">
	  <iso:rule context="G_SG0/G_SG6/G_SG12">
		<iso:assert test="G_SG15/S_QTY/C_C186/D_6063 = '48'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'QTY_48'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="G_SG15/S_QTY/C_C186/D_6063 ='70'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'QTY_70'"/>
		  </xsl:call-template>
		</iso:assert>
		<iso:assert test="G_SG15/S_QTY/C_C186/D_6063 = '83' or
					      G_SG17">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'QTY_83 or SCC'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15
				[S_QTY/C_C186/D_6063 = ('70', '72', '83') and
				 S_QTY/C_C186/D_6063 = current()/S_QTY/C_C186/D_6063]
				[position() &gt; 1]">
		<iso:extends rule="S_QTY_REPmore"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15
				[S_QTY/C_C186/D_6063 = '48' and
				 S_QTY/C_C186/D_6063 = current()/S_QTY/C_C186/D_6063]
				[position() &gt; 3]">
		<iso:extends rule="S_QTY_REPmore"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG15/S_QTY/C_C186[D_6063 = ('48', '70', '72', '83')]">
		<iso:extends rule="S_QTY_Proof"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('1', '4')]/G_SG18/S_QTY/C_C186[D_6063 = ('113', '3', '260')]">
		<iso:extends rule="S_QTY_Proof"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('1', '4')]">
		<iso:assert test="G_SG18/S_QTY/C_C186/D_6063 = '113'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'QTY_113'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = '4']">
		<iso:assert test="G_SG18/S_QTY/C_C186/D_6063 = '3'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'QTY_3'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('2', '3')]">
		<iso:assert test="G_SG18/S_QTY/C_C186/D_6063 = '66'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'QTY_66'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('1', '4')]
				                                  /G_SG18[S_QTY/C_C186/D_6063 = ('113', '3', '260') and
												          S_QTY/C_C186/D_6063 = current()/S_QTY/C_C186/D_6063]
														 [position() &gt; 1]">
		<iso:extends rule="S_QTY_REPmore"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('2', '3')]/G_SG18/S_QTY/C_C186[D_6063 = '66']">
		<xsl:if test="not(../../S_DTM/C_C507[D_2005 = '161'])">
		  <iso:extends rule="S_QTY_Proof"/>
		</xsl:if>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('2', '3')]
				                                  /G_SG18[S_QTY/C_C186/D_6063 = '66']
														 [position() &gt; 1]">
		<iso:extends rule="S_QTY_REPmore"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('9', '10')]">
		<iso:assert test="G_SG18/S_QTY/C_C186/D_6063 = '113'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'QTY_113'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('9', '10')]/G_SG18/S_QTY/C_C186[D_6063 = '113']">
		<iso:extends rule="S_QTY_Proof"/>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG20[S_PAC/C_C531/D_7075 = ('1', '2', '3')]">
		<iso:assert test="S_QTY/C_C186/D_6063 = '52'">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'QTY_52'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG20[S_PAC/C_C531/D_7075 = ('1', '2', '3')]/S_QTY/C_C186[D_6063 = '52']">
		<iso:extends rule="S_QTY_Proof"/>
	  </iso:rule>

	</iso:pattern>

	<iso:pattern name="S_SCC" id="S_SCC">
	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('2', '3', '9', '10') and
				                                   S_SCC/D_4017 = current()/S_SCC/D_4017]
												  [position() &gt; 1]">
		<iso:extends rule="S_SCC_REPmore"/>
	  </iso:rule>
	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG17[S_SCC/D_4017 = ('1', '4') and
				                                   S_SCC/D_4017 = current()/S_SCC/D_4017]
												  [position() &gt; 999]">
		<iso:extends rule="S_SCC_REPmore"/>
	  </iso:rule>
	</iso:pattern>

	<iso:pattern name="S_PAC" id="S_PAC">
	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG20[S_PAC/C_C531/D_7075 = ('1', '2', '3') and
				                                   S_PAC/C_C531/D_7075 = current()/S_PAC/C_C531/D_7075]
												  [position() &gt; 1]">
		<iso:assert test="not(.)">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'REPmore'"/>
			<xsl:with-param name="ObjectName" select="concat('PAC_', current()/S_PAC/C_C531/D_7075)"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	  <iso:rule context="G_SG0/G_SG6/G_SG12/G_SG20/S_PAC[C_C531/D_7075 = ('1', '2', '3')]">
		<iso:assert test="C_C202/D_7064 != ''">
		  <xsl:call-template name="errormessage">
			<xsl:with-param name="ErrorClass" select="'ONA'"/>
			<xsl:with-param name="ObjectName" select="'PAC_7064'"/>
		  </xsl:call-template>
		</iso:assert>
	  </iso:rule>

	</iso:pattern>
</iso:schema>
