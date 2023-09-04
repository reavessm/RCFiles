
$mermaid
%%{
  init: {
    'theme': 'dark',
    'gitGraph': {
      'showCommitLabel': false
    }
  }
}%%
gitGraph TB:
  commit
  commit
  branch development
  checkout development
  commit
  checkout main
  commit
  merge development
  checkout development
  commit
  branch temp
  checkout temp
  commit
  checkout development
  commit
  merge temp
  commit
  checkout main
  commit
  merge development
mermaid$
