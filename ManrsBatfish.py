import os
from pybatfish.client.session import Session


class ManrsBatfish:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def __init__(self, snapshot_dir, host="localhost"):
        if not os.path.exists(snapshot_dir):
            raise ValueError("Snapshot directory '{}' does not exist".format(snapshot_dir))
        self._bf = Session(host=host)
        self._bf.init_snapshot(snapshot_dir)
        self.node_properties = self._bf.q.nodeProperties().answer()
        self.interface_properties = self._bf.q.interfaceProperties().answer()
        self.bgp_peer_properties = self._bf.q.bgpPeerConfiguration().answer()

    def _interfaces_without_property(self, property_name):
        return [row['Interface'].dict() for _, row in self.interface_properties.frame().iterrows() if
                row[property_name] is None]

    def _bgp_peers_without_property(self, property_name):
        return [self._peer_dict(row) for _, row in self.bgp_peer_properties.frame().iterrows() if
                row[property_name] is None]

    def _peer_dict(self, row):
        return {"hostname": row['Node'], "vrf": row['VRF'], "remote_ip": row['Remote_IP']}

    def get_bgp_peers(self):
        return [self._peer_dict(row) for _, row in self.bgp_peer_properties.frame().iterrows()]

    def get_bgp_peers_without_import_policy(self):
        return self._bgp_peers_without_property("Import_Policy")

    def get_interfaces(self):
        return [row['Interface'].dict() for _, row in self.interface_properties.frame().iterrows()]

    def get_interfaces_without_incoming_filter(self):
        return self._interfaces_without_property("Incoming_Filter_Name")

    def get_nodes(self):
        return [row['Node'] for _, row in self.node_properties.frame().iterrows()]


if __name__ == "__main__":
    # this entry point can be used for debugging by directly invoking the python script
    manrs_batfish = ManrsBatfish(snapshot_dir="test")
    print(manrs_batfish.get_nodes())
