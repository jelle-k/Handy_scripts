<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<message>
			<class>nl.serac.sboconnector.processors.MarshalledObjectsProcessor</class>
			<keydefinitions>
				<keydefinition>
					<objecttype>52</objecttype>
					<keyfields>U_se_ItmsGrpCod</keyfields>
				</keydefinition>
			</keydefinitions>
			<data>
				<marshalledobject>
					<BOM>
						<BO>
							<AdmInfo>
								<Version>2</Version>
								<Object>52</Object>
							</AdmInfo>
							<ItemGroups>
								<xsl:for-each select="./BOM/BO/OITB/row">
									<row>
										<GroupName>
											<xsl:value-of select="./ItmsGrpNam"/>
										</GroupName>
										<U_se_ItmsGrpCod>
											<xsl:value-of select="./ItmsGrpCod"/>
										</U_se_ItmsGrpCod>
									</row>
								</xsl:for-each>
							</ItemGroups>
						</BO>
					</BOM>
				</marshalledobject>
			</data>
		</message>
	</xsl:template>
</xsl:stylesheet>
