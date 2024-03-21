module uing

pub struct Button {
}

pub fn new_button(title string) &Button {
	b := C.uiNewButton(title.str)
	return &Button(b)
}

type ButtonCallback = fn ()

pub fn (b &Button) on_clicked(cb ButtonCallback) {
	C.uiButtonOnClicked(&C.uiButton(b), cb, 0)
}
