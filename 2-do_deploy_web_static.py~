#!/usr/bin/python3
"""
fabric script that generates a .tgz from the contents of web_static
all files in the folder web_static are added to the final archive
all archives must be stored in the folder versions
the name of the archive created has the format
web_static_<year><month><day><hour><minute><second>.tgz
the function do_pack must return the archive path
if the archive has been correctly generated.
otherwise, it should return None
"""
from fabric.api import local
from datetime import datetime


def do_pack():
    """
        returns the archive path if archive has been correctly
        created.
        all files in the folder web_static are added to the final archive
        all archives must be stored in the folder versions
        the name of the archive created has the format
        web_static_<year><month><day><hour><minute><second>.tgz
        the function do_pack must return the archive path
        if the archive has been correctly generated.
        otherwise, it should return None
    """

    local("mkdir -p versions")
    date = datetime.now().strftime("%Y%m%d%H%M%S")
    archived_path = "versions/web_static_{}.tgz".format(date)
    t_gzip_archive = local("tar -cvzf {} web_static".format(archived_path))

    if t_gzip_archive.succeeded:
        return archived_f_path
    else:
        return None
