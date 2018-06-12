<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"  xmlns:xsl="http://www.w3.org/1999/XSL/Transform" >
  <xsl:output method="xml" encoding="UTF-8" indent="yes"/>
  <xsl:template match="/">
    <message>
      <class>nl.serac.sboconnector.processors.MarshalledObjectsProcessor</class>
      <data>
        <marshalledobject>
          <BOM>
            <BO>
              <AdmInfo>
                <Version>
                <xsl:value-of select="2" />
                </Version>
                <Object>
                  <xsl:value-of select="52" />
                </Object>
              </AdmInfo>
              <OITB>
                <row>
                  <U_se_ItmsGrpCod>
                    <xsl:value-of select="BOM/BO/OITB/row/ItmsGrpCod"/>
                  </U_se_ItmsGrpCod>
                  <ItmsGrpNam>
                    <xsl:value-of select="BOM/BO/OITB/row/ItmsGrpNam"/>
                  </ItmsGrpNam>
                </row>
              </OITB>
            </BO>
          </BOM>
        </marshalledobject>
      </data>
    </message>
  </xsl:template>
</xsl:stylesheet>  