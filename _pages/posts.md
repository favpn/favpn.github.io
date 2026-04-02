---
layout: page
title: All Videos
permalink: /pages/posts/
#image: '/images/15.jpg'
---

<script>
function searchPosts() {
  const input = document.getElementById("searchInput");
  const filter = input.value.toLowerCase();
  const ul = document.getElementById("postsList");
  const li = ul.getElementsByTagName("li");

  for (let i = 0; i < li.length; i++) {
    const a = li[i].getElementsByTagName("a")[0];
    const text = a.textContent || a.innerText;

    if (text.toLowerCase().indexOf(filter) > -1) {
      li[i].style.display = "";
    } else {
      li[i].style.display = "none";
    }
  }
}
</script>

<h1>All Video</h1>

<input type="text" id="searchInput" placeholder="Buscar posts..." onkeyup="searchPosts()">

<ul id="postsList">
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a><br>
      <small>{{ post.date | date: "%d/%m/%Y" }}</small>
    </li>
  {% endfor %}
</ul>