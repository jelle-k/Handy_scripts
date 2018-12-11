<xsl:stylesheet version="2.0" xmlns:ns="http://www.onetrail.net" xmlns:ns3="http://pip3a4po.ws.service.onetrail.com/" xmlns:tns="http://www.onetrail.net" xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:param name="date">
			<xsl:value-of select="BOM/BO/Documents/row/DocDate" />
		</xsl:param>
		<xsl:param name="ddate">
			<xsl:value-of select='BOM/BO/Documents/row/DocDueDate' />
		</xsl:param>
		<xsl:variable name="dateTime" select="concat($date,'T000000')" />
		<xsl:variable name="ddateTime" select="concat($ddate,'T000000')" />
		<tns:Pip3A4PurchaseOrderRequest>
			<tns:fromRole>
				<tns:PartnerRoleDescription>
					<tns:ContactInformation>
						<tns:contactName>
							<tns:FreeFormText lang="EN">CompuB Purchase Department</tns:FreeFormText>
						</tns:contactName>
						<tns:EmailAddress>
							<xsl:value-of select='BOM/BO/Documents/row/se_EmailAddress' />
						</tns:EmailAddress>
						<tns:facsimileNumber>
							<tns:CommunicationsNumber>
								<xsl:value-of select='BOM/BO/Documents/row/se_facsimileNumber' />
							</tns:CommunicationsNumber>
						</tns:facsimileNumber>
						<tns:telephoneNumber>
							<tns:CommunicationsNumber>
								<xsl:value-of select='BOM/BO/Documents/row/se_telephoneNumber' />
							</tns:CommunicationsNumber>
						</tns:telephoneNumber>
					</tns:ContactInformation>
					<tns:GlobalPartnerRoleClassificationCode>Reseller</tns:GlobalPartnerRoleClassificationCode>
					<tns:PartnerDescription>
						<tns:BusinessDescription>
							<tns:GlobalBusinessIdentifier>
								<xsl:value-of select='BOM/BO/Documents/row/se_fromRole_GlobalBusinessIdentifier' />
							</tns:GlobalBusinessIdentifier>
							<tns:GlobalSupplyChainCode>Information Technology</tns:GlobalSupplyChainCode>
							<tns:businessName>
								<tns:FreeFormText lang="EN">
									<xsl:value-of select='BOM/BO/Documents/row/se_businessName' />
								</tns:FreeFormText>
							</tns:businessName>
						</tns:BusinessDescription>
						<tns:GlobalPartnerClassificationCode>Buyer</tns:GlobalPartnerClassificationCode>
					</tns:PartnerDescription>
				</tns:PartnerRoleDescription>
			</tns:fromRole>
			<tns:Authentication>
				<tns:Username/>
				<tns:Password/>
			</tns:Authentication>
			<tns:GlobalDocumentFunctionCode>Request</tns:GlobalDocumentFunctionCode>
			<tns:PurchaseOrder>
				<tns:AccountDescription>
					<tns:accountName>
						<tns:FreeFormText lang="EN">
							<xsl:value-of select='BOM/BO/Documents/row/se_businessName' />
						</tns:FreeFormText>
					</tns:accountName>
					<tns:AccountNumber>
						<xsl:value-of select='BOM/BO/Documents/row/se_fromRole_GlobalBusinessIdentifier' />
					</tns:AccountNumber>
					<tns:billTo>
						<tns:PartnerRoleDescription>
							<tns:ContactInformation>
								<tns:contactName>
									<tns:FreeFormText lang="EN">Finance Department</tns:FreeFormText>
								</tns:contactName>
								<tns:EmailAddress>
									<xsl:value-of select='BOM/BO/Documents/row/se_EmailAddress' />
								</tns:EmailAddress>
								<tns:facsimileNumber>
									<tns:CommunicationsNumber>
										<xsl:value-of select='BOM/BO/Documents/row/se_facsimileNumber' />
									</tns:CommunicationsNumber>
								</tns:facsimileNumber>
								<tns:telephoneNumber>
									<tns:CommunicationsNumber>
										<xsl:value-of select='BOM/BO/Documents/row/se_telephoneNumber' />
									</tns:CommunicationsNumber>
								</tns:telephoneNumber>
							</tns:ContactInformation>
							<tns:GlobalPartnerRoleClassificationCode>Reseller</tns:GlobalPartnerRoleClassificationCode>
							<tns:PartnerDescription>
								<tns:BusinessDescription>
									<tns:GlobalBusinessIdentifier>8713783750339</tns:GlobalBusinessIdentifier>
									<tns:businessName>
										<tns:FreeFormText lang="EN">
											<xsl:value-of select='BOM/BO/Documents/row/se_businessName' />
										</tns:FreeFormText>
									</tns:businessName>
								</tns:BusinessDescription>
								<tns:GlobalPartnerClassificationCode>Buyer</tns:GlobalPartnerClassificationCode>
							</tns:PartnerDescription>
						</tns:PartnerRoleDescription>
					</tns:billTo>
				</tns:AccountDescription>
				<tns:remarks>
					<tns:remark context="Sales Remark">
						<xsl:value-of select='BOM/BO/Documents/row/Comments' />
					</tns:remark>
				</tns:remarks>
				<tns:GlobalPurchaseOrderTypeCode>Standard</tns:GlobalPurchaseOrderTypeCode>
				<tns:OrderShippingInformation>
					<!-- Needs to be released -->
					<tns:GlobalShippingServiceLevelCode>
						<xsl:value-of select='translate(BOM/BO/Documents/row/TrnspCode, "abcdefghijklmnopqrstuvwxyz", "ABCDEFGHIJKLMNOPQRSTUVWXYZ")' />
					</tns:GlobalShippingServiceLevelCode>
					<tns:GlobalSpecialFulfillmentRequestCode>Complete</tns:GlobalSpecialFulfillmentRequestCode>
				</tns:OrderShippingInformation>
				<!-- Document Rows -->
				<xsl:for-each select="/BOM/BO/Document_Lines/row">
					<tns:ProductLineItem>
						<tns:remarks>
							<tns:remark lang="EN">
								<xsl:value-of select="./ItemDescription" />
							</tns:remark>
						</tns:remarks>
						<tns:GlobalProductUnitOfMeasureCode>
							<xsl:value-of select="./se_BuyUnitMsr" />
						</tns:GlobalProductUnitOfMeasureCode>
						<tns:isDropShip>
							<tns:AffirmationIndicator>No</tns:AffirmationIndicator>
						</tns:isDropShip>
						<tns:LineNumber>
							<xsl:value-of select="number(./LineNum)" />
						</tns:LineNumber>
						<tns:OrderQuantity>
							<tns:requestedQuantity>
								<tns:ProductQuantity>
									<xsl:value-of select="number(./Quantity)" />
								</tns:ProductQuantity>
							</tns:requestedQuantity>
						</tns:OrderQuantity>
						<tns:ProductIdentification>
							<tns:GlobalProductIdentifier>
								<xsl:value-of select="./ItemCode" />
							</tns:GlobalProductIdentifier>
							<tns:PartnerProductIdentification>
								<tns:GlobalPartnerClassificationCode>Seller</tns:GlobalPartnerClassificationCode>
								<tns:ProprietaryProductIdentifier>
									<xsl:value-of select="./SupplierCatNum" />
								</tns:ProprietaryProductIdentifier>
							</tns:PartnerProductIdentification>
							<tns:PartnerProductIdentification>
								<tns:GlobalPartnerClassificationCode>Buyer</tns:GlobalPartnerClassificationCode>
								<tns:ProprietaryProductIdentifier>
									<xsl:value-of select="./ItemCode" />
								</tns:ProprietaryProductIdentifier>
							</tns:PartnerProductIdentification>
							<tns:PartnerProductIdentification>
								<tns:GlobalPartnerClassificationCode>EAN</tns:GlobalPartnerClassificationCode>
								<tns:ProprietaryProductIdentifier>
									<xsl:value-of select="./BarCode" />
								</tns:ProprietaryProductIdentifier>
							</tns:PartnerProductIdentification>
						</tns:ProductIdentification>
						<tns:proprietaryInformation>
							<tns:FreeFormText lang="EN">
								<xsl:value-of select="./ItemDescription" />
							</tns:FreeFormText>
						</tns:proprietaryInformation>
						<tns:requestedEvent>
							<tns:TransportationEvent>
								<tns:DateStamp>
									<xsl:value-of select="concat(./ShipDate,'T000000')" />
								</tns:DateStamp>
								<tns:GlobalTransportEventCode>Ship</tns:GlobalTransportEventCode>
							</tns:TransportationEvent>
						</tns:requestedEvent>
						<tns:requestedUnitPrice>
							<tns:FinancialAmount>
								<tns:GlobalCurrencyCode>
									<xsl:value-of select="./Currency" />
								</tns:GlobalCurrencyCode>
								<tns:MonetaryAmount>
									<xsl:value-of select="number(./Price)" />
								</tns:MonetaryAmount>
							</tns:FinancialAmount>
						</tns:requestedUnitPrice>
						<tns:totalLineItemAmount>
							<tns:FinancialAmount>
								<tns:GlobalCurrencyCode>
									<xsl:value-of select="./Currency" />
								</tns:GlobalCurrencyCode>
								<tns:MonetaryAmount>
									<xsl:value-of select="number(./LineTotal)" />
								</tns:MonetaryAmount>
							</tns:FinancialAmount>
						</tns:totalLineItemAmount>
					</tns:ProductLineItem>
				</xsl:for-each>
				<tns:purchaseOrderIdentifier>
					<tns:ProprietaryDocumentIdentifier>
						<xsl:value-of select='BOM/BO/Documents/row/DocNum' />
					</tns:ProprietaryDocumentIdentifier>
				</tns:purchaseOrderIdentifier>
				<tns:requestedEvent>
					<tns:TransportationEvent>
						<tns:DateStamp>
							<xsl:value-of select='$ddateTime' />
						</tns:DateStamp>
						<tns:GlobalTransportEventCode>Ship</tns:GlobalTransportEventCode>
					</tns:TransportationEvent>
				</tns:requestedEvent>
				<tns:shipTo>
					<tns:PartnerDescription>
						<tns:BusinessDescription>
							<tns:GlobalBusinessIdentifier>
								<xsl:value-of select='BOM/BO/AddressExtension/row/BillToGlobalLocationNumber' />
							</tns:GlobalBusinessIdentifier>
						</tns:BusinessDescription>
						<tns:GlobalPartnerClassificationCode>Buyer</tns:GlobalPartnerClassificationCode>
						<tns:ContactInformation>
							<tns:contactName>
								<tns:FreeFormText lang="EN">Purchase Department</tns:FreeFormText>
							</tns:contactName>
							<tns:EmailAddress>
								<xsl:value-of select='BOM/BO/Documents/row/se_EmailAddress' />
							</tns:EmailAddress>
							<tns:telephoneNumber>
								<tns:CommunicationsNumber>
									<xsl:value-of select='BOM/BO/Documents/row/se_telephoneNumber' />
								</tns:CommunicationsNumber>
							</tns:telephoneNumber>
						</tns:ContactInformation>
					</tns:PartnerDescription>
					<tns:PhysicalAddress />
					<!-- left out Physical Address <tns:addressLine1><tns:FreeFormText lang="EN"><xsl:value-of select='BOM/BO/AddressExtension/row/ShipToStreet' /></tns:FreeFormText></tns:addressLine1><tns:addressLine2><tns:FreeFormText lang="EN"><xsl:value-of select='BOM/BO/AddressExtension/row/ShipToBlock' /></tns:FreeFormText></tns:addressLine2><tns:cityName><tns:FreeFormText lang="EN"><xsl:value-of select='BOM/BO/AddressExtension/row/ShipToCity' /></tns:FreeFormText></tns:cityName><tns:GlobalCountryCode><xsl:value-of select='BOM/BO/AddressExtension/row/ShipToCountry' /></tns:GlobalCountryCode><tns:NationalPostalCode><xsl:value-of select='BOM/BO/AddressExtension/row/ShipToZipCode' /></tns:NationalPostalCode></tns:PhysicalAddress> -->
				</tns:shipTo>
				<tns:totalAmount>
					<tns:FinancialAmount>
						<tns:GlobalCurrencyCode>
							<xsl:value-of select='BOM/BO/Documents/row/DocCurrency' />
						</tns:GlobalCurrencyCode>
						<tns:MonetaryAmount>
							<xsl:value-of select='number(BOM/BO/Documents/row/DocTotal)' />
						</tns:MonetaryAmount>
					</tns:FinancialAmount>
				</tns:totalAmount>
			</tns:PurchaseOrder>
			<tns:thisDocumentGenerationDateTime>
				<tns:DateTimeStamp>
					<xsl:value-of select='$dateTime' />
				</tns:DateTimeStamp>
			</tns:thisDocumentGenerationDateTime>
			<tns:thisDocumentIdentifier>
				<tns:ProprietaryDocumentIdentifier>
					<xsl:value-of select='BOM/BO/Documents/row/DocNum' />
				</tns:ProprietaryDocumentIdentifier>
			</tns:thisDocumentIdentifier>
			<tns:toRole>
				<tns:PartnerRoleDescription>
					<tns:ContactInformation>
						<tns:contactName>
							<tns:FreeFormText lang="EN">Sales Department </tns:FreeFormText>
						</tns:contactName>
						<tns:EmailAddress>
							<xsl:value-of select='BOM/BO/Documents/row/se_E_MailL' />
						</tns:EmailAddress>
						<tns:facsimileNumber>
							<tns:CommunicationsNumber>
								<xsl:value-of select='BOM/BO/Documents/row/se_Fax' />
							</tns:CommunicationsNumber>
						</tns:facsimileNumber>
						<tns:telephoneNumber>
							<tns:CommunicationsNumber>
								<xsl:value-of select='BOM/BO/Documents/row/se_Tel1' />
							</tns:CommunicationsNumber>
						</tns:telephoneNumber>
					</tns:ContactInformation>
					<tns:GlobalPartnerRoleClassificationCode>Distributor</tns:GlobalPartnerRoleClassificationCode>
					<tns:PartnerDescription>
						<tns:BusinessDescription>
							<tns:GlobalBusinessIdentifier>
								<xsl:value-of select='BOM/BO/AddressExtension/row/BillToGlobalLocationNumber' />
							</tns:GlobalBusinessIdentifier>
							<tns:GlobalSupplyChainCode>Information Technology</tns:GlobalSupplyChainCode>
							<tns:businessName>
								<tns:FreeFormText lang="EN">
									<xsl:value-of select='BOM/BO/Documents/row/CardName' />
								</tns:FreeFormText>
							</tns:businessName>
						</tns:BusinessDescription>
						<tns:GlobalPartnerClassificationCode>Seller</tns:GlobalPartnerClassificationCode>
					</tns:PartnerDescription>
				</tns:PartnerRoleDescription>
			</tns:toRole>
		</tns:Pip3A4PurchaseOrderRequest>
	</xsl:template>
</xsl:stylesheet>