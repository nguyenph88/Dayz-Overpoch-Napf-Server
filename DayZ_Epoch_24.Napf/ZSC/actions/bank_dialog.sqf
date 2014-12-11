private ["_dialog"];
ZSC_CurrentStorage = cursorTarget;
_dialog = createDialog "BankDialog";
call BankDialogUpdateAmounts;
