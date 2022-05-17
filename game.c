
#include "mode0.h"
#include "game.h"
#include "spritesheet.h"
#include "background.h"
#include "lvl2background.h"
#include "sound.h"
#include "collide.h"
 



// Variables
int hOff;
int vOff;
OBJ_ATTR shadowOAM[128];


SPRITE player;
SPRITE poster[14];
SPRITE curtain[3];
SPRITE clock[1];
SPRITE cart[1];
SPRITE enemy[3];
SPRITE door[4];
SPRITE lives[10];
int hit = 0;
int button = 0;
int postershit = 0;

//time
int time_m;
int time_s = 60;
// int time_cs;
int changetimes = 0;
int sb;
int frames = 0;
int framesmos = 0;
int count;
int enemymove = 0;
int postercount = 0;
int checkframe = 0;
int level = 0;
int livesleft = 3;
int isPlay = 1;
int heartenabled = 0;


enum {PLAYERRIGHT, PLAYERLEFT, PLAYERIDLE};
enum {ENEMYRIGHT, ENEMYLEFT, ENEMYIDLE};

#define LIVESCOUNT 3
#define SPRITECOUNT 5
#define ENEMYCOUNT 3
#define DOORCOUNT 4
#define CLOCKCOUNT 1
#define POSTERCOUNT 14
#define CURTAINCOUNT 2

void showTimer() {
  short time_m_1s = time_m % 10;
  short time_m_10s = time_m / 10;
  short time_s_1s = time_s % 10;
  short time_s_10s = time_s / 10;

//location
    char x = 160;
    char y = 0;

 
        //time_m
    shadowOAM[60].attr0 = ATTR0_SQUARE | y;
    shadowOAM[60].attr1 = ATTR1_TINY | x;
    shadowOAM[60].attr2 = ATTR2_TILEID((time_m / 10), 30); 

    shadowOAM[61].attr0 = ATTR0_SQUARE | y;
    shadowOAM[61].attr1 = ATTR1_TINY | (x + 8);
    shadowOAM[61].attr2 = ATTR2_TILEID((time_m % 10), 30); 

    shadowOAM[62].attr0 = ATTR0_SQUARE | y;
    shadowOAM[62].attr1 = ATTR1_TINY | (x + 8 + 8);
    shadowOAM[62].attr2 = 970;

  shadowOAM[63].attr0 = ATTR0_SQUARE | y;
  shadowOAM[63].attr1 = ATTR1_TINY | (x + 8 + 8 + 8);
  shadowOAM[63].attr2 = ATTR2_TILEID((time_s / 10), 30);

  shadowOAM[64].attr0 = ATTR0_SQUARE | y;
  shadowOAM[64].attr1 = ATTR1_TINY | (x + 8 + 8 + 8 + 8);
  shadowOAM[64].attr2 = ATTR2_TILEID((time_s % 10), 30); 
//     //55:50
//     shadowOAM[60].attr0 = ATTR0_SQUARE | y;
//     shadowOAM[60].attr1 = ATTR1_TINY | x;
//     shadowOAM[60].attr2 = 960 + 0 +time_m / 10; 

//     shadowOAM[61].attr0 = ATTR0_SQUARE | y;
//     shadowOAM[61].attr1 = ATTR1_TINY | (x + 8);
//     shadowOAM[61].attr2 = 960 + 0 +  time_m % 10;

//     shadowOAM[62].attr0 = ATTR0_SQUARE | y;
//     shadowOAM[62].attr1 = ATTR1_TINY | (x + 8 + 8);
//     shadowOAM[62].attr2 = 970;

//   shadowOAM[63].attr0 = ATTR0_SQUARE | y;
//   shadowOAM[63].attr1 = ATTR1_TINY | (x + 8 + 8 + 8);
//   shadowOAM[63].attr2 = 960 + 5 +  time_s / 10;
//   shadowOAM[63].attr2 = ATTR2_TILEID((time_s / 10), 30);

//   shadowOAM[64].attr0 = ATTR0_SQUARE | y;
//   shadowOAM[64].attr1 = ATTR1_TINY | (x + 8 + 8 + 8 + 8);
//   shadowOAM[64].attr2 = 960 + 9 + time_s % 10;
//   shadowOAM[64].attr2 = ATTR2_TILEID((time_s % 10), 30); 

}

