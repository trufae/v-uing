module uing

pub struct C.uiSlider {}

pub struct Slider {
}

type SliderCallback = fn (voidptr, voidptr)

pub fn new_slider(min int, max int) &Slider {
	return &Slider(C.uiNewSlider(min, max))
}

pub fn (s &Slider) set_range(min int, max int) {
	C.uiSliderSetRange(&C.uiSlider(s), min, max)
}

pub fn (s &Slider) get_value() int {
	return C.uiSliderValue(&C.uiSlider(s))
}

pub fn (s &Slider) has_tooltip() bool {
	return C.uiSliderHasToolTip(&C.uiSlider(s)) == 1
}

pub fn (s &Slider) set_has_tooltip(has bool) {
	C.uiSliderSetHasToolTip(&C.uiSlider(s), if has { 1 } else { 0 })
}

pub fn (w &Slider) on_changed(cb SliderCallback) {
	C.uiSliderOnChanged(C.uiControl(w), cb, 0)
}

pub fn (w &Slider) on_released(cb SliderCallback) {
	C.uiSliderOnReleased(C.uiControl(w), cb, 0)
}
