import fileinput
import json
import os
import re
from typing import List

servers_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'mockdata', 'servers.json')
ipv4addresses_path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'mockdata', 'ipv4addresses.json')

object_matcher = re.compile(r'"_id.*?\),')


def add_primary_ip_flag(primaryips: List):

    close_bracket_matcher = re.compile(r' }$')

    for ipv4_line in fileinput.input('mockdata/ipv4addresses.json', inplace=True):
        ipv4_line = object_matcher.sub('', ipv4_line)
        ipv4_line_json = json.loads(ipv4_line)
        if ipv4_line_json['ipv4address'] in primaryips:
            print(close_bracket_matcher.sub(', "is_primary": true }', ipv4_line), end="")
        else:
            print(close_bracket_matcher.sub(', "is_primary": false }', ipv4_line), end="")


if __name__ == '__main__':
    primary_ips = []

    address_matcher = re.compile(r'"ipv4address"\s:\s(\d+)')

    with open(servers_path) as inp:
        for line in inp:
            match = address_matcher.search(line)
            if match is not None:
                print(line)
                primary_ips.append(int(match.group(1)))

    add_primary_ip_flag(primary_ips)