void enableTimerInterrupts() {
    REG_IE = INT_TM3 | INT_TM2;

    //OR: count every min from code in class
        // REG_TM0CNT = 0;
        // REG_TM0D = 65536 - 60;
        // REG_TM0CNT = TM_CASCADE | TIMER_ON | TM_IRQ;

    // //cs
    //       REG_TM0CNT = 0;
    //       REG_TM0D = 65536 - 164;
    //       REG_TM0CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    // //s
        REG_TM2CNT = 0;
        REG_TM2D = 65536 - 16384;
        REG_TM2CNT = TM_FREQ_1024 | TIMER_ON | TM_IRQ;
    // //min
          REG_TM3CNT = 0;
          REG_TM3D = 65536 - 60;
          REG_TM3CNT = TM_CASCADE | TIMER_ON | TM_IRQ;
}


void stopClock() {
    isPlay = 0;
    // REG_TM3CNT = TIMER_OFF;
    // REG_TM2CNT = TIMER_OFF;
}

void unstopClock() {
    isPlay = 1;
    // REG_TM3CNT = TIMER_ON;
    // REG_TM2CNT = TIMER_ON;
}

void interruptHandler() {
    int boostallow = 1;

	REG_IME = 0;

    //if (!(BUTTON_PRESSED(BUTTON_A))) {

    if (REG_IF & INT_TM2) {
        if(isPlay) {
        time_s--;
        if (time_s < 0 && time_m > 0) {
            time_s += 60;
            time_m--;
        }
    //     if (BUTTON_PRESSED(BUTTON_A) && boostallow) {
    //     time_s += 10;
    //     boostallow = 0;
    // }
        }
    }

    // if (REG_IF & INT_TM3) {
    //     if(isPlay) {
    //     // if (time_s < 0 && time_m > 0)
    //         time_m--;
    // //     if (time_s / 10 <= 0 && time_s % 10 <= 0 && time_m / 10 <= 0 && time_m <= 0 && time_s <=0) {
    // //     hit = 3;
    // // }
    //     }
    // }

    

    // if (time_s < 30 && hit < 2 && time_m <= 0) {
    //     PALETTE[1] = RED;
    // } //else //change back to old color
    
    // if (changetimes) {
    //     if (time_m <=  0 && time_s <= 0) {
    //     time_m = 0;
    //     time_s = 59;
    //     hit = 3;
    //     //REG_IME = 0;

    //     }
    // } else {
    //     if (time_m <= 0 && time_s <= 0) {
    //     time_m = 0;
    //     time_s = 59;
    //     hit = 3;
    //     //REG_IME = 0;

    // }
    // if (hit == 3) {
    //     time_m = 0;
    //     time_s = 59;
    //     //REG_IME = 0;

    // }
    // if (postershit > 6) {
    //     time_m = 0;
    //     time_s = 0;
    // }
    // }


    //}
    // if (time_m < 0) {
    //     time_m = 0;
    //     time_s = 0;
    //     REG_IME = 0;
    //     hit = 3;
    // }
    // if (hit == 3) {
    //     time_m = 0;
    //     time_s = 0;
    //     REG_IME = 0;
    // }
    // if (postershit > 6) {
    //     time_m = 0;
    //     time_s = 0;

    //     REG_IME = 0;
    // }

    // if (BUTTON_PRESSED(BUTTON_A) && boostallow) {
    //     time_s += 10;
    //     boostallow = 0;
    // }

    //}




	if(REG_IF & INT_VBLANK) {
        if (soundA.isPlaying) {

            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = TIMER_OFF;
                }
            }
        }

        if (soundB.isPlaying) {

            soundB.vBlankCount = soundB.vBlankCount + 1;
            if (soundB.vBlankCount > soundB.duration) {
                if (soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.loops);
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    REG_TM1CNT = TIMER_OFF;
                }
            }
		}

        // REG_IF = INT_VBLANK;
		// REG_IF = REG_IF;
        REG_IF = INT_VBLANK;
	} 

    // if (!BUTTON_PRESSED(BUTTON_A))
    REG_IF = REG_IF;

	REG_IME = 1;
}

