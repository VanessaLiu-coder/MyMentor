# Team-22
MCI project 2018 - Team 22 - My Mentor

<%= form_for([@user, @user.mentors.build]) do |f| %>
<%= f.select :users, User.all.collect { |c| [c.name, c.id] }%>  

<%= f.select :user_id, @user.courses.all.collect {|x| [x.name, x.id]}%>