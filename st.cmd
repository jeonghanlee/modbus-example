#!/home/train/build-epics/modbus/bin/linux-x86_64/modbusApp

epicsEnvSet("TOP","${PWD}")
epicsEnvSet("DB_TOP", "$(TOP)/db")
epicsEnvSet("IOCSH_TOP", "$(TOP)/iocsh")

epicsEnvSet("LOCATION","TESTLAB")


epicsEnvSet("SYSSUBSYS","LBNL")
epicsEnvSet("DEVDI", "MODBUSIOC")
epicsEnvSet("IOCNAME", "$(SYSSUBSYS):$(DEVDI)")
epicsEnvSet("USERNAME", "train")




#-# Register all support components
dbLoadDatabase "dbd/modbus.dbd"
modbus_registerRecordDeviceDriver pdbbase

#- Use the following commands for TCP/IP
#- drvAsynIPPortConfigure(const char *portName,
#-                        const char *hostInfo,
#-                        unsigned int priority,
#-                        int noAutoConnect,
#-                        int noProcessEos);


epicsEnvSet("PORTNAME", "modbus1")
epicsEnvSet("SERVERIP", "localhost")
epicsEnvSet("PORT", 5020)

drvAsynIPPortConfigure("$(PORTNAME)","$(SERVERIP):$(PORT=502)", "$(PRIORITY=0)", "$(NOAUTOCONNECT=0)" ,"$(NOPROCESSEOS=1)")
asynSetOption("$(PORTNAME)",0,"disconnectOnReadTimeout", "Y")
#-
#-modbusInterposeConfig(const char *portName,
#-                      modbusLinkType linkType,
#-                      int timeoutMsec, 
#-                      int writeDelayMsec)
modbusInterposeConfig("$(PORTNAME)","$(LINKTYPE=0)", "$(TIMEOUT=5000)", "$(WRITEDELAYMSEC=0)")


# Enable ASYN_TRACEIO_HEX on octet server
asynSetTraceIOMask("$(PORTNAME)",0,4)
# Enable ASYN_TRACE_ERROR and ASYN_TRACEIO_DRIVER on octet server
#asynSetTraceMask("sim1",0,9)

#dbLoadTemplate("sim1.substitution")


iocInit()

dbl > "$(SYSSUBSYS)_$(DEVDI)_PVs.list"

#EOF