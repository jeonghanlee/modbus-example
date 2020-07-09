




epicsEnvSet("IOC","iocTest")
epicsEnvSet("TOP","$/home/jhlee/epics_env/epics-modules/modbus")
epicsEnvSet("ASYN","/home/jhlee/epics_env/epics-modules/asyn")
epicsEnvSet("EPICS_BASE","/home/jhlee/epics_env/epics-base")



dbLoadDatabase("$(TOP)/dbd/modbus.dbd")
modbus_registerRecordDeviceDriver(pdbbase)

# Use the following commands for TCP/IP
#drvAsynIPPortConfigure(const char *portName,
#                       const char *hostInfo,
#                       unsigned int priority,
#                       int noAutoConnect,
#                       int noProcessEos);
drvAsynIPPortConfigure("sim1","camaro:502",0,0,1)
#asynSetOption("sim1",0, "disconnectOnReadTimeout", "Y")
#modbusInterposeConfig(const char *portName,
#                      modbusLinkType linkType,
#                      int timeoutMsec, 
#                      int writeDelayMsec)
modbusInterposeConfig("sim1",0,2000,0)


