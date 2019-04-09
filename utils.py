# -*- coding: utf-8 -*-
"""
__________________________________________________________________________
Copyright (C) 2016-2019 OpenNFT.org

Written by Evgeny Prilepin

"""

import time
import contextlib
import pathlib
import hashlib
import random
import uuid

import numpy as np
from PyQt5 import QtCore, QtWidgets

import config


@contextlib.contextmanager
def timeit(message):
    t = time.time()
    yield
    to = time.time() - t

    units = 's'

    if 0.001 <= to < 0.1:
        to *= 1e3
        units = 'ms'
    elif to < 0.001:
        to *= 1e6
        units = 'mcs'

    print(message + ' {:.2f} {}'.format(to, units))


# ==============================================================================
def generate_random_number_string(num=5):
    """Generates a sequence of numbers and returns it as string
    """
    num = np.random.randint(0, 9, size=(num,)).tolist()
    s_num = ''.join(map(str, num))

    return s_num


def get_app_instance_dir() -> pathlib.Path:
    """Returns application instance directory

    :return: A full path to instance directory
    """
    return pathlib.Path(config.ROOT_PATH)


def get_unique_app_instance_uuid() -> str:
    """Returns unique application instance uuid

    :return: Unique application instance uuid that depends from application instance directory
    """
    inst_dir = get_app_instance_dir()

    sha1 = hashlib.sha1()
    sha1.update(str(inst_dir).encode('utf-8'))
    inst_hash = sha1.hexdigest()

    random_state = random.getstate()
    random.seed(inst_hash)
    u = str(uuid.UUID(int=random.getrandbits(128)))
    random.setstate(random_state)

    return u


def get_app_config_dir() -> pathlib.Path:
    """Returns application configuration directory

    :return: A full path to application configuration directory
    """
    return pathlib.Path(QtCore.QStandardPaths.standardLocations(
        QtCore.QStandardPaths.AppConfigLocation)[0]) / get_unique_app_instance_uuid()


def get_app_settings_file() -> pathlib.Path:
    """Returns a path to application settings file

    :return: A full path to application settings INI-file
    """
    app_name = QtWidgets.QApplication.applicationName()
    return get_app_config_dir() / (app_name + '.ini')
