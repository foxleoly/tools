#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
#
# Created by foxleoly at 4/27/22
#
#
# Filename:  lnx-kernel-query.py
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
import requests
from lxml import html
from os.path import exists
DEBUG_FLAG = False

# todo: need add param to specify the file path.


def save_file(**kwargs):
    url = kwargs.get('url')
    filename = url.split('/')[-1]
    file_path = kwargs.get('path')
    try:
        data = requests.get(url)
        full_path = f'{file_path}/{filename}'
        with open(full_path, 'wb') as f:
            f.write(data.content)
        print(f'{filename} saved to {file_path}')
    except Exception as e:
        print(e)


def get_kernel_version():
    html_file = "kernel.html"
    req_url = "https://www.kernel.org/"
    if DEBUG_FLAG:
        # set the debug status
        if exists(html_file):
            with open(html_file, "r") as f:
                html_content = f.read()
        else:
            html_content = requests.get(req_url)
            with open(html_file, "w") as f:
                f.write(html_content.text)
    else:
        # get the html content from the url
        try:
            html_content = requests.get(req_url)
            print(f"request the url: {req_url}")
        except Exception as e:
            print(e)

    tree = html.fromstring(html_content.text)
    # print(tree)
    html_element = tree.xpath('//*[@id="latest_link"]/a/text()')
    lnx_ver = ''.join(html_element)
    _lnx_ver = lnx_ver.split('.')
    # full_link = f'https://cdn.kernel.org/pub/linux/kernel/v{_lnx_ver[0]}.x/linux-{lnx_ver}.tar.xz'
    # patch_link = f'https://cdn.kernel.org/pub/linux/kernel/v{_lnx_ver[0]}.x/patch-{lnx_ver}.xz'
    incr_ver = f'{_lnx_ver[0]}.{_lnx_ver[1]}.{int(_lnx_ver[2])-1}-{_lnx_ver[2]}'
    print(f'latest version: {incr_ver}')
    incr_link = f'https://cdn.kernel.org/pub/linux/kernel/v{_lnx_ver[0]}.x/incr/patch-{incr_ver}.xz'

    # print(f'lnx_ver:-->{lnx_ver}\n:-->{full_link}\n:-->{patch_link}\n:-->{incr_link}')
    saved_path = '/home/foxleoly/workspace/kernelbuild'
    save_file(url=incr_link, path=saved_path)
    return


if __name__ == '__main__':
    get_kernel_version()
