## Lecture 1

- Can move files into "New Group from Selection"
- Views have a background colour
- Buttons inherit from Views, so they can also have a background colour. Text colour is a Button property
- Can use Emojis & Symbols (just double click them to insert where the current blinking text cursor is)
- Named parameters e.g. `func flipCard(withEmoji emoji: String, on button: button)` // external name withEmoji, internal name emoji
- Can refactor rename variables (so that references to the UIComponents also get updated)
- button.currentTitle, button.setTitle, UIControlState / `UIControl.State.normal`
- Remember to add a sender type on @IBAction e.g. `@IBAction func buttonPress(_ sender: UIButton)` (instead of default's any)
- To see the StoryBoard + Code together, use "Assistant" view to split the screen vertically
- Property Observers can have anonymous delegates, e.g. `var flipCount = 0 { didSet { print("\(flipCount)") } }`, such that if flipCount was "set", the didSet closure will execute
- Use an Outlet Collection to have a list of `[UIButton]` and abstract away each concrete Button. Can loop over all the buttons or use indices to access them. (seems like you have to manually link each card to the same Outlet Collection?)
- Loop over collection: `for card in cards { ... }`
- use camelCase for properties, even IBOutlet/IBAction
- `?` optionals are just an enumeration for two states: set | unset
- optionals can be unwrapped safely via if let / guard let e.g. `if let cardIndex = cards.firstIndex(of: sender) { ... }`. guard let is the opposite of if let, like a guard clause
- optionals can be unsafely accessed via `!` (similar to typescript)