void updateTime() {

    if (time_s < 30 && hit < 2 && time_m <= 0) {
        PALETTE[1] = RED;
    } //else //change back to old color
    
    if (changetimes) {
        if (time_m <=  0 && time_s <= 0) {
        time_m = 0;
        time_s = 59;
        hit = 3;
        //REG_IME = 0;

        }
    } else {
        if (time_m <= 0 && time_s <= 0) {
        time_m = 0;
        time_s = 59;
        hit = 3;
        //REG_IME = 0;

    }
    if (hit == 3) {
        time_m = 0;
        time_s = 59;
        //REG_IME = 0;

    }
    // if (postershit > 6) {
    //     time_m = 0;
    //     time_s = 59;
    // }
    }
}

void setupInterrupts() {

	REG_IME = 0;

    // REG_IE |= INT_VBLANK;
    REG_DISPSTAT |= INT_VBLANK_ENABLE;

    REG_INTERRUPT = interruptHandler;
    enableTimerInterrupts();

    REG_IE = INT_TM3 | INT_TM2| INT_VBLANK;
	REG_IME = 1;
}



// Initialize the game
void initGame() {
    time_s = 59;
    time_m = 0;
    vOff = 25 + 70;     //new;
    hOff = 0;
    postercount = 0;
    hit = 0;
    button = 0;
    postershit = 0;
    livesleft = 3;
    changetimes = 0;
    initPlayer();
    initPoster();
    initEnemy();
    initDoor();
    initCurtain();
    initLives();
    setupInterrupts();
    

}


// Updates the game each frame
void updateGame() {
    updatePlayer();
    updateEnemy();
    // updateLives();
    updateTime();
    // updateLevel();
    // updateLives();
    frames++;
    framesmos++;
}

// Draws the game each frame
void drawGame() {
    drawPlayer();
    drawPoster();
    drawEnemy();
    drawDoor();
    drawCurtain();
    drawLives();

    waitForVBlank();
    showTimer();
    DMANow(3, shadowOAM, OAM, 128 * 4);

    REG_BG1HOFF = hOff;
    REG_BG1VOFF = vOff;
}

void updateLevel() {
            if (vOff < 256 - 512 && sb > 0) {
                sb--;
                player.worldRow -=256;
                vOff += 256;
            } 
    }


void initPlayer() {
    if (level == 0) {
    player.hide = 0;
    player.width = 16;
    player.height = 16;
    player.rdel = 1;
    player.cdel = 1;

    player.worldRow = 116 + 25 + 5 + 5 + 70; //new
    player.worldCol = 44;

    player.ishiding = 0;
    player.ishit = 0;

    player.aniState = 0;
    player.curFrame = 0;
    player.numFrames = 5;
    player.aniState = PLAYERRIGHT;

    player.goUp = 0;
    player.goDown = 0;
    player.floorlevel = 0;
    }
   

}

void initEnemy() {
    if (level == 0) {
        int r = 0;
        int c = 0;
        for (int i = 0; i <ENEMYCOUNT; i++) {
        enemy[i].width = 16;
        enemy[i].height = 32;
        enemy[i].rdel = 1;
        enemy[i].cdel = 1;

        enemy[i].worldRow = 114 + 25 - r + 5;
        enemy[i].worldCol = 136 + 19;

        enemy[i].ishiding = 0;
        enemy[i].ishit = 0;

        enemy[i].aniState = ENEMYRIGHT;
        enemy[i].curFrame = 0;
        enemy[i].aniCounter = 0;
        enemy[i].numFrames = 3;


        enemy[i].enemymove = 0;
        enemy[i].isright = 1;
        enemy[i].isleft = 0;
        r+= 69;
    }
    }

}

