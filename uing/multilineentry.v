module uing

pub fn new_multiline_entry(wrapping bool) &MultilineEntry {
	unsafe {
		if wrapping {
			return &MultilineEntry(C.uiNewNonWrappingMultilineEntry())
		}
		return &MultilineEntry(C.uiNewMultilineEntry())
	}
}

pub fn (e &MultilineEntry) get_text() string {
	unsafe {
		res := C.uiMultilineEntryText(&C.uiMultilineEntry(e))
		s := res.vstring()
		C.free(res)
		return s
	}
}

pub fn (e &MultilineEntry) set_text(text string) {
	unsafe {
		C.uiMultilineEntrySetText(&C.uiMultilineEntry(e), text.str)
	}
}

pub fn (e &MultilineEntry) set_readonly(ro bool) {
	C.uiMultilineEntrySetReadOnly(&C.uiMultilineEntry(e), if ro { 1 } else { 0 })
}

pub fn (e &MultilineEntry) is_readonly() bool {
	return C.uiMultilineEntryReadOnly(&C.uiMultilineEntry(e)) == 1
}
