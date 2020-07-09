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

epicsEnvSet("PORTNAME", "modbus1")
epicsEnvSet("SERVERIP", "127.0.0.1")
epicsEnvSet("PORT", 5020)
#epicsEnvSet("SERVERIP", "147.0.27.197")
#epicsEnvSet("PORT", 502)
iocshLoad("$(IOCSH_TOP)/modbusPortConfigure.iocsh", "TCP_NAME=$(PORTNAME), INET=$(SERVERIP), PORT=$(PORT), ASYN_OPT_ENABLE=#, TIMEOUT=5000")

# Enable ASYN_TRACE_ERROR and ASYN_TRACEIO_DRIVER on octet server
## asynSetTraceMask("$(PORTNAME)",0,9)
# IN (Read, EPICS IOC <- Modbus TCP/IP server)
epicsEnvSet("MOD_NAME", "Output_Relays")
epicsEnvSet("ELEMENT",   36)
epicsEnvSet("FUNC_CODE", 1)
epicsEnvSet("DATA_TYPE", 0)
epicsEnvSet("START_ADDR", 0)

iocshLoad("$(IOCSH_TOP)/modbusAsynConfigure.iocsh", "NAME=$(MOD_NAME),TCP_NAME=$(PORTNAME),FUNC_CODE=$(FUNC_CODE),DATA_LENGTH=$(ELEMENT), DATA_TYPE=$(DATA_TYPE), START_ADDR=$(START_ADDR), POLL_DELAY=1000")

dbLoadTemplate("$(DB_TOP)/func_code_1.substitutions", "DB_TOP=$(DB_TOP),PREF=$(IOCNAME),MODPORT=$(MOD_NAME)")

#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI00B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=0,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI01B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=1,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI02B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=2,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI03B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=3,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI04B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=4,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI05B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=5,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI06B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=6,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI07B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=7,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI08B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=8,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI09B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=9,  ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI10B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=10, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI11B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=11, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI12B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=12, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI13B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=13, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI14B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=14, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI15B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=15, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI16B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=16, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI17B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=17, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI18B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=18, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI19B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=19, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI20B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=20, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI21B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=21, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI22B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=22, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI23B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=23, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI24B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=24, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI25B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=25, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI26B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=26, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI27B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=27, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI28B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=28, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI29B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=29, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI30B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=30, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI31B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=31, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI32B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=32, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI33B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=33, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")
#dbLoadRecords("$(DB_TOP)/bi_bit.template", "P=$(IOCNAME):,R=BI34B, PORT=$(MOD_NAME), START_ADDR=0, OFFSET=34, ZNAM=Inactive, ONAM=Active, ZSV=NO_ALARM, OSV=MAJOR, SCAN=I/O Intr")


epicsEnvSet("SCAN", "10 second")
dbLoadRecords("$(DB_TOP)/mbbiDirect.template",  "P=$(IOCNAME):,R=MBBID0,  PORT=$(MOD_NAME), OFFSET=0, MASK=0xFFF, SCAN=I/O Intr") 
dbLoadRecords("$(DB_TOP)/intarray_in.template", "P=$(IOCNAME):,R=BIArray, PORT=$(MOD_NAME), NELM=$(ELEMENT), SCAN=I/O Intr") 
dbLoadRecords("$(DB_TOP)/asynRecord.template",  "P=$(IOCNAME):,R=BIAsyn,  PORT=$(MOD_NAME), ADDR=0, TMOD=Read, IFACE=asynUInt32Digital")
dbLoadRecords("$(DB_TOP)/statistics.template",  "P=$(IOCNAME):,R=BI,      PORT=$(MOD_NAME), SCAN=$(SCAN)")
dbLoadRecords("$(DB_TOP)/poll_delay.template",  "P=$(IOCNAME):,R=BIPollDelay, PORT=$(MOD_NAME)")

iocInit()

dbl > "$(SYSSUBSYS)_$(DEVDI)_PVs.list"

#EOF
