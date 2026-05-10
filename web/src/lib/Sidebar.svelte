<script>
  let { navButtons, playersOnline, sessionTime, serverName, handleAction } = $props();
</script>

<aside class="sidebar">
  <div class="sidebar-header">
    <h1>{serverName}</h1>
  </div>

  <nav class="nav-buttons">
    {#each navButtons as btn}
      <button class="nav-btn" onclick={() => handleAction(btn)}>
        <i class={btn.icon}></i>
        <span>{btn.label}</span>
      </button>
    {/each}
  </nav>

  <div class="sidebar-bottom">
    <div class="info-pill">
      <i class="fas fa-users"></i>
      <div class="content">
        <span class="label">Players</span>
        <span class="value">{playersOnline} Online</span>
      </div>
    </div>
    <div class="info-pill">
      <i class="fas fa-history"></i>
      <div class="content">
        <span class="label">Session</span>
        <span class="value">{sessionTime}</span>
      </div>
    </div>
  </div>
</aside>
