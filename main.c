


#include "mode0.h"
#include "game.h"
#include "spritesheet.h"
#include "background.h"
#include "startscreen.h"
#include "instructscreen.h"
#include "pausescreen.h"
#include "losescreen.h"
#include "nextlevelOwin.h"
#include "bg0.h"
#include "lvl2background.h"
#include "zelda.h"
#include "sound.h"
#include "winner.h"
#include "gameSong.h"
#include "collide.h"




// Prototypes
void initialize();
void goToGame();
void game();

// States
enum {START,GAME, PAUSE, WIN, LOSE, HOWTO};
int state;
OBJ_ATTR shadowOAM[128];
SPRITE box;

// Button Variables
unsigned short buttons;
unsigned short oldButtons;
int seed;
int screenBlock;
int hOff1;
int vOff1;
int tapped;
// int screenBlock;




int main() {

    initialize();



/*comment block that explains the following: what is finished about
the game so far, what still needs to be added, any bugs that you have found, and, for
our sake, how to play the game in its current state (and see anything you want us to
see). */

/*
finished:
 most aspects of timing that I wanted
 the characters mostly
 color scheme ideas 
 the things i said in m3
 some sounds
 state screen stylings

 todo:
 edge cases for movement (lock movement spaces) but not with collision map pls no
 add timers and timer sprites that give player more time
 adding more of the same sprite items
 Tall background for level 2
 scoping out level 2 cuz its huge
 fixing why my soundb doesnt play I think
 CHEATS


 Stuff I put in my sticky notes: some resolved, idek
            decrease ammount of time to get through game for each level; last level is extra long; activate second background when about to dieee.


            problems: timer showing 1:59 but counting till 1 min

            extra long background problems (JULIAAAA)

            two level problems (how to make two levels properly and use the same background but just dma something new)

            use of tiles to display interration in states

            adding sound

            gain time sprite!!

            pop up score sprite!!

            have to go back to the base level to collect the check mark to end the game

            best way to display  score?


*/



    while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {
        case START:
            start();
            break;
        case HOWTO:
            howto();
            break;
        case GAME:
            game();
            break;
        case PAUSE:
            pause();
            break;
        case WIN:
            win();
        case LOSE:
            lose();
            break;

        }
               
    }
}

// Sets up GBA
void initialize() {

    // Set up the display
    //  Enable background 0
    REG_DISPCTL = MODE0 | BG1_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(12) | BG_SIZE_SMALL;

    // Set up background 0's control register
    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(20) | BG_SIZE_TALL;

    REG_BG2CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(15) | BG_SIZE_WIDE;

    oldButtons = buttons;
    buttons = BUTTONS;

    screenBlock = 15;
    hOff1 = 0;
    vOff1 = 0;

    setupSounds();
    // setupInterrupts();

    // initBox();

    
    //new
    // screenBlock = 20;

    // Set up the first state
    goToStart();
    // goToGame();
    // initGame();


}



// Sets up the start state.
void goToStart() {
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    REG_BG0VOFF = 0;
    REG_BG0HOFF = 0;

    REG_DISPCTL = MODE0 | BG1_ENABLE| SPRITE_ENABLE;


    //regbg0 stuff
    DMANow(3, startscreenPal, PALETTE, startscreenPalLen/ 2);
    DMANow(3, startscreenTiles, &CHARBLOCK[0], startscreenTilesLen/2);
    DMANow(3,startscreenMap, &SCREENBLOCK[12], startscreenMapLen/2);


    state = START;
}

// Runs every frame of the start state.
void start() {
    level = 0;
    seed++;
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        // setupInterrupts();
        goToHowto();
        // goToGame();
        // initGame();
    }


}

void initBox() {
    box.worldCol = 151;
    box.worldRow = 137;
    box.ishiding = 0;
}


// howto();
void goToHowto() {
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    DMANow(3, instructscreenPal, PALETTE, instructscreenPalLen/ 2);
    DMANow(3, instructscreenTiles, &CHARBLOCK[0], instructscreenTilesLen/2);
    DMANow(3,instructscreenMap, &SCREENBLOCK[12], instructscreenMapLen/2);

    state = HOWTO;
}

void howto() {
    waitForVBlank();
    if (BUTTON_PRESSED(BUTTON_START)) {
        // setupInterrupts();
        stopSound();
        playSoundA(gameSong_data, gameSong_length, 1);
        goToGame();
        initGame();
    }
}


// Sets up the pause state.
void goToPause() {
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;



    DMANow(3, pausescreenPal, PALETTE, pausescreenPalLen/ 2);
    DMANow(3, pausescreenTiles, &CHARBLOCK[0], pausescreenTilesLen/2);
    DMANow(3,pausescreenMap, &SCREENBLOCK[12], pausescreenMapLen/2);

    // stopClock();

    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = PAUSE;
}



// Runs every frame of the pause state.
void pause() {
    waitForVBlank();
        // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        unpauseSound();
        unstopClock();
    }
        // REG_DISPCTL = MODE0 | BG1_ENABLE |BG2_ENABLE | SPRITE_ENABLE;
        // unstopClock();

        // unstopClock();
}
//

