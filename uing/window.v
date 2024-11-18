module uing

pub struct C.uiWindow {}

pub struct Window {
}

type WindowCallback = fn (voidptr, voidptr) int

pub fn new_window(title string, width int, height int, a int) &Window {
	w := C.uiNewWindow(title.str, width, height, a)
	return &Window(w)
}

// @[unsafe]
pub fn (w &Window) set_child(c voidptr) {
	// pub fn (w &Window) set_child(c &Control)
	unsafe {
		C.uiWindowSetChild(&C.uiWindow(w), &C.uiControl(c))
	}
}

pub fn (w &Window) show() {
	C.uiControlShow(C.uiControl(w))
}

pub fn (w &Window) on_closing(cb WindowCallback) {
	C.uiWindowOnClosing(C.uiControl(w), cb, 0)
}

pub fn (w &Window) open_file() ?string {
	unsafe {
		r := C.uiOpenFile(&C.uiWindow(w))
		if r == 0 {
			return none
		}
		res := r.vstring()
		C.free(r)
		return res
	}
}

pub fn (w &Window) open_folder() ?string {
	unsafe {
		r := C.uiOpenFolder(&C.uiWindow(w))
		if r == 0 {
			return none
		}
		res := r.vstring()
		C.free(r)
		return res
	}
}

pub fn (w &Window) save_file() ?string {
	unsafe {
		r := C.uiSaveFile(&C.uiWindow(w))
		if r == 0 {
			return none
		}
		res := r.vstring()
		C.free(r)
		return res
	}
}

pub fn (w &Window) msg_box(title string, description string) {
	C.uiMsgBox(&C.uiWindow(w), title.str, description.str)
}

pub fn (w &Window) msg_box_error(title string, description string) {
	C.uiMsgBoxError(&C.uiWindow(w), title.str, description.str)
}
