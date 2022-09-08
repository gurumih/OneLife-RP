let cachedPlayers=[],biggestPlayerID=0;const playerlistElement=document.getElementById("playerlist"),plistMsgElement=document.getElementById("playerlist-message"),plistCountElement=document.getElementById("plist-count"),plistSearchElement=document.getElementById("plist-search");function applyPlayerlistFilter(){let e=plistSearchElement.value.toLowerCase();Array.from(playerlistElement.children).forEach((t=>{"playerlist-message"!=t.id&&(""==e||"string"==typeof t.dataset.pname&&t.dataset.pname.includes(e)?t.hidden=!1:t.hidden=!0)}))}function removePlayer(e){document.getElementById(`divPlayer${e.id}`).remove()}function addPlayer(e){e.id>biggestPlayerID&&(biggestPlayerID=e.id);let t=`<div class="list-group-item list-group-item-accent-secondary player text-truncate" \n                onclick="showPlayer('${e.license}')" id="divPlayer${e.id}">\n                    <span class="pping"> ---- </span>\n                    <span class="pname">${xss(e.name)}</span>\n            </div>`;$("#playerlist").append(t)}function updatePlayer(e){let t,a=document.getElementById(`divPlayer${e.id}`);e.ping=parseInt(e.ping),e.ping<0?(t="secondary",e.ping="??"):t=e.ping<60?"success":e.ping<100?"warning":"danger",a.classList.remove("list-group-item-accent-secondary","list-group-item-accent-success","list-group-item-accent-warning","list-group-item-accent-danger"),a.classList.add("list-group-item-accent-"+t),a.firstElementChild.classList.remove("text-secondary","text-success","text-warning","text-danger");const n=biggestPlayerID.toString().length+2;a.firstElementChild.innerHTML=`[${e.id}]`.padStart(n,"x").replace(/x/g,"&nbsp;"),a.lastElementChild.textContent=e.name,a.dataset.pname=e.name.toLowerCase()}function processPlayers(e){if(!Array.isArray(e))return Array.from(playerlistElement.children).forEach((e=>e.hidden=!0)),plistMsgElement.textContent="string"==typeof e?e:!1===e?"Playerlist not available.":"Invalid playerlist",void(plistMsgElement.hidden=!1);let t,a,n;plistMsgElement.hidden=!0,applyPlayerlistFilter();try{t=e.filter((e=>!cachedPlayers.filter((t=>t.id===e.id)).length)),a=cachedPlayers.filter((t=>!e.filter((e=>e.id===t.id)).length)),n=cachedPlayers.filter((t=>e.filter((e=>e.id===t.id)).length))}catch(e){console.log(`Failed to process the playerlist with message: ${e.message}`)}a.forEach(removePlayer),t.forEach(addPlayer),n.forEach(updatePlayer),e.length||(plistMsgElement.hidden=!1,plistMsgElement.innerHTML="No Players Online.<br>\n        <small>If you have players in your server, remove <code>sv_lan</code> from <code>server.cfg</code>.</small>"),cachedPlayers=e,plistCountElement.textContent=e.length}plistSearchElement&&plistSearchElement.addEventListener("input",(function(e){applyPlayerlistFilter()}));const modPlayer={curr:{id:!1,license:!1,identifiers:!1},Modal:new coreui.Modal(document.getElementById("modPlayer")),Title:document.getElementById("modPlayerTitle"),Message:document.getElementById("modPlayerMessage"),Content:document.getElementById("modPlayerContent"),Buttons:{search:document.getElementById("modPlayerButtons-search"),message:document.getElementById("modPlayerButtons-message"),kick:document.getElementById("modPlayerButtons-kick"),warn:document.getElementById("modPlayerButtons-warn")},Main:{body:document.getElementById("modPlayerMain"),tab:document.getElementById("modPlayerMain-tab"),joinDate:document.getElementById("modPlayerMain-joinDate"),playTime:document.getElementById("modPlayerMain-playTime"),sessionTime:document.getElementById("modPlayerMain-sessionTime"),notesLog:document.getElementById("modPlayerMain-notesLog"),notes:document.getElementById("modPlayerMain-notes")},IDs:{body:document.getElementById("modPlayerIDs"),tab:document.getElementById("modPlayerIDs-tab"),list:document.getElementById("modPlayerIDs-list")},History:{body:document.getElementById("modPlayerHistory"),tab:document.getElementById("modPlayerHistory-tab"),list:document.getElementById("modPlayerHistory-log")},Ban:{body:document.getElementById("modPlayerBan"),tab:document.getElementById("modPlayerBan-tab"),reason:document.getElementById("modPlayerBan-reason"),durationSelect:document.getElementById("modPlayerBan-durationSelect"),durationMultiplier:document.getElementById("modPlayerBan-durationMultiplier"),durationUnit:document.getElementById("modPlayerBan-durationUnit")}};function showPlayer(e,t="unknown",a=""){modPlayer.curr.id=!1,modPlayer.curr.license=!1,modPlayer.curr.identifiers=!1,modPlayer.Message.innerHTML=SPINNER_HTML,modPlayer.Message.classList.remove("d-none"),modPlayer.Content.classList.add("d-none"),modPlayer.Title.innerText="loading...",modPlayer.Main.tab.classList.add("active"),modPlayer.Main.body.classList.add("show","active"),modPlayer.Main.joinDate.innerText="--",modPlayer.Main.playTime.innerText="--",modPlayer.Main.sessionTime.innerText="--",modPlayer.Main.notesLog.innerText="--",modPlayer.Main.notes.value="",modPlayer.IDs.tab.classList.remove("active"),modPlayer.IDs.body.classList.remove("show","active"),modPlayer.IDs.list.innerText="loading...",modPlayer.History.tab.classList.remove("active"),modPlayer.History.body.classList.remove("show","active"),modPlayer.History.list.innerText="loading...",modPlayer.Ban.tab.classList.remove("nav-link-red","active"),modPlayer.Ban.body.classList.remove("show","active"),modPlayer.Ban.tab.classList.add("nav-link-disabled","disabled"),modPlayer.Ban.reason.value="",modPlayer.Ban.durationSelect.value="2 days",modPlayer.Ban.durationMultiplier.value="",modPlayer.Ban.durationUnit.value="days",modPlayer.Ban.durationMultiplier.disabled=!0,modPlayer.Ban.durationUnit.disabled=!0,modPlayer.Buttons.search.disabled=!0,modPlayer.Buttons.message.disabled=!0,modPlayer.Buttons.kick.disabled=!0,modPlayer.Buttons.warn.disabled=!0,modPlayer.Modal.show(),txAdminAPI({url:"/player/"+e,type:"GET",dataType:"json",success:function(e){if(e.logout)window.location="/auth?logout";else{if("danger"==e.type)return modPlayer.Title.innerText="Error",void(modPlayer.Message.innerHTML=`<h4 class=text-danger>${xss(e.message)}</h4>`);if("offline"==e.type){modPlayer.Title.innerText=t;const n=a.split(";"),r=n.join(";\n");let s=`<h4 class=text-danger>${xss(e.message)}</h4>\n`;return s+="Player Identifiers:<br>\n",s+=`<code>${xss(r)}</code>`,modPlayer.Message.innerHTML=s,modPlayer.curr.identifiers=n,void(modPlayer.Buttons.search.disabled=!1)}if(modPlayer.curr.id=e.id,modPlayer.curr.license=e.license,modPlayer.curr.identifiers=e.identifiers,modPlayer.Title.innerText=e.id?`[${e.id}] ${e.name}`:e.name,modPlayer.Main.joinDate.innerText=e.joinDate,modPlayer.Main.playTime.innerText=e.playTime,modPlayer.Main.sessionTime.innerText=e.sessionTime,modPlayer.Main.notesLog.innerText=e.notesLog,modPlayer.Main.notes.disabled=e.isTmp,modPlayer.Main.notes.value=e.notes,modPlayer.IDs.list.innerText=e.identifiers.join(",\n"),Array.isArray(e.actionHistory)&&e.actionHistory.length){e.actionHistory.reverse();let t=e.actionHistory.map((e=>`<div class="list-group-item list-group-item-accent-${xss(e.color)} player-history-entry">\n                                [${xss(e.date)}]<strong>[${xss(e.action)}]</strong>\n                                ${xss(e.reason)} (${xss(e.author)})\n                            </div>`));t.push('<div class="text-center text-info">\n                    For more events, click on the Search button below.\n                </div>'),modPlayer.History.list.innerHTML=t.join("\n")}else modPlayer.History.list.innerHTML='<h3 class="mx-auto pt-3 text-secondary">nothing here...</h3>';modPlayer.Buttons.search.disabled=!1,modPlayer.Buttons.message.disabled=e.funcDisabled.message,modPlayer.Buttons.kick.disabled=e.funcDisabled.kick,modPlayer.Buttons.warn.disabled=e.funcDisabled.warn,e.funcDisabled.ban||(modPlayer.Ban.tab.classList.add("nav-link-red"),modPlayer.Ban.tab.classList.remove("nav-link-disabled","disabled")),modPlayer.Content.classList.remove("d-none"),modPlayer.Message.classList.add("d-none")}},error:function(e,t,a){modPlayer.Title.innerText="error",modPlayer.Content.classList.add("d-none"),modPlayer.Message.classList.remove("d-none"),modPlayer.Message.innerText=`Error loading player info:\n${a}`}})}function setNoteMessage(e,t){"string"==typeof t?modPlayer.Main.notesLog.innerHTML=`<span class="text-${t}">${e}</span>`:modPlayer.Main.notesLog.innerText=e}function searchPlayer(){if(modPlayer.Modal.hide(),!modPlayer.curr.identifiers)return;const e=modPlayer.curr.identifiers.join(";");window.location.pathname==TX_BASE_PATH+"/player/list"?(searchInput.value=e,performSearch()):window.location=TX_BASE_PATH+"/player/list#"+encodeURI(e)}async function messagePlayer(){if(!modPlayer.curr.id)return;modPlayer.Modal.hide();const e=await txAdminPrompt({title:"Direct Message",description:"Type direct message below:"});if(!e||0===e.length)return;const t=$.notify({message:'<p class="text-center">Executing Command...</p>'},{});let a={id:modPlayer.curr.id,message:e.trim()};txAdminAPI({type:"POST",url:"/player/message",timeout:REQ_TIMEOUT_LONG,data:a,dataType:"json",success:function(e){t.update("progress",0),t.update("type",e.type),t.update("message",e.message)},error:function(e,a,n){t.update("progress",0),t.update("type","danger"),t.update("message",n)}})}async function kickPlayer(){if(0==modPlayer.curr.id)return;modPlayer.Modal.hide();const e=await txAdminPrompt({modalColor:"red",confirmBtnClass:"btn-red",title:"Kick Player",description:"Type the kick reason or leave it blank (press enter)",required:!1});if(!1===e)return;const t=$.notify({message:'<p class="text-center">Executing Command...</p>'},{});let a={id:modPlayer.curr.id,reason:e};txAdminAPI({type:"POST",url:"/player/kick",timeout:REQ_TIMEOUT_LONG,data:a,dataType:"json",success:function(e){t.update("progress",0),t.update("type",e.type),t.update("message",e.message),"danger"!==e.type&&modPlayer.Modal.hide()},error:function(e,a,n){t.update("progress",0),t.update("type","danger"),t.update("message",n)}})}async function warnPlayer(){if(0==modPlayer.curr.id)return;modPlayer.Modal.hide();const e=await txAdminPrompt({modalColor:"orange",confirmBtnClass:"btn-orange",title:"Warn Player",description:"Type the warn reason."});if(!1===e)return;if(!e.length)return $.notify({message:'<p class="text-center">The warn reason is required.</p>'},{type:"danger"});const t=$.notify({message:'<p class="text-center">Executing Command...</p>'},{});let a={id:modPlayer.curr.id,reason:e};txAdminAPI({type:"POST",url:"/player/warn",timeout:REQ_TIMEOUT_LONG,data:a,dataType:"json",success:function(e){t.update("progress",0),t.update("type",e.type),t.update("message",e.message),"danger"!==e.type&&modPlayer.Modal.hide()},error:function(e,a,n){t.update("progress",0),t.update("type","danger"),t.update("message",n)}})}function banPlayer(){const e=modPlayer.Ban.reason.value.trim();if(!e.length)return void $.notify({message:'<p class="text-center">The ban reason is required.</p>'},{type:"danger"});const t="custom"===modPlayer.Ban.durationSelect.value?`${modPlayer.Ban.durationMultiplier.value} ${modPlayer.Ban.durationUnit.value}`:modPlayer.Ban.durationSelect.value,a=$.notify({message:'<p class="text-center">Executing Command...</p>'},{}),n={reason:e,duration:t,reference:!1!==modPlayer.curr.id?modPlayer.curr.id:modPlayer.curr.identifiers};txAdminAPI({type:"POST",url:"/player/ban",timeout:REQ_TIMEOUT_LONG,data:n,dataType:"json",success:function(e){a.update("progress",0),a.update("type",e.type),a.update("message",e.message),"danger"!==e.type&&modPlayer.Modal.hide()},error:function(e,t,n){a.update("progress",0),a.update("type","danger"),a.update("message",n)}})}modPlayer.Main.notes.addEventListener("keydown",(e=>{if(setNoteMessage("Press enter to save."),13==e.keyCode&&!e.shiftKey){e.preventDefault(),setNoteMessage("Saving...","warning");const t={license:modPlayer.curr.license,note:modPlayer.Main.notes.value};txAdminAPI({type:"POST",url:"/player/save_note",timeout:REQ_TIMEOUT_LONG,data:t,dataType:"json",success:function(e){"string"==typeof e.message&&"string"==typeof e.type?setNoteMessage(e.message,e.type):setNoteMessage("Failed to save with error: wrong return format","danger")},error:function(e,t,a){setNoteMessage(`Failed to save with error: ${a}`,"danger")}})}})),modPlayer.Ban.durationSelect.onchange=()=>{const e="custom"!==modPlayer.Ban.durationSelect.value;modPlayer.Ban.durationMultiplier.disabled=e,modPlayer.Ban.durationUnit.disabled=e};