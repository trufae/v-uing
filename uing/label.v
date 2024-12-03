module uing

pub struct Label {
}

pub fn new_label(text string) &Label { // &C.uiControl {
	return &Label(C.uiNewLabel(text.str))
}
