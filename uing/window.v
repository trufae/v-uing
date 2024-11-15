
module uing
pub struct C.uiWindow {}
pub struct Window {
}

type WindowCallback = fn (voidptr, voidptr) int

pub fn new_window(title string, width int, height int, a int) &Window {
	w := C.uiNewWindow(title.str, width, height, a)
	return &Window(w)
}

@[unsafe]
pub fn (w &Window) set_child(c voidptr) {
// pub fn (w &Window) set_child(c &Control)
	C.uiWindowSetChild(&C.uiWindow(w), &C.uiControl(c))
}

pub fn (w &Window) show() {
	C.uiControlShow(C.uiControl(w))
}

pub fn (w &Window) on_closing(cb WindowCallback) {
	C.uiWindowOnClosing(C.uiControl(w), cb, 0)
}
