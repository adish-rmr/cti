import xmltodict


def data_extraction(dossier_id, name, uuid):
    xml_file = f"./extractedi6z/{name}_{uuid}/{dossier_id}.i6d"
    if xml_file:
        print(f"XML file {xml_file}")

    with open(xml_file, "r") as f:
        xml_content = f.read()

    dossier = xmltodict.parse(xml_content)
    scheda = {}
    scheda['name'] = name


    def json_climb(data, keys):
        for key in keys:
            data = data[key]
        return data


    routes = [["GeneralPopulationHazardViaInhalationRoute"],
              ["GeneralPopulationHazardViaDermalRoute"]]
    start = ["i6c:Document", "i6c:Content", "ENDPOINT_SUMMARY.DataTox"]
    middle = ["SystemicEffects", "LongTermStudy"]
    hazard = ["HazardAssessment", "value"]
    valore = ["StDose", "value"]
    unit = ["StDose", "unitCode"]


    codifica = {
        8309: "insufficient data available: testing proposed",
        8295: "no data available: testing technically not feasible",
        8314: "no-threshold effect and/or no dose-response information available",
        8318: "exposure based waiving",
        8316: "DNEL (Derived No Effect Level)",
        8317: "DMEL (Derived Minimum Effect Level)",
        8326: "other toxicological threshold",
        8327: "low hazard (no threshold derived)",
        8328: "medium hazard (no threshold derived)",
        8329: "high hazard (no threshold derived)",
        8330: "hazard unknown (no further information necessary)",
        62037: "hazard unknown but no further hazard information necessary as no exposure expected",
        8342: "insufficient hazard data available (further information necessary)",
        8322: "no hazard identified",
        5676: "acute toxicity",
        5677: "repeated dose toxicity",
        6626: "effect on fertility",
        4155: "developmental toxicity / teratogenicity",
        2936: "neurotoxicity",
        2862: "immunotoxicity",
        6627: "sensitisation (skin)",
        6628: "sensitisation (respiratory tract)",
        2743: "carcinogenicity",
        6629: "skin irritation/corrosion",
        6630: "irritation (respiratory tract)",
        4153: "genetic toxicity",
        5136: "Oral",
        5137: "Dermal",
        5138: "By inhalation",
        8341: "ECHA REACH Guidance",
        1342: "other:",
        4147: "NOAEC",
        4148: "LOAEC",
        5759: "BMCL05",
        5760: "BMC05",
        5761: "BMCL10",
        1109: "NOAEL",
        937: "LOAEL",
        5672: "BMDL05",
        5673: "BMD05",
        5674: "BMDL10",
        5675: "T25",
        8340: "no DNEL required: short term exposure controlled by conditions for long-term",
        8100: "ng/m³",
        8101: "µg/m³",
        3440: "mg/m³",
        2098: "mg/L",
        58256: "ppm",
        58419: "mg/m³",
        8098: "ng/kg bw/day",
        8099: "µg/kg bw/day",
        2085: "mg/kg bw/day",
        8319: "% in mixture (weight basis)",
        8102: "ng/cm²",
        8103: "µg/cm²",
        2077: "mg/cm²"
    }

    for route in routes:
        code = json_climb(dossier, start + route + middle + hazard)
        value = json_climb(dossier, start + route + middle + valore)
        measure_unit = json_climb(dossier, start + route + middle + unit)
        scheda[f"{route[0][23:]}"] = f"{codifica[int(code)]}: {value} {codifica[int(measure_unit)]}"

    print(scheda)

    return scheda