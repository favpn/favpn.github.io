---
layout: page
title: Search Videos
permalink: /pages/search/
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

// Inicializa posts visíveis com base na pesquisa
function initSearch() {
  const items = document.querySelectorAll(".post-item");
  postsCache = Array.from(items).map(el => ({
    element: el,
    text: normalize(el.innerText)
  }));

  // Verifica se existe query na URL
  const params = new URLSearchParams(window.location.search);
  const query = params.get("q") || "";

  if(query) {
    document.getElementById("searchInput").value = query;
    filterPosts(query);
  } else {
    // Se não houver query, escondemos todos ou mostramos os primeiros X
    postsCache.forEach(post => post.element.style.display = "none");
  }
}

// Filtra posts
function filterPosts(filterText) {
  const filter = normalize(filterText);
  postsCache.forEach(post => {
    post.element.style.display = post.text.includes(filter) ? "" : "none";
  });
}

// Ao digitar e apertar Enter, redireciona com query
function handleSearch(event) {
  if(event.key === "Enter") {
    const input = document.getElementById("searchInput");
    const query = input.value.trim();
    if(query) {
      // Redireciona para a mesma página com ?q=busca
      window.location.href = window.location.pathname + "?q=" + encodeURIComponent(query);
    }
    event.preventDefault();
  }
}

document.addEventListener("DOMContentLoaded", initSearch);
</script>

<!-- Campo de busca -->
<input type="text" id="searchInput" placeholder="Buscar vídeos..." onkeypress="handleSearch(event)">

<!-- Lista de posts -->
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