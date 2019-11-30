## Lecture 1

- Can move files into "New Group from Selection"
- Views have a background colour
- Buttons inherit from Views, so they can also have a background colour. Text colour is a Button property
- Can use Emojis & Symbols
- Named parameters e.g. `func flipCard(withEmoji emoji: String, on button: button)` // external name withEmoji, internal name emoji
- Can refactor rename variables (so that references to the UIComponents also get updated)
- button.currentTitle, button.setTitle, UIControlState / `UIControl.State.normal`
- Remember to add a sender type on @IBAction e.g. `@IBAction func buttonPress(_ sender: UIButton)` (instead of default's any)
- To see the StoryBoard + Code together, use "Assistant" view to split the screen vertically
- Property Observers can have anonymous delegates, e.g. `var flipCount = 0 { didSet { print("\(flipCount)") } }`, such that if flipCount was "set", the didSet closure will execute
