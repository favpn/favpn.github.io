---
layout: page
title: Random Videos
permalink: /pages/shuffle-videos/
#image: '/images/15.jpg'
---

<div class="articles" id="random-posts"></div>

<script>
  const posts = [
    {% for post in site.posts %}
      {
        title: {{ post.title | jsonify }},
        url: {{ post.url | relative_url | jsonify }},
        image: {{ post.image | relative_url | jsonify }},
        excerpt: {{ post.excerpt | strip_html | jsonify }},
        date: {{ post.date | date_to_xmlschema | jsonify }},
        date_str: {{ post.date | date_to_string | jsonify }},
        tags: {{ post.tags | jsonify }},
        video: {{ post.video_embed | jsonify }}
      }{% unless forloop.last %},{% endunless %}
    {% endfor %}
  ];

  function shuffle(arr) {
    for (let i = arr.length - 1; i > 0; i--) {
      const j = Math.floor(Math.random() * (i + 1));
      [arr[i], arr[j]] = [arr[j], arr[i]];
    }
    return arr;
  }

  const selected = shuffle(posts).slice(0, 5);
  const container = document.getElementById("random-posts");

  selected.forEach(post => {
    const el = document.createElement("div");

    el.innerHTML = `
      <div class="article">
        <div class="article__content">

          <div class="article__head">
            ${post.image && post.video ? `
              <div class="video-icon">
                <svg viewBox="0 0 100 100">
                  <polygon points="40,30 65,50 40,70"></polygon>
                </svg>
              </div>
            ` : ""}

            ${post.image ? `
              <a href="${post.url}" class="article__image">
                <img class="lazy" data-src="${post.image}" src="${post.image}" alt="${post.title}">
              </a>
            ` : ""}
          </div>

          <div class="article__info">
            <h2 class="article__title">
              <a href="${post.url}">${post.title}</a>
            </h2>

            <div class="article__meta">
              ${post.tags && post.tags.length ? `
                <div class="article__tags">
                  ${post.tags.map(tag =>
                    `<a href="/tags/?tag=${encodeURIComponent(tag.toLowerCase())}" class="article__tag">${tag}</a>`
                  ).join("")}
                </div>
                •
              ` : ""}

              <time class="article__date" datetime="${post.date}">
                ${post.date_str}
              </time>
            </div>
          </div>

        </div>
      </div>
    `;

    container.appendChild(el);
	
	if (window.lazyLoadInstance) {
  window.lazyLoadInstance.update();
}
  });
</script>