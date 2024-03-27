module uing

pub struct Label {
}

pub fn new_label(text string) &C.uiLabel {
	l := C.uiNewLabel(text.str)
		   return l
	// return &Label(l)
}
