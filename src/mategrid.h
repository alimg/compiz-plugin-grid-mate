/*
 * Compiz Fusion Mategrid plugin Mate fork
 *
 * Copyright (c) 2008 Stephen Kennedy <suasol@gmail.com>
 * Copyright (c) 2010 Scott Moreau <oreaus@gmail.com>
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * Description:
 *
 * Plugin to act like winsplit revolution (http://www.winsplit-revolution.com/)
 * use <Control><Alt>NUMPAD_KEY to move and tile your windows.
 *
 * Press the tiling keys several times to cycle through some tiling options.
 */

#include <core/core.h>
#include <core/atoms.h>
#include <core/pluginclasshandler.h>
#include <composite/composite.h>
#include <opengl/opengl.h>

#include "mategrid_options.h"

#define SNAPOFF_THRESHOLD 50

typedef enum
{
    MategridUnknown = 0,
    MategridBottomLeft = 1,
    MategridBottom = 2,
    MategridBottomRight = 3,
    MategridLeft = 4,
    MategridCenter = 5,
    MategridRight = 6,
    MategridTopLeft = 7,
    MategridTop = 8,
    MategridTopRight = 9,
    MategridMaximize = 10
} MategridType;

typedef struct _MategridProps
{
    int gravityRight;
    int gravityDown;
    int numCellsX;
    int numCellsY;
} MategridProps;

enum Edges
{
    NoEdge = 0,
    BottomLeft,
    Bottom,
    BottomRight,
    Left,
    Right,
    TopLeft,
    Top,
    TopRight
};

class Animation
{
	public:

	Animation ();

	GLfloat progress;
	CompRect fromRect;
	CompRect targetRect;
	CompRect currentRect;
	GLfloat opacity;
	GLfloat timer;
	int duration;
	bool complete;
	bool fadingOut;
};

class MategridScreen :
    public ScreenInterface,
    public CompositeScreenInterface,
    public GLScreenInterface,
    public PluginClassHandler <MategridScreen, CompScreen>,
    public MategridOptions
{
    public:

	MategridScreen (CompScreen *);
	CompositeScreen *cScreen;
	GLScreen        *glScreen;

	CompRect workarea, currentRect, desiredSlot, lastSlot,
		 desiredRect, lastWorkarea, currentWorkarea;
	MategridProps props;
	Edges edge, lastEdge;
	CompOption::Vector o;
	bool centerCheck;
	CompWindow *mGrabWindow;
	bool animating;

	void getPaintRectangle (CompRect&);
	void setCurrentRect (Animation&);

	bool initiateCommon (CompAction*, CompAction::State,
			     CompOption::Vector&, MategridType, bool);

	void glPaintRectangle (const GLScreenPaintAttrib&,
			       const GLMatrix&, CompOutput *);

	bool glPaintOutput (const GLScreenPaintAttrib &,
			    const GLMatrix &, const CompRegion &,
			    CompOutput *, unsigned int);

	void preparePaint (int msSinceLastPaint);
	void donePaint ();

	std::vector <Animation> animations;

	MategridType edgeToMategridType ();

	void handleEvent (XEvent *event);

	bool restoreWindow (CompAction*,
			    CompAction::State,
			    CompOption::Vector&);

	void
	snapbackOptionChanged (CompOption *option,
				Options    num);

	CompRect
	slotToRect (CompWindow      *w,
		    const CompRect& slot);
	CompRect
	constrainSize (CompWindow *w,
		       const CompRect& slot);
};

class MategridWindow :
    public WindowInterface,
    public PluginClassHandler <MategridWindow, CompWindow>
{
    public:

	MategridWindow (CompWindow *);
	CompWindow *window;
	MategridScreen *gScreen;

	bool isMategridResized;
	bool isMategridMaximized;
	int pointerBufDx;
	int pointerBufDy;
	int resizeCount;
	CompRect originalSize;
	MategridType lastTarget;

	void grabNotify (int, int, unsigned int, unsigned int);

	void ungrabNotify ();

	void moveNotify (int, int, bool);
};

#define GRID_WINDOW(w) \
    MategridWindow *gw = MategridWindow::get (w)

class MategridPluginVTable :
    public CompPlugin::VTableForScreenAndWindow <MategridScreen, MategridWindow>
{
    public:

	bool init ();
};

COMPIZ_PLUGIN_20090315 (mategrid, MategridPluginVTable);

 
