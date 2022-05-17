
//{{BLOCK(instructscreen)

//======================================================================
//
//	instructscreen, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 239 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 7648 + 2048 = 10208
//
//	Time-stamp: 2022-04-22, 20:16:27
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTSCREEN_H
#define GRIT_INSTRUCTSCREEN_H

#define instructscreenTilesLen 7648
extern const unsigned short instructscreenTiles[3824];

#define instructscreenMapLen 2048
extern const unsigned short instructscreenMap[1024];

#define instructscreenPalLen 512
extern const unsigned short instructscreenPal[256];

#endif // GRIT_INSTRUCTSCREEN_H

//}}BLOCK(instructscreen)
