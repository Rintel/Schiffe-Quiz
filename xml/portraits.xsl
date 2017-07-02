<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:lido="http://www.lido-schema.org"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:p="http://example.com/Portraits">
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="lido:lidoWrap">
        <p:gallery xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                     xsi:schemaLocation="http://example.com/Portraits portraits_schema.xsd">
            <xsl:for-each select=" lido:lido">
                <p:painting>
                    <xsl:apply-templates select="lido:descriptiveMetadata/lido:objectIdentificationWrap"/>

                    <xsl:apply-templates select="lido:descriptiveMetadata/lido:eventWrap/lido:eventSet/lido:event"/>

                    <p:resourceLink>
                        <xsl:value-of
                                select="lido:administrativeMetadata/lido:resourceWrap/lido:resourceSet/lido:resourceRepresentation[@lido:type='provided_image']/lido:linkResource"/>
                    </p:resourceLink>
                </p:painting>
            </xsl:for-each>
        </p:gallery>
    </xsl:template>

    <xsl:template match="lido:objectIdentificationWrap">
        <p:title>
            <xsl:value-of select="lido:titleWrap/lido:titleSet/lido:appellationValue"/>
        </p:title>
        <p:description>
            <xsl:value-of
                    select="lido:objectDescriptionWrap/lido:objectDescriptionSet[@lido:type='Beschreibung']/lido:descriptiveNoteValue"/>
        </p:description>
    </xsl:template>

    <xsl:template match="lido:event">
        <p:actor>
            <xsl:choose>
                <xsl:when test="lido:eventActor">
                    <xsl:apply-templates select="lido:eventActor/lido:actorInRole/lido:actor"/>
                </xsl:when>
                <xsl:otherwise>
                    <p:name>unbekannt</p:name>
                    <p:birthYear/>
                    <p:deathYear/>
                </xsl:otherwise>
            </xsl:choose>
        </p:actor>
        <p:date>
            <p:earliestDate>
                <xsl:value-of select="lido:eventDate/lido:date/lido:earliestDate"/>
            </p:earliestDate>
            <p:latestDate>
                <xsl:value-of select="lido:eventDate/lido:date/lido:latestDate"/>
            </p:latestDate>
        </p:date>
        <p:materials_techniques>
            <xsl:apply-templates
                    select="lido:eventMaterialsTech/lido:materialsTech/lido:termMaterialsTech[@lido:type='Material']"/>
            <xsl:apply-templates
                    select="lido:eventMaterialsTech/lido:materialsTech/lido:termMaterialsTech[@lido:type='Technik']"/>
        </p:materials_techniques>
    </xsl:template>

    <xsl:template match="lido:actor">
        <p:name>
            <xsl:value-of select="lido:nameActorSet/lido:appellationValue"/>
        </p:name>
        <p:birthYear>
            <xsl:value-of select="lido:vitalDatesActor/lido:earliestDate"/>
        </p:birthYear>
        <p:deathYear>
            <xsl:value-of select="lido:vitalDatesActor/lido:latestDate"/>
        </p:deathYear>
    </xsl:template>

    <xsl:template match="lido:termMaterialsTech[@lido:type='Material']">
        <p:material>
            <xsl:value-of select="lido:term"/>
        </p:material>
    </xsl:template>

    <xsl:template match="lido:termMaterialsTech[@lido:type='Technik']">
        <p:technique>
            <xsl:value-of select="lido:term"/>
        </p:technique>
    </xsl:template>
</xsl:stylesheet>