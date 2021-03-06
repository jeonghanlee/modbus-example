#-------------------------------------------------------------------------------
# Name:         ModSlaveMBDataItemDelegate
# Purpose:
#
# Author:      elbar
#
# Created:     17/12/2012
# Copyright:   (c) elbar 2012
# Licence:     <your licence>
#-------------------------------------------------------------------------------
#!/usr/bin/env python

from PyQt5 import QtCore,QtWidgets

import Utils

#-------------------------------------------------------------------------------
class ModSlaveMBDataItemDelegate(QtWidgets.QStyledItemDelegate):
    """ Modbus data model items delegate """
    # setup signals
    update_item = QtCore.pyqtSignal()

    def __init__(self, discrete=False, data_type=0):#data type > 0 : decimal, 1 : hex
        super(ModSlaveMBDataItemDelegate,self).__init__()
        self._discrete = discrete
        self._data_type = data_type

    def paint(self, painter, option, index):
        QtWidgets.QStyledItemDelegate.paint(self, painter, option, index)

    def createEditor(self, parent, option, index):
        # print("Create editor")
        editor = QtWidgets.QLineEdit(parent)
        if (self._discrete):
            editor.setInputMask("b")
        elif (self._data_type == 0):
            editor.setInputMask("00000")
        elif (self._data_type == 1):
            editor.setInputMask("hhhh")
        else:
            editor.setInputMask("00000")
        return editor

    def setEditorData(self, editor, index):
        # print("Set editor data")
        value = str((index.model()).data(index, QtCore.Qt.EditRole))
        editor.setText(value)

    def setModelData(self, editor, model,index):
        # print("Set model data")
        value = str(editor.text())
        try:
            if (self._data_type == 0): # decimal
                _value = int(value, 10)
            elif(self._data_type == 1): #hex
                _value = int(value, 16)
        except Exception:
            _value = 0
        if (not self._discrete): # check values
            if (_value > 65535):
                Utils.errorMessageBox("Value is greater than 65535.")
                return
        model.setData(index, value, QtCore.Qt.EditRole);
        # emit SIGNAL for updating modbus data
        self.update_item.emit()

    def updateEditorGeometry(self, editor, option, index):
        # print("Update editor geometry")
        editor.setGeometry(option.rect)

    def set_data_type(self, data_type):
        # print("Data Type = {0}".format(data_type))
        self._data_type = data_type

#-------------------------------------------------------------------------------