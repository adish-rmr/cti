<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:i6="http://iuclid6.echa.europa.eu/namespaces/platform-fields/v1" xmlns:i6c="http://iuclid6.echa.europa.eu/namespaces/platform-container/v1" xmlns:xt="http://iuclid6.echa.europa.eu/namespaces/ENDPOINT_SUMMARY-DataTox/7.0" version="1.0">
    <xsl:template match="/">
        <html>
            <head>
                <link href="iuclid6_style.css" rel="stylesheet" type="text/css"/>
            </head>
            <body>
                <table>
                    <tr/>
                    <xsl:apply-templates/>
                </table>
            </body>
        </html>
    </xsl:template>
    <xsl:template match="//i6c:PlatformMetadata | //i6c:Attachments | //i6c:ModificationHistory"/>
    <xsl:template match="//xt:ENDPOINT_SUMMARY">
        <tr class="headerDocument">
            <td>Toxicological information</td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:Extrapolated | //xt:Extrapolated | //xt:Extrapolated | //xt:Extrapolated | //xt:Extrapolated | //xt:Extrapolated | //xt:Extrapolated">
        <tr>
            <td class="label">DNEL extrapolated from long term DNEL</td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:DataProtection">
        <tr>
            <td class="label"/>
            <td class="value">
                <xsl:apply-templates/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AssessmentFactor | //xt:DoseResponseAF | //xt:DiffInDurationAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:OverallAssessmentFactor | //xt:DoseResponseAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityDatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:AssessmentFactor | //xt:DoseResponseAF | //xt:DiffInDurationAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:OverallAssessmentFactor | //xt:DoseResponseAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityDatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:AssessmentFactor | //xt:DoseResponseAF | //xt:DiffInDurationAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:OverallAssessmentFactor | //xt:DoseResponseAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityDatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:AssessmentFactor | //xt:DoseResponseAF | //xt:DiffInDurationAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:OverallAssessmentFactor | //xt:DoseResponseAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityDatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:AssessmentFactor | //xt:DoseResponseAF | //xt:DiffInDurationAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:OverallAssessmentFactor | //xt:DoseResponseAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityDatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:AssessmentFactor | //xt:DoseResponseAF | //xt:DiffInDurationAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:OverallAssessmentFactor | //xt:DoseResponseAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityDatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:AssessmentFactor | //xt:DoseResponseAF | //xt:DiffInDurationAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:OverallAssessmentFactor | //xt:DoseResponseAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityDatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:AssessmentFactor | //xt:DoseResponseAF | //xt:DiffInDurationAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:OverallAssessmentFactor | //xt:DoseResponseAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityDatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:AssessmentFactor | //xt:DoseResponseAF | //xt:DiffInDurationAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityAF | //xt:OthUncertaintiesAF | //xt:OverallAssessmentFactor | //xt:DoseResponseAF | //xt:InterspeciesAF | //xt:OthInterspeciesAF | //xt:IntraspeciesAF | //xt:DatabaseQualityDatabaseQualityAF | //xt:OthUncertaintiesAF">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'IntraspeciesAF'">AF for intraspecies differences</xsl:when>
                    <xsl:when test="name(.) = 'InterspeciesAF'">AF for interspecies differences (allometric scaling)</xsl:when>
                    <xsl:when test="name(.) = 'DatabaseQualityDatabaseQualityAF'">AF for the quality of the whole database</xsl:when>
                    <xsl:when test="name(.) = 'DoseResponseAF'">AF for dose response relationship</xsl:when>
                    <xsl:when test="name(.) = 'DiffInDurationAF'">AF for differences in duration of exposure</xsl:when>
                    <xsl:when test="name(.) = 'OthInterspeciesAF'">AF for other interspecies differences</xsl:when>
                    <xsl:when test="name(.) = 'DatabaseQualityAF'">AF for the quality of the whole database</xsl:when>
                    <xsl:when test="name(.) = 'OverallAssessmentFactor'">Overall assessment factor (AF)</xsl:when>
                    <xsl:when test="name(.) = 'AssessmentFactor'">Overall assessment factor (AF)</xsl:when>
                    <xsl:when test="name(.) = 'OthUncertaintiesAF'">AF for remaining uncertainties</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:StDose | //xt:StDose | //xt:StDoseRTR | //xt:StDose | //xt:StDose | //xt:StDoseRTR | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDoseRTR | //xt:StDose | //xt:StDose | //xt:StDoseRTR | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDoseRTR | //xt:StDose | //xt:StDose | //xt:StDoseRTR | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDoseRTR | //xt:StDose | //xt:StDose | //xt:StDoseRTR | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDose | //xt:StDoseRTR | //xt:StDose | //xt:StDose | //xt:StDoseRTR">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'StDose'">Value</xsl:when>
                    <xsl:when test="name(.) = 'StDoseRTR'">Value</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select="./value "/>
                <xsl:choose>
                    <xsl:when test="./unitCode = '8100'"> ng/m³</xsl:when>
                    <xsl:when test="./unitCode = '8101'"> µg/m³</xsl:when>
                    <xsl:when test="./unitCode = '3440'"> mg/m³</xsl:when>
                    <xsl:when test="./unitCode = '2098'"> mg/L</xsl:when>
                    <xsl:when test="./unitCode = '58256'"> ppm</xsl:when>
                    <xsl:when test="./unitCode = '58419'"> mg/m³</xsl:when>
                    <xsl:when test="./unitCode = '8098'"> ng/kg bw/day</xsl:when>
                    <xsl:when test="./unitCode = '8099'"> µg/kg bw/day</xsl:when>
                    <xsl:when test="./unitCode = '2085'"> mg/kg bw/day</xsl:when>
                    <xsl:when test="./unitCode = '8319'"> % in mixture (weight basis)</xsl:when>
                    <xsl:when test="./unitCode = '8102'"> ng/cm²</xsl:when>
                    <xsl:when test="./unitCode = '8103'"> µg/cm²</xsl:when>
                    <xsl:when test="./unitCode = '2077'"> mg/cm²</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./unitOther "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:DerivationMethod | //xt:DoseDescriptorStart | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:DerivationMethod | //xt:DoseDescriptorStart | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:DerivationMethod | //xt:DoseDescriptorStart | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:DerivationMethod | //xt:DoseDescriptorStart | //xt:Conclusion | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:DerivationMethod | //xt:DoseDescriptorStart | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:DerivationMethod | //xt:DoseDescriptorStart | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:DerivationMethod | //xt:DoseDescriptorStart | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:DerivationMethod | //xt:DoseDescriptorStart | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:HazardAssessment | //xt:MostSensitiveEndpoint | //xt:OriginalStudy | //xt:DerivationMethod | //xt:DoseDescriptorStartingPoint | //xt:DoseDescriptorStartRTR | //xt:Conclusion">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'DoseDescriptorStartingPoint'">Dose descriptor starting point</xsl:when>
                    <xsl:when test="name(.) = 'HazardAssessment'">Hazard assessment conclusion</xsl:when>
                    <xsl:when test="name(.) = 'DerivationMethod'">DNEL derivation method</xsl:when>
                    <xsl:when test="name(.) = 'DoseDescriptorStartRTR'">Modified dose descriptor starting point</xsl:when>
                    <xsl:when test="name(.) = 'MostSensitiveEndpoint'">Most sensitive endpoint</xsl:when>
                    <xsl:when test="name(.) = 'OriginalStudy'">Route of original study</xsl:when>
                    <xsl:when test="name(.) = 'DoseDescriptorStart'">Dose descriptor starting point</xsl:when>
                    <xsl:when test="name(.) = 'Conclusion'">Hazard assessment conclusion</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:choose>
                    <xsl:when test="./i6:value = '8309'">insufficient data available: testing proposed</xsl:when>
                    <xsl:when test="./i6:value = '8295'">no data available: testing technically not feasible</xsl:when>
                    <xsl:when test="./i6:value = '8314'">no-threshold effect and/or no dose-response information available</xsl:when>
                    <xsl:when test="./i6:value = '8318'">exposure based waiving</xsl:when>
                    <xsl:when test="./i6:value = '8316'">DNEL (Derived No Effect Level)</xsl:when>
                    <xsl:when test="./i6:value = '8317'">DMEL (Derived Minimum Effect Level)</xsl:when>
                    <xsl:when test="./i6:value = '8326'">other toxicological threshold</xsl:when>
                    <xsl:when test="./i6:value = '8327'">low hazard (no threshold derived)</xsl:when>
                    <xsl:when test="./i6:value = '8328'">medium hazard (no threshold derived)</xsl:when>
                    <xsl:when test="./i6:value = '8329'">high hazard (no threshold derived)</xsl:when>
                    <xsl:when test="./i6:value = '8330'">hazard unknown (no further information necessary)</xsl:when>
                    <xsl:when test="./i6:value = '62037'">hazard unknown but no further hazard information necessary as no exposure expected</xsl:when>
                    <xsl:when test="./i6:value = '8342'">insufficient hazard data available (further information necessary)</xsl:when>
                    <xsl:when test="./i6:value = '8322'">no hazard identified</xsl:when>
                    <xsl:when test="./i6:value = '5676'">acute toxicity</xsl:when>
                    <xsl:when test="./i6:value = '5677'">repeated dose toxicity</xsl:when>
                    <xsl:when test="./i6:value = '6626'">effect on fertility</xsl:when>
                    <xsl:when test="./i6:value = '4155'">developmental toxicity / teratogenicity</xsl:when>
                    <xsl:when test="./i6:value = '2936'">neurotoxicity</xsl:when>
                    <xsl:when test="./i6:value = '2862'">immunotoxicity</xsl:when>
                    <xsl:when test="./i6:value = '6627'">sensitisation (skin)</xsl:when>
                    <xsl:when test="./i6:value = '6628'">sensitisation (respiratory tract)</xsl:when>
                    <xsl:when test="./i6:value = '2743'">carcinogenicity</xsl:when>
                    <xsl:when test="./i6:value = '6629'">skin irritation/corrosion</xsl:when>
                    <xsl:when test="./i6:value = '6630'">irritation (respiratory tract)</xsl:when>
                    <xsl:when test="./i6:value = '4153'">genetic toxicity</xsl:when>
                    <xsl:when test="./i6:value = '5136'">Oral</xsl:when>
                    <xsl:when test="./i6:value = '5137'">Dermal</xsl:when>
                    <xsl:when test="./i6:value = '5138'">By inhalation</xsl:when>
                    <xsl:when test="./i6:value = '8341'">ECHA REACH Guidance</xsl:when>
                    <xsl:when test="./i6:value = '1342'">other:</xsl:when>
                    <xsl:when test="./i6:value = '4147'">NOAEC</xsl:when>
                    <xsl:when test="./i6:value = '4148'">LOAEC</xsl:when>
                    <xsl:when test="./i6:value = '5759'">BMCL05</xsl:when>
                    <xsl:when test="./i6:value = '5760'">BMC05</xsl:when>
                    <xsl:when test="./i6:value = '5761'">BMCL10</xsl:when>
                    <xsl:when test="./i6:value = '1109'">NOAEL</xsl:when>
                    <xsl:when test="./i6:value = '937'">LOAEL</xsl:when>
                    <xsl:when test="./i6:value = '5672'">BMDL05</xsl:when>
                    <xsl:when test="./i6:value = '5673'">BMD05</xsl:when>
                    <xsl:when test="./i6:value = '5674'">BMDL10</xsl:when>
                    <xsl:when test="./i6:value = '5675'">T25</xsl:when>
                    <xsl:when test="./i6:value = '8340'">no DNEL required: short term exposure controlled by conditions for long-term</xsl:when>
                </xsl:choose>
                <xsl:value-of select="./i6:other "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//xt:AdministrativeDataSummary | //xt:WorkersHazardViaInhalationRoute | //xt:SystemicEffects | //xt:LongTermStudy | //xt:DNMELInfoWithRTR | //xt:ExplanationForHazardConclusion | //xt:AcuteShortTermExposureStudy | //xt:DNELInfoWithRouteToRouteWithExtrapolation | //xt:ExplanationForHazardConclusion | //xt:LocalEffects | //xt:LongTermNoStudy | //xt:DNMELInfoWithoutRTR | //xt:ExplanationForHazardConclusion | //xt:AcuteShortTermExposureStudy | //xt:DNELInfoWithoutRouteToRouteWithExtrapolation | //xt:ExplanationForHazardConclusion | //xt:WorkersHazardViaDermalRoute | //xt:SystemicEffects | //xt:LongTermStudy | //xt:DNMELInfoWithRTR | //xt:ExplanationForHazardConclusion | //xt:AcuteShortTermExposureStudy | //xt:DNELInfoWithRouteToRouteWithExtrapolation | //xt:ExplanationForHazardConclusion | //xt:LocalEffects | //xt:LongTermNoStudy | //xt:DNMELInfoWithoutRTR | //xt:ExplanationForHazardConclusion | //xt:AcuteShortTermExposureStudy | //xt:DNELInfoWithoutRouteToRouteWithoutExtrapolation | //xt:ExplanationForHazardConclusion | //xt:WorkersHazardForTheEyes | //xt:EyesLocalEffects | //xt:AdditionalInformationWorkers | //xt:GeneralPopulationHazardViaInhalationRoute | //xt:SystemicEffects | //xt:LongTermStudy | //xt:DNMELInfoWithRTR | //xt:ExplanationForHazardConclusion | //xt:AcuteShortTermExposureStudy | //xt:DNELInfoWithRouteToRouteWithExtrapolation | //xt:ExplanationForHazardConclusion | //xt:LocalEffects | //xt:LongTermNoStudy | //xt:DNMELInfoWithoutRTR | //xt:ExplanationForHazardConclusion | //xt:AcuteShortTermExposureStudy | //xt:DNELInfoWithoutRouteToRouteWithExtrapolation | //xt:ExplanationForHazardConclusion | //xt:GeneralPopulationHazardViaDermalRoute | //xt:SystemicEffects | //xt:LongTermStudy | //xt:DNMELInfoWithRTR | //xt:ExplanationForHazardConclusion | //xt:AcuteShortTermExposureStudy | //xt:DNELInfoWithRouteToRouteWithExtrapolation | //xt:ExplanationForHazardConclusion | //xt:LocalEffects | //xt:LongTermNoStudy | //xt:DNMELInfoWithoutRTR | //xt:ExplanationForHazardConclusion | //xt:AcuteShortTermExposureStudy | //xt:DNELInfoWithoutRouteToRouteWithoutExtrapolation | //xt:ExplanationForHazardConclusion | //xt:GeneralPopulationHazardViaOralRoute | //xt:SystemicEffects | //xt:LongTermStudy | //xt:DNMELInfoWithRTR | //xt:ExplanationForHazardConclusion | //xt:AcuteShortTermExposureStudy | //xt:DNELInfoWithRouteToRouteWithExtrapolation | //xt:ExplanationForHazardConclusion | //xt:GeneralPopulationHazardForTheEyes | //xt:EyesLocalEffects | //xt:AdditionalInformationGeneralPopulation">
        <tr class="headerBlock">
            <td>
                <xsl:choose>
                    <xsl:when test="name(.) = 'GeneralPopulationHazardViaInhalationRoute'">General Population - Hazard via inhalation route</xsl:when>
                    <xsl:when test="name(.) = 'DNELInfoWithRouteToRouteWithExtrapolation'">DNEL related information</xsl:when>
                    <xsl:when test="name(.) = 'AdditionalInformationGeneralPopulation'">Additional information - General Population</xsl:when>
                    <xsl:when test="name(.) = 'DNMELInfoWithoutRTR'">DNEL related information</xsl:when>
                    <xsl:when test="name(.) = 'AcuteShortTermExposureStudy'">Acute/short term exposure</xsl:when>
                    <xsl:when test="name(.) = 'GeneralPopulationHazardForTheEyes'">General Population - Hazard for the eyes</xsl:when>
                    <xsl:when test="name(.) = 'LongTermNoStudy'">Long term exposure</xsl:when>
                    <xsl:when test="name(.) = 'AdministrativeDataSummary'">Administrative data</xsl:when>
                    <xsl:when test="name(.) = 'WorkersHazardViaInhalationRoute'">Workers - Hazard via inhalation route</xsl:when>
                    <xsl:when test="name(.) = 'GeneralPopulationHazardViaOralRoute'">General Population - Hazard via oral route</xsl:when>
                    <xsl:when test="name(.) = 'LocalEffects'">Local effects</xsl:when>
                    <xsl:when test="name(.) = 'GeneralPopulationHazardViaDermalRoute'">General Population - Hazard via dermal route</xsl:when>
                    <xsl:when test="name(.) = 'DNMELInfoWithRTR'">DNEL related information</xsl:when>
                    <xsl:when test="name(.) = 'ExplanationForHazardConclusion'">Explanation for hazard conclusion</xsl:when>
                    <xsl:when test="name(.) = 'WorkersHazardForTheEyes'">Workers - Hazard for the eyes</xsl:when>
                    <xsl:when test="name(.) = 'LongTermStudy'">Long term exposure</xsl:when>
                    <xsl:when test="name(.) = 'SystemicEffects'">Systemic effects</xsl:when>
                    <xsl:when test="name(.) = 'DNELInfoWithoutRouteToRouteWithExtrapolation'">DNEL related information</xsl:when>
                    <xsl:when test="name(.) = 'DNELInfoWithoutRouteToRouteWithoutExtrapolation'">DNEL related information</xsl:when>
                    <xsl:when test="name(.) = 'AdditionalInformationWorkers'">Additional information - workers</xsl:when>
                    <xsl:when test="name(.) = 'WorkersHazardViaDermalRoute'">Workers - Hazard via dermal route</xsl:when>
                    <xsl:when test="name(.) = 'EyesLocalEffects'">Local effects</xsl:when>
                </xsl:choose>
            </td>
            <td>
                <hr/>
            </td>
        </tr>
        <xsl:apply-templates select="./@*"/>
        <xsl:apply-templates/>
    </xsl:template>
    <xsl:template match="//xt:JustificationRTR | //xt:DoseResponseJustif | //xt:DiffInDurationJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustif | //xt:DatabaseJustif | //xt:OthUncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseDescriptorJustificationRTR | //xt:DoseResponseJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustifAF | //xt:DatabaseQualityJustif | //xt:UncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseResponseJustif | //xt:DiffInDurationJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustif | //xt:DatabaseJustif | //xt:OthUncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseResponseJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustifAF | //xt:DatabaseQualityJustif | //xt:UncertaintiesJustif | //xt:JustificationAndComments | //xt:JustificationRTR | //xt:DoseResponseJustif | //xt:DiffInDurationJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustif | //xt:DatabaseJustif | //xt:OthUncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseDescriptorJustificationRTR | //xt:DoseResponseJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustifAF | //xt:DatabaseQualityJustif | //xt:UncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseResponseJustif | //xt:DiffInDurationJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustif | //xt:DatabaseJustif | //xt:OthUncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseResponseJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustifAF | //xt:DatabaseQualityJustif | //xt:UncertaintiesJustif | //xt:JustificationAndComments | //xt:Comments | //xt:DiscussionWorkers | //xt:JustificationRTR | //xt:DoseResponseJustif | //xt:DiffInDurationJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustif | //xt:DatabaseJustif | //xt:OthUncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseDescriptorJustificationRTR | //xt:DoseResponseJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustifAF | //xt:DatabaseQualityJustif | //xt:UncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseResponseJustif | //xt:DiffInDurationJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustif | //xt:DatabaseJustif | //xt:OthUncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseResponseJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustifAF | //xt:DatabaseQualityJustif | //xt:UncertaintiesJustif | //xt:JustificationAndComments | //xt:JustificationRTR | //xt:DoseResponseJustif | //xt:DiffInDurationJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustif | //xt:DatabaseJustif | //xt:OthUncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseDescriptorJustificationRTR | //xt:DoseResponseJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustifAF | //xt:DatabaseQualityJustif | //xt:UncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseResponseJustif | //xt:DiffInDurationJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustif | //xt:DatabaseJustif | //xt:OthUncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseResponseJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustifAF | //xt:DatabaseQualityJustif | //xt:UncertaintiesJustif | //xt:JustificationAndComments | //xt:JustificationRTR | //xt:DoseResponseJustif | //xt:DiffInDurationJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustif | //xt:DatabaseJustif | //xt:OthUncertaintiesJustif | //xt:JustificationAndComments | //xt:DoseDescriptorJustificationRTR | //xt:DoseResponseJustif | //xt:InterspeciesJustif | //xt:OthInterspeciesJustif | //xt:IntraspeciesJustifAF | //xt:DatabaseQualityJustif | //xt:UncertaintiesJustif | //xt:JustificationAndComments | //xt:Comments | //xt:DiscussionGenPop">
        <tr>
            <td class="label">
                <xsl:choose>
                    <xsl:when test="name(.) = 'IntraspeciesJustif'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'DatabaseQualityJustif'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'OthUncertaintiesJustif'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'Comments'">Explanation for hazard conclusion</xsl:when>
                    <xsl:when test="name(.) = 'DoseResponseJustif'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'IntraspeciesJustifAF'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'DiscussionGenPop'"/>
                    <xsl:when test="name(.) = 'DiscussionWorkers'"/>
                    <xsl:when test="name(.) = 'DatabaseJustif'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'DoseDescriptorJustificationRTR'">Explanation for the modification of the dose descriptor starting point</xsl:when>
                    <xsl:when test="name(.) = 'OthInterspeciesJustif'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'UncertaintiesJustif'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'InterspeciesJustif'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'DiffInDurationJustif'">Justification</xsl:when>
                    <xsl:when test="name(.) = 'JustificationRTR'">Explanation for the modification of the dose descriptor starting point</xsl:when>
                    <xsl:when test="name(.) = 'JustificationAndComments'">Explanation for hazard conclusion</xsl:when>
                </xsl:choose>
            </td>
            <td class="value">
                <xsl:value-of select=". "/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="//i6:country/i6:value">
        <xsl:choose>
            <xsl:when test=". = '2683'">Afghanistan </xsl:when>
            <xsl:when test=". = '2684'">Albania </xsl:when>
            <xsl:when test=". = '2685'">Algeria </xsl:when>
            <xsl:when test=". = '2686'">American Samoa </xsl:when>
            <xsl:when test=". = '2688'">Andorra </xsl:when>
            <xsl:when test=". = '2689'">Angola </xsl:when>
            <xsl:when test=". = '2690'">Anguilla </xsl:when>
            <xsl:when test=". = '2692'">Antarctica </xsl:when>
            <xsl:when test=". = '2695'">Antigua and Barbuda </xsl:when>
            <xsl:when test=". = '2696'">Argentina </xsl:when>
            <xsl:when test=". = '2697'">Armenia </xsl:when>
            <xsl:when test=". = '2698'">Aruba </xsl:when>
            <xsl:when test=". = '107'">Australia </xsl:when>
            <xsl:when test=". = '108'">Austria </xsl:when>
            <xsl:when test=". = '2701'">Azerbaijan </xsl:when>
            <xsl:when test=". = '2702'">Bahamas (the) </xsl:when>
            <xsl:when test=". = '2703'">Bahrain </xsl:when>
            <xsl:when test=". = '2704'">Bangladesh </xsl:when>
            <xsl:when test=". = '2705'">Barbados </xsl:when>
            <xsl:when test=". = '2707'">Belarus </xsl:when>
            <xsl:when test=". = '147'">Belgium </xsl:when>
            <xsl:when test=". = '2708'">Belize </xsl:when>
            <xsl:when test=". = '2709'">Benin </xsl:when>
            <xsl:when test=". = '2710'">Bermuda </xsl:when>
            <xsl:when test=". = '2711'">Bhutan </xsl:when>
            <xsl:when test=". = '2720'">Bolivia (Plurinational State of) </xsl:when>
            <xsl:when test=". = '65600'">Bonaire, Sint Eustatius and Saba </xsl:when>
            <xsl:when test=". = '2722'">Bosnia and Herzegovina </xsl:when>
            <xsl:when test=". = '2723'">Botswana </xsl:when>
            <xsl:when test=". = '2724'">Bouvet Island </xsl:when>
            <xsl:when test=". = '2725'">Brazil </xsl:when>
            <xsl:when test=". = '2726'">British Indian Ocean Territory (the) </xsl:when>
            <xsl:when test=". = '2727'">Brunei Darussalam </xsl:when>
            <xsl:when test=". = '184'">Bulgaria </xsl:when>
            <xsl:when test=". = '2729'">Burkina Faso </xsl:when>
            <xsl:when test=". = '2730'">Burundi </xsl:when>
            <xsl:when test=". = '2736'">Cabo Verde </xsl:when>
            <xsl:when test=". = '2734'">Cambodia </xsl:when>
            <xsl:when test=". = '2735'">Cameroon </xsl:when>
            <xsl:when test=". = '206'">Canada </xsl:when>
            <xsl:when test=". = '2746'">Cayman Islands (the) </xsl:when>
            <xsl:when test=". = '2747'">Central African Republic (the) </xsl:when>
            <xsl:when test=". = '2748'">Chad </xsl:when>
            <xsl:when test=". = '2749'">Chile </xsl:when>
            <xsl:when test=". = '2750'">China </xsl:when>
            <xsl:when test=". = '2751'">Christmas Island </xsl:when>
            <xsl:when test=". = '2754'">Cocos (Keeling) Islands (the) </xsl:when>
            <xsl:when test=". = '2755'">Colombia </xsl:when>
            <xsl:when test=". = '2759'">Comoros (the) </xsl:when>
            <xsl:when test=". = '2765'">Congo (the Democratic Republic of the) </xsl:when>
            <xsl:when test=". = '2764'">Congo (the) </xsl:when>
            <xsl:when test=". = '2769'">Cook Islands (the) </xsl:when>
            <xsl:when test=". = '2771'">Costa Rica </xsl:when>
            <xsl:when test=". = '286'">Croatia </xsl:when>
            <xsl:when test=". = '2773'">Cuba </xsl:when>
            <xsl:when test=". = '65601'">Curaçao </xsl:when>
            <xsl:when test=". = '304'">Cyprus </xsl:when>
            <xsl:when test=". = '307'">Czechia </xsl:when>
            <xsl:when test=". = '2774'">Côte d'Ivoire </xsl:when>
            <xsl:when test=". = '333'">Denmark </xsl:when>
            <xsl:when test=". = '2790'">Djibouti </xsl:when>
            <xsl:when test=". = '2791'">Dominica </xsl:when>
            <xsl:when test=". = '2792'">Dominican Republic (the) </xsl:when>
            <xsl:when test=". = '2799'">Ecuador </xsl:when>
            <xsl:when test=". = '2800'">Egypt </xsl:when>
            <xsl:when test=". = '2801'">El Salvador </xsl:when>
            <xsl:when test=". = '2803'">Equatorial Guinea </xsl:when>
            <xsl:when test=". = '2804'">Eritrea </xsl:when>
            <xsl:when test=". = '754'">Estonia </xsl:when>
            <xsl:when test=". = '3358'">Eswatini </xsl:when>
            <xsl:when test=". = '2805'">Ethiopia </xsl:when>
            <xsl:when test=". = '2813'">Falkland Islands (the) [Malvinas] </xsl:when>
            <xsl:when test=". = '2815'">Faroe Islands (the) </xsl:when>
            <xsl:when test=". = '2817'">Fiji </xsl:when>
            <xsl:when test=". = '766'">Finland </xsl:when>
            <xsl:when test=". = '779'">France </xsl:when>
            <xsl:when test=". = '2825'">French Guiana </xsl:when>
            <xsl:when test=". = '2826'">French Polynesia </xsl:when>
            <xsl:when test=". = '2827'">French Southern Territories (the) </xsl:when>
            <xsl:when test=". = '2828'">Gabon </xsl:when>
            <xsl:when test=". = '2829'">Gambia (the) </xsl:when>
            <xsl:when test=". = '2834'">Georgia </xsl:when>
            <xsl:when test=". = '807'">Germany </xsl:when>
            <xsl:when test=". = '2835'">Ghana </xsl:when>
            <xsl:when test=". = '2836'">Gibraltar </xsl:when>
            <xsl:when test=". = '810'">Greece </xsl:when>
            <xsl:when test=". = '2838'">Greenland </xsl:when>
            <xsl:when test=". = '2839'">Grenada </xsl:when>
            <xsl:when test=". = '2840'">Guadeloupe </xsl:when>
            <xsl:when test=". = '2841'">Guam </xsl:when>
            <xsl:when test=". = '2842'">Guatemala </xsl:when>
            <xsl:when test=". = '7818'">Guernsey </xsl:when>
            <xsl:when test=". = '2843'">Guinea </xsl:when>
            <xsl:when test=". = '2844'">Guinea-Bissau </xsl:when>
            <xsl:when test=". = '2845'">Guyana </xsl:when>
            <xsl:when test=". = '2846'">Haiti </xsl:when>
            <xsl:when test=". = '2851'">Heard Island and McDonald Islands </xsl:when>
            <xsl:when test=". = '2854'">Holy See (the) </xsl:when>
            <xsl:when test=". = '2855'">Honduras </xsl:when>
            <xsl:when test=". = '2856'">Hong Kong </xsl:when>
            <xsl:when test=". = '845'">Hungary </xsl:when>
            <xsl:when test=". = '882'">Iceland </xsl:when>
            <xsl:when test=". = '2865'">India </xsl:when>
            <xsl:when test=". = '2866'">Indonesia </xsl:when>
            <xsl:when test=". = '2870'">Iran (Islamic Republic of) </xsl:when>
            <xsl:when test=". = '2871'">Iraq </xsl:when>
            <xsl:when test=". = '911'">Ireland </xsl:when>
            <xsl:when test=". = '7819'">Isle of Man </xsl:when>
            <xsl:when test=". = '2876'">Israel </xsl:when>
            <xsl:when test=". = '916'">Italy </xsl:when>
            <xsl:when test=". = '2877'">Jamaica </xsl:when>
            <xsl:when test=". = '918'">Japan </xsl:when>
            <xsl:when test=". = '7820'">Jersey </xsl:when>
            <xsl:when test=". = '2878'">Jordan </xsl:when>
            <xsl:when test=". = '2879'">Kazakhstan </xsl:when>
            <xsl:when test=". = '2880'">Kenya </xsl:when>
            <xsl:when test=". = '2881'">Kiribati </xsl:when>
            <xsl:when test=". = '2882'">Korea (the Democratic People's Republic of) </xsl:when>
            <xsl:when test=". = '2883'">Korea (the Republic of) </xsl:when>
            <xsl:when test=". = '2884'">Kuwait </xsl:when>
            <xsl:when test=". = '2885'">Kyrgyzstan </xsl:when>
            <xsl:when test=". = '2886'">Lao People's Democratic Republic (the) </xsl:when>
            <xsl:when test=". = '985'">Latvia </xsl:when>
            <xsl:when test=". = '2887'">Lebanon </xsl:when>
            <xsl:when test=". = '2888'">Lesotho </xsl:when>
            <xsl:when test=". = '2889'">Liberia </xsl:when>
            <xsl:when test=". = '2890'">Libya </xsl:when>
            <xsl:when test=". = '2891'">Liechtenstein </xsl:when>
            <xsl:when test=". = '1024'">Lithuania </xsl:when>
            <xsl:when test=". = '1041'">Luxembourg </xsl:when>
            <xsl:when test=". = '2896'">Macao </xsl:when>
            <xsl:when test=". = '2898'">Madagascar </xsl:when>
            <xsl:when test=". = '2899'">Malawi </xsl:when>
            <xsl:when test=". = '2900'">Malaysia </xsl:when>
            <xsl:when test=". = '2901'">Maldives </xsl:when>
            <xsl:when test=". = '2902'">Mali </xsl:when>
            <xsl:when test=". = '1048'">Malta </xsl:when>
            <xsl:when test=". = '2904'">Marshall Islands (the) </xsl:when>
            <xsl:when test=". = '2905'">Martinique </xsl:when>
            <xsl:when test=". = '2908'">Mauritania </xsl:when>
            <xsl:when test=". = '2909'">Mauritius </xsl:when>
            <xsl:when test=". = '2910'">Mayotte </xsl:when>
            <xsl:when test=". = '1067'">Mexico </xsl:when>
            <xsl:when test=". = '3877'">Micronesia (Federated States of) </xsl:when>
            <xsl:when test=". = '2919'">Moldova (the Republic of) </xsl:when>
            <xsl:when test=". = '2921'">Monaco </xsl:when>
            <xsl:when test=". = '2922'">Mongolia </xsl:when>
            <xsl:when test=". = '7821'">Montenegro </xsl:when>
            <xsl:when test=". = '2924'">Montserrat </xsl:when>
            <xsl:when test=". = '2925'">Morocco </xsl:when>
            <xsl:when test=". = '2926'">Mozambique </xsl:when>
            <xsl:when test=". = '2930'">Myanmar </xsl:when>
            <xsl:when test=". = '2932'">Namibia </xsl:when>
            <xsl:when test=". = '2933'">Nauru </xsl:when>
            <xsl:when test=". = '2934'">Nepal </xsl:when>
            <xsl:when test=". = '1158'">Netherlands (the) </xsl:when>
            <xsl:when test=". = '2935'">Netherlands Antilles </xsl:when>
            <xsl:when test=". = '2938'">New Caledonia </xsl:when>
            <xsl:when test=". = '1161'">New Zealand </xsl:when>
            <xsl:when test=". = '2939'">Nicaragua </xsl:when>
            <xsl:when test=". = '2940'">Niger (the) </xsl:when>
            <xsl:when test=". = '2941'">Nigeria </xsl:when>
            <xsl:when test=". = '2942'">Niue </xsl:when>
            <xsl:when test=". = '2945'">Norfolk Island </xsl:when>
            <xsl:when test=". = '2897'">North Macedonia </xsl:when>
            <xsl:when test=". = '2946'">Northern Mariana Islands (the) </xsl:when>
            <xsl:when test=". = '1175'">Norway </xsl:when>
            <xsl:when test=". = '2977'">Oman </xsl:when>
            <xsl:when test=". = '2984'">Pakistan </xsl:when>
            <xsl:when test=". = '2985'">Palau </xsl:when>
            <xsl:when test=". = '2986'">Palestine, State of </xsl:when>
            <xsl:when test=". = '2987'">Panama </xsl:when>
            <xsl:when test=". = '2988'">Papua New Guinea </xsl:when>
            <xsl:when test=". = '2989'">Paraguay </xsl:when>
            <xsl:when test=". = '2994'">Peru </xsl:when>
            <xsl:when test=". = '2995'">Philippines (the) </xsl:when>
            <xsl:when test=". = '3000'">Pitcairn </xsl:when>
            <xsl:when test=". = '1394'">Poland </xsl:when>
            <xsl:when test=". = '1401'">Portugal </xsl:when>
            <xsl:when test=". = '3027'">Puerto Rico </xsl:when>
            <xsl:when test=". = '3028'">Qatar </xsl:when>
            <xsl:when test=". = '1496'">Romania </xsl:when>
            <xsl:when test=". = '3175'">Russian Federation (the) </xsl:when>
            <xsl:when test=". = '3176'">Rwanda </xsl:when>
            <xsl:when test=". = '3177'">Réunion </xsl:when>
            <xsl:when test=". = '7823'">Saint Barthélemy </xsl:when>
            <xsl:when test=". = '3318'">Saint Helena, Ascension and Tristan da Cunha </xsl:when>
            <xsl:when test=". = '3319'">Saint Kitts and Nevis </xsl:when>
            <xsl:when test=". = '3320'">Saint Lucia </xsl:when>
            <xsl:when test=". = '7824'">Saint Martin (French part) </xsl:when>
            <xsl:when test=". = '3321'">Saint Pierre and Miquelon </xsl:when>
            <xsl:when test=". = '3322'">Saint Vincent and the Grenadines </xsl:when>
            <xsl:when test=". = '3323'">Samoa </xsl:when>
            <xsl:when test=". = '3324'">San Marino </xsl:when>
            <xsl:when test=". = '3325'">Sao Tome and Principe </xsl:when>
            <xsl:when test=". = '3326'">Saudi Arabia </xsl:when>
            <xsl:when test=". = '3328'">Senegal </xsl:when>
            <xsl:when test=". = '3332'">Serbia </xsl:when>
            <xsl:when test=". = '3333'">Seychelles </xsl:when>
            <xsl:when test=". = '3336'">Sierra Leone </xsl:when>
            <xsl:when test=". = '3337'">Singapore </xsl:when>
            <xsl:when test=". = '65602'">Sint Maarten (Dutch part) </xsl:when>
            <xsl:when test=". = '3339'">Slovakia </xsl:when>
            <xsl:when test=". = '1562'">Slovenia </xsl:when>
            <xsl:when test=". = '3340'">Solomon Islands </xsl:when>
            <xsl:when test=". = '3343'">Somalia </xsl:when>
            <xsl:when test=". = '3344'">South Africa </xsl:when>
            <xsl:when test=". = '3345'">South Georgia and the South Sandwich Islands </xsl:when>
            <xsl:when test=". = '65603'">South Sudan </xsl:when>
            <xsl:when test=". = '1567'">Spain </xsl:when>
            <xsl:when test=". = '3346'">Sri Lanka </xsl:when>
            <xsl:when test=". = '3352'">Sudan (the) </xsl:when>
            <xsl:when test=". = '3355'">Suriname </xsl:when>
            <xsl:when test=". = '3357'">Svalbard and Jan Mayen </xsl:when>
            <xsl:when test=". = '1591'">Sweden </xsl:when>
            <xsl:when test=". = '1595'">Switzerland </xsl:when>
            <xsl:when test=". = '3359'">Syrian Arab Republic (the) </xsl:when>
            <xsl:when test=". = '3362'">Taiwan </xsl:when>
            <xsl:when test=". = '3363'">Tajikistan </xsl:when>
            <xsl:when test=". = '3364'">Tanzania, the United Republic of </xsl:when>
            <xsl:when test=". = '3366'">Thailand </xsl:when>
            <xsl:when test=". = '3370'">Timor-Leste </xsl:when>
            <xsl:when test=". = '3371'">Togo </xsl:when>
            <xsl:when test=". = '3372'">Tokelau </xsl:when>
            <xsl:when test=". = '3373'">Tonga </xsl:when>
            <xsl:when test=". = '3393'">Trinidad and Tobago </xsl:when>
            <xsl:when test=". = '3394'">Tunisia </xsl:when>
            <xsl:when test=". = '1641'">Turkey </xsl:when>
            <xsl:when test=". = '3395'">Turkmenistan </xsl:when>
            <xsl:when test=". = '3396'">Turks and Caicos Islands (the) </xsl:when>
            <xsl:when test=". = '3397'">Tuvalu </xsl:when>
            <xsl:when test=". = '3402'">Uganda </xsl:when>
            <xsl:when test=". = '3403'">Ukraine </xsl:when>
            <xsl:when test=". = '3406'">United Arab Emirates (the) </xsl:when>
            <xsl:when test=". = '1651'">United Kingdom of Great Britain and Northern Ireland (the) </xsl:when>
            <xsl:when test=". = '63145'">United Kingdom: Northern Ireland </xsl:when>
            <xsl:when test=". = '1652'">United States (the) </xsl:when>
            <xsl:when test=". = '3407'">United States Minor Outlying Islands (the) </xsl:when>
            <xsl:when test=". = '3410'">Uruguay </xsl:when>
            <xsl:when test=". = '3412'">Uzbekistan </xsl:when>
            <xsl:when test=". = '3414'">Vanuatu </xsl:when>
            <xsl:when test=". = '3416'">Venezuela (Bolivarian Republic of) </xsl:when>
            <xsl:when test=". = '3420'">Viet Nam </xsl:when>
            <xsl:when test=". = '3421'">Virgin Islands (British) </xsl:when>
            <xsl:when test=". = '3422'">Virgin Islands (U.S.) </xsl:when>
            <xsl:when test=". = '3425'">Wallis And Futuna </xsl:when>
            <xsl:when test=". = '3428'">Western Sahara </xsl:when>
            <xsl:when test=". = '3433'">Yemen </xsl:when>
            <xsl:when test=". = '3434'">Zambia </xsl:when>
            <xsl:when test=". = '3435'">Zimbabwe </xsl:when>
            <xsl:when test=". = '3446'">Åland Islands </xsl:when>
            <xsl:when test=". = '1173'">no data </xsl:when>
            <xsl:when test=". = '2207'">not specified </xsl:when>
            <xsl:when test=". = '1342'">other: </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="//xt:DataProtection/i6:confidentiality">
        <xsl:choose>
            <xsl:when test=". = '2732'">CBI </xsl:when>
            <xsl:when test=". = '2859'">IP </xsl:when>
            <xsl:when test=". = '3441'">no PA </xsl:when>
        </xsl:choose>
    </xsl:template>
</xsl:stylesheet>
