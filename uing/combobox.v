module uing

type ComboboxCallback = fn (voidptr, voidptr)

pub struct Combobox {
}

pub fn new_combobox() &Combobox {
	return &Combobox(C.uiNewCombobox())
}

pub fn (e &Combobox) append(text string) {
	C.uiComboboxAppend(&C.uiCombobox(e), text.str)
}

pub fn (e &Combobox) insert_at(index int, text string) {
	C.uiComboboxInsertAt(&C.uiCombobox(e), index, text.str)
}

pub fn (e &Combobox) delete_at(index int) {
	C.uiComboboxDelete(&C.uiCombobox(e), index)
}

pub fn (e &Combobox) clear() {
	C.uiComboboxClear(&C.uiCombobox(e))
}

// not very v-idiomatic
pub fn (e &Combobox) num_items() int {
	return C.uiComboboxNumItems(&C.uiCombobox(e))
}

// selected_index maybe?
pub fn (e &Combobox) get_selected() int {
	return C.uiComboboxSelected(&C.uiCombobox(e))
}

pub fn (e &Combobox) set_selected(index int) {
	C.uiComboboxSetSelected(&C.uiCombobox(e), index)
}

pub fn (e &Combobox) on_selected(cb ComboboxCallback) {
	C.uiComboboxOnSelected(&C.uiCombobox(e), cb, 0)
}

// TODO add EditableCombobox API
