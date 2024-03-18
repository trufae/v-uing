module uing

#include <ui.h>
#flag -I/Users/pancake/.local/share/radare2/prefix/include/
#flag -L/Users/pancake/.local/share/radare2/prefix/lib
#flag -lui

struct C.uiInitOptions {}

struct C.uiControl {}
struct C.uiLabel {}
struct C.uiBox {}
struct C.uiWindow {}

fn C.uiInit(options &C.uiInitOptions) &char
fn C.uiUninit()
fn C.uiMain()
fn C.uiNewLabel(&char) &C.uiLabel
fn C.uiControl(voidptr) voidptr
fn C.uiControlShow(&C.uiWindow)
fn C.uiNewWindow(&char, int, int, int) &C.uiWindow
fn C.uiWindowSetChild(&C.uiWindow, &C.uiControl)
fn C.uiBoxSetPadded(&C.uiBox, int)
fn C.uiBoxAppend(&C.uiBox, &C.uiControl, int)
fn C.uiNewVerticalBox() &C.uiBox
fn C.uiNewHorizontalBox() &C.uiBox

pub struct Window {
}

pub struct Label {
}
pub struct Box {
}
pub struct Control {
}

pub fn new_window(title string, width int, height int, a int) &Window {
	w := C.uiNewWindow(title.str, width, height, a)
	return &Window(w)
}
pub fn (w &Window)set_child(c &Control) {
	C.uiWindowSetChild (&C.uiWindow(w), &C.uiControl(c))
}

pub fn new_label(text string) &Label {
	l := C.uiNewLabel(text.str)
	return &Label(l)
}

pub fn new_hbox() &Box {
	b := C.uiNewHorizontalBox()
	return &Box(b)
}

pub fn (b &Box)set_padded(pad int) {
	C.uiBoxSetPadded(&C.uiBox(b), pad)
}

pub fn (b &Box)append(c &Control, pos int) {
	C.uiBoxAppend(&C.uiBox(b), &C.uiControl(c), pos)
}

pub fn new_vbox() &Box {
	b := C.uiNewVerticalBox()
   return &Box(b)
}

pub fn (w &Window) show() {
	C.uiControlShow(C.uiControl(w))
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
