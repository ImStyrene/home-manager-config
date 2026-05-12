{ pkgs, ... }:

  {
  programs.vesktop = {
    enable = true;
    package = pkgs.vesktop;
    settings = {
      discordBranch = "canary";
      minimizeToTray = true;
      arRPC = true;
      splashColor = "#aeaeae";
      splashBackground = "#141414";
    };
    vencord = {
      settings = {
	  autoUpdate = true;
	  autoUpdateNotification = true;
	  useQuickCss = true;

	  themeLinks = [
	    "https://refact0r.github.io/system24/build/system24.css"
	  ];

	  eagerPatches = false;


	  enableReactDevtools = false;
	  frameless = false;
	  transparent = false;
	  winCtrlQ = false;
	  disableMinSize = false;
	  winNativeTitleBar = false;

	  plugins = {
	    ChatInputButtonAPI.enabled = true;
	    CommandsAPI.enabled = true;
	    DynamicImageModalAPI.enabled = true;
	    MemberListDecoratorsAPI.enabled = true;
	    MessageAccessoriesAPI.enabled = true;
	    MessageDecorationsAPI.enabled = true;
	    MessageEventsAPI.enabled = true;
	    MessagePopoverAPI.enabled = true;
	    MessageUpdaterAPI.enabled = true;
	    ServerListAPI.enabled = true;
	    UserSettingsAPI.enabled = true;

	    AccountPanelServerProfile = {
	      enabled = true;
	      prioritizeServerProfile = false;
	    };

	    AlwaysAnimate.enabled = true;
	    AlwaysExpandRoles.enabled = true;
	    AlwaysTrust.enabled = false;

	    AnonymiseFileNames = {
	      enabled = true;
	      anonymiseByDefault = true;
	      method = 0;
	      randomisedLength = 7;
	    };

	    AppleMusicRichPresence.enabled = false;
	    "WebRichPresence (arRPC)".enabled = false;

	    BetterFolders = {
	      enabled = true;
	      sidebar = true;
	      showFolderIcon = 1;
	      keepIcons = false;
	      closeAllHomeButton = false;
	      closeAllFolders = false;
	      forceOpen = false;
	      sidebarAnim = true;
	      closeOthers = false;
	    };

	    BetterGifAltText.enabled = true;
	    BetterGifPicker.enabled = true;

	    BetterNotesBox = {
	      enabled = true;
	      hide = true;
	      noSpellCheck = true;
	    };

	    BetterRoleContext.enabled = false;
	    BetterRoleDot.enabled = false;

	    BetterSessions = {
	      enabled = true;
	      backgroundCheck = false;
	    };

	    BetterSettings = {
	      enabled = true;
	      disableFade = true;
	      eagerLoad = true;
	      organizeMenu = true;
	    };

	    BetterUploadButton.enabled = true;
	    BiggerStreamPreview.enabled = true;

	    BlurNSFW = {
	      enabled = true;
	      blurAmount = 10;
	    };

	    CallTimer = {
	      enabled = true;
	      format = "stopwatch";
	    };

	    ClearURLs.enabled = true;
	    ClientTheme.enabled = false;
	    ColorSighted.enabled = false;
	    ConsoleJanitor.enabled = false;
	    ConsoleShortcuts.enabled = false;

	    CopyEmojiMarkdown = {
	      enabled = true;
	      copyUnicode = true;
	    };

	    CopyFileContents.enabled = false;
	    CopyStickerLinks.enabled = false;
	    CopyUserURLs.enabled = false;

	    CrashHandler = {
	      enabled = true;
	      attemptToPreventCrashes = true;
	      attemptToNavigateToHome = false;
	    };

	    CtrlEnterSend.enabled = false;
	    CustomIdle.enabled = false;

	    CustomRPC = {
	      enabled = true;
	      type = 0;
	      timestampMode = 0;
	    };

	    Dearrow = {
	      enabled = true;
	      hideButton = false;
	      replaceElements = 0;
	      dearrowByDefault = true;
	    };

	    Decor.enabled = true;
	    DisableCallIdle.enabled = true;
	    DontRoundMyTimestamps.enabled = false;

	    Experiments = {
	      enabled = true;
	      toolbarDevMenu = false;
	    };

	    ExpressionCloner.enabled = true;
	    F8Break.enabled = false;

	    FakeNitro = {
	      enabled = true;
	      enableEmojiBypass = true;
	      emojiSize = 48;
	      transformEmojis = true;
	      enableStickerBypass = true;
	      stickerSize = 160;
	      transformStickers = true;
	      transformCompoundSentence = false;
	      enableStreamQualityBypass = true;
	      useHyperLinks = true;
	      hyperLinkText = "{{NAME}}";
	      disableEmbedPermissionCheck = false;
	    };

	    FakeProfileThemes = {
	      enabled = true;
	      nitroFirst = false;
	    };

	    FavoriteEmojiFirst.enabled = true;

	    FavoriteGifSearch = {
	      enabled = true;
	      searchOption = "hostandpath";
	    };

	    FixCodeblockGap.enabled = false;

	    FixImagesQuality = {
	      enabled = true;
	      originalImagesInChat = false;
	    };

	    FixSpotifyEmbeds = {
	      enabled = true;
	      volume = 10;
	    };

	    FixYoutubeEmbeds.enabled = true;
	    ForceOwnerCrown.enabled = false;
	    FriendInvites.enabled = true;
	    FriendsSince.enabled = false;
	    FullSearchContext.enabled = false;
	    FullUserInChatbox.enabled = false;

	    GameActivityToggle = {
	      enabled = true;
	      oldIcon = false;
	      location = "PANEL";
	    };

	    GifPaste.enabled = false;
	    GreetStickerPicker.enabled = false;
	    HideMedia.enabled = true;
	    iLoveSpam.enabled = false;
	    IgnoreActivities.enabled = false;
	    ImageLink.enabled = false;

	    ImageZoom = {
	      enabled = true;
	      size = 350;
	      zoom = 6.399999999999999;
	      saveZoomValues = true;
	      nearestNeighbour = false;
	      square = false;
	      invertScroll = true;
	      zoomSpeed = 0.5;
	    };

	    ImplicitRelationships.enabled = false;
	    InvisibleChat.enabled = false;
	    IrcColors.enabled = false;
	    KeepCurrentChannel.enabled = false;
	    LastFMRichPresence.enabled = false;
	    LoadingQuotes.enabled = false;

	    MemberCount = {
	      enabled = true;
	      memberList = true;
	      toolTip = true;
	      voiceActivity = true;
	    };

	    MentionAvatars.enabled = false;

	    MessageClickActions = {
	      enabled = true;
	      enableDeleteOnClick = true;
	      enableDoubleClickToEdit = true;
	      enableDoubleClickToReply = true;
	      requireModifier = true;
	    };

	    MessageLatency = {
	      enabled = true;
	      latency = 1;
	      detectDiscordKotlin = true;
	      showMillis = true;
	      ignoreSelf = false;
	    };

	    MessageLinkEmbeds = {
	      enabled = true;
	      listMode = "blacklist";
	      idList = "";
	      automodEmbeds = "never";
	    };

	    MessageLogger = {
	      enabled = true;
	      deleteStyle = "text";
	      logDeletes = true;
	      collapseDeleted = false;
	      logEdits = true;
	      inlineEdits = true;
	      ignoreBots = false;
	      ignoreSelf = false;
	      ignoreUsers = "";
	      ignoreChannels = "";
	      ignoreGuilds = "";
	    };

	    MutualGroupDMs.enabled = false;

	    NewGuildSettings = {
	      enabled = true;
	      guild = true;
	      messages = 1;
	      everyone = true;
	      role = true;
	      highlights = true;
	      events = true;
	      showAllChannels = true;
	    };

	    NoBlockedMessages = {
	      enabled = true;
	      ignoreMessages = false;
	      applyToIgnoredUsers = true;
	    };

	    NoDevtoolsWarning.enabled = true;
	    NoF1.enabled = true;
	    NoMaskedUrlPaste.enabled = false;
	    NoMosaic.enabled = false;
	    NoOnboardingDelay.enabled = false;
	    NoPendingCount.enabled = false;
	    NoProfileThemes.enabled = false;

	    NoReplyMention = {
	      enabled = true;
	      userList = "1234567890123445,1234567890123445";
	      shouldPingListed = true;
	      inverseShiftReply = false;
	      roleList = "1234567890123445,1234567890123445";
	    };

	    NoServerEmojis.enabled = false;
	    NoTypingAnimation.enabled = false;
	    NoUnblockToJump.enabled = false;
	    NormalizeMessageLinks.enabled = false;

	    NotificationVolume = {
	      enabled = true;
	      notificationVolume = 50.54151624548736;
	    };

	    OnePingPerDM.enabled = false;
	    oneko.enabled = false;

	    OpenInApp = {
	      enabled = true;
	      spotify = true;
	      steam = true;
	      epic = true;
	      tidal = true;
	      itunes = true;
	    };

	    OverrideForumDefaults.enabled = false;
	    PauseInvitesForever.enabled = false;

	    PermissionFreeWill = {
	      enabled = true;
	      lockout = true;
	      onboarding = true;
	    };

	    PermissionsViewer.enabled = false;
	    petpet.enabled = true;
	    PictureInPicture.enabled = false;

	    PinDMs = {
	      enabled = true;
	      canCollapseDmSection = false;

	      userBasedCategoryList = {
		"1118310707038007307" = [
		  {
		    id = "26vhgp31nz4";
		    name = "Friends";
		    color = 10070709;
		    collapsed = false;

		    channels = [
		      "1428503625143161003"
		      "1417254155445080127"
		      "1304574815646126132"
		    ];
		  }
		];
	      };

	      pinOrder = 0;
	    };

	    PlainFolderIcon.enabled = true;

	    PlatformIndicators = {
	      enabled = true;
	      colorMobileIndicator = true;
	      list = true;
	      badges = true;
	      messages = true;
	    };

	    PreviewMessage.enabled = true;
	    QuickMention.enabled = true;
	    QuickReply.enabled = false;
	    ReactErrorDecoder.enabled = false;
	    ReadAllNotificationsButton.enabled = true;

	    RelationshipNotifier = {
	      enabled = true;
	      notices = true;
	      offlineRemovals = true;
	      friends = true;
	      friendRequestCancels = true;
	      servers = true;
	      groups = true;
	    };

	    ReplaceGoogleSearch = {
	      enabled = true;
	      customEngineName = "Mojeek";
	      customEngineURL = "https://mojeek.com/search?q=";
	      replacementEngine = "off";
	    };

	    ReplyTimestamp.enabled = true;
	    RevealAllSpoilers.enabled = false;
	    ReverseImageSearch.enabled = true;

	    ReviewDB = {
	      enabled = true;
	      notifyReviews = true;
	      showWarning = true;
	      hideTimestamps = false;
	      hideBlockedUsers = true;
	    };

	    RoleColorEverywhere = {
	      enabled = true;
	      chatMentions = true;
	      memberList = true;
	      voiceUsers = true;
	      reactorsList = true;
	      pollResults = true;
	      colorChatMessages = false;
	      messageSaturation = 30;
	    };

	    SecretRingToneEnabler = {
	      enabled = true;
	      onlySnow = false;
	    };

	    Summaries = {
	      enabled = false;
	      summaryExpiryThresholdDays = 3;
	    };

	    SendTimestamps = {
	      enabled = true;
	      replaceMessageContents = true;
	    };

	    ServerInfo.enabled = false;
	    ServerListIndicators.enabled = false;
	    ShikiCodeblocks.enabled = false;
	    ShowAllMessageButtons.enabled = true;
	    ShowConnections.enabled = false;
	    ShowHiddenChannels.enabled = false;
	    ShowHiddenThings.enabled = false;

	    ShowMeYourName = {
	      enabled = false;
	      displayNames = false;
	      mode = "user-nick";
	      inReplies = false;
	    };

	    ShowTimeoutDuration.enabled = false;

	    SilentMessageToggle = {
	      enabled = true;
	      persistState = false;
	      autoDisable = true;
	    };

	    SilentTyping = {
	      enabled = true;
	      showIcon = true;
	      contextMenu = true;
	      isEnabled = true;
	    };

	    SortFriendRequests = {
	      enabled = true;
	      showDates = false;
	    };

	    SpotifyControls = {
	      enabled = true;
	      hoverControls = false;
	      useSpotifyUris = false;
	      previousButtonRestartsTrack = true;
	    };

	    SpotifyCrack = {
	      enabled = true;
	      noSpotifyAutoPause = true;
	      keepSpotifyActivityOnIdle = false;
	    };

	    SpotifyShareCommands.enabled = true;
	    StartupTimings.enabled = true;
	    StickerPaste.enabled = true;
	    StreamerModeOnStream.enabled = false;
	    SuperReactionTweaks.enabled = false;
	    TextReplace.enabled = false;
	    ThemeAttributes.enabled = false;
	    Translate.enabled = false;

	    TypingIndicator = {
	      enabled = true;
	      includeMutedChannels = false;
	      includeCurrentChannel = true;
	      indicatorMode = 3;
	      includeBlockedUsers = false;
	    };

	    TypingTweaks.enabled = false;
	    Unindent.enabled = true;
	    UnlockedAvatarZoom.enabled = true;
	    UnsuppressEmbeds.enabled = false;
	    UserMessagesPronouns.enabled = false;
	    UserVoiceShow.enabled = false;
	    USRBG.enabled = false;
	    ValidReply.enabled = true;
	    ValidUser.enabled = true;
	    VoiceChatDoubleClick.enabled = true;

	    VcNarrator = {
	      enabled = false;
	      voice = "English (America) espeak-ng";
	      volume = 1;
	      rate = 1;
	      sayOwnName = false;
	      latinOnly = false;
	      joinMessage = "{{USER}} joined";
	      leaveMessage = "{{USER}} left";
	      moveMessage = "{{USER}} moved to {{CHANNEL}}";
	      muteMessage = "{{USER}} muted";
	      unmuteMessage = "{{USER}} unmuted";
	      deafenMessage = "{{USER}} deafened";
	      undeafenMessage = "{{USER}} undeafened";
	    };

	    VencordToolbox = {
	      enabled = true;
	      showPluginMenu = true;
	    };

	    ViewIcons = {
	      enabled = true;
	      format = "webp";
	      imgSize = "1024";
	    };

	    ViewRaw = {
	      enabled = true;
	      clickMethod = "Left";
	    };

	    VoiceDownload.enabled = false;

	    VoiceMessages = {
	      enabled = true;
	      echoCancellation = true;
	      noiseSuppression = true;
	    };

	    VolumeBooster = {
	      enabled = true;
	      multiplier = 2;
	    };

	    WebKeybinds.enabled = false;
	    WebScreenShareFixes.enabled = true;
	    WhoReacted.enabled = true;
	    XSOverlay.enabled = false;
	    YoutubeAdblock.enabled = true;
	    BadgeAPI.enabled = true;

	    NoTrack = {
	      enabled = true;
	      disableAnalytics = true;
	    };

	    Settings = {
	      enabled = true;
	      settingsLocation = "aboveNitro";
	    };

	    DisableDeepLinks.enabled = true;
	    SupportHelper.enabled = true;
	    WebContextMenus.enabled = true;
	    ImageFilename.enabled = false;
	    MoreQuickReactions.enabled = false;
	    ContextMenuAPI.enabled = true;
	    MenuItemDemanglerAPI.enabled = true;
	    NoticesAPI.enabled = true;

	    CustomCommands = {
	      enabled = true;
	      tagsList = { };
	      clyde = true;
	    };

	    NoDefaultHangStatus.enabled = false;
	    CharacterCounter.enabled = false;
	    ConcatenatedComponentExtractor.enabled = true;
	    NoMiddleClickPaste.enabled = false;
	  };

	  uiElements = {
	    chatBarButtons = { };
	    messagePopoverButtons = { };
	  };

	  notifications = {
	    timeout = 5000;
	    position = "bottom-right";
	    useNative = "not-focused";
	    logLimit = 50;
	  };

	  cloud = {
	    authenticated = true;
	    url = "https://api.vencord.dev/";
	    settingsSync = true;
	  };
	themes = [
	  "https://refact0r.github.io/system24/build/system24.css"
	];
	};
      };
    };
  }
