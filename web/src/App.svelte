<script>
  import { fade } from 'svelte/transition';
  import Sidebar from './lib/Sidebar.svelte';
  import MainContent from './lib/MainContent.svelte';
  import Announcements from './lib/Announcements.svelte';

  const isBrowser = !window.invokeNative;
  
  let visible = $state(isBrowser);
  let showLogoutConfirm = $state(false);
  let activeInfo = $state(null);
  let notification = $state({ show: false, message: "" });
  let theme = $state({
    primary: '#6ed3f3',
    primaryDark: '#4fbfdf',
    primaryText: '#000000'
  });

  let sessionTime = $state("00:02:47");
  let playersOnline = $state(1);
  let serverName = $state("LumaNode Studios");

  let playerData = $state({
    id: 1,
    name: "John Doe",
    job: "Unemployed",
    dob: "05-02-1995",
    gender: "Male",
    avatar: ""
  });

  let config = $state(isBrowser ? {
    navButtons: [
        { label: "RESUME", action: "hide-ui", icon: "fas fa-play" },
        { label: "SETTINGS", action: "settings", icon: "fas fa-cog" },
        { label: "KEYBINDS", action: "settings", icon: "fas fa-keyboard" },
        { label: "DISCONNECT", action: "logout", icon: "fas fa-sign-out-alt" }
    ],
    infoCards: [
        { label: "Rules", desc: "Server Guidelines", icon: "fas fa-gavel", type: "modal", title: "RULES", content: [{title: "Test", text: "Test content"}] },
        { label: "About", desc: "Our Story", icon: "fas fa-info-circle", type: "modal", title: "ABOUT", content: "Test content" }
    ],
    announcements: [
        { author: "The Mechanic", date: "05-02-2026", time: "12:58 PM", title: "ENGINE TROUBLE", content: "To the person who tried to use maple syrup as engine oil: It didn't work. Your car now smells like a pancake house and is permanently dead." },
        { author: "Police", date: "04-02-2026", time: "03:13 AM", title: "Keep Look Out", content: "Be on the lookout for a man in a hotdog suit running down Great Ocean Highway. He is not dangerous, just very fast." },
        { author: "Burger Shot", date: "03-02-2026", time: "01:20 PM", title: "OUT OF BUNS", content: "We are currently out of burger buns. All orders will be served between two slices of watermelon until further notice." },
        { author: "Burger Shot", date: "03-02-2026", time: "01:20 PM", title: "OUT OF BUNS", content: "We are currently out of burger buns. All orders will be served between two slices of watermelon until further notice." },
        { author: "Burger Shot", date: "03-02-2026", time: "01:20 PM", title: "OUT OF BUNS", content: "We are currently out of burger buns. All orders will be served between two slices of watermelon until further notice." },
        { author: "Burger Shot", date: "03-02-2026", time: "01:20 PM", title: "OUT OF BUNS", content: "We are currently out of burger buns. All orders will be served between two slices of watermelon until further notice." },
        { author: "Burger Shot", date: "03-02-2026", time: "01:20 PM", title: "OUT OF BUNS", content: "We are currently out of burger buns. All orders will be served between two slices of watermelon until further notice." },
        { author: "Burger Shot", date: "03-02-2026", time: "01:20 PM", title: "OUT OF BUNS", content: "We are currently out of burger buns. All orders will be served between two slices of watermelon until further notice." },
        { author: "Burger Shot", date: "03-02-2026", time: "01:20 PM", title: "OUT OF BUNS", content: "We are currently out of burger buns. All orders will be served between two slices of watermelon until further notice." }
    ],
    imageMap: "https://r2.fivemanage.com/ikenZGXRwE4faTVyko8MZ/pausemap.png"
  } : { navButtons: [], infoCards: [], announcements: [], imageMap: "" });

  if (isBrowser && !window.GetParentResourceName) {
    window.GetParentResourceName = () => "LNS_PauseMenu";
  }

  const handleMessage = (event) => {
    const { action, data, config: newConfig, theme: newTheme, playTime: newPlayTime } = event.data;

    if (action === "setVisible") {
      visible = data;
      if (newConfig) {
          config = newConfig;
          serverName = newConfig.serverName || serverName;
      }
      if (newTheme) theme = newTheme;
      if (newPlayTime) sessionTime = newPlayTime;
    } else if (action === "updatePlayerData") {
      playerData = data;
    }
  };

  const post = (action, data = {}) => {
    if (isBrowser) {
        if (action === 'hide-ui') visible = false;
        return;
    }
    fetch(`https://${GetParentResourceName()}/${action}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify(data),
    }).catch(console.error);
  };

  const showNotify = (msg) => {
      notification.message = msg;
      notification.show = true;
      setTimeout(() => {
          notification.show = false;
      }, 5000);
  };

  const handleAction = (btn) => {
      if (btn.type === 'modal') {
          activeInfo = btn;
      } else if (btn.action === 'logout') {
          showLogoutConfirm = true;
      } else {
          post(btn.action);
      }
  };

  const closeInfo = () => {
      activeInfo = null;
  };

  const copyDiscord = (code) => {
      if (navigator.clipboard && navigator.clipboard.writeText) {
          navigator.clipboard.writeText(code).then(() => {
              showNotify("Discord Invite Code copied to clipboard!");
          }).catch(() => {
              fallbackCopy(code);
          });
      } else {
          fallbackCopy(code);
      }
  };

  const fallbackCopy = (text) => {
      try {
          const textArea = document.createElement("textarea");
          textArea.value = text;
          
          textArea.style.position = "fixed";
          textArea.style.left = "-9999px";
          textArea.style.top = "0";
          document.body.appendChild(textArea);
          
          textArea.focus();
          textArea.select();
          
          const successful = document.execCommand('copy');
          document.body.removeChild(textArea);
          
          if (successful) {
              showNotify("Discord Invite Code copied to clipboard!");
          } else {
              showNotify("Auto-copy failed. Please highlight and copy manually.");
          }
      } catch (err) {
          showNotify("Auto-copy failed. Please highlight and copy manually.");
      }
  };

  const confirmLogout = () => {
      showLogoutConfirm = false;
      post('logout');
  };

  const cancelLogout = () => {
      showLogoutConfirm = false;
  };

  $effect(() => {
    window.addEventListener("message", handleMessage);
    const handleKeydown = (e) => {
      if (e.key === "Escape" && visible) {
        post("hide-ui");
      }
    };
    window.addEventListener("keydown", handleKeydown);

    return () => {
      window.removeEventListener("message", handleMessage);
      window.removeEventListener("keydown", handleKeydown);
    };
  });
</script>

{#if visible}
  <main 
    class="container" 
    style="--primary: {theme.primary}; --primary-dark: {theme.primaryDark}; --primary-text: {theme.primaryText};"
    transition:fade={{ duration: 400 }}
  >
    <div class="dashboard-wrapper">
      <Announcements 
        announcements={config.announcements} 
      />
      
      <MainContent 
        {playerData} 
        imageMap={config.imageMap} 
        infoCards={config.infoCards} 
        {handleAction} 
      />

      <Sidebar 
        navButtons={config.navButtons} 
        {playersOnline} 
        {sessionTime} 
        {serverName}
        {handleAction} 
      />
    </div>

    {#if showLogoutConfirm}
      <div class="modal-overlay" transition:fade={{ duration: 200 }} onclick={cancelLogout}>
        <div class="confirm-modal" onclick={(e) => e.stopPropagation()}>
          <div class="modal-icon">
            <i class="fas fa-sign-out-alt"></i>
          </div>
          <h2>Wait a minute!</h2>
          <p>Are you sure you want to disconnect from the server? Any unsaved progress may be lost.</p>
          
          <div class="modal-actions">
            <button class="modal-btn cancel" onclick={cancelLogout}>
              STAY IN GAME
            </button>
            <button class="modal-btn confirm" onclick={confirmLogout}>
              DISCONNECT
            </button>
          </div>
        </div>
      </div>
    {/if}

    {#if activeInfo}
      <div class="modal-overlay" transition:fade={{ duration: 200 }} onclick={closeInfo}>
        <div class="info-modal" onclick={(e) => e.stopPropagation()}>
          <div class="modal-header">
             <div class="title-group">
                <i class={activeInfo.icon}></i>
                <h2>{activeInfo.title}</h2>
             </div>
             <button class="close-btn" onclick={closeInfo}>
                <i class="fas fa-times"></i>
             </button>
          </div>

          <div class="modal-body">
            {#if typeof activeInfo.content === 'string'}
                <p class="text-content">{activeInfo.content}</p>
            {:else if Array.isArray(activeInfo.content)}
                <div class="info-list">
                    {#each activeInfo.content as item}
                        <div class="info-item">
                            <div class="item-title">{item.title}</div>
                            <div class="item-text">{item.text}</div>
                        </div>
                    {/each}
                </div>
            {/if}

            {#if activeInfo.isDiscord}
                <div class="discord-card">
                    <div class="discord-info">
                        <span class="label">INVITE CODE</span>
                        <span class="code">{activeInfo.inviteCode}</span>
                    </div>
                    <button class="copy-btn" onclick={() => copyDiscord(activeInfo.inviteCode)}>
                        COPY CODE
                    </button>
                </div>
            {/if}
          </div>
        </div>
      </div>
    {/if}

    {#if notification.show}
      <div class="notification-toast" transition:fade={{ duration: 300 }}>
        <i class="fas fa-info-circle"></i>
        <span>{notification.message}</span>
      </div>
    {/if}
  </main>
{/if}
