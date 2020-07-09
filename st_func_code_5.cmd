#!/home/train/build-epics/modbus/bin/linux-x86_64/modbusApp

epicsEnvSet("CMDTOP","${PWD}")
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

epicsEnvSet("PORTNAME", "modbus1")
epicsEnvSet("SERVERIP", "127.0.0.1")
epicsEnvSet("PORT", 5020)

iocshLoad("$(IOCSH_TOP)/modbusPortConfigure.iocsh", "TCP_NAME=$(PORTNAME), ASYN_OPT_ENABLE=")

asynSetTraceIOMask("$(PORTNAME)",0,4)
# Enable ASYN_TRACE_ERROR and ASYN_TRACEIO_DRIVER on octet server
asynSetTraceMask("$(PORTNAME)",0,9)
# Out (Write, EPICS IOC -> Modbus TCP/IP server)
epicsEnvSet("MOD_NAME", "A0_Out_Bits" )
epicsEnvSet("FUNC_CODE", 5)
epicsEnvSet("ELEMENT",  20)
epicsEnvSet("DATA_TYPE",  0)
# I changed the server UNIT ID 2 for this example
iocshLoad("$(IOCSH_TOP)/modbusAsynConfigure.iocsh", "NAME=$(MOD_NAME),TCP_NAME=$(PORTNAME),FUNC_CODE=$(FUNC_CODE),DATA_LENGTH=$(ELEMENT), DATA_TYPE=$(DATA_TYPE), POLL_DELAY=1000")

dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO00B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=00,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO01B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=01,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO02B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=02,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO03B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=03,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO04B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=04,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO05B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=05,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO06B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=06,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO07B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=07,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO08B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=08,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO09B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=09,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO10B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=10,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO11B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=11,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO12B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=12,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO13B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=13,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO14B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=14,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO15B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=15,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO16B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=16,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO17B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=17,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO18B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=18,  ZNAM=Low, ONAM=High")
dbLoadRecords("$(DB_TOP)/bo_bit.template", "P=$(IOCNAME):,R=BO19B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=19,  ZNAM=Low, ONAM=High")


iocInit()

dbl > "$(SYSSUBSYS)_$(DEVDI)_PVs.list"

#EOF
