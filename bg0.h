
//{{BLOCK(bg0)

//======================================================================
//
//	bg0, 256x1024@4, 
//	+ palette 256 entries, not compressed
//	+ 299 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x128 
//	Total size: 512 + 9568 + 8192 = 18272
//
//	Time-stamp: 2022-04-18, 16:03:19
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_BG0_H
#define GRIT_BG0_H

#define bg0TilesLen 9568
extern const unsigned short bg0Tiles[4784];

#define bg0MapLen 8192
extern const unsigned short bg0Map[4096];

#define bg0PalLen 512
extern const unsigned short bg0Pal[256];

#endif // GRIT_BG0_H

//}}BLOCK(bg0)
