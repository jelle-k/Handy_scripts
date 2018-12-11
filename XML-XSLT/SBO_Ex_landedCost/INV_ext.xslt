<xsl:stylesheet version="2.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"  xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"  xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2" >
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
  <!-- HEADER -->
    <cac:Invoice>
      <cbc:UBLVersionID>
        <xsl:value-of select="2.1"/>
      </cbc:UBLVersionID>
      <cac:IssueDate>
        <xsl:value-of select="BOM/BO/OINV/row/DocDueDate"/>
      </cac:IssueDate>
      <cbc:InvoiceTypeCode>
        <xsl:attribute name="listID">ISO 4217 Alpha</xsl:attribute>
        <xsl:attribute name="listAgencyID">6</xsl:attribute>
        <xsl:value-of select="BOM/BO/OINV/row/ObjType"/>
      </cbc:InvoiceTypeCode>      
      <cbc:OrderReference>
        <cbc:ID>
          <xsl:value-of select="BOM/BO/OINV/row/NumAtCard"/>
        </cbc:ID>
      </cbc:OrderReference>
<!-- ADDRESS -->      
      <cac:AccountingCustomerParty>
        <cac:Party>
          <cbc:EndpointID>
            <xsl:attribute name="schemeID">GLN</xsl:attribute>
            <xsl:attribute name="schemeAgencyID">13</xsl:attribute>
            <xsl:value-of select="BOM/BO/OINV/row/LicTradNum"/>
          </cbc:EndpointID>
          <cac:PartyName>
            <cbc:Name>
              <xsl:value-of select="BOM/BO/OINV/row/CardName"/>
            </cbc:Name>
          </cac:PartyName>
          <cac:PostalAddress>
            <cbc:StreetName>
              <xsl:value-of select="BOM/BO/INV12/row/StreetB"/>
            </cbc:StreetName>
            <cbc:CityName>
              <xsl:value-of select="BOM/BO/INV12/row/CityB"/>
            </cbc:CityName>
            <cbc:PostalZone>
              <xsl:value-of select="BOM/BO/INV12/row/ZipCodeB"/>
            </cbc:PostalZone>
            <cac:Country>
              <cbc:IdentificationCode>
                <xsl:attribute name="listID">ISO3166-1</xsl:attribute>
                <xsl:attribute name="listAgencyID">6</xsl:attribute>
                <xsl:value-of select="BOM/BO/INV12/row/CountryB"/>
              </cbc:IdentificationCode> 
            </cac:Country>            
          </cac:PostalAddress>
          <cac:Delivery>
            <cac:DeliveryLocation>
              <cac:Address>
                <cbc:StreetName>
                  <xsl:value-of select="BOM/BO/INV12/row/StreetS"/>
                </cbc:StreetName>
                <cbc:CityName>
                  <xsl:value-of select="BOM/BO/INV12/row/CityS"/>
                </cbc:CityName>
                <cbc:PostalZone>
                  <xsl:value-of select="BOM/BO/INV12/row/ZipCodeS"/>
                </cbc:PostalZone>
                <cac:Country>
                  <cbc:IdentificationCode>
                    <xsl:value-of select="BOM/BO/INV12/row/CountryS"/>
                  </cbc:IdentificationCode>
                </cac:Country>
                
              </cac:Address>
            </cac:DeliveryLocation>
          </cac:Delivery>
        </cac:Party>
      </cac:AccountingCustomerParty>
      
<!-- TAX -->
      <cac:TaxTotal>
        <cbc:TaxAmount>
          <xsl:attribute name="currencyID">
            <xsl:value-of select="BOM/BO/OINV/row/DocCur"/>
          </xsl:attribute>
          <xsl:value-of select="BOM/BO/INV6/row/VatSum"/>
        </cbc:TaxAmount>
      </cac:TaxTotal>
      
<!-- LINES -->
      <cac:InvoiceLine>
        <xsl:for-each select="/BOM/BO/INV1/row">
          <cac:Item>
            <cbc:Name>
              <xsl:value-of select="./ItemDescription"/>
            </cbc:Name>
            <cac:SellersItemIdentification>
              <cbc:ID>
                <xsl:value-of select="./ItemCode"/>
              </cbc:ID>
            </cac:SellersItemIdentification>
          </cac:Item>
        </xsl:for-each>
      </cac:InvoiceLine>
    </cac:Invoice>
  </xsl:template>
</xsl:stylesheet>