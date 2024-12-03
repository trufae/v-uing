module uing

#include <ui.h>
#flag -I/Users/pancake/.local/share/radare2/prefix/include/
#flag -L/Users/pancake/.local/share/radare2/prefix/lib
#flag -lui

struct C.uiInitOptions {}

struct C.uiButton {}

@[typedef]
struct C.uiControl {}

@[typedef]
struct C.uiLabel {}

@[typedef]
struct C.uiBox {}

struct C.uiTab {}

struct C.uiMenu {}

struct C.uiEntry {}

struct C.uiCombobox {}

struct C.uiMultilineEntry {}

fn C.uiInit(options &C.uiInitOptions) voidptr
fn C.uiUninit()
fn C.uiMain()
fn C.uiQuit()
fn C.uiNewButton(&char) &C.uiButton
fn C.uiNewLabel(&char) &C.uiLabel
fn C.uiControl(voidptr) voidptr
fn C.uiControlDestroy(voidptr)
fn C.uiControlShow(&C.uiWindow)
fn C.uiNewWindow(&char, int, int, int) &C.uiWindow
fn C.uiWindowTitle(&C.uiWindow) &char
fn C.uiWindowSetTitle(&C.uiWindow, &char)
fn C.uiWindowSetTitle(&C.uiWindow, &char)
fn C.uiWindowPosition(&C.uiWindow, &int, &int)
fn C.uiWindowOnPositionChanged(&C.uiWindow, WindowCallbackVoid, voidptr)
fn C.uiWindowSetPosition(&C.uiWindow, int, int)
fn C.uiWindowSetChild(&C.uiWindow, &C.uiControl)
fn C.uiWindowSetContentSize(&C.uiWindow, int, int)
fn C.uiWindowFullscreen(&C.uiWindow) int
fn C.uiWindowSetFullscreen(&C.uiWindow, int)
fn C.uiWindowBorderless(&C.uiWindow) int
fn C.uiWindowSetBorderless(&C.uiWindow, int)
fn C.uiWindowResizeable(&C.uiWindow) int
fn C.uiWindowSetResizeable(&C.uiWindow, int)
fn C.uiWindowMargined(&C.uiWindow) int
fn C.uiWindowSetMargined(&C.uiWindow, int)
fn C.uiBoxSetPadded(&C.uiBox, int)
fn C.uiBoxAppend(&C.uiBox, &C.uiControl, int)
fn C.uiNewVerticalBox() &C.uiBox
fn C.uiNewHorizontalBox() &C.uiBox
fn C.uiButtonOnClicked(&C.uiButton, ButtonCallback, voidptr)
fn C.uiWindowOnClosing(&C.uiButton, WindowCallback, voidptr)
fn C.uiEntrySetText(&C.uiEntry, &char)
fn C.uiEntryText(&C.uiEntry) &char
fn C.uiEntryOnChanged(&C.uiEntry, EntryChangedCallback, voidptr)
fn C.uiEntrySetReadOnly(&C.uiEntry, int)
fn C.uiEntryReadOnly(&C.uiEntry) int
fn C.uiNewEntry() &C.uiEntry
fn C.uiNewPasswordEntry() &C.uiEntry
fn C.uiNewSearchEntry() &C.uiEntry
fn C.uiNewSlider(min int, max int) &C.uiSlider
fn C.uiSliderSetRange(&C.uiSlider, int, int)
fn C.uiSliderValue(&C.uiSlider) int
fn C.uiSliderHasToolTip(&C.uiSlider) int
fn C.uiSliderSetHasToolTip(&C.uiSlider, int)
fn C.uiSliderOnChanged(&C.uiSlider, SliderCallback, voidptr)
fn C.uiSliderOnReleased(&C.uiSlider, SliderCallback, voidptr)

fn C.uiNewCombobox() &C.uiCombobox
fn C.uiComboboxAppend(&C.uiCombobox, &char)
fn C.uiComboboxInsertAt(&C.uiCombobox, int, &char)
fn C.uiComboboxDelete(&C.uiCombobox, int)
fn C.uiComboboxClear(&C.uiCombobox)
fn C.uiComboboxSetSelected(&C.uiCombobox, int)
fn C.uiComboboxSelected(&C.uiCombobox) int
fn C.uiComboboxOnSelected(&C.uiCombobox, ComboboxCallback, voidptr)
fn C.uiComboboxNumItems(&C.uiCombobox) int

fn C.uiNewMultilineEntry() &C.uiMultilineEntry
fn C.uiNewNonWrappingMultilineEntry() &C.uiMultilineEntry
fn C.uiMultilineEntryText(&C.uiMultilineEntry) &char
fn C.uiMultilineEntrySetText(&C.uiMultilineEntry, &char)
fn C.uiMultilineEntrySetReadOnly(&C.uiMultilineEntry, int)
fn C.uiMultilineEntryReadOnly(&C.uiMultilineEntry) int

fn C.uiNewMenu(&char) &C.uiMenu

fn C.uiOpenFile(&C.uiWindow) &char
fn C.uiSaveFile(&C.uiWindow) &char
fn C.uiOpenFolder(&C.uiWindow) &char
fn C.uiMsgBox(&C.uiWindow, &char, &char) &char
fn C.uiMsgBoxError(&C.uiWindow, &char, &char) &char

pub struct Box {
}

pub struct Tab {
}

pub struct Entry {
}

pub struct Menu {
}

pub struct MultilineEntry {
}

pub union Control {
	a     C.uiControl
	b     C.uiButton
	c     C.uiLabel
	d     C.uiBox
	e     Entry
	label Label
	f     Slider
	box   Box
}

// type Control = Button | Label | Box

pub fn quit() {
	C.uiQuit()
}

pub fn initialize() ! {
	opt := C.uiInitOptions{}
	s := C.uiInit(&opt)
	unsafe {
		if s != nil {
			return error(cstring_to_vstring(s))
		}
	}
}

pub fn main() {
	C.uiMain()
}

pub fn finalize() {
	C.uiUninit()
}
