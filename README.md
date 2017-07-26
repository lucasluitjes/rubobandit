RuboBandit: automatically adds styling inconsistencies to your code, while ensuring functional equivalency.

Disclaimer: I get it, a consistent coding style improves readability and makes it easier to collaborate with others. On the day job and other serious projects, I'll happily rubocop some consistency into my code. Nothing but appreciation for the rubocop developers.

That said, sometimes I miss the old days. The _whytheluckystiff days, when posting a stop motion animated gif of a moving handwritten copy of your code garnered admiration from the wider Ruby community. When language constructs were used playfully to accomplish a goal or just as an expression.

So here's my small act of rebellion. A happy place for all the lovely little hacks I can't put in capital P Production code. Missing Gemfile and gemspec not accidental.

Current supported inconsistencies:

- Randomly adds random amount of whitespace to the end of some lines.
- Converts about half of all multiline comments to very long single-line comments.

Planned inconsistencies:

- Randomly swap between block styles.
- Replace descriptive variable names with single letters and add comment: `# TODO better variable names!`
- Ensure hash syntax style alternates between colon (`{key: 'value'}`) and hash-rocket (`{:key => 'value'}`)

Planned features:

- Genetic algorithm to alter the weights until a functionally equivalent result is produced. As a fitness function, calculate the distance between the ASTs of the original and modified code.


