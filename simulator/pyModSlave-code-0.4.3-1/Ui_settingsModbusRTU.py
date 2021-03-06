# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:\Projects\python\pyModSlave\ui\settingsmodbusrtu.ui'
#
# Created by: PyQt5 UI code generator 5.11.3
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_SettingsModbusRTU(object):
    def setupUi(self, SettingsModbusRTU):
        SettingsModbusRTU.setObjectName("SettingsModbusRTU")
        SettingsModbusRTU.resize(220, 240)
        SettingsModbusRTU.setMinimumSize(QtCore.QSize(220, 240))
        SettingsModbusRTU.setMaximumSize(QtCore.QSize(220, 300))
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/img/options-16.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        SettingsModbusRTU.setWindowIcon(icon)
        SettingsModbusRTU.setModal(True)
        self.verticalLayout = QtWidgets.QVBoxLayout(SettingsModbusRTU)
        self.verticalLayout.setObjectName("verticalLayout")
        self.gridLayout = QtWidgets.QGridLayout()
        self.gridLayout.setObjectName("gridLayout")
        self.cmbStopBits = QtWidgets.QComboBox(SettingsModbusRTU)
        self.cmbStopBits.setObjectName("cmbStopBits")
        self.cmbStopBits.addItem("")
        self.cmbStopBits.addItem("")
        self.cmbStopBits.addItem("")
        self.gridLayout.addWidget(self.cmbStopBits, 4, 1, 1, 1)
        self.cmbPort = QtWidgets.QSpinBox(SettingsModbusRTU)
        self.cmbPort.setMinimum(1)
        self.cmbPort.setMaximum(128)
        self.cmbPort.setObjectName("cmbPort")
        self.gridLayout.addWidget(self.cmbPort, 1, 1, 1, 1)
        self.lblPort = QtWidgets.QLabel(SettingsModbusRTU)
        self.lblPort.setMinimumSize(QtCore.QSize(0, 0))
        self.lblPort.setObjectName("lblPort")
        self.gridLayout.addWidget(self.lblPort, 1, 0, 1, 1)
        self.lblStopBits = QtWidgets.QLabel(SettingsModbusRTU)
        self.lblStopBits.setObjectName("lblStopBits")
        self.gridLayout.addWidget(self.lblStopBits, 4, 0, 1, 1)
        self.cmbDataBits = QtWidgets.QComboBox(SettingsModbusRTU)
        self.cmbDataBits.setObjectName("cmbDataBits")
        self.cmbDataBits.addItem("")
        self.cmbDataBits.addItem("")
        self.gridLayout.addWidget(self.cmbDataBits, 3, 1, 1, 1)
        self.lblDataBits = QtWidgets.QLabel(SettingsModbusRTU)
        self.lblDataBits.setObjectName("lblDataBits")
        self.gridLayout.addWidget(self.lblDataBits, 3, 0, 1, 1)
        self.cmbBaud = QtWidgets.QComboBox(SettingsModbusRTU)
        self.cmbBaud.setObjectName("cmbBaud")
        self.cmbBaud.addItem("")
        self.cmbBaud.addItem("")
        self.cmbBaud.addItem("")
        self.cmbBaud.addItem("")
        self.cmbBaud.addItem("")
        self.cmbBaud.addItem("")
        self.cmbBaud.addItem("")
        self.cmbBaud.addItem("")
        self.gridLayout.addWidget(self.cmbBaud, 2, 1, 1, 1)
        self.lblBaud = QtWidgets.QLabel(SettingsModbusRTU)
        self.lblBaud.setObjectName("lblBaud")
        self.gridLayout.addWidget(self.lblBaud, 2, 0, 1, 1)
        self.cmbParity = QtWidgets.QComboBox(SettingsModbusRTU)
        self.cmbParity.setObjectName("cmbParity")
        self.cmbParity.addItem("")
        self.cmbParity.addItem("")
        self.cmbParity.addItem("")
        self.gridLayout.addWidget(self.cmbParity, 5, 1, 1, 1)
        self.lblParity = QtWidgets.QLabel(SettingsModbusRTU)
        self.lblParity.setObjectName("lblParity")
        self.gridLayout.addWidget(self.lblParity, 5, 0, 1, 1)
        self.lblDev = QtWidgets.QLabel(SettingsModbusRTU)
        self.lblDev.setObjectName("lblDev")
        self.gridLayout.addWidget(self.lblDev, 0, 0, 1, 1)
        self.cmbDev = QtWidgets.QComboBox(SettingsModbusRTU)
        self.cmbDev.setEditable(True)
        self.cmbDev.setObjectName("cmbDev")
        self.cmbDev.addItem("")
        self.cmbDev.addItem("")
        self.gridLayout.addWidget(self.cmbDev, 0, 1, 1, 1)
        self.verticalLayout.addLayout(self.gridLayout)
        self.buttonBox = QtWidgets.QDialogButtonBox(SettingsModbusRTU)
        self.buttonBox.setOrientation(QtCore.Qt.Horizontal)
        self.buttonBox.setStandardButtons(QtWidgets.QDialogButtonBox.Cancel|QtWidgets.QDialogButtonBox.Ok)
        self.buttonBox.setObjectName("buttonBox")
        self.verticalLayout.addWidget(self.buttonBox)
        self.lblStopBits.setBuddy(self.cmbStopBits)
        self.lblDataBits.setBuddy(self.cmbDataBits)
        self.lblBaud.setBuddy(self.cmbBaud)
        self.lblParity.setBuddy(self.cmbParity)

        self.retranslateUi(SettingsModbusRTU)
        self.cmbStopBits.setCurrentIndex(0)
        self.cmbDataBits.setCurrentIndex(1)
        self.cmbBaud.setCurrentIndex(4)
        self.cmbParity.setCurrentIndex(0)
        self.buttonBox.accepted.connect(SettingsModbusRTU.accept)
        self.buttonBox.rejected.connect(SettingsModbusRTU.reject)
        QtCore.QMetaObject.connectSlotsByName(SettingsModbusRTU)

    def retranslateUi(self, SettingsModbusRTU):
        _translate = QtCore.QCoreApplication.translate
        SettingsModbusRTU.setWindowTitle(_translate("SettingsModbusRTU", "Modbus RTU Settings"))
        self.cmbStopBits.setItemText(0, _translate("SettingsModbusRTU", "1"))
        self.cmbStopBits.setItemText(1, _translate("SettingsModbusRTU", "1.5"))
        self.cmbStopBits.setItemText(2, _translate("SettingsModbusRTU", "2"))
        self.lblPort.setText(_translate("SettingsModbusRTU", "Serial port"))
        self.lblStopBits.setText(_translate("SettingsModbusRTU", "Stop Bits"))
        self.cmbDataBits.setItemText(0, _translate("SettingsModbusRTU", "7"))
        self.cmbDataBits.setItemText(1, _translate("SettingsModbusRTU", "8"))
        self.lblDataBits.setText(_translate("SettingsModbusRTU", "Data Bits"))
        self.cmbBaud.setItemText(0, _translate("SettingsModbusRTU", "1200"))
        self.cmbBaud.setItemText(1, _translate("SettingsModbusRTU", "2400"))
        self.cmbBaud.setItemText(2, _translate("SettingsModbusRTU", "4800"))
        self.cmbBaud.setItemText(3, _translate("SettingsModbusRTU", "9600"))
        self.cmbBaud.setItemText(4, _translate("SettingsModbusRTU", "19200"))
        self.cmbBaud.setItemText(5, _translate("SettingsModbusRTU", "38400"))
        self.cmbBaud.setItemText(6, _translate("SettingsModbusRTU", "57600"))
        self.cmbBaud.setItemText(7, _translate("SettingsModbusRTU", "115200"))
        self.lblBaud.setText(_translate("SettingsModbusRTU", "Baud"))
        self.cmbParity.setItemText(0, _translate("SettingsModbusRTU", "None"))
        self.cmbParity.setItemText(1, _translate("SettingsModbusRTU", "Odd"))
        self.cmbParity.setItemText(2, _translate("SettingsModbusRTU", "Even"))
        self.lblParity.setText(_translate("SettingsModbusRTU", "Parity"))
        self.lblDev.setText(_translate("SettingsModbusRTU", "Serial device"))
        self.cmbDev.setItemText(0, _translate("SettingsModbusRTU", "/dev/ttyS"))
        self.cmbDev.setItemText(1, _translate("SettingsModbusRTU", "/dev/ttyUSB"))

import pyModSlaveQt_rc
