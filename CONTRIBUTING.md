# Contributing to SQL Practice Repository

Thank you for your interest in contributing! This repository is designed to help people learn SQL, and we welcome contributions that make it better.

## How You Can Contribute

### 1. Add New Exercises
- Create exercises that fill gaps in coverage
- Ensure exercises have clear questions
- Follow the existing format and difficulty levels
- Include solutions in the appropriate solutions folder

### 2. Improve Existing Content
- Fix typos or unclear instructions
- Improve exercise descriptions
- Add more context or hints
- Enhance documentation

### 3. Add Database Support
- Provide MySQL or SQLite versions of schema files
- Document database-specific syntax differences
- Add setup instructions for other databases

### 4. Share Solutions
- Submit alternative solutions to exercises
- Explain different approaches
- Add performance comparisons

## Contribution Guidelines

### Exercise Format
When adding new exercises, follow this format:

```markdown
### Exercise X: [Short Title]
**Question:** [Clear, specific question]

**Hint:** [Optional - only if needed for difficult exercises]
```

### Solution Format
Solutions should be:
- Clear and well-commented
- Follow SQL best practices
- Use proper formatting
- Include the exercise number

Example:
```sql
-- Exercise 1: Simple SELECT
SELECT * FROM employees;
```

### Pull Request Process

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/add-new-exercises
   ```
3. **Make your changes**
   - Add exercises or improvements
   - Test your SQL queries
   - Update documentation if needed
4. **Commit with clear messages**
   ```bash
   git commit -m "Add 5 new window function exercises"
   ```
5. **Push to your fork**
   ```bash
   git push origin feature/add-new-exercises
   ```
6. **Open a Pull Request**
   - Describe what you've added or changed
   - Reference any related issues
   - Explain why the change is valuable

### Code of Conduct

- Be respectful and constructive
- Focus on helping learners
- Accept feedback gracefully
- Credit sources when appropriate

## Content Standards

### Exercises Should:
- Have a clear learning objective
- Be appropriate for the difficulty level
- Use the provided sample database
- Have a testable solution
- Build on previous concepts

### Solutions Should:
- Be correct and tested
- Follow SQL best practices
- Use clear variable/alias names
- Include comments for complex logic
- Show efficient approaches

### Documentation Should:
- Use clear, simple language
- Include examples where helpful
- Be well-formatted
- Stay up-to-date with code changes

## Testing Your Contributions

Before submitting:
1. Test all SQL queries against the sample database
2. Verify queries work in PostgreSQL (primary database)
3. Check for typos and formatting issues
4. Ensure consistency with existing content

## Questions or Suggestions?

- Open an issue for discussion
- Reach out to maintainers
- Start with small contributions

## Recognition

Contributors will be recognized in the project. We appreciate all contributions, big or small!

---

Thank you for helping others learn SQL! 🎉
