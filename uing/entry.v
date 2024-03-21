module uing

pub fn new_entry() &Entry {
	return &Entry(C.uiNewEntry())
}

pub fn (e &Entry) set_text(text string) {
	C.uiEntrySetText(&C.uiEntry(e), text.str)
}
