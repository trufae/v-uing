module uing

pub fn new_menu(name string) &Menu {
	return &Menu(C.uiNewMenu(name.str))
}
