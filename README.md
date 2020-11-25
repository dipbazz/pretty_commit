![](https://img.shields.io/badge/Microverse-blueviolet)

# Preety commit
This project helps to check your commit message if you followed the well adapted commit guidlines or not.

## Definition

1. **why follow git commit guidlines**

Git commit message is a way to tell other developer what you have accomplished in the current commit of your code, so that they will understand what has been changed or updated in codebase. Because of that we should follow the commit guidlines that can save us and other developer time to figure out why certain changes was adapted.

2. **Commit structure to follow**

```
<type> [<scope>(optional)] <short_summary>

<description>
```

  - `<type>` can be from a list ["build", "ci", "docs", "feat", "add", "update", "refactor", "fix", "style", "test", "revert", "perf"]
  - `<scope>` is optional but could be anything specifying the place of changes filename, location, functions,  etc.
  - `<short_summary>` short explanation in imperative mood. Not capitalized. No period at the end.
  - `<description>` This is the part where you leave a detailed description about your changes during commit. Try to explain what and why you have done something. But be sure to wrap every line within 72 character.

3. **Good commit message**

```
Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely); various tools like `log`, `shortlog`
and `rebase` can get confused if you run the two together.

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

If you use an issue tracker, put references to them at the bottom,
like this:

Resolves: #123
See also: #456, #789

```
For more information regarding how you can have a great commit message you can follow [Chris Beams](https://chris.beams.io/) article about [How to Write a Git Commit Message](https://chris.beams.io/posts/git-commit/)

4. **Bad commit messages**

```
The commit message in which there is only title trying to explaing everything in one line and exceeds the line limit of 50 chars or more
```
```    
commit title that ends with dot.
```

```
Test FileHandler to accept only .pdf file

The title is good but may be a description is not wrapping within a 72 characters line limit is another example of bad commit message.
```

## Built With

- Ruby

## Getting Started

- Clone this repo.
- Navigate to the preety_commit folder
- install gem package with `bundle install`
- In your terminal run 

    `./bin/prettycommit /path/to/your/git/project/`

    or 

    `./bin/prettycommit` 

    it will accept `.` as a current path. And to get a help
    
    `./bin/prettycommit -h` 

**To test the code with rspec.**
  - install rspec using `gem install rspec` 
  - run `rspec` or `rspec --format doc` on your terminal to test the code .
  


## Authors

👤 **Dipesh Bajgain**

- GitHub: [@dipbazz](https://github.com/dipbazz)
- Twitter: [@dipbazz](https://twitter.com/dipbazz)
- LinkedIn: [Dipesh Bajgain](https://www.linkedin.com/in/dipbazz/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Git commit guidlines](https://gist.github.com/robertpainsi/b632364184e70900af4ab688decf6f53) to get understanding about what are the guidelines.
- [online git commit message editor](https://commitlint.io/)

## 📝 License

This project is [MIT](./LICENSE) licensed.
