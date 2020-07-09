#!/home/train/build-epics/modbus/bin/linux-x86_64/modbusApp

epicsEnvSet("CMDTOP", "${PWD}")
epicsEnvSet("DB_TOP", "$(CMDTOP)/db")
epicsEnvSet("IOCSH_TOP", "$(CMDTOP)/iocsh")

epicsEnvSet("LOCATION","TESTLAB")

epicsEnvSet("SYSSUBSYS","LBNL")
epicsEnvSet("DEVDI", "MODBUSIOC")
epicsEnvSet("IOCNAME", "$(SYSSUBSYS):$(DEVDI)")
epicsEnvSet("USERNAME", "train")

#-# Register all support components
dbLoadDatabase "$(CMDTOP)/dbd/modbus.dbd"
modbus_registerRecordDeviceDriver pdbbase

epicsEnvSet("PORTNAME", "modbus")
epicsEnvSet("SERVERIP", "127.0.0.1")
epicsEnvSet("PORT", 5020)

iocshLoad("$(IOCSH_TOP)/modbusPortConfigure.iocsh", "TCP_NAME=$(PORTNAME), ASYN_OPT_ENABLE=")

#asynSetTraceIOMask("$(PORTNAME)",0,4)
# Enable ASYN_TRACE_ERROR and ASYN_TRACEIO_DRIVER on octet server
#asynSetTraceMask("$(PORTNAME)",0,9)
# IN (Read, EPICS IOC <- Modbus TCP/IP server)

### to read the values of Internal Sensors, External Sensors, Power Supply, Tachometer
###                       and status of Siren, Beacon, and External Sensors
### 1 address register for each of 16 bit value
### Some responses use 2 address registers (32bit integer or float)
### Some responses use 1 address register  (16 bit integer)
 
epicsEnvSet("FUNC_CODE",  4)
epicsEnvSet("MOD_NAME", "Input_Registers")
epicsEnvSet("ELEMENT",    6)
epicsEnvSet("DATA_TYPE",  7)
epicsEnvSet("START_ADDR", 10)

iocshLoad("$(IOCSH_TOP)/modbusAsynConfigure.iocsh", "NAME=$(MOD_NAME),TCP_NAME=$(PORTNAME),FUNC_CODE=$(FUNC_CODE),DATA_LENGTH=$(ELEMENT), DATA_TYPE=$(DATA_TYPE), START_ADDR=$(START_ADDR), POLL_DELAY=1000")

dbLoadRecords("$(DB_TOP)/aiFloat64.template", "P=$(IOCNAME):,R=AI0InternalTemperature,    PORT=$(MOD_NAME), OFFSET=0, DATA_TYPE=FLOAT32_LE, HOPR=200, LOPR=0, PREC=3, SCAN=I/O Intr")
dbLoadRecords("$(DB_TOP)/aiFloat64.template", "P=$(IOCNAME):,R=AI2InternalHuminity,       PORT=$(MOD_NAME), OFFSET=2, DATA_TYPE=FLOAT32_LE, HOPR=100, LOPR=0, PREC=3, SCAN=I/O Intr")
dbLoadRecords("$(DB_TOP)/aiFloat64.template", "P=$(IOCNAME):,R=AI4InternalBatteryVoltage, PORT=$(MOD_NAME), OFFSET=4, DATA_TYPE=FLOAT32_LE, HOPR=200, LOPR=0, PREC=3, SCAN=I/O Intr")
dbLoadRecords("$(DB_TOP)/aiFloat64.template", "P=$(IOCNAME):,R=AI6InternalBatteryVoltage, PORT=$(MOD_NAME), OFFSET=6, DATA_TYPE=FLOAT32_LE, HOPR=200, LOPR=0, PREC=3, SCAN=I/O Intr")

#dbLoadTemplate("$(DB_TOP)/func_code_4.substitutions", "DB_TOP=$(DB_TOP),PREF=$(IOCNAME):,MODPORT=$(MOD_NAME)")
# epicsEnvSet("SCAN", "10 second")
# # Unclear What is MASK
# dbLoadRecords("$(DB_TOP)/mbbiDirect.template",  "P=$(IOCNAME):,R=MBBIDI,      PORT=$(MOD_NAME), OFFSET=0, MASK=0x1, SCAN=I/O Intr") 
# dbLoadRecords("$(DB_TOP)/intarray_in.template", "P=$(IOCNAME):,R=BIArray,     PORT=$(MOD_NAME), NELM=$(ELEMENT), SCAN=I/O Intr") 
# dbLoadRecords("$(DB_TOP)/asynRecord.template",  "P=$(IOCNAME):,R=BIAsyn,      PORT=$(MOD_NAME), ADDR=0, TMOD=Read, IFACE=asynUInt32Digital")
# dbLoadRecords("$(DB_TOP)/statistics.template",  "P=$(IOCNAME):,R=BI,          PORT=$(MOD_NAME), SCAN=$(SCAN)")
# dbLoadRecords("$(DB_TOP)/poll_delay.template",  "P=$(IOCNAME):,R=BIPollDelay, PORT=$(MOD_NAME)")

iocInit()

dbl > "$(SYSSUBSYS)_$(DEVDI)_PVs.list"

#EOF