// Sets up the lose state.
void goToLose() {
    // REG_DISPCTL = MODE0 | BG1_ENABLE;
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;
    DMANow(3, losescreenPal, PALETTE, losescreenPalLen/ 2);
    DMANow(3, losescreenTiles, &CHARBLOCK[0], losescreenTilesLen/2);
    DMANow(3,losescreenMap, &SCREENBLOCK[12], losescreenMapLen/2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = LOSE;
}

// Runs every frame of the lose state.
void lose() {
    waitForVBlank();
        // State transitions
    if (BUTTON_PRESSED(BUTTON_START))
        // setupInterrupts();
        goToStart();
}

void goToWin() {
    REG_BG1HOFF = 0;
    REG_BG1VOFF = 0;

    REG_DISPCTL = MODE0 | BG2_ENABLE;
    REG_BG2CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(15) | BG_SIZE_WIDE;



    DMANow(3, winnerPal, PALETTE, winnerPalLen/ 2);
    DMANow(3, winnerTiles, &CHARBLOCK[3], winnerTilesLen/2);
    DMANow(3,winnerMap, &SCREENBLOCK[15], winnerMapLen/2); //28,15,16,17
    DMANow(3,winnerMap, &SCREENBLOCK[19], 1024);


    hOff1 = 0;
    vOff1 = 0;

    REG_BG2HOFF = hOff1;
    REG_BG2VOFF = vOff1;


    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);
    state = WIN;
}

// Runs every frame of the win state
void win() {
//     waitForVBlank();
//     // Lock the framerate to 60 fps
    //waitForVBlank();



    // State transitions
    // if (BUTTON_PRESSED(BUTTON_START))
    //     goToStart();
        //gotoLevel2();

hOff1++;
REG_BG2HOFF = hOff1;

if (screenBlock == 18 && hOff1 > 256) {
    screenBlock = 15;
    hOff1 = 0;
}

if (hOff1 > 256) {
    hOff1 -= 256;
    screenBlock++;
    

}

    waitForVBlank();
    REG_BG2CNT = BG_CHARBLOCK(3) | BG_SCREENBLOCK(screenBlock) | BG_SIZE_WIDE| BG_4BPP;



    if (BUTTON_PRESSED(BUTTON_START)) {
        // REG_DISPCTL = MODE0 | BG1_ENABLE| SPRITE_ENABLE;
        //setupInterrupts();
        goToStart();
    }
}


// Sets up the game state
void goToGame() {
    REG_DISPCTL = MODE0 | BG1_ENABLE| SPRITE_ENABLE;

    // Make sure changes do not appear onscreen
    waitForVBlank();


    //new
    // DMANow(3, bg0Pal, PALETTE, 256);
    // DMANow(3, bg0Tiles, &CHARBLOCK[2], bg0TilesLen / 2);
    // DMANow(3, bg0Map, &SCREENBLOCK[20], bg0MapLen / 2);

    // REG_BG0HOFF = hOff;
    // REG_BG0VOFF = vOff;

    //new

    // Set up the background
    // if (level ==  0) {
            DMANow(3, backgroundPal, PALETTE, 256);
            DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
            DMANow(3, backgroundMap, &SCREENBLOCK[12], backgroundMapLen / 2);
    // } else {
            // REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_TALL;

            // DMANow(3, lvl2backgroundPal, PALETTE, 256);
            // DMANow(3, lvl2backgroundTiles, &CHARBLOCK[0], lvl2backgroundTilesLen / 2);
            // DMANow(3, lvl2backgroundMap, &SCREENBLOCK[27], lvl2backgroundMapLen / 2);
    // }


    REG_BG1VOFF = vOff;
    REG_BG1HOFF = hOff;
    // // Set up the sprites
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);
    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    hideSprites();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    //level on flag
    //go back into game 
    //draw curr level; play curr song
    //time +=15 time_s


    //waitForVBlank();

    state = GAME;
}

// Runs every frame of the game state
void game() {
    srand(seed);
    //     if (level ==  0) {
    //         DMANow(3, backgroundPal, PALETTE, 256);
    //         DMANow(3, backgroundTiles, &CHARBLOCK[0], backgroundTilesLen / 2);
    //         DMANow(3, backgroundMap, &SCREENBLOCK[27], backgroundMapLen / 2);
    // } else {
            // REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(27) | BG_SIZE_TALL;

    //         DMANow(3, lvl2backgroundPal, PALETTE, 256);
    //         DMANow(3, lvl2backgroundTiles, &CHARBLOCK[0], lvl2backgroundTilesLen / 2);
    //         DMANow(3, lvl2backgroundMap, &SCREENBLOCK[27], lvl2backgroundMapLen / 2);
    // }
    updateGame();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        goToPause();
        pauseSound();
        stopClock();
        // pauseSound();
        // stopClock();
    } 
    
    if (hit == 3) {
        stopSound();
        goToLose();
    } 
    if (postershit > 12) {
        stopSound();
        goToWin();
        level+=1;
        // postershit = 0;
        //gotoWin();
    //     REG_DISPCTL = MODE0 | BG0_ENABLE | BG2_ENABLE | SPRITE_ENABLE;
    //     DMANow(3, lvl2backgroundPal, PALETTE, 256);
    //     DMANow(3, lvl2backgroundTiles, &CHARBLOCK[2], lvl2backgroundTilesLen / 2);
    //     DMANow(3, lvl2backgroundMap, &SCREENBLOCK[20], lvl2backgroundMapLen / 2);
    //     initPlayer();

    // REG_BG0HOFF = hOff;
    // REG_BG0VOFF = vOff;

        //goToWin();
    // } else if (hit == 2) {
        
    // }
    } 
    if (hit == 2) {
        playSoundB(collide_data, collide_length, 0);
    }
}

