#!/usr/bin/env python

from __future__ import print_function

import sys
import xml.etree.ElementTree as ET

import ruamel.yaml
from ruamel.yaml.scalarstring import DoubleQuotedScalarString


def gfm_extract(argv=None):
    if argv is None:
        argv = sys.argv[1:]

    xml_input = argv[0] if len(argv) > 0 else "mailFilters.xml"
    if xml_input in ["-h", "--help", "help"]:
        print("Usage: gfm_extract [input.xml [output.yaml]]")
        sys.exit(0)
    yaml_output = argv[1] if len(argv) > 1 else "mailFilters.yaml"

    namespaces = {
        str(x[0]) if x[0] != "" else "atom": x[1]
        for _, x in ET.iterparse(xml_input, events=["start-ns"])
    }

    tree = ET.parse(xml_input)
    root = tree.getroot()

    filters = []
    for e in root.findall("./atom:entry", namespaces):
        properties = {}
        for p in e.findall("./apps:property", namespaces):
            name = p.get("name")
            value = p.get("value")
            properties[name] = DoubleQuotedScalarString(value)
        if "size" not in properties:
            for noneed in ["sizeOperator", "sizeUnit"]:
                if noneed in properties:
                    del properties[noneed]
        filters.append(properties)

    data = {"namespaces": namespaces, "filters": filters}

    yaml = ruamel.yaml.YAML()
    yaml.indent(mapping=2, sequence=4, offset=2)
    with open(yaml_output, "w") as stream:
        yaml.dump(data, stream=stream)


if __name__ == "__main__":
    gfm_extract()
