<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" 
xmlns:ns0="www.boltrics.nl/sendreceipt:v1.00"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
 >
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <message>
      <class>nl.serac.sboconnector.addons.vanmeeuwen.StaalDuinenGRPO</class>
      <data>
        <marshalledobject>
          <BOM>
            <BO>
              <Documents>
                <row>
                  <OrderNo>
                    <xsl:value-of select="/ns0:Message/ns0:Documents/ns0:Document/ns0:ExternalDocumentNo"/>
                  </OrderNo>
                  <NumAtCard>
                    <xsl:value-of select="/ns0:Message/ns0:Documents/ns0:Document/ns0:No"/>
                  </NumAtCard>
                </row>
              </Documents>
              <Document_Lines>
                <xsl:for-each select="/ns0:Message/ns0:Documents/ns0:Document/ns0:DocumentLines/ns0:DocumentLine">
                  <row>
                    <ItemCode>
                      <xsl:value-of select="./ns0:ExternalNo" />                     
                    </ItemCode>
                    <Quantity>
                      <xsl:value-of select="./ns0:Quantity" />
                    </Quantity>
                  </row>
                </xsl:for-each>
              </Document_Lines>
            </BO>
          </BOM>
        </marshalledobject>
      </data>
    </message>
  </xsl:template>
</xsl:stylesheet>  