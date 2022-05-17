
//{{BLOCK(winner)

//======================================================================
//
//	winner, 1024x256@4, 
//	+ palette 256 entries, not compressed
//	+ 288 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 128x32 
//	Total size: 512 + 9216 + 8192 = 17920
//
//	Time-stamp: 2022-04-29, 11:16:31
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINNER_H
#define GRIT_WINNER_H

#define winnerTilesLen 9216
extern const unsigned short winnerTiles[4608];

#define winnerMapLen 8192
extern const unsigned short winnerMap[4096];

#define winnerPalLen 512
extern const unsigned short winnerPal[256];

#endif // GRIT_WINNER_H

//}}BLOCK(winner)
