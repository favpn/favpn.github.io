---
layout: page
title: All Videos
permalink: /pages/posts/
---

<style>
#searchInput {
  width: 100%;
  padding: 12px;
  margin-bottom: 20px;
  border-radius: 6px;
  border: 1px solid #ccc;
  font-size: 16px;
}
</style>

<script>
let postsCache = [];

function normalize(text) {
  return text
    .toLowerCase()
    .normalize("NFD")
    .replace(/[\u0300-\u036f]/g, "");
}

function initSearch() {
  const items = document.querySelectorAll(".post-item");

  postsCache = Array.from(items).map(el => ({
    element: el,
    text: normalize(el.innerText)
  }));
}

let timeout = null;

function searchPosts() {
  clearTimeout(timeout);

  timeout = setTimeout(() => {
    const input = document.getElementById("searchInput");
    const filter = normalize(input.value);

    postsCache.forEach(post => {
      if (post.text.includes(filter)) {
        post.element.style.display = "";
      } else {
        post.element.style.display = "none";
      }
    });
  }, 150);
}

document.addEventListener("DOMContentLoaded", initSearch);
</script>

<input type="text" id="searchInput" placeholder="Buscar vídeos..." onkeyup="searchPosts()">

<div class="row" id="postsList">
  {% for post in site.posts %}
  <div class="article col col-6 col-t-12 post-item">
    <div class="article__content">

      <div class="article__head">
        {% if post.image and post.video_embed %}
        <div class="video-icon">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100">
            <polygon points="40,30 65,50 40,70"></polygon>
          </svg>
        </div>
        {% endif %}

        {% if post.image %}
        <a href="{{ post.url | relative_url }}" class="article__image">
          <img 
            class="lazy"
            data-src="{{ post.image | relative_url }}"
            src="{{ post.image | relative_url }}"
            alt="{{ post.title }}"
            onerror="this.style.display='none'">
        </a>
        {% endif %}
      </div>

      <div class="article__info">
        <h2 class="article__title">
          <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        </h2>

        <div class="article__meta">
          <time class="article__date">
            {{ post.date | date: "%d/%m/%Y" }}
          </time>
        </div>
      </div>

    </div>
  </div>
  {% endfor %}
</div>