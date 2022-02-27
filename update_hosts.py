#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
#
# Created by ${USER} at ${DATE}
#
#
# Filename:  ${FILE_NAME}
#
# Description:
#
#
#
#
#
#
#
#
import re

import requests

URL = "https://gitee.com/ineo6/hosts/raw/master/hosts"


def req(**kwargs):
    """
    request by url
    :param kwargs:
    :return:
    """
    url = kwargs.get("url")
    sess = requests.Session()
    http_get = sess.get(url, timeout=5)
    if http_get.status_code == 200:
        return http_get.text
    else:
        raise RuntimeError("request error")


def file_read(**kwargs):
    """
    read file on system
    :param kwargs: filename=file path and filename
    :return:
    """
    filename = kwargs.get("filename")
    with open(filename, 'r') as _file:
        file_content = _file.read()
        # start = file_content.index("# GitHub Host Start\n")
        # print(start)
        # end = file_content.index("# GitHub Host End\n")
        # print(end)
        # print(file_content[start:end])
    return file_content


def proc_hosts():
    # process hosts
    hosts_content = file_read(filename="/etc/hosts")
    http_content = req(url=URL)
    fin_result = re.sub(r'#.*Start.*#.*End', http_content, hosts_content, flags=re.DOTALL)
    try:
        with open("/etc/hosts", 'w') as _file:
            _file.write(fin_result)
    except Exception as e:
        print(e)

    print("update hosts success\n")


if __name__ == "__main__":
    # print(req(url=URL))
    # print(file_read(filename="/etc/hosts"))
    proc_hosts()
