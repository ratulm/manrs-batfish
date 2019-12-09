import os
from pybatfish.client.session import Session

class ManrsBatfish:

    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self, snapshot_dir, host="localhost"):
        if not os.path.exists(snapshot_dir):
            raise ValueError("Snapshot directory '{}' does not exist".format(snapshot_dir))
        self._bf = Session(host=host)
        self._bf.init_snapshot(snapshot_dir)

    def check_interface_acl(self, node_name, interface_name):
        print(node_name, interface_name)
        pass

