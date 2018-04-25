<?xml version="1.0" encoding="UTF-8" ?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml"  encoding="UTF-8" indent="yes" />
  <xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <BOM>
      <BO>
        <AdmInfo>
          <Object>
            <xsl:value-of select="-1"/>
          </Object>
        </AdmInfo>
        <SE_DIES_EXPORT>
          <xsl:apply-templates select="BOM/BO/SE_DIES_EXPORT/row[U_se_exclude='N']"/>
        </SE_DIES_EXPORT>
      </BO>
    </BOM>
  </xsl:template>
  <xsl:template match="@*|node()">
    <xsl:copy>
      <xsl:apply-templates select="@*|node()"/>
    </xsl:copy>
  </xsl:template>
</xsl:transform>