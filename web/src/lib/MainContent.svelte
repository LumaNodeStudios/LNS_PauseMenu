<script>
  import Profile from './Profile.svelte';
  
  let { playerData, imageMap, infoCards, handleAction } = $props();
</script>

<div class="main-content">
  <Profile {playerData} />

  <section class="community-section">
    <div class="section-title">
      <i class="fas fa-info-circle"></i>
      Information Center
    </div>
    <div class="social-cards">
      {#each infoCards as card}
        <div class="social-card" onclick={() => {
          handleAction(card);
        }}>
          <i class={card.icon}></i>
          <h3>{card.label}</h3>
          <p>{card.desc}</p>
        </div>
      {/each}
    </div>
  </section>

  <div class="map-card" onclick={() => handleAction({ action: 'map' })}>
    <img src={imageMap} class="map-bg" alt="Map" />
    <div class="map-info">
      <h2><i class="fas fa-map-marked-alt"></i> MAPS</h2>
      <p>Click to open GPS navigation</p>
    </div>
  </div>
</div>
