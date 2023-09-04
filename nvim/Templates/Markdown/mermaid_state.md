
$mermaid
%%{init:
  {'themeVariables':
    {
      'signalColor': '#fff',
      'signalTextColor': '#fff'
    }
  }
}%%
sequenceDiagram
    Janet->>VCS: Add+Commit foo.txt
    VCS->>Brad: Update foo.txt
    Brad->>VCS: Add+Commit changes to foo.txt
    VCS->>Janet: Update foo.txt
mermaid$
