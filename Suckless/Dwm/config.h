/* See LICENSE file for copyright and license details. */

/* include for media keys*/
#include <X11/XF86keysym.h>

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = {
	"HackNerdFont:size=12", "FontAwesome5Brands:size=14", 
	"FontAwesome5Free:size=14", "Icofont:size=13", "FontAwesome5Solid:size=14"
};
static const char dmenufont[]       = "Hack:size=12";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#484e5f";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};


/* volume fnct */
static const char *upvol[]   = { 
	"/usr/bin/pactl", "set-sink-volume", "0", "+5%",     NULL 
};
static const char *downvol[] = {
	"/usr/bin/pactl", "set-sink-volume", "0", "-5%",     NULL 
};
static const char *mutevol[] = { 
	"/usr/bin/pactl", "set-sink-mute",   "0", "toggle",  NULL 
};

/* tagging */
static const char *tags[] = { 
	"1: ", "2: ", "3: ", "4: ", "5: "
};

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       1<<4,            0,           -1 },
	{ "Spotify",  NULL,       NULL,       1<<3,            0,           -1 },
	{ "discord",  NULL,       NULL,       1<<2,            0,           -1 },
	{ "Chromium", NULL,       NULL,       1<<1,            0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },
	{ "[S]",      monocle },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ NULL,	      NULL},
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
	"dmenu_run", "-m", dmenumon, "-fn", 
	dmenufont, "-nb", col_gray1, "-nf", 
	col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL 
};
static const char *termcmd[]  = { "st", NULL };
static const char *tmic[] = { "amixer", "set", "Capture", "toggle", NULL };
static const char *yfscmd[] = { "fscChoice", NULL };
static const char *downbright[] = { "xbacklight", "-dec", "10", NULL };
static const char *upbright[] = { "xbacklight", "-inc", "10", NULL };
static const char *tabbedcmd[] = { "tabbed", "-r 2", "st", "-w", "''", NULL };
static const char *quitcmd[] = { "powerChoice", NULL };
static const char *reccmd[] = { "recChoice", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_t,      spawn,          {.v = termcmd } },
	{ MODKEY|ShiftMask,             XK_t,      spawn,          {.v = tabbedcmd } },
	{ MODKEY,                       XK_d,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_j,      incnmaster,     {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      incnmaster,     {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY|ShiftMask,             XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_f,      fullscreen,     {0} },
	{ MODKEY,			XK_y,	   spawn,	   {.v = yfscmd } },
	{ MODKEY,                       XK_s, 	   togglesticky,   {0} },
	{ MODKEY,                       XK_z,      zoom,           {0} },
	{ MODKEY,                       XK_l,      shiftview,      {.i = +1} },
	{ MODKEY,			XK_r,	   spawn,	   {.v = reccmd} },
	{ MODKEY,                       XK_h,      shiftview,      {.i = -1} },
	{ MODKEY,                       XK_q,      killclient,     {0} },
	{ MODKEY|ShiftMask,             XK_q,      spawn,          {.v = quitcmd } },
	{ MODKEY,                       XK_space,  togglefloating, {0} },
	{ MODKEY, 			XK_m,      cyclelayout,      {.i = -1} },
	{ MODKEY|ShiftMask,             XK_m,      cyclelayout,      {.i = +1} },
	{ 0,                            XF86XK_AudioLowerVolume,   spawn,          
		{.v = downvol } },
	{ 0,                            XF86XK_AudioMute,          spawn,          
		{.v = mutevol } },
	{ 0,                            XF86XK_AudioRaiseVolume,   spawn,          
		{.v = upvol   } },
	{ 0, 				XF86XK_MonBrightnessUp,    spawn,
		{.v = upbright } },
	{ 0,                            XF86XK_MonBrightnessDown,  spawn,
		{.v = downbright } },
	{ 0,				XF86XK_AudioMicMute,       spawn,
		{.v = tmic } },
	TAGKEYS(                        XK_ampersand,              0)
	TAGKEYS(                        XK_eacute,                 1)
	TAGKEYS(                        XK_quotedbl,               2)
	TAGKEYS(                        XK_apostrophe,             3)
	TAGKEYS(                        XK_parenleft,              4)
	//TAGKEYS(                        XK_minus,                  5)
	//TAGKEYS(                        XK_egrave,                 6)
	//TAGKEYS(                        XK_underscore,             7)
	//TAGKEYS(                        XK_ccedilla,               8)
	TAGKEYS(                        XK_1,                      0)
 	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
 	TAGKEYS(                        XK_5,                      4)
 	//TAGKEYS(                        XK_6,                      5)
 	//TAGKEYS(                        XK_7,                      6)
 	//TAGKEYS(                        XK_8,                      7)
 	//TAGKEYS(                        XK_9,                      8)	
};

/* buttons definitions */
/* click can be 
 * ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
};
