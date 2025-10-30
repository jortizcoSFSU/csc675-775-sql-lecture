# Update Fork Guide

This guide explains how to update your forked repository with the latest instructor material covered during SQL lectures. It is especially useful if you've fallen behind or your fork is missing recent updates made during class.

---

## Why Should You Do This?

If you're not actively following along during lectures, you may miss updates your instructor pushes to the assignment repository — such as new starter code, example queries, test cases, or corrections.

Keeping your fork up to date ensures that:
- You have access to the most current code and examples.
- Your work is aligned with what’s covered in class.
- You avoid bugs or missing files caused by outdated content.

By following the instructions below, you can **sync your repository** with the instructor’s latest changes without starting over.


---


# How to Update Your Forked Repository with Instructor's Latest Changes

This guide will show you how to:
1. Sync your fork with the original (instructor’s) repository.
2. Choose between `merge` and `rebase` depending on your workflow.

---

## One-Time Setup (Add the Upstream Repository)

You only need to do this once, the first time you sync with the original repo.

1. Open your terminal or DataGrip terminal.
2. Navigate to your local cloned fork:
   ```bash
   cd your-repo-name
   ```
3. Add the original instructor's repository as an upstream remote:
   ```bash
   git remote add upstream https://github.com/jortizcoSFSU/csc675-775-sql-lecture.git
   ```
4. Confirm that it was added:
   ```bash
   git remote -v
   ```

You should now see something like:
```
origin    https://github.com/your-username/your-repo-name.git
upstream  https://github.com/jortizcoSFSU/csc675-775-sql-lecture.git
```

---

## Method 1: Merge (Safe, Recommended for Most Students)

This method adds the instructor’s changes to your repo without rewriting your history.

### Steps:

```bash
# Step 1: Fetch the latest changes from upstream
git fetch upstream

# Step 2: Switch to your local main branch
git checkout main

# Step 3: Merge the upstream changes into your main branch
git merge upstream/main

# Step 4: Push the updated main branch to your GitHub fork
git push origin main
```

If there are merge conflicts, Git will ask you to resolve them manually.

---

## Method 2: Rebase (Optional, For Advanced Users)

Rebase rewrites your commit history to make it as if your work was done on top of the latest instructor updates. This keeps your history cleaner but can be more confusing.

### Only use this if you're comfortable with Git and don’t mind rewriting local commits.

### Steps:

```bash
# Step 1: Fetch the latest changes from upstream
git fetch upstream

# Step 2: Switch to your main branch
git checkout main

# Step 3: Rebase onto upstream/main
git rebase upstream/main
```

### If there are conflicts:
- Git will stop and ask you to fix them.
- After fixing each conflict:
  ```bash
  git add <file-you-fixed>
  git rebase --continue
  ```

### Once successful:
```bash
# Step 4: Push your rebased branch (force push is needed)
git push origin main --force
```

---

## 📚 Summary of Key Terms

| Command                | What It Does                                           |
|------------------------|--------------------------------------------------------|
| `git fetch`            | Gets the latest changes but doesn't apply them yet     |
| `git merge`            | Adds changes with a new "merge commit"                 |
| `git rebase`           | Rewrites history to put your work on top of upstream   |
| `git push`             | Uploads your local branch to your GitHub fork          |
| `git push --force`     | Required after rebasing, replaces old history          |

---

## Final Tip

If you're unsure which method to use, **stick with `merge`**. It’s easier to manage and works for 99% of student workflows.
