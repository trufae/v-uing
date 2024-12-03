module uing

pub struct C.uiWindow {}

pub struct Window {
}

type WindowCallback = fn (&C.uiWindow, voidptr) int
type WindowCallbackVoid = fn (&C.uiWindow, voidptr)

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

pub fn (w &Window) title() string {
	unsafe {
		return C.uiWindowTitle(C.uiControl(w)).vstring()
	}
}

pub fn (w &Window) set_title(title string) {
	C.uiWindowSetTitle(C.uiControl(w), title.str)
}

pub fn (w &Window) set_content_size(width int, height int) {
	C.uiWindowSetContentSize(&C.uiWindow(w), width, height)
}

pub fn (w &Window) is_fullscreen() bool {
	return C.uiWindowFullscreen(&C.uiWindow(w)) != 0
}

pub fn (w &Window) set_fullscreen(enable bool) {
	C.uiWindowSetFullscreen(&C.uiWindow(w), enable)
}

pub fn (w &Window) is_borderless() bool {
	return C.uiWindowBorderless(&C.uiWindow(w)) != 0
}

pub fn (w &Window) set_borderless(enable bool) {
	C.uiWindowSetMargined(&C.uiWindow(w), enable)
}

pub fn (w &Window) is_resizeable() bool {
	return C.uiWindowResizeable(&C.uiWindow(w)) != 0
}

pub fn (w &Window) set_resizeable(enable bool) {
	C.uiWindowSetMargined(&C.uiWindow(w), enable)
}

pub fn (w &Window) is_margined() bool {
	return C.uiWindowMargined(&C.uiWindow(w)) != 0
}

pub fn (w &Window) set_margined(enable bool) {
	C.uiWindowSetBorderless(&C.uiWindow(w), enable)
}
pub fn (w &Window) destroy() {
	C.uiControlDestroy(C.uiControl(w))
}
