gsettings list-recursively > /media/data/gsettings_before_ansible

##### Things that can be done in Welcome screen
### Desktop colours
gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y-Dark'
gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark'
### Panel Layout: Traditional
gsettings set org.cinnamon app-menu-label 'Menu'
gsettings set org.cinnamon panels-height "['1:27']"
gsettings set org.cinnamon enabled-applets "['panel1:left:0:menu@cinnamon.org:30', 'panel1:left:1:show-desktop@cinnamon.org:31', 'panel1:left:2:panel-launchers@cinnamon.org:32', 'panel1:left:3:window-list@cinnamon.org:33', 'panel1:right:0:systray@cinnamon.org:34', 'panel1:right:1:xapp-status@cinnamon.org:35', 'panel1:right:2:keyboard@cinnamon.org:36', 'panel1:right:3:notifications@cinnamon.org:37', 'panel1:right:4:printers@cinnamon.org:38', 'panel1:right:5:removable-drives@cinnamon.org:39', 'panel1:right:6:favorites@cinnamon.org:40', 'panel1:right:7:user@cinnamon.org:41', 'panel1:right:8:network@cinnamon.org:42', 'panel1:right:9:sound@cinnamon.org:43', 'panel1:right:10:power@cinnamon.org:44', 'panel1:right:11:calendar@cinnamon.org:45']"
gsettings set org.cinnamon panel-zone-icon-sizes '[{"panelId": 1, "left": 0, "center": 0, "right": 0}]'
gsettings set org.cinnamon next-applet-id 46
### Background image
gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/linuxmint-una/acoelho_lush.jpg'

##### In Settings.
# Privacy:
gsettings set org.cinnamon.desktop.privacy remember-recent-files false

### Disable effects
gsettings set org.cinnamon.muffin desktop-effects false
gsettings set org.cinnamon startup-animation false
gsettings set org.cinnamon desktop-effects-workspace false
gsettings set org.cinnamon enable-vfade false

gsettings set org.cinnamon enabled-applets "['panel1:left:0:menu@cinnamon.org:78', 'panel1:right:12:show-desktop@cinnamon.org:79', 'panel1:left:2:panel-launchers@cinnamon.org:80', 'panel1:left:4:window-list@cinnamon.org:81', 'panel1:right:1:systray@cinnamon.org:82', 'panel1:right:2:xapp-status@cinnamon.org:83', 'panel1:right:3:keyboard@cinnamon.org:84', 'panel1:right:4:notifications@cinnamon.org:85', 'panel1:right:5:printers@cinnamon.org:86', 'panel1:right:6:removable-drives@cinnamon.org:87', 'panel1:right:7:favorites@cinnamon.org:88', 'panel1:right:8:user@cinnamon.org:89', 'panel1:right:9:network@cinnamon.org:90', 'panel1:right:10:sound@cinnamon.org:91', 'panel1:right:11:power@cinnamon.org:92', 'panel1:right:12:calendar@cinnamon.org:93', 'panel1:left:3:placesCenter@scollins:94']"
gsettings set org.cinnamon next-applet-id 95

##### List view
gsettings set org.nemo.preferences default-folder-viewer 'list-view'
gsettings set org.nemo.list-view default-visible-columns ['name', 'size']
gsettings set org.nemo.list-view default-column-order ['name', 'size', 'type', 'date_modified', 'date_created_with_time', 'date_accessed', 'date_created', 'detailed_type', 'group', 'where', 'mime_type', 'date_modified_with_time', 'octal_permissions', 'owner', 'permissions']

#### Desktop
gsettings set psensor interface-window-h 282
gsettings set psensor interface-window-y 197
gsettings set psensor interface-hide-on-startup true
gsettings set psensor interface-window-divider-pos 362
gsettings set psensor interface-window-w 772
gsettings set psensor interface-window-x 121
gsettings set org.nemo.desktop computer-icon-visible false
gsettings set org.nemo.desktop volumes-visible false
gsettings set org.nemo.desktop home-icon-visible false


### Sound
gsettings set org.cinnamon.desktop.sound volume-sound-enabled false
gsettings set org.cinnamon.sounds plug-enabled false
gsettings set org.cinnamon.sounds unplug-enabled false
gsettings set org.cinnamon.sounds switch-enabled false
gsettings set org.cinnamon.sounds login-enabled false
gsettings set org.cinnamon.sounds logout-enabled false
gsettings set org.cinnamon.sounds tile-enabled false

# Favovites
gsettings set org.cinnamon favorite-apps "['firefox.desktop']"

# Ignored System reports
gsettings set com.linuxmint.report ignored-reports "['install-language-packs', 'install-media-codecs']"

gsettings list-recursively > /media/data/gsettings_after_ansible
