$graphviz
graph G {
  bgcolor="invis";
  edge [dir=both, arrowhead=none, arrowtail=none];

  subgraph_entity_cluster {
    node [shape=rect, style=rounded];
    ru [label="Regular User"];
    u  [label="User"];
    s  [label="School"];
    st [label="School type"];
    e  [label="Employer"];

    ruu [label="d", shape=circle];
    ru -- ruu [arrowhead="icurve"];
    ruu -- u;
  }

  subgraph_relationship_cluster {
    node [shape=diamond];

    a [label="Attends"];
    ru -- a [label="N"];
    a -- s  [label="M"];

    sst [label=""];
    s -- sst  [label="N"];
    sst -- st [label="1"];

    rue [label="Employment"];
    ru -- rue [label="N"];
    rue -- e  [label="M"];
  }

  subgraph_attribute_cluster {

    tn [label=<<u>Type Name</u>>]
    st -- tn;

    yg [label="Year Graduated", peripheries=2];
    a -- yg;

    sn [label=<<u>School Name</u>>];
    s -- sn;

    jt [label="Job Title", peripheries=2];
    rue -- jt;
  }
}
graphviz$
