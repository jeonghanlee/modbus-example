# EPICS Modbus example

## Examples

### `st_func_code_1.cmd`

For DO (Server) / DI (EPICS BI), `DATA_LENGTH = START_ADDR + No of Coils`. For example, Server's Start addr is 0, and has 20 Coils, then EPICS IOC `DATA_LENGTH` is 20.

* Case 1 : `DATA_LENGTH = 20`, and the server also has 20 coils and the number of PVs is 21. We see the PVs are updating according to that server value changing.

```bash
drvModbusAsyn::readPoller port A0_In_Bits invalid offset 20, max=20
```

* Case 2 : `DATA_LENGTH = 50`, and server has only 20 coils, and the number of PVs is 20. PV values doesn't change.

```bash
drvModbusAsyn::doModbusIO port A0_In_Bits Modbus exception=2
```

* Case 3 : `DATA_LENGTH = 20`, and server has 20 coils, and the number of PV is 17. We skip offset 3,10,16, and 20. All defined PVs are updating properly.

* Case 4 : `DATA_LENGTH = 10`, and server has 20 coils and the number of PVs is 10 with 0 - 9 offset. All PV values are updating.

* Case 5 : `DATA_LENGTH = 10`, and server has 20 coils and the number of PVs is 10 with 0,2,4, ..., 18 offsets. PV values with offset lower than 10 are updating. However, PVs with offset `>=10` doesn't change.

```bash
drvModbusAsyn::readPoller port A0_In_Bits invalid offset 10, max=10
```

* Case 6 : `DATA_LENGTH=20`, and server has 20 coils, and 20 PVs. But server has `UNIT_ID=2`, EPICS has `UNIT_ID=1`.

```bash
devAsynUInt32Digital::initCommon connectDevice failed asynManager:connectDevice port A0_In_Bits not found
```

### `st_func_code_5.cmd`

* case 1 : `DATA_LENGTH=20`, and server has 20 coils, and 10 PVs. EPICS can write 10 PV values sequentially with `caput_5.bash`.

```bash
epicsEnvSet("MOD_NAME", "A0_Out_Bits" )
epicsEnvSet("FUNC_CODE", 5)
epicsEnvSet("ELEMENT",  20)
```
