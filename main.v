import uing

fn main() {
	uing.initialize()!

	w := uing.new_window('hello', 800, 600, 1)
	label := uing.new_label('world')
	w.set_child(&uing.Control(label))
	w.show()

	uing.main()
	uing.finalize()
}
