
//{{BLOCK(zelda)

//======================================================================
//
//	zelda, 1024x256@4, 
//	+ palette 256 entries, not compressed
//	+ 731 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x32 
//	Total size: 512 + 23392 + 8192 = 32096
//
//	Time-stamp: 2022-04-22, 13:57:21
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_ZELDA_H
#define GRIT_ZELDA_H

#define zeldaTilesLen 23392
extern const unsigned short zeldaTiles[11696];

#define zeldaMapLen 8192
extern const unsigned short zeldaMap[4096];

#define zeldaPalLen 512
extern const unsigned short zeldaPal[256];

#endif // GRIT_ZELDA_H

//}}BLOCK(zelda)
