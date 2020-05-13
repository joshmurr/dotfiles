### Adding a new module

```bash
cd ~/.dotfiles
# Add the new submodule
git submodule add https://example.com/remote/path/to/repo.git vim/bundle/one-submodule
# Initialize and clone the submodule
git submodule update --init
# Stage the changes
git add vim/bundle/one-submodule
# Commit the changes
git commit -m "Add a new submodule: one-submodule"
```

### Updating Submodules

```bash
git submodule update --init --recursive
```