void initPoster() {
    if (level == 0) {
    int c = 0;
    int lvl = 0;
    int r = 0;
    for (int i = 0; i <POSTERCOUNT; i++) {
        // if (i == 0 || i == 1) {}
        poster[i].width = 16;
        poster[i].height = 16;
        poster[i].rdel = 1;
        poster[i].cdel = 1;

        // poster[i].worldRow = 113 + 25 + 5;
        if (i == 0 || i == 1) {
            poster[i].worldCol = 18 + c;
            poster[i].worldRow = 113 + 25 + 5;
        } 
         if (i == 2) {
            poster[i].worldCol = 144;
            poster[i].worldRow = 113 + 25 + 5;
        } 
         if (i == 3) {
            poster[i].worldCol = 216;
            poster[i].worldRow = 113 + 25 + 5;
        } 
         if (i == 4) { //not showing up...
            poster[i].worldCol = 50;
            poster[i].worldRow = 73;
        } 
         if (i == 5) {
            poster[i].worldCol = 145;
            poster[i].worldRow = 73;
        } 
         if (i == 6) {
            poster[i].worldCol = 218;
            poster[i].worldRow = 73;
        } 
         if (i == 7) {
            poster[i].worldCol = 50;
            poster[i].worldRow = 73;
        } 
         if (i > 7) {
            poster[i].worldCol = rand() % (40 + r) + 10;
            poster[i].worldRow = 8;
        }
        poster[i].ishiding = 0;
        poster[i].ishit = 0;

        poster[i].aniState = 0;
        poster[i].curFrame = 0;

        c+=55;
        r+= 12;
    }
    }

}

void initDoor() {
     int r = 0;
        for (int i = 0; i <DOORCOUNT; i++) {
        door[i].width = 16;
        door[i].height = 16;
        door[i].rdel = 1;
        door[i].cdel = 1;

        door[i].worldRow = 232 - r; //88 is the next one
        door[i].worldCol = 104;

        door[i].ishiding = 0;
        door[i].ishit = 0;
        door[i].ishitD = 0;

        door[i].aniState = 0;
        door[i].curFrame = 0;
        r+= 72;
    }
}

void initCurtain() {
    int r = 0;
        for (int i = 0; i <CURTAINCOUNT; i++) {
        curtain[i].width = 16;
        curtain[i].height = 16;
        curtain[i].rdel = 1;
        curtain[i].cdel = 1;

        curtain[i].worldRow = 115 + 25 + 5 - r;
        curtain[i].worldCol = 176;

        curtain[i].ishiding = 0;
        curtain[i].ishit = 0;

        curtain[i].aniState = 0;
        curtain[i].curFrame = 0;
        r+=72;
    }
}

void initLives() {
    int c = 0;
    for (int i = 0; i < livesleft; i++) {
        lives[i].width = 8;
        lives[i].height = 8;

        lives[i].worldRow = 0;
        lives[i].worldCol = 13 + c;

        lives[i].aniState = 0;
        lives[i].curFrame = 0;
        c += 10;
    }
}
// Handle every-frame actions of the player

