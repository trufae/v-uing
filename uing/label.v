module uing

pub struct Label {
}

pub fn new_label(text string) &Label {
	l := C.uiNewLabel(text.str)
	return &Label(l)
}

pub fn (l &Label) control() &Control {
	return &Control(l)
}
