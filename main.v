import uing

fn main() {
	uing.initialize()!

	w := uing.new_window('hello', 800, 600, 1)
	box := uing.new_vbox()
	label := uing.new_label('world')
	box.append(label, 1)
	b := uing.new_button('ok')
	b.on_clicked(fn () {
		println('Why this callback is not executed')
	})
	box.append(b, 2)
	w.set_child(box)

	// w.on_closing(uing.quit)
	w.on_closing(fn (a &C.uiWindow, b voidptr) int {
		uing.quit()
		return 1
	})
	w.show()

	uing.main()
	uing.finalize()
}