void updatePlayer() {
    if (BUTTON_HELD(BUTTON_RIGHT)) {
                for (int i = 0; i <CURTAINCOUNT; i++) {
            if (curtain[i].ishit == 1)
            curtain[i].ishit = 0;
                }
        if (player.hide == 1)
            player.hide = 0;
            player.ishiding = 0;

        // player.worldCol += player.cdel;

        //if (collision())
        if (player.worldCol + player.width < MAPWIDTH - 13) {
            player.worldCol += player.cdel;

            if(hOff+1 < (MAPWIDTH - SCREENWIDTH) && ((player.worldCol - hOff) > (SCREENWIDTH/2)) && (hOff + SCREENWIDTH < MAPWIDTH)) {
                hOff++;
            }
        }
    }
    if (BUTTON_HELD(BUTTON_LEFT)) {
                for (int i = 0; i <CURTAINCOUNT; i++) {
            if (curtain[i].ishit == 1)
            curtain[i].ishit = 0;
                }
        if (player.hide == 1)
            player.hide = 0;
            player.ishiding = 0;

        if (player.worldCol > 13) {
            player.worldCol -= player.cdel;
        }

        if((hOff - 1 >= 0) && ((player.worldCol - hOff) <= (SCREENWIDTH/2))) {
            hOff--;
        }
    }

    if(BUTTON_PRESSED(BUTTON_UP)) {
        if (player.hide == 1)
        player.hide = 0;
        for (int i = 0; i <DOORCOUNT; i++) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, door[i].worldCol, door[i].worldRow, door[i].width, door[i].height) == 1) {
            if (door[i].ishit == 1) {
                if (player.floorlevel + 1 < 4) {
                    player.goUp = 1;
                    player.floorlevel++;
                //if ((vOff - 10 >= 0 && player.worldRow - 10 < 184) &&  ((player.worldRow - vOff) <= (SCREENHEIGHT / 2))) {
                // TODO 1.0: Update background offset (aka move the screen) if the above is true
                    vOff-=33;
            //}
                // vOff -=10;
                }
            }
        }
}
    }

    if (BUTTON_PRESSED(BUTTON_DOWN)) {
    button++;
    for (int i = 0; i <CURTAINCOUNT; i++) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, curtain[i].worldCol + 1, curtain[i].worldRow, curtain[i].width -6, curtain[i].height) == 1) {
            player.ishiding = 1;
            curtain[i].ishit = 1;
            player.hide = 1;

        }  
    }

        for (int i = 0; i < DOORCOUNT; i++) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, door[i].worldCol, door[i].worldRow, door[i].width, door[i].height) == 1) {
            if (door[i].ishitD == 1) {
                if (player.floorlevel - 1 >= 0) {
                    player.floorlevel--;
                    player.goDown = 1;
                    vOff += 33;
                }
            }
         } 
    }
        //  if (player.ishiding == 1 && button % 2 == 0) {
        //     player.ishiding = 0;
        // }
    }
    for (int i = 0; i <POSTERCOUNT; i++) {
        //check if poster is not hit; then check the collision
            if (poster[i].ishit != 1) {
                if (collision(player.worldCol, player.worldRow, player.width, player.height, poster[i].worldCol, poster[i].worldRow, poster[i].width, poster[i].height) == 1) {
                    poster[i].ishit = 1;
                    postershit+=1;
            }
        }
    }

    for (int i = 0; i <ENEMYCOUNT; i++) {
        framesmos++;
        if (player.ishit != 1) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, enemy[i].worldCol + 2, enemy[i].worldRow, enemy[i].width - 8, enemy[i].height) == 1) {
            // if (player.ishiding == 0) {
            //     player.ishit = 1;
            //     hit += 1;
            //     initPlayer();
            // }
        //  for (int i = 0; i <ENEMYCOUNT; i++) {
        //     if (enemy[i].ishit == 1)
        //         enemy[i].ishit = 0;
        //     }
            if (player.ishiding == 0) {
                playSoundB(collide_data, collide_length, 0);
                player.ishit = 1;
                //enemy[i].ishit = 1;
                hit += 1;
                player.ishiding = 0;
            
                REG_MOSAIC = MOS_OH(1) | MOS_OV(1);
                shadowOAM[0].attr0 |= ATTR0_MOSAIC;
            //     //if (framesmos % 10 == 1) {
            //         initPlayer();
            //         vOff = 25;
            //         hOff = 0;
            //         checkframe = 0;
            //     //}
            }
        }
        }
}

    for (int i = 0; i <DOORCOUNT; i++) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, door[i].worldCol, door[i].worldRow, door[i].width, door[i].height) == 1) {
        door[i].ishit = 1;
        } else {
            door[i].ishit = 0;
        }
}

    for (int i = 0; i < DOORCOUNT; i++) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, door[i].worldCol, door[i].worldRow, door[i].width, door[i].height) == 1) {
        door[i].ishitD = 1;
        } 
    }



if (player.goUp ==1 && player.worldRow >= 64) {
    // player.worldRow -= 80 - 25;
    player.worldRow -= 70;
    player.goUp = 0;
}

if (player.goDown == 1) {
    player.worldRow += 70;
    player.goDown = 0;
}


// for (int i = 0; i < POSTERCOUNT; i++) {
//     if (poster[i].ishit == 1) {
//         postershit +=1;
//     }
// }

if (BUTTON_PRESSED(BUTTON_A)) {
    if (changetimes == 0) {
        // changetimes = 1;
        time_s += 10;
        if (time_s > 60) {
            time_s -= 60;
            time_m += 1;
        }
    }
}

animatePlayer();

}


