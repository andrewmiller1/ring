Load "qt.rh"
Load "ring_qt.ring"
Load "objectslib/objects.ring"
Load "objectslib/subwindows.ring"

if iswindows()
	LoadLib("ringqt.dll")
but ismacosx()
	LoadLib("libringqt.dylib")
else
	LoadLib("libringqt.so")
ok

GUILib = new GUILib

func setwinicon pWindow,cImage
	if cImage = NULL return ok		
	pWindow.setWindowIcon(new qicon(new qpixmap(cImage)))
		
func setbtnimage pBtn,cImage
	if cImage = NULL return ok		
	pBtn.setIcon(new qicon(new qpixmap(cImage)))

Class GUILib

	func objcmp o1,o2
		return ptrcmp(o1.pObject,o2.pObject)

	func findobj aList,o1,nColumn
		return find(aList,o1.pObject,nColumn)

/*
	This package 
	(1) Create new classes names (Better Names)
	(2) Index starts from 1 instead of 0 (More Natural)
*/

package System.GUI

	class App from qApp 

		func init 	# To allow using new App() 
			return self 

	class window from qWidget

	class mainwindow from qMainWindow

	class label from qLabel

	class button from qPushButton

	class textbox from qLineEdit

	class editbox from qTextEdit

	class listbox from qListWidget

		func CurrentRow
			return 1+Super.CurrentRow()

		func SetCurrentRow nIndex,nOptions
			return Super.SetCurrentRow(nIndex-1,nOptions)

		func item nIndex 
			return super.item(nIndex-1)

		func itemat nX,nY
			return super.itemAt(nX-1,nY-1)
	
		func row oItem
			return super.row(oItem)+1

		func TakeItem nIndex 
			return super.TakeItem(nIndex-1)		

	class checkbox from qCheckBox

	class slider from qSlider

	class progressbar from qProgressbar

	class SpinBox from qSpinBox

	class ComboBox from qComboBox

		func CurrentIndex
			return Super.CurrentIndex() + 1

		func SetCurrentIndex nIndex
			return Super.SetCurrentIndex(nIndex - 1)

		func FindData p1,p2,p3
			return Super.FindData(p1,p2,p3)+1

		func FindText p1,p2
			return Super.FindText(p1,p2)+1

		func InsertItem nIndex,p2,p3
			return Super.InsertItem(nIndex-1,p2,p3)	

		func ItemData nIndex,p2
			return Super.ItemData(nIndex-1,p2)

		func ItemIcon nIndex 
			return Super.ItemIcon(nIndex-1)

		func ItemText nIndex 
			return Super.ItemText(nIndex-1)

		func RemoveItem nIndex 
			return Super.RemoveItem(nIndex-1)

		func SetItemIcon nIndex,p2
			return Super.SetItemIcon(nIndex-1,p2)

		func SetItemText nIndex,p2
			return Super.SetItemText(nIndex-1,p2)

		func ModelColumn 
			return Super.ModelColumn()+1

		func SetModelColumn nIndex
			return Super.SetModelColumn(nIndex-1)		

	class DateTimeEdit from qDateTimeEdit

	class TableWidget from qTableWidget

	class TreeView from qTreeView

	class TreeWidget from qTreeWidget

	class RadioButton from qRadioButton

	class WebView from qWebView

	class Dial  from qDial

	class Frame from qFrame

	class LCDNumber from qLCDNumber

	class Timer from qTimer

	class vboxlayout from qVBoxLayout

	class hboxlayour from qHBoxLayout

	class TabWidget from qTabWidget

	class Statusbar from qStatusBar

	class ToolBar from qToolBar

	class MenuBar from qMenubar 

	class Menu from qMenu 

	class DockWidget from qDockWidget 

	class TableWidgetItem from qTableWidgetItem 

	
