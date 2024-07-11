<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:sapxsl="http://www.sap.com/sapxsl" 
xmlns:a="http://www.opentrans.org/opentrans/1.0/opentrans_order" 
xmlns:axw = "own_functions"
version="2.0">
#mk#
	<xsl:include href="common_functions_cloud.xsl"/>
	
	<xsl:param name="ACTISEDI" select=" '' "/>
	<xsl:param name="PPATH" select=" '' "/>
 	<xsl:param name="lifnr" select=" '' "/>
 	<xsl:param name="MESCOD"/>
 	<xsl:param name="SNDPRN"/>
 	<xsl:param name="SNDPOR"/>
	<xsl:param name="customer_code" select=" '' "/>
	<xsl:param name="tftab_table" select=" 'Y_25VSI_B2B_CHANGE_DOC' "/>
	<xsl:param name="tftab_dir" select="concat($PPATH,'/',$customer_code,'/tftab') "/>
	<xsl:param name="tftab_extension" select=" '' "/>
	
	<xsl:variable name="tftab_ext" select="if ($tftab_extension != '') then concat('.',$tftab_extension) else $tftab_extension "/>
	
  <xsl:strip-space elements="*"/>

  <xsl:template match="/">
  		<xsl:apply-templates/>
  </xsl:template>
  
<!-- <xsl:template match="/"> -->  
<!--    <SSP_Service>-->
<!--      <Request Function="B2B_ORDER_FESTO">-->
<!--        <I_XML>-->
<!--          <I_STRING>-->
<!--            <xsl:apply-templates/>-->
<!--          </I_STRING>-->
<!--        </I_XML>-->
<!--        <STATUS>-->
<!--          <I_STATUS>false</I_STATUS>-->
<!--        </STATUS>-->
<!--      </Request>-->
<!--    </SSP_Service>-->
<!--  </xsl:template> -->

  <xsl:template match="/cXML">
		<ORDERS05>
<!--
			<xsl:attribute name="xsi:noNamespaceSchemaLocation">
				<xsl:value-of select="'Z:/INT/Data/eProcurement/_Mappings/PO/SAP-XML/SAP_ORDERS05_Schema-W3C2001-5-2.xsd'"/>
			</xsl:attribute>
-->
			<xsl:variable name="Vvar2_const" select="'1'"/>
			<xsl:variable name="Vvar503_const" select="'-'"/>
			<xsl:variable name="Vvar566_const" select="','"/>
			<xsl:variable name="Vvar581_const" select="'002'"/>
			<xsl:variable name="Vvar625_const" select="70"/>
			<xsl:variable name="Vvar641_const" select="'='"/>
			<IDOC>
				<xsl:attribute name="BEGIN">
					<xsl:value-of select="$Vvar2_const"/>
				</xsl:attribute>
				<EDI_DC40>
					<xsl:attribute name="SEGMENT">
						<xsl:value-of select="$Vvar2_const"/>
					</xsl:attribute>
					<TABNAM>
						<xsl:value-of select="'EDI_DC40'"/>
					</TABNAM>
					<DOCREL>
						<xsl:value-of select="'46C'"/>
					</DOCREL>
					<DIRECT>
						<xsl:value-of select="'2'"/>
					</DIRECT>
					<IDOCTYP>
						<xsl:value-of select="'ORDERS05'"/>
					</IDOCTYP>
					<MESTYP>
						<xsl:value-of select="'ORDERS'"/>
					</MESTYP>
					<MESCOD>
						<xsl:value-of select="$MESCOD"/>
					</MESCOD>
					<MESFCT>
						<xsl:value-of select="''"/>
					</MESFCT>
					<SNDPOR>
						<xsl:value-of select="$SNDPOR"/>
					</SNDPOR>
					<SNDPRT>
						<xsl:value-of select="'KU'"/>
					</SNDPRT>
					<SNDPRN>
						<xsl:value-of select="$SNDPRN"/>
					</SNDPRN>
