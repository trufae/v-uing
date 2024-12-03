import uing

fn main() {
	uing.initialize()!

	w := uing.new_window('hello', 800, 600, 1)

	box := uing.new_vbox()
	label := uing.new_label('world')
	box.append(label, 1)

	hbox := uing.new_hbox()
	b0 := uing.new_button('quit')
	b0.on_clicked(fn [w] () {
		w.destroy()
		uing.quit()
	})
	b1 := uing.new_button('open file')

	entry := uing.new_entry()
	b1.on_clicked(fn [entry, w] () {
		text := entry.get_text()
		println('Why this callback is not executed ${text}')
		f := w.open_file()
		println(f)
	})
	// entry.set_padded(10)
	box.append(entry, 0)

	// slider
	slide := uing.new_slider(1, 10)
	box.append(slide, 0)

	hbox.append(b0, 1)
	hbox.append(b1, 2)
	hbox.set_padded(10)

	box.append(hbox, 1)
	box.set_padded(10)
	w.set_child(box)
	entry.set_readonly(true)
	entry.set_text('Hello World')
	if entry.is_readonly() {
		println('Entry is readonly')
	}

	// w.on_closing(uing.quit)
	w.on_closing(fn (a &C.uiWindow, b voidptr) int {
		uing.quit()
		return 1
	})
	w.set_title('My Window Title')
	w.show()

	uing.main()
	uing.finalize()
}
