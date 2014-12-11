class ExtraRc {
  class ItemRadio {
     class GroupManagement {
        text = "Group Management";
        script = "execVM 'dzgm\loadGroupManagement.sqf'";
     };
  };
  
	class ItemMap {
        class locate {
            text = "Locate Vehicles";
            script = "execVM 'custom\locate_vehicle.sqf'";
        };
    };
};