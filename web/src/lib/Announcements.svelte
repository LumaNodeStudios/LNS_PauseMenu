<script>
  let { announcements } = $props();
</script>

<aside class="announcements-panel">
  <div class="section-title">
    <i class="fas fa-bullhorn"></i>
    Announcements
  </div>

  <div class="announcements-list">
    {#each announcements as ann}
      <div class="announcement">
        <div class="ann-header">
          <span>by {ann.author}</span>
          <span>{ann.time} - {ann.date}</span>
        </div>
        <div class="ann-title">{ann.title}</div>
        <div class="ann-content">{ann.content}</div>
      </div>
    {/each}
  </div>
</aside>
