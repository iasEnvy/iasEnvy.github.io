---
layout: main
feature: space
link: /code/space.coffee
---

<div class="posts">
  {% for post in site.posts %}
    <article class="post">
      {% include post_thumb.html %}
      {% include post_title.html %}
      <div class="entry">{{ post.excerpt }}</div>
      <hr>
    </article>
  {% endfor %}
</div>