void updateEnemy() {
    int chck = 0;
    // make a count variable that holds the total number of pixels it has moved in some direction 
    // and when it reaches a threshold it gets reset to zero and you change the 
    // struct's cdel value to make it move in the opposite direction!
        for (int i = 0; i <ENEMYCOUNT; i++) {
        if (frames % 10 == 1) {
            if (enemy[i].isright) {
            if (enemy[i].enemymove >= 49) {
                count += 1;
                enemy[i].enemymove = 0;
                enemy[i].cdel = -1;
                enemy[i].isright = 0;
                enemy[i].isleft = 1;
            }
            enemy[i].worldCol += enemy[i].cdel;
            enemy[i].enemymove++;
            enemy[i].aniState = ENEMYRIGHT;

            } else if (enemy[i].isleft) {
                if (enemy[i].enemymove >= 49) {
                count += 1;
                enemy[i].enemymove = 0;
                enemy[i].cdel = 1;
                enemy[i].isleft = 0;
                enemy[i].isright = 1;
            }
            enemy[i].worldCol += enemy[i].cdel;
            enemy[i].enemymove++;
            enemy[i].aniState = ENEMYLEFT;
            }
        }
            
        }
        animateEnemy(); 
        
}

void updateLives() {
    if (BUTTON_PRESSED(BUTTON_B)) {
        if (hit > 0) {
            hit -= 1;
            // livesleft+=1;
        }
    }
    if (hit == 1) {
        livesleft = 2;
    } else if (hit == 2) {
        livesleft = 1;
    }
}



// Handle player animation states
void animatePlayer() {
        // // Set previous state to current state
    player.prevAniState = player.aniState;
    player.aniState = PLAYERIDLE;

    // Change the animation frame every 20 frames of gameplay
    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if (BUTTON_HELD(BUTTON_RIGHT)) {
        player.aniState = PLAYERRIGHT;
    }
    if (BUTTON_HELD(BUTTON_LEFT)){
        player.aniState = PLAYERLEFT;
    }
    if (player.aniState == PLAYERIDLE) {
        player.curFrame = 0;
        player.aniCounter = 0;
        player.aniState = player.prevAniState;
    } else {
        player.aniCounter++;
    }
}

void animateEnemy() {
            for (int i = 0; i <ENEMYCOUNT; i++) {
            if(enemy[i].aniCounter % 12 == 0) {
                enemy[i].curFrame++;
                if (enemy[i].curFrame >= enemy[i].numFrames) {
                    enemy[i].curFrame = 0;
                }
        } enemy[i].aniCounter++;
        }
}

// Draw the player
void drawPlayer() {
    if (player.hide) {
        shadowOAM[0].attr0 |= ATTR0_HIDE;
            // REG_MOSAIC = MOS_OH(1) | MOS_OV(1);
            // shadowOAM[0].attr0 |= ATTR0_MOSAIC;
    } else {
        if (player.ishit == 0) {
            //orig 16 by 16
            shadowOAM[0].attr0 = ((ROWMASK & player.worldRow) - vOff) |ATTR0_TALL;
            shadowOAM[0].attr1 = ((COLMASK & player.worldCol) - hOff) | ATTR1_MEDIUM;
            // shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState * 2 + 10, player.curFrame * 2);
            shadowOAM[0].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(player.aniState*2 + 10 , player.curFrame*4);

        } 
        if (player.ishit == 1) {
            // REG_MOSAIC = MOS_OH(1) | MOS_OV(1);
            // shadowOAM[0].attr0 |= ATTR0_MOSAIC;
                //if (framesmos % 10 == 1) {
                    initPlayer();
                    vOff = 25 + 70;
                    hOff = 0;
                    checkframe = 0;
                //}
        }
        if (hit == 2) {
            PALETTE[1] = RED;
        }
    }
}

