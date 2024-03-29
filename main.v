import uing

fn main() {
	uing.initialize()!

	w := uing.new_window('hello', 800, 600, 1)
	label := uing.new_label('world')
	box := uing.new_vbox()
	box.append(label.control(), 1)
	b := uing.new_button('ok')
	b.on_clicked(fn () {
		print('Why this callback is not executed')
	})
	box.append(b.control, 2)
	w.set_child(box.control())
	w.on_closing(uing.quit)
	w.show()

	uing.main()
	uing.finalize()
}
