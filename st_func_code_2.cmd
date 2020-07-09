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

iocshLoad("$(IOCSH_TOP)/modbusPortConfigure.iocsh", "TCP_NAME=$(PORTNAME), ASYN_OPT_ENABLE=")

asynSetTraceIOMask("$(PORTNAME)",0,4)
# Enable ASYN_TRACE_ERROR and ASYN_TRACEIO_DRIVER on octet server
asynSetTraceMask("$(PORTNAME)",0,9)
# IN (Read, EPICS IOC <- Modbus TCP/IP server)
epicsEnvSet("MOD_NAME", "Digital_Inputs")
epicsEnvSet("ELEMENT",  40)
epicsEnvSet("FUNC_CODE", 2)
epicsEnvSet("DATA_TYPE", 0)
epicsEnvSet("START_ADDR", 0)

iocshLoad("$(IOCSH_TOP)/modbusAsynConfigure.iocsh", "NAME=$(MOD_NAME),TCP_NAME=$(PORTNAME),FUNC_CODE=$(FUNC_CODE),DATA_LENGTH=$(ELEMENT), DATA_TYPE=$(DATA_TYPE), START_ADDR=$(START_ADDR), POLL_DELAY=1000")

dbLoadTemplate("$(DB_TOP)/func_code_2.substitutions", "DB_TOP=$(DB_TOP),PREF=$(IOCNAME):,MODPORT=$(MOD_NAME)")
epicsEnvSet("SCAN", "10 second")
# Unclear What is MASK
dbLoadRecords("$(DB_TOP)/mbbiDirect.template",  "P=$(IOCNAME):,R=MBBIDI,      PORT=$(MOD_NAME), OFFSET=0, MASK=0x1, SCAN=I/O Intr") 
dbLoadRecords("$(DB_TOP)/intarray_in.template", "P=$(IOCNAME):,R=BIArray,     PORT=$(MOD_NAME), NELM=$(ELEMENT), SCAN=I/O Intr") 
dbLoadRecords("$(DB_TOP)/asynRecord.template",  "P=$(IOCNAME):,R=BIAsyn,      PORT=$(MOD_NAME), ADDR=0, TMOD=Read, IFACE=asynUInt32Digital")
dbLoadRecords("$(DB_TOP)/statistics.template",  "P=$(IOCNAME):,R=BI,          PORT=$(MOD_NAME), SCAN=$(SCAN)")
dbLoadRecords("$(DB_TOP)/poll_delay.template",  "P=$(IOCNAME):,R=BIPollDelay, PORT=$(MOD_NAME)")

iocInit()

dbl > "$(SYSSUBSYS)_$(DEVDI)_PVs.list"

#EOF
