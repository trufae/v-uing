import uing

fn main() {
	uing.initialize()!

	w := uing.new_window("hello world", 800, 600, 1)
	w.show()

	uing.main()
	uing.finalize()
}