<!--					<xsl:for-each select="Header">-->
<!--						<xsl:for-each select="From">-->
<!--							<xsl:for-each select="Credential">-->
<!--								<xsl:variable name="ExistsResult">-->
<!--									<xsl:for-each select="@domain">-->
<!--										<xsl:variable name="Vvar369_domain_anySimpleType" select="."/>-->
<!--										<xsl:if test="(('NetworkId') = (string($Vvar369_domain_anySimpleType))) or (('NetworkID') = (string($Vvar369_domain_anySimpleType)))">-->
<!--											<xsl:value-of select="true()"/>-->
<!--										</xsl:if>-->
<!--									</xsl:for-each>-->
<!--								</xsl:variable>-->
<!--								<xsl:variable name="Vvar366_exists" select="string-length( $ExistsResult )&gt;0"/>-->
<!--								<xsl:for-each select="Identity">-->
<!--									<xsl:variable name="Vvar364_Identity_anySimpleType" select="."/>-->
<!--									<xsl:if test="string($Vvar366_exists)='true' or string($Vvar366_exists)='1'">-->
										
<!-- 										 
											<xsl:value-of select="axw:getProperty($customer_code,$Vvar364_Identity_anySimpleType,$tftab_table,$tftab_dir,$tftab_ext)"/>

											<xsl:value-of select="string($Vvar364_Identity_anySimpleType)"/>
-->
											
										
<!--									</xsl:if>-->
<!--								</xsl:for-each>-->
<!--							</xsl:for-each>-->
<!--						</xsl:for-each>-->
<!--					</xsl:for-each>-->
					<RCVPOR>
						<xsl:value-of select="'LS'"/>
					</RCVPOR>
					<RCVPRT>
						<xsl:value-of select="'LI'"/>
					</RCVPRT>
					<RCVPRN>
						<xsl:value-of select="'FESTO'"/>
					</RCVPRN>
				</EDI_DC40>
				<E1EDK01>
					<xsl:attribute name="SEGMENT">
						<xsl:value-of select="$Vvar2_const"/>
					</xsl:attribute>
					<xsl:for-each select="Request">
						<xsl:for-each select="OrderRequest">
							<xsl:for-each select="OrderRequestHeader">
								<xsl:for-each select="Total">
									<xsl:for-each select="Money">
										<xsl:for-each select="@currency">
											<xsl:variable name="Vvar389_currency_anySimpleType" select="."/>
											<CURCY>
												<xsl:value-of select="string($Vvar389_currency_anySimpleType)"/>
											</CURCY>
										</xsl:for-each>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</E1EDK01>
				<E1EDKA1>
					<xsl:attribute name="SEGMENT">
						<xsl:value-of select="$Vvar2_const"/>
					</xsl:attribute>
					<PARVW>
						<xsl:value-of select="'AG'"/>
					</PARVW>
					<xsl:for-each select="Header">
						<xsl:for-each select="From">
							<xsl:for-each select="Credential">
								<xsl:variable name="ExistsResult1">
									<xsl:for-each select="@domain">
										<xsl:variable name="Vvar405_domain_anySimpleType" select="."/>
										<xsl:if test="(('NetworkId') = (string($Vvar405_domain_anySimpleType))) or (('NetworkID') = (string($Vvar405_domain_anySimpleType)))">
											<xsl:value-of select="true()"/>
										</xsl:if>
									</xsl:for-each>
								</xsl:variable>
								<xsl:variable name="Vvar402_exists" select="string-length( $ExistsResult1 )&gt;0"/>
								<xsl:for-each select="Identity">
									<xsl:variable name="Vvar400_Identity_anySimpleType" select="."/>
									<xsl:if test="string($Vvar402_exists)='true' or string($Vvar402_exists)='1'">
										<PARTN>
											<xsl:value-of select="$SNDPRN"/>
											
<!--											<xsl:value-of select="axw:getProperty($customer_code,$Vvar400_Identity_anySimpleType,$tftab_table,$tftab_dir,$tftab_ext)"/>-->
<!-- 
											<xsl:value-of select="string($Vvar400_Identity_anySimpleType)"/>
