
module uing
struct C.uiWindow {}
pub struct Window {
}


pub fn new_window(title string, width int, height int, a int) &Window {
	w := C.uiNewWindow(title.str, width, height, a)
	return &Window(w)
}

pub fn (w &Window) set_child(c voidptr) { // &C.uiControl) {
	unsafe {
		C.uiWindowSetChild(&C.uiWindow(w), &C.uiControl(c))
	}
}
pub fn (w &Window) show() {
	C.uiControlShow(C.uiControl(w))
}

pub fn (w &Window) on_closing(cb ButtonCallback) {
	C.uiWindowOnClosing(C.uiControl(w), cb, 0)
}
