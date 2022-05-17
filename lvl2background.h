
//{{BLOCK(lvl2background)

//======================================================================
//
//	lvl2background, 256x1024@4, 
//	+ palette 256 entries, not compressed
//	+ 28 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x128 
//	Total size: 512 + 896 + 8192 = 9600
//
//	Time-stamp: 2022-04-20, 23:14:45
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LVL2BACKGROUND_H
#define GRIT_LVL2BACKGROUND_H

#define lvl2backgroundTilesLen 896
extern const unsigned short lvl2backgroundTiles[448];

#define lvl2backgroundMapLen 8192
extern const unsigned short lvl2backgroundMap[4096];

#define lvl2backgroundPalLen 512
extern const unsigned short lvl2backgroundPal[256];

#endif // GRIT_LVL2BACKGROUND_H

//}}BLOCK(lvl2background)
