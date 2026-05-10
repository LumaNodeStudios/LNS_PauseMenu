<script>
  let { playerData } = $props();
</script>

<section class="profile-section">
  <div class="avatar-container">
    <div class="avatar">
      <img src={playerData.avatar || "https://cdn.discordapp.com/attachments/1336328016531554355/1500811756757323866/13fd1a02e1c68b0b3990d45db45377d4.png?ex=69f9cb5e&is=69f879de&hm=ecc03357c84a8e7b951b4535e189e1b2351b891ae19c61432c24a74ff77438ce&"} alt="Avatar" />
    </div>
    <div class="player-id">ID: {playerData.id || 1}</div>
  </div>

  <div class="profile-stats">
    <div class="stat-item">
      <i class="fas fa-user"></i>
      <div class="content">
        <span class="label">Full Name</span>
        <span class="value">{playerData.name}</span>
      </div>
    </div>
    <div class="stat-item">
      <i class="fas fa-briefcase"></i>
      <div class="content">
        <span class="label">Job</span>
        <span class="value">{playerData.job}</span>
      </div>
    </div>
    <div class="stat-item">
      <i class="fas fa-calendar"></i>
      <div class="content">
        <span class="label">DOB</span>
        <span class="value">{playerData.dob || "01/01/1990"}</span>
      </div>
    </div>
    <div class="stat-item">
      <i class="fas fa-venus-mars"></i>
      <div class="content">
        <span class="label">Gender</span>
        <span class="value">{playerData.gender || "Male"}</span>
      </div>
    </div>
  </div>
</section>
