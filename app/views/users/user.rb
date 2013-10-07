<h1>User list</h1>

  <ul>
  <% @users.each do |user| %>
<li><p><%=user.username %>:<% user.email%></p></li>
      <%end%>

</ul>