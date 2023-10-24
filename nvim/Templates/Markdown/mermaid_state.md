
$mermaid
%%{init:
  {'themeVariables':
    {
      'fontSize': '35px'
    }
  }
}%%
stateDiagram
    dcmoff : Door closed, motor off
    mru : Motor running up
    dcmoff --> mru : Button pressed / start motor
mermaid$
