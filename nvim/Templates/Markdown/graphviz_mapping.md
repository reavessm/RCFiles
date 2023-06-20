$graphviz
digraph G {
  bgcolor=invis;
  rankdir=TB;

  ru [shape=none, label=<
      <table border="0" cellborder="1" cellspacing="0">
        <tr>
          <td>Regular User</td>
        </tr>
        <tr>
          <td port="e"><u>Email</u></td>
          <td>Birthdate</td>
          <td>Sex</td>
          <td>CurrentCity</td>
          <td>HomeTown</td>
        </tr>
      </table>
    >]

  f [shape=none, label=<
      <table border="0" cellborder="1" cellspacing="0">
        <tr>
          <td>Friendship</td>
        </tr>
        <tr>
          <td port="e"><u>Email</u></td>
          <td port="f"><u>FriendEmail</u></td>
          <td>DateConnected</td>
          <td>Relationship</td>
        </tr>
      </table>
    >]

  f:e -> ru:e;
  f:f -> ru:e;
}
graphviz$
