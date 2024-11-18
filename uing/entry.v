module uing

type EntryChangedCallback = fn (voidptr, voidptr)

pub fn new_entry() &Entry {
	return &Entry(C.uiNewEntry())
}

pub fn new_password_entry() &Entry {
	return &Entry(C.uiNewPasswordEntry())
}

pub fn new_search_entry() &Entry {
	return &Entry(C.uiNewPasswordEntry())
}

pub fn (e &Entry) set_text(text string) {
	C.uiEntrySetText(&C.uiEntry(e), text.str)
}

pub fn (e &Entry) get_text() string {
	unsafe {
		res := C.uiEntryText(&C.uiEntry(e))
		s := res.vstring()
		C.free(res)
		return s
	}
}

pub fn (e &Entry) set_readonly(ro bool) {
	C.uiEntrySetReadOnly(&C.uiEntry(e), if ro { 1 } else { 0 })
}

pub fn (e &Entry) is_readonly() bool {
	return C.uiEntryReadOnly(&C.uiEntry(e)) == 1
}
