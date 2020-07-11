import inheritance;

void animalMakeSound(IAnimal animal) {
	animal.makeSound();
}

void main() {
	Cat cat = new Cat();	// Cat class
	cat.makeSound();		// calling makeSound function

	// we can use IAnimal interface to call its makeSound function
	// given the class object that inherits from that interface
	animalMakeSound(new Cat());
	animalMakeSound(new Dog());
	animalMakeSound(new Cow());
}