void drawPoster() {
    for (int i = 0; i < POSTERCOUNT; i++) {
        if (poster[i].hide) {
            shadowOAM[1 + i].attr0 |= ATTR0_HIDE;
        } else {
            if (poster[i].ishit == 0) {
            shadowOAM[1 + i].attr0 = (ROWMASK & poster[i].worldRow - vOff) |ATTR0_SQUARE;
            shadowOAM[1 + i].attr1 = (COLMASK & poster[i].worldCol - hOff) | ATTR1_SMALL;
            shadowOAM[1 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(poster[i].aniState * 2, poster[i].curFrame * 2 + 6);

            } else {
            // postershit+=1;
            shadowOAM[1 + i].attr0 = (ROWMASK & poster[i].worldRow - vOff) |ATTR0_SQUARE;
            shadowOAM[1 + i].attr1 = (COLMASK & poster[i].worldCol - hOff) | ATTR1_SMALL;
            shadowOAM[1 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(poster[i].aniState * 2 + 2, poster[i].curFrame * 2 + 6);
            }
        }
    }
}

void drawDoor() {
    for (int i = 0; i < DOORCOUNT; i++) {
        if (door[i].hide) {
            shadowOAM[20 + i].attr0 |= ATTR0_HIDE;
        } else {
            if (door[i].ishit == 0) {
            shadowOAM[20 + i].attr0 = ((ROWMASK & door[i].worldRow) - vOff) |ATTR0_SQUARE;
            shadowOAM[20 + i].attr1 = ((COLMASK & door[i].worldCol) - hOff) | ATTR1_SMALL;
            shadowOAM[20 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(door[i].aniState * 2, door[i].curFrame * 2 + 2);

            } else {
            shadowOAM[20 + i].attr0 = ((ROWMASK & door[i].worldRow) - vOff) |ATTR0_SQUARE;
            shadowOAM[20 + i].attr1 = ((COLMASK & door[i].worldCol) - hOff) | ATTR1_SMALL;
            shadowOAM[20 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(door[i].aniState * 2 + 2, door[i].curFrame * 2 + 2);
            }
        }
    }
}

void drawLives() {
    if (BUTTON_PRESSED(BUTTON_B)) {
        if (hit > 0) {
            hit -= 1;
            // livesleft+=1;
        } 
        }
    if (hit != 0) {
        if (hit == 1) {
            shadowOAM[70 + 2].attr0 |= ATTR0_HIDE;
        } else if (hit == 2) {
            shadowOAM[70 + 1].attr0 |= ATTR0_HIDE;
            shadowOAM[70 + 1].attr0 |= ATTR0_HIDE;
        }
    } else {
        for (int i = 0; i < livesleft; i++) {
            shadowOAM[70 + i].attr0 = lives[i].worldRow |ATTR0_SQUARE;
            shadowOAM[70 + i].attr1 = lives[i].worldCol| ATTR1_SMALL;
            shadowOAM[70 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(lives[i].aniState * 2 + 4, lives[i].curFrame * 2 + 2);
        }
    }

        // for (int i = 0; i < livesleft; i++) {
        //     shadowOAM[70 + i].attr0 = lives[i].worldRow |ATTR0_SQUARE;
        //     shadowOAM[70 + i].attr1 = lives[i].worldCol| ATTR1_SMALL;
        //     shadowOAM[70 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(lives[i].aniState * 2 + 4, lives[i].curFrame * 2 + 2);
        // }

}

void drawEnemy() {
        for (int i = 0; i < ENEMYCOUNT; i++) {
        if (enemy[i].hide) {
            shadowOAM[5 + i].attr0 |= ATTR0_HIDE;
        } else {
            if (enemy[i].ishit == 0) {
            shadowOAM[30 + i].attr0 = (ROWMASK & enemy[i].worldRow - vOff) |ATTR0_TALL;
            shadowOAM[30 + i].attr1 = (COLMASK & enemy[i].worldCol - hOff) | ATTR1_MEDIUM;
            shadowOAM[30 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(enemy[i].aniState * 2 + 14, enemy[i].curFrame * 4);
            }

        }
    }
}

void drawCurtain() {
        for (int i = 0; i < CURTAINCOUNT; i++) {
        if (curtain[i].hide) {
            shadowOAM[45 + i].attr0 |= ATTR0_HIDE;
        } else {
            if (curtain[i].ishit == 0) {
            shadowOAM[45 + i].attr0 = (ROWMASK & curtain[i].worldRow - vOff) |ATTR0_SQUARE;
            shadowOAM[45 + i].attr1 = (COLMASK & curtain[i].worldCol - hOff) | ATTR1_SMALL;
            shadowOAM[45 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(curtain[i].aniState, curtain[i].curFrame * 2 + 10);

            } else {
            shadowOAM[45 + i].attr0 = (ROWMASK & curtain[i].worldRow - vOff) |ATTR0_SQUARE;
            shadowOAM[45 + i].attr1 = (COLMASK & curtain[i].worldCol - hOff) | ATTR1_SMALL;
            shadowOAM[45 + i].attr2 = ATTR2_PALROW(0) | ATTR2_TILEID(curtain[i].aniState * 2 + 2, curtain[i].curFrame * 2 + 10);
            }
        }
    }
}


