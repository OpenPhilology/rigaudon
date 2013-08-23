import sys

def get_metadata(archive_xml_file):
    from lxml import etree
    # returns dictionary with appropriate single-value strings
    info = {}
    categories = ['creator', 'title', 'ppi',
                  'publisher', 'date', 'identifier', 'volume']
    tree = etree.parse(archive_xml_file)
    for category in categories:
        data = tree.xpath('/metadata/' + category + '/text()')
        try:
            info[category] = data[0]
            if len(data) > 1:
                info[category] = info[category] + ' et al.'
        except IndexError:
            info[category] =''
    return info

print get_metadata(sys.argv[2])[sys.argv[1]]