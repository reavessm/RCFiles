
$tikz
\begin{tikzpicture}[scale=3, transform shape, ->, node distance=2cm, thick,double=magenta, double distance=2pt]
  \coordinate (S);
  \node (1) [circle, draw, below of=S]               {1};
  \node (2) [circle, double, draw, below left of=1]  {2};
  \node (3) [circle, double, draw, below right of=1] {3};
  \node (4) [circle, draw, below of=2]               {4};
  \node (5) [circle, draw, below of=3]               {5};

    \draw (S) to (1);
    \draw (1) to node[above] {a} (2);
    \draw (1) to node[above] {b} (3);
    \draw (2) to[loop above] node[auto] {a} (2);
    \draw (3) to[loop above] node[auto] {b} (3);
    \draw (2) to[bend left] node[auto] {b} (4);
    \draw (4) to[bend left] node[auto] {a} (2);
    \draw (3) to[bend left] node[auto] {a} (5);
    \draw (5) to[bend left] node[auto] {b} (3);
    \draw (4) to[loop below] node[auto] {b} (4);
    \draw (5) to[loop below] node[auto] {a} (5);
\end{tikzpicture}
tikz$
