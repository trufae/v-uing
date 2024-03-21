module uing

pub fn new_hbox() &Box {
	b := C.uiNewHorizontalBox()
	return &Box(b)
}

pub fn (b &Box) set_padded(pad int) {
	C.uiBoxSetPadded(&C.uiBox(b), pad)
}

pub fn (b &Box) append(c &Control, pos int) {
	C.uiBoxAppend(&C.uiBox(b), &C.uiControl(c), pos)
}

pub fn new_vbox() &Box {
	b := C.uiNewVerticalBox()
	return &Box(b)
}
