# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'C:\Projects\python\pyModSlave\ui\busmonitor.ui'
#
# Created by: PyQt5 UI code generator 5.11.3
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets

class Ui_BusMonitor(object):
    def setupUi(self, BusMonitor):
        BusMonitor.setObjectName("BusMonitor")
        BusMonitor.setWindowModality(QtCore.Qt.NonModal)
        BusMonitor.resize(500, 500)
        BusMonitor.setMinimumSize(QtCore.QSize(450, 500))
        BusMonitor.setMaximumSize(QtCore.QSize(500, 580))
        icon = QtGui.QIcon()
        icon.addPixmap(QtGui.QPixmap(":/img/view-16.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        BusMonitor.setWindowIcon(icon)
        self.centralwidget = QtWidgets.QWidget(BusMonitor)
        self.centralwidget.setMinimumSize(QtCore.QSize(450, 400))
        self.centralwidget.setMaximumSize(QtCore.QSize(16777215, 16777215))
        self.centralwidget.setObjectName("centralwidget")
        self.verticalLayout = QtWidgets.QVBoxLayout(self.centralwidget)
        self.verticalLayout.setObjectName("verticalLayout")
        self.lblRawData = QtWidgets.QLabel(self.centralwidget)
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.lblRawData.setFont(font)
        self.lblRawData.setLayoutDirection(QtCore.Qt.LeftToRight)
        self.lblRawData.setObjectName("lblRawData")
        self.verticalLayout.addWidget(self.lblRawData)
        self.lstRawData = QtWidgets.QListView(self.centralwidget)
        self.lstRawData.setMinimumSize(QtCore.QSize(0, 0))
        font = QtGui.QFont()
        font.setPointSize(8)
        self.lstRawData.setFont(font)
        self.lstRawData.setEditTriggers(QtWidgets.QAbstractItemView.NoEditTriggers)
        self.lstRawData.setAlternatingRowColors(True)
        self.lstRawData.setSelectionMode(QtWidgets.QAbstractItemView.SingleSelection)
        self.lstRawData.setSelectionBehavior(QtWidgets.QAbstractItemView.SelectRows)
        self.lstRawData.setSelectionRectVisible(False)
        self.lstRawData.setObjectName("lstRawData")
        self.verticalLayout.addWidget(self.lstRawData)
        self.lblPDU = QtWidgets.QLabel(self.centralwidget)
        font = QtGui.QFont()
        font.setBold(True)
        font.setWeight(75)
        self.lblPDU.setFont(font)
        self.lblPDU.setObjectName("lblPDU")
        self.verticalLayout.addWidget(self.lblPDU)
        self.txtPDU = QtWidgets.QPlainTextEdit(self.centralwidget)
        self.txtPDU.setReadOnly(True)
        self.txtPDU.setObjectName("txtPDU")
        self.verticalLayout.addWidget(self.txtPDU)
        BusMonitor.setCentralWidget(self.centralwidget)
        self.toolBar = QtWidgets.QToolBar(BusMonitor)
        self.toolBar.setObjectName("toolBar")
        BusMonitor.addToolBar(QtCore.Qt.TopToolBarArea, self.toolBar)
        self.actionClear = QtWidgets.QAction(BusMonitor)
        icon1 = QtGui.QIcon()
        icon1.addPixmap(QtGui.QPixmap(":/img/edit-clear-16.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.actionClear.setIcon(icon1)
        self.actionClear.setIconVisibleInMenu(True)
        self.actionClear.setObjectName("actionClear")
        self.actionExit = QtWidgets.QAction(BusMonitor)
        icon2 = QtGui.QIcon()
        icon2.addPixmap(QtGui.QPixmap(":/img/Close-16.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.actionExit.setIcon(icon2)
        self.actionExit.setObjectName("actionExit")
        self.actionSave = QtWidgets.QAction(BusMonitor)
        icon3 = QtGui.QIcon()
        icon3.addPixmap(QtGui.QPixmap(":/img/save-16.png"), QtGui.QIcon.Normal, QtGui.QIcon.Off)
        self.actionSave.setIcon(icon3)
        self.actionSave.setObjectName("actionSave")

        self.retranslateUi(BusMonitor)
        QtCore.QMetaObject.connectSlotsByName(BusMonitor)

    def retranslateUi(self, BusMonitor):
        _translate = QtCore.QCoreApplication.translate
        BusMonitor.setWindowTitle(_translate("BusMonitor", "Bus Monitor"))
        self.lblRawData.setText(_translate("BusMonitor", "Raw Data"))
        self.lblPDU.setText(_translate("BusMonitor", "ADU"))
        self.toolBar.setWindowTitle(_translate("BusMonitor", "toolBar"))
        self.actionClear.setText(_translate("BusMonitor", "Clear"))
        self.actionClear.setToolTip(_translate("BusMonitor", "Clear"))
        self.actionExit.setText(_translate("BusMonitor", "Exit"))
        self.actionExit.setToolTip(_translate("BusMonitor", "Exit"))
        self.actionSave.setText(_translate("BusMonitor", "Save"))
        self.actionSave.setToolTip(_translate("BusMonitor", "Save"))

import pyModSlaveQt_rc