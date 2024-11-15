module uing

pub struct Label {
}

pub fn new_label(text string) &C.uiControl {
	return &C.uiControl(C.uiNewLabel(text.str))
}
