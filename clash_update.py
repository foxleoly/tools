#!/usr/bin/env python3
# -*- coding: UTF-8 -*-
#
# Created by foxleoly at 5/21/22
#
#
# Filename:  clash_update.py
#
# Description:
# automaticly update clash bin file
#
# step1. get clash and extract
# step2. compare with local version
# step3. update local bin file


CLASH_URL = 'https://release.dreamacro.workers.dev/latest/clash-linux-amd64-latest.gz'
CLASH_BIN = '/usr/bin/clash'


def get_clash():
    '''
    get clash zip file from officail site.
    '''
    pass


def extract_cmp_clash():
    '''
    extract and compare with local bin file
    if the local file missmatch with the downloaded file. will update local file.
    '''
    pass


def update_clash():
    '''
    move latest clash file and update local.
    '''
    pass


if __name__ == "__main__":
    update_clash()
