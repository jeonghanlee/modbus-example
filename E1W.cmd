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
epicsEnvSet("ELEMENT",   52)
epicsEnvSet("DATA_TYPE",  7)
epicsEnvSet("START_ADDR", 0)

iocshLoad("$(IOCSH_TOP)/modbusAsynConfigure.iocsh","NAME=$(MOD_NAME),TCP_NAME=$(PORTNAME),FUNC_CODE=$(FUNC_CODE),DATA_LENGTH=$(ELEMENT),DATA_TYPE=$(DATA_TYPE),START_ADDR=$(START_ADDR), POLL_DELAY=1000")

dbLoadTemplate("$(DB_TOP)/E1W.substitutions","DB_TOP=$(DB_TOP),PREF=$(IOCNAME),MODPORT=$(MOD_NAME)")

iocInit()

dbl > "$(SYSSUBSYS)_$(DEVDI)_PVs.list"

#EOF
