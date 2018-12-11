<xsl:stylesheet version="2.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<message>
			<class>nl.serac.sboconnector.processors.MarshalledServicesProcessor</class>
			<data>
				<marshalledobject>
					<BOM>
						<BO>
							<AdmInfo>
								<Version>
									<xsl:value-of select="2" />
								</Version>
								<Object>
									<xsl:value-of select="69" />
								</Object>
							</AdmInfo>
							<LandedCost>
								<PostingDate>
									<xsl:value-of select="BOM/BO/Documents/row/DocDate"/>
								</PostingDate>
								<DueDate>
									<xsl:value-of select="BOM/BO/Documents/row/TaxDate"/>
								</DueDate>
								<VendorCode>
									<xsl:value-of select="BOM/BO/Documents/row/CardCode"/>
								</VendorCode>
								<Remarks>
									<xsl:value-of select="BOM/BO/Documents/row/Remarks"/>
								</Remarks>
								<DocumentCurrency>
									<xsl:value-of select="BOM/BO/Documents/row/DocCurrency"/>
								</DocumentCurrency>
								<Total />
								<TotalFreightCharges />
								<LandedCost_ItemLines>
									<xsl:for-each select="/BOM/BO/Document_Lines/row">
										<xsl:if test="not(./ItemCode = '99999999')">
											<LandedCost_ItemLine>
												<LineNumber>
													<xsl:value-of select="./BaseLine"/>
												</LineNumber>
												<BaseDocumentType>asGoodsReceiptPO</BaseDocumentType>
												<BaseEntry>
													<xsl:value-of select="./BaseEntry"/>
												</BaseEntry>
											</LandedCost_ItemLine>
										</xsl:if>
									</xsl:for-each>
								</LandedCost_ItemLines>
								<LandedCost_CostLines>
									<xsl:for-each select="/BOM/BO/Document_Lines/row">
										<xsl:if test="./ItemCode = '99999999'">
											<LandedCost_CostLine>
												<LandedCostCode>02</LandedCostCode>
												<Amount>
													<xsl:value-of select="./Price"/>
												</Amount>
											</LandedCost_CostLine>
										</xsl:if>
									</xsl:for-each>								
								</LandedCost_CostLines>
							</LandedCost>
						</BO>
					</BOM>
				</marshalledobject>
			</data>
		</message>
	</xsl:template>
</xsl:stylesheet>  