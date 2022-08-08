all:
	stow --verbose --target=$$HOME --restow --ignore=steam */

delete:
	stow --verbose --target=$$HOME --delete --ignore=steam */
