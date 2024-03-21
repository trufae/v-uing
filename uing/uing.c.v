module uing

#include <ui.h>
#flag -I/Users/pancake/.local/share/radare2/prefix/include/
#flag -L/Users/pancake/.local/share/radare2/prefix/lib
#flag -lui

struct C.uiInitOptions {}

struct C.uiButton {}

struct C.uiControl {}

struct C.uiLabel {}

struct C.uiBox {}


struct C.uiTab {}

struct C.uiEntry {}

fn C.uiInit(options &C.uiInitOptions) &char
fn C.uiUninit()
fn C.uiMain()
fn C.uiQuit()
fn C.uiNewButton(&char) &C.uiButton
fn C.uiNewLabel(&char) &C.uiLabel
fn C.uiControl(voidptr) voidptr
fn C.uiControlShow(&C.uiWindow)
fn C.uiNewWindow(&char, int, int, int) &C.uiWindow
fn C.uiWindowSetChild(&C.uiWindow, &C.uiControl)
fn C.uiBoxSetPadded(&C.uiBox, int)
fn C.uiBoxAppend(&C.uiBox, &C.uiControl, int)
fn C.uiNewVerticalBox() &C.uiBox
fn C.uiNewHorizontalBox() &C.uiBox
fn C.uiButtonOnClicked(&C.uiButton, ButtonCallback, voidptr)
fn C.uiWindowOnClosing(&C.uiButton, ButtonCallback, voidptr)
fn C.uiEntrySetText(&C.uiEntry, &char)
fn C.uiNewEntry() &C.uiEntry


pub struct Box {
}

pub struct Control {
}

pub struct Tab {
}

pub struct Entry {
}



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