-->											
										</PARTN>
									</xsl:if>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="Request">

					<xsl:for-each select="OrderRequest">
							<xsl:for-each select="OrderRequestHeader">
								<xsl:for-each select="Contact">
									<xsl:variable name="Vvar419_Contact" select="."/>
									
									<xsl:if test="@role='purchasingAgent'">
									<xsl:for-each select="@role">
										
										<xsl:variable name="Vvar422_role_anySimpleType" select="."/>
										<xsl:variable name="Vvar424_result_equal" select="('purchasingAgent') = (string($Vvar422_role_anySimpleType))"/>
										<xsl:variable name="Vvar425_cond">
											<xsl:choose>
												<xsl:when test="(string($Vvar424_result_equal))='true'">
													<xsl:for-each select="$Vvar419_Contact/Name">
														<xsl:variable name="Vvar427_Name_anySimpleType" select="."/>
														<xsl:value-of select="string($Vvar427_Name_anySimpleType)"/>
													</xsl:for-each>
												</xsl:when>
												<xsl:otherwise>
													<xsl:value-of select="'unknown'"/>
												</xsl:otherwise>
											</xsl:choose>
										</xsl:variable>
										<BNAME>
											<xsl:value-of select="$Vvar425_cond"/>
										</BNAME>
										
									</xsl:for-each>
									</xsl:if>
								</xsl:for-each>
								
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</E1EDKA1>
				<xsl:for-each select="Request">
					<xsl:for-each select="OrderRequest">
						<xsl:for-each select="OrderRequestHeader">
							<xsl:for-each select="ShipTo">
								<xsl:for-each select="Address">
									<xsl:variable name="Vvar440_Address" select="."/>
									<E1EDKA1>
										<xsl:attribute name="SEGMENT">
											<xsl:value-of select="$Vvar2_const"/>
										</xsl:attribute>
										<PARVW>
											<xsl:value-of select="'WE'"/>
										</PARVW>
										<xsl:for-each select="@addressID">
											<xsl:variable name="Vvar447_addressID_anySimpleType" select="."/>
											<LIFNR>
												<xsl:value-of select="string($Vvar447_addressID_anySimpleType)"/>
											</LIFNR>
										</xsl:for-each>
										<xsl:for-each select="Name">
											<xsl:variable name="Vvar451_Name_anySimpleType" select="."/>
											<NAME1>
												<xsl:value-of select="string($Vvar451_Name_anySimpleType)"/>
											</NAME1>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="DeliverTo">
												<xsl:variable name="Vvar457_DeliverTo_anySimpleType" select="."/>
												<xsl:variable name="ExistsResult2">
													<xsl:for-each select="$Vvar440_Address/Name">
														<xsl:variable name="Vvar461_Name_anySimpleType" select="."/>
														<xsl:if test="(string($Vvar461_Name_anySimpleType)) = (string($Vvar457_DeliverTo_anySimpleType))">
															<xsl:value-of select="true()"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:variable>
												<xsl:variable name="Vvar459_exists" select="string-length( $ExistsResult2 )&gt;0"/>
												<xsl:if test="not(string($Vvar459_exists)='true' or string($Vvar459_exists)='1')">
													<NAME2>
														<xsl:value-of select="substring(string($Vvar457_DeliverTo_anySimpleType), number(1), number(35))"/>
													</NAME2>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="DeliverTo">
												<xsl:variable name="Vvar471_DeliverTo_anySimpleType" select="."/>
												<xsl:variable name="ExistsResult3">
													<xsl:for-each select="$Vvar440_Address/Name">
														<xsl:variable name="Vvar475_Name_anySimpleType" select="."/>
														<xsl:if test="(string($Vvar475_Name_anySimpleType)) = (string($Vvar471_DeliverTo_anySimpleType))">
															<xsl:value-of select="true()"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:variable>
												<xsl:variable name="Vvar473_exists" select="string-length( $ExistsResult3 )&gt;0"/>
												<xsl:if test="not(string($Vvar473_exists)='true' or string($Vvar473_exists)='1')">
													<NAME3>
														<xsl:value-of select="substring(string($Vvar471_DeliverTo_anySimpleType), number(36), number(35))"/>
													</NAME3>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="Street">
												<xsl:variable name="Vvar485_Street_anySimpleType" select="."/>
												<STRAS>
													<xsl:value-of select="string($Vvar485_Street_anySimpleType)"/>
												</STRAS>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="City">
												<xsl:variable name="Vvar491_City_anySimpleType" select="."/>
												<ORT01>
													<xsl:value-of select="string($Vvar491_City_anySimpleType)"/>
												</ORT01>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="Country">
												<xsl:for-each select="@isoCountryCode">
													<xsl:variable name="Vvar500_isoCountryCode_anySimpleType" select="."/>
													<COUNC>
														<xsl:value-of select="string($Vvar500_isoCountryCode_anySimpleType)"/>
													</COUNC>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="PostalCode">
												<xsl:variable name="Vvar507_PostalCode_anySimpleType" select="."/>
												<xsl:variable name="Vvar512_result_equal" select="($Vvar503_const) = (substring(string($Vvar507_PostalCode_anySimpleType), number(6), number(1)))"/>
												<xsl:variable name="Vvar513_cond">
													<xsl:choose>
														<xsl:when test="(string($Vvar512_result_equal))='true'">
															<xsl:value-of select="concat(substring-before(string($Vvar507_PostalCode_anySimpleType), $Vvar503_const),
                                                                                                               substring-after(string($Vvar507_PostalCode_anySimpleType), $Vvar503_const))"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="string($Vvar507_PostalCode_anySimpleType)"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:variable>
												<PSTLZ>
													<xsl:value-of select="string($Vvar513_cond)"/>
												</PSTLZ>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="State">
												<xsl:variable name="Vvar521_State_anySimpleType" select="."/>
												<REGIO>
													<xsl:value-of select="string($Vvar521_State_anySimpleType)"/>
												</REGIO>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="Email">
											<xsl:variable name="Vvar525_Email_anySimpleType" select="."/>
											<ILNNR>
												<xsl:value-of select="string($Vvar525_Email_anySimpleType)"/>
											</ILNNR>
										</xsl:for-each>
									</E1EDKA1>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				
				<xsl:for-each select="Request">
					<xsl:for-each select="OrderRequest">
						<xsl:for-each select="OrderRequestHeader">
							<xsl:for-each select="BillTo">
								<xsl:for-each select="Address">
									<xsl:variable name="Vvar440_Address" select="."/>
									<E1EDKA1>
										<xsl:attribute name="SEGMENT">
											<xsl:value-of select="$Vvar2_const"/>
										</xsl:attribute>
										<PARVW>
											<xsl:value-of select="'RE'"/>
										</PARVW>
										<xsl:for-each select="@addressID">
											<xsl:variable name="Vvar447_addressID_anySimpleType" select="."/>
											<LIFNR>
												<xsl:value-of select="string($Vvar447_addressID_anySimpleType)"/>
											</LIFNR>
										</xsl:for-each>
										<xsl:for-each select="Name">
											<xsl:variable name="Vvar451_Name_anySimpleType" select="."/>
											<NAME1>
												<xsl:value-of select="string($Vvar451_Name_anySimpleType)"/>
											</NAME1>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="DeliverTo">
												<xsl:variable name="Vvar457_DeliverTo_anySimpleType" select="."/>
												<xsl:variable name="ExistsResult2">
													<xsl:for-each select="$Vvar440_Address/Name">
														<xsl:variable name="Vvar461_Name_anySimpleType" select="."/>
														<xsl:if test="(string($Vvar461_Name_anySimpleType)) = (string($Vvar457_DeliverTo_anySimpleType))">
															<xsl:value-of select="true()"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:variable>
												<xsl:variable name="Vvar459_exists" select="string-length( $ExistsResult2 )&gt;0"/>
												<xsl:if test="not(string($Vvar459_exists)='true' or string($Vvar459_exists)='1')">
													<NAME2>
														<xsl:value-of select="substring(string($Vvar457_DeliverTo_anySimpleType), number(1), number(35))"/>
													</NAME2>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="DeliverTo">
												<xsl:variable name="Vvar471_DeliverTo_anySimpleType" select="."/>
												<xsl:variable name="ExistsResult3">
													<xsl:for-each select="$Vvar440_Address/Name">
														<xsl:variable name="Vvar475_Name_anySimpleType" select="."/>
														<xsl:if test="(string($Vvar475_Name_anySimpleType)) = (string($Vvar471_DeliverTo_anySimpleType))">
															<xsl:value-of select="true()"/>
														</xsl:if>
													</xsl:for-each>
												</xsl:variable>
												<xsl:variable name="Vvar473_exists" select="string-length( $ExistsResult3 )&gt;0"/>
												<xsl:if test="not(string($Vvar473_exists)='true' or string($Vvar473_exists)='1')">
													<NAME3>
														<xsl:value-of select="substring(string($Vvar471_DeliverTo_anySimpleType), number(36), number(35))"/>
													</NAME3>
												</xsl:if>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="Street">
												<xsl:variable name="Vvar485_Street_anySimpleType" select="."/>
												<STRAS>
													<xsl:value-of select="string($Vvar485_Street_anySimpleType)"/>
												</STRAS>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="City">
												<xsl:variable name="Vvar491_City_anySimpleType" select="."/>
												<ORT01>
													<xsl:value-of select="string($Vvar491_City_anySimpleType)"/>
												</ORT01>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="Country">
												<xsl:for-each select="@isoCountryCode">
													<xsl:variable name="Vvar500_isoCountryCode_anySimpleType" select="."/>
													<COUNC>
														<xsl:value-of select="string($Vvar500_isoCountryCode_anySimpleType)"/>
													</COUNC>
												</xsl:for-each>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="PostalCode">
												<xsl:variable name="Vvar507_PostalCode_anySimpleType" select="."/>
												<xsl:variable name="Vvar512_result_equal" select="($Vvar503_const) = (substring(string($Vvar507_PostalCode_anySimpleType), number(6), number(1)))"/>
												<xsl:variable name="Vvar513_cond">
													<xsl:choose>
														<xsl:when test="(string($Vvar512_result_equal))='true'">
															<xsl:value-of select="concat(substring-before(string($Vvar507_PostalCode_anySimpleType), $Vvar503_const),
                                                                                                               substring-after(string($Vvar507_PostalCode_anySimpleType), $Vvar503_const))"/>
														</xsl:when>
														<xsl:otherwise>
															<xsl:value-of select="string($Vvar507_PostalCode_anySimpleType)"/>
														</xsl:otherwise>
													</xsl:choose>
												</xsl:variable>
												<PSTLZ>
													<xsl:value-of select="string($Vvar513_cond)"/>
												</PSTLZ>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="PostalAddress">
											<xsl:for-each select="State">
												<xsl:variable name="Vvar521_State_anySimpleType" select="."/>
												<REGIO>
													<xsl:value-of select="string($Vvar521_State_anySimpleType)"/>
												</REGIO>
											</xsl:for-each>
										</xsl:for-each>
										<xsl:for-each select="Email">
											<xsl:variable name="Vvar525_Email_anySimpleType" select="."/>
											<ILNNR>
												<xsl:value-of select="string($Vvar525_Email_anySimpleType)"/>
											</ILNNR>
										</xsl:for-each>
									</E1EDKA1>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
				
				
				<E1EDK02>
					<xsl:attribute name="SEGMENT">
						<xsl:value-of select="$Vvar2_const"/>
					</xsl:attribute>
					<QUALF>
						<xsl:value-of select="'001'"/>
					</QUALF>
					<xsl:for-each select="Request">
						<xsl:for-each select="OrderRequest">
							<xsl:for-each select="OrderRequestHeader">
								<xsl:for-each select="@orderID">
									<xsl:variable name="Vvar536_orderID_anySimpleType" select="."/>
									<BELNR>
										<xsl:value-of select="string($Vvar536_orderID_anySimpleType)"/>
									</BELNR>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="Request">
						<xsl:for-each select="OrderRequest">
							<xsl:for-each select="OrderRequestHeader">
								<xsl:for-each select="@orderDate">
									<xsl:variable name="Vvar547_orderDate_anySimpleType" select="."/>
									<DATUM>
										<xsl:value-of select="substring($Vvar547_orderDate_anySimpleType,1,4)"/>
										<xsl:value-of select="substring($Vvar547_orderDate_anySimpleType,6,2)"/>
										<xsl:value-of select="substring($Vvar547_orderDate_anySimpleType,9,2)"/>
									</DATUM>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</xsl:for-each>
				</E1EDK02>
				<xsl:for-each select="Request">
					<xsl:for-each select="OrderRequest">
						<xsl:for-each select="ItemOut">
							<E1EDP01>
								<xsl:attribute name="SEGMENT">
									<xsl:value-of select="$Vvar2_const"/>
								</xsl:attribute>
								<xsl:for-each select="@lineNumber">
									<xsl:variable name="Vvar560_lineNumber_anySimpleType" select="."/>
									<POSEX>
										<xsl:value-of select="string($Vvar560_lineNumber_anySimpleType)"/>
									</POSEX>
								</xsl:for-each>
								<xsl:for-each select="@quantity">
									<xsl:variable name="Vvar564_quantity_anySimpleType" select="."/>
									<xsl:variable name="Vvar567_result_contains" select="contains(string($Vvar564_quantity_anySimpleType), $Vvar566_const)"/>
									<xsl:variable name="Vvar568_cond">
										<xsl:choose>
											<xsl:when test="(string($Vvar567_result_contains))='true'">
												<xsl:value-of select="concat(substring-before(string($Vvar564_quantity_anySimpleType), $Vvar566_const), substring-after(string($Vvar564_quantity_anySimpleType),
                                                                                        $Vvar566_const))"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:value-of select="string($Vvar564_quantity_anySimpleType)"/>
											</xsl:otherwise>
										</xsl:choose>
									</xsl:variable>
									<MENGE>
										<xsl:value-of select="$Vvar568_cond"/>
									</MENGE>
								</xsl:for-each>
								<xsl:for-each select="ItemDetail">
									<xsl:for-each select="UnitOfMeasure">
										<xsl:variable name="Vvar576_UnitOfMeasure_anySimpleType" select="."/>
										<MENEE>
											<xsl:value-of select="axw:getProperty($customer_code,$Vvar576_UnitOfMeasure_anySimpleType,$tftab_table,$tftab_dir,$tftab_ext)"/>
											
<!--											<xsl:value-of select="string($Vvar576_UnitOfMeasure_anySimpleType)"/>-->
											
										</MENEE>
									</xsl:for-each>
								</xsl:for-each>
								<E1EDP03>
									<xsl:attribute name="SEGMENT">
										<xsl:value-of select="$Vvar2_const"/>
									</xsl:attribute>
									<IDDAT>
										<xsl:value-of select="$Vvar581_const"/>
									</IDDAT>
									<xsl:for-each select="@requestedDeliveryDate">
										<xsl:variable name="Vvar584_requestedDeliveryDate_anySimpleType" select="."/>
										<DATUM>
										<xsl:value-of select="substring($Vvar584_requestedDeliveryDate_anySimpleType,1,4)"/>
										<xsl:value-of select="substring($Vvar584_requestedDeliveryDate_anySimpleType,6,2)"/>
										<xsl:value-of select="substring($Vvar584_requestedDeliveryDate_anySimpleType,9,2)"/>
									</DATUM>
									</xsl:for-each>
								</E1EDP03>
								<E1EDP19>
									<xsl:attribute name="SEGMENT">
										<xsl:value-of select="$Vvar2_const"/>
									</xsl:attribute>
									<QUALF>
										<xsl:value-of select="$Vvar581_const"/>
									</QUALF>
									<xsl:for-each select="ItemID">
										<xsl:for-each select="SupplierPartID">
											<xsl:variable name="Vvar594_SupplierPartID_anySimpleType" select="."/>
											<IDTNR>
												<xsl:value-of select="string($Vvar594_SupplierPartID_anySimpleType)"/>
											</IDTNR>
										</xsl:for-each>
									</xsl:for-each>
									<xsl:for-each select="ItemDetail">
										<xsl:for-each select="Description">
											<xsl:variable name="Vvar600_Description_anySimpleType" select="."/>
											<KTEXT>
												<xsl:value-of select="string($Vvar600_Description_anySimpleType)"/>
											</KTEXT>
										</xsl:for-each>
									</xsl:for-each>
								</E1EDP19>
								<xsl:for-each select="ItemDetail">
									<xsl:for-each select="Extrinsic">
										<xsl:variable name="Vvar606_Extrinsic_anySimpleType" select="."/>
										<xsl:variable name="ExistsResult4">
											<xsl:for-each select="@name">
												<xsl:variable name="Vvar611_name_anySimpleType" select="."/>
												<xsl:if test="('customersPartNo') = (string($Vvar611_name_anySimpleType))">
													<xsl:value-of select="true()"/>
												</xsl:if>
											</xsl:for-each>
										</xsl:variable>
										<xsl:variable name="Vvar608_exists" select="string-length( $ExistsResult4 )&gt;0"/>
										<xsl:if test="string($Vvar608_exists)='true' or string($Vvar608_exists)='1'">
											<E1EDP19>
												<xsl:attribute name="SEGMENT">
													<xsl:value-of select="'1'"/>
												</xsl:attribute>
												<QUALF>
													<xsl:value-of select="'001'"/>
												</QUALF>
												<IDTNR>
													<xsl:value-of select="string($Vvar606_Extrinsic_anySimpleType)"/>
												</IDTNR>
											</E1EDP19>
										</xsl:if>
									</xsl:for-each>
								</xsl:for-each>
								<xsl:for-each select="ItemID">
									<xsl:for-each select="SupplierPartAuxiliaryID">
										<xsl:variable name="Vvar622_SupplierPartAuxiliaryID_anySimpleType" select="."/>
										<E1EDPT1>
											<xsl:attribute name="SEGMENT">
												<xsl:value-of select="$Vvar2_const"/>
											</xsl:attribute>
											<TDID>
												<xsl:value-of select="'F01'"/>
											</TDID>
											<E1EDPT2>
												<xsl:attribute name="SEGMENT">
													<xsl:value-of select="$Vvar2_const"/>
												</xsl:attribute>
												<TDLINE>
													<xsl:value-of select="substring(string($Vvar622_SupplierPartAuxiliaryID_anySimpleType), number(1), number($Vvar625_const))"/>
												</TDLINE>
												<TDFORMAT>
													<xsl:value-of select="'*'"/>
												</TDFORMAT>
											</E1EDPT2>
											<E1EDPT2>
												<xsl:attribute name="SEGMENT">
													<xsl:value-of select="$Vvar2_const"/>
												</xsl:attribute>
												<TDLINE>
													<xsl:value-of select="substring(string($Vvar622_SupplierPartAuxiliaryID_anySimpleType), number(71), number($Vvar625_const))"/>
												</TDLINE>
												<TDFORMAT>
													<xsl:value-of select="$Vvar641_const"/>
												</TDFORMAT>
											</E1EDPT2>
											<E1EDPT2>
												<xsl:attribute name="SEGMENT">
													<xsl:value-of select="$Vvar2_const"/>
												</xsl:attribute>
												<TDLINE>
													<xsl:value-of select="substring(string($Vvar622_SupplierPartAuxiliaryID_anySimpleType), number(141), number($Vvar625_const))"/>
												</TDLINE>
												<TDFORMAT>
													<xsl:value-of select="$Vvar641_const"/>
												</TDFORMAT>
											</E1EDPT2>
											<E1EDPT2>
												<xsl:attribute name="SEGMENT">
													<xsl:value-of select="$Vvar2_const"/>
												</xsl:attribute>
												<TDLINE>
													<xsl:value-of select="substring(string($Vvar622_SupplierPartAuxiliaryID_anySimpleType), number(211), number($Vvar625_const))"/>
												</TDLINE>
												<TDFORMAT>
													<xsl:value-of select="$Vvar641_const"/>
												</TDFORMAT>
											</E1EDPT2>
										</E1EDPT1>
									</xsl:for-each>
								</xsl:for-each>
							</E1EDP01>
						</xsl:for-each>
					</xsl:for-each>
				</xsl:for-each>
			</IDOC>
		</ORDERS05>
	</xsl:template>
</xsl:stylesheet>