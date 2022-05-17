# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"

# 1 "mode0.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 89 "mode0.h"
typedef void (*ihp_t)(void);
# 140 "mode0.h"
extern volatile unsigned short *videoBuffer;
# 161 "mode0.h"
typedef struct {
    u16 tileimg[8192];
} charblock;


typedef struct {
    u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();


typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[128];
# 230 "mode0.h"
void hideSprites();






typedef struct {
    int worldRow;
    int worldCol;
    int rdel;
    int cdel;
    int width;
    int height;
    int aniCounter;
    int aniState;
    int prevAniState;
    int curFrame;
    int numFrames;
    int ishiding;
    int ishit;
    int hide;
    int ishid;
    int goUp;
    int goDown;
    int enemymove;
    int isright;
    int isleft;
    int ishitD;
    int floorlevel;

} SPRITE;
# 279 "mode0.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
extern int hit;
extern int postershit;







typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 330 "mode0.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);


int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 3 "game.c" 2
# 1 "game.h" 1
# 9 "game.h"
extern int hOff;
extern int vOff;
extern int won;
extern int level;






void initGame();
void initSprites();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void animatePlayer();
void drawPlayer();
void stopClock();
void unstopClock();
void setupInterrupts();

int collisionCheck(unsigned char *collisionMap, int mapWidth, int col, int row, int width, int height,
        int colShift, int rowShift);
int collisionCheckAllPixels(unsigned char *collisionMap, int mapWidth, int col, int row, int width,
        int height, int colShift, int rowShift);
int collisionCheckReturnLargest(unsigned char *collisionMap, int mapWidth, int col, int row, int width,
    int height, int colShift, int rowShift);
int collisionCheckReturnLargestAllPixels(unsigned char *collisionMap, int mapWidth, int col, int row,
        int width, int height, int colShift, int rowShift);
# 4 "game.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 5 "game.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[208];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 6 "game.c" 2
# 1 "lvl2background.h" 1
# 22 "lvl2background.h"
extern const unsigned short lvl2backgroundTiles[448];


extern const unsigned short lvl2backgroundMap[4096];


extern const unsigned short lvl2backgroundPal[256];
# 7 "game.c" 2
# 1 "sound.h" 1
void setupSounds();
void playSoundA(const signed char* sound, int length, int loops);
void playSoundB(const signed char* sound, int length, int loops);

void setupInterrupts1();
void interruptHandler1();

void pauseSound();
void unpauseSound();
void stopSound();
# 49 "sound.h"
typedef struct{
    const signed char* data;
    int length;
    int frequency;
    int isPlaying;
    int loops;
    int duration;
    int priority;
    int vBlankCount;
} SOUND;

SOUND soundA;
SOUND soundB;
# 8 "game.c" 2
# 1 "collide.h" 1


extern const unsigned int collide_sampleRate;
extern const unsigned int collide_length;
extern const signed char collide_data[];
# 9 "game.c" 2





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


int time_m;
int time_s = 60;

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
# 60 "game.c"
void showTimer() {
  short time_m_1s = time_m % 10;
  short time_m_10s = time_m / 10;
  short time_s_1s = time_s % 10;
  short time_s_10s = time_s / 10;


    char x = 160;
    char y = 0;



    shadowOAM[60].attr0 = (0 << 14) | y;
    shadowOAM[60].attr1 = (0 << 14) | x;
    shadowOAM[60].attr2 = ((30)*32 + ((time_m / 10)));

    shadowOAM[61].attr0 = (0 << 14) | y;
    shadowOAM[61].attr1 = (0 << 14) | (x + 8);
    shadowOAM[61].attr2 = ((30)*32 + ((time_m % 10)));

    shadowOAM[62].attr0 = (0 << 14) | y;
    shadowOAM[62].attr1 = (0 << 14) | (x + 8 + 8);
    shadowOAM[62].attr2 = 970;

  shadowOAM[63].attr0 = (0 << 14) | y;
  shadowOAM[63].attr1 = (0 << 14) | (x + 8 + 8 + 8);
  shadowOAM[63].attr2 = ((30)*32 + ((time_s / 10)));

  shadowOAM[64].attr0 = (0 << 14) | y;
  shadowOAM[64].attr1 = (0 << 14) | (x + 8 + 8 + 8 + 8);
  shadowOAM[64].attr2 = ((30)*32 + ((time_s % 10)));
# 114 "game.c"
}

void enableTimerInterrupts() {
    *(unsigned short*)0x4000200 = 1<<6 | 1<<5;
# 129 "game.c"
        *(volatile unsigned short*)0x400010A = 0;
        *(volatile unsigned short*)0x4000108 = 65536 - 16384;
        *(volatile unsigned short*)0x400010A = 3 | (1<<7) | (1<<6);

          *(volatile unsigned short*)0x400010E = 0;
          *(volatile unsigned short*)0x400010C = 65536 - 60;
          *(volatile unsigned short*)0x400010E = (1<<2) | (1<<7) | (1<<6);
}


void stopClock() {
    isPlay = 0;


}

void unstopClock() {
    isPlay = 1;


}

void interruptHandler() {
    int boostallow = 1;

 *(unsigned short*)0x4000208 = 0;



    if (*(volatile unsigned short*)0x4000202 & 1<<5) {
        if(isPlay) {
        time_s--;
        if (time_s < 0 && time_m > 0) {
            time_s += 60;
            time_m--;
        }




        }
    }
# 246 "game.c"
 if(*(volatile unsigned short*)0x4000202 & 1 << 0) {
        if (soundA.isPlaying) {

            soundA.vBlankCount = soundA.vBlankCount + 1;
            if (soundA.vBlankCount > soundA.duration) {
                if (soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.loops);
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    *(volatile unsigned short*)0x4000102 = (0<<7);
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
                    *(volatile unsigned short*)0x4000106 = (0<<7);
                }
            }
  }



        *(volatile unsigned short*)0x4000202 = 1 << 0;
 }


    *(volatile unsigned short*)0x4000202 = *(volatile unsigned short*)0x4000202;

 *(unsigned short*)0x4000208 = 1;
}

void updateTime() {

    if (time_s < 30 && hit < 2 && time_m <= 0) {
        ((unsigned short *)0x5000000)[1] = ((31) | (0) << 5 | (0) << 10);
    }

    if (changetimes) {
        if (time_m <= 0 && time_s <= 0) {
        time_m = 0;
        time_s = 59;
        hit = 3;


        }
    } else {
        if (time_m <= 0 && time_s <= 0) {
        time_m = 0;
        time_s = 59;
        hit = 3;


    }
    if (hit == 3) {
        time_m = 0;
        time_s = 59;


    }




    }
}

void setupInterrupts() {

 *(unsigned short*)0x4000208 = 0;


    *(unsigned short*)0x4000004 |= 1 << 3;

    *((ihp_t *)0x03007FFC) = interruptHandler;
    enableTimerInterrupts();

    *(unsigned short*)0x4000200 = 1<<6 | 1<<5| 1 << 0;
 *(unsigned short*)0x4000208 = 1;
}




void initGame() {
    time_s = 59;
    time_m = 0;
    vOff = 25 + 70;
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



void updateGame() {
    updatePlayer();
    updateEnemy();

    updateTime();


    frames++;
    framesmos++;
}


void drawGame() {
    drawPlayer();
    drawPoster();
    drawEnemy();
    drawDoor();
    drawCurtain();
    drawLives();

    waitForVBlank();
    showTimer();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);

    (*(volatile unsigned short *)0x04000014) = hOff;
    (*(volatile unsigned short *)0x04000016) = vOff;
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

    player.worldRow = 116 + 25 + 5 + 5 + 70;
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
        for (int i = 0; i <3; i++) {
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
    for (int i = 0; i <14; i++) {

        poster[i].width = 16;
        poster[i].height = 16;
        poster[i].rdel = 1;
        poster[i].cdel = 1;


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
         if (i == 4) {
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
        for (int i = 0; i <4; i++) {
        door[i].width = 16;
        door[i].height = 16;
        door[i].rdel = 1;
        door[i].cdel = 1;

        door[i].worldRow = 232 - r;
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
        for (int i = 0; i <2; i++) {
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


void updatePlayer() {
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
                for (int i = 0; i <2; i++) {
            if (curtain[i].ishit == 1)
            curtain[i].ishit = 0;
                }
        if (player.hide == 1)
            player.hide = 0;
            player.ishiding = 0;




        if (player.worldCol + player.width < 256 - 13) {
            player.worldCol += player.cdel;

            if(hOff+1 < (256 - 240) && ((player.worldCol - hOff) > (240/2)) && (hOff + 240 < 256)) {
                hOff++;
            }
        }
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))) {
                for (int i = 0; i <2; i++) {
            if (curtain[i].ishit == 1)
            curtain[i].ishit = 0;
                }
        if (player.hide == 1)
            player.hide = 0;
            player.ishiding = 0;

        if (player.worldCol > 13) {
            player.worldCol -= player.cdel;
        }

        if((hOff - 1 >= 0) && ((player.worldCol - hOff) <= (240/2))) {
            hOff--;
        }
    }

    if((!(~(oldButtons) & ((1 << 6))) && (~buttons & ((1 << 6))))) {
        if (player.hide == 1)
        player.hide = 0;
        for (int i = 0; i <4; i++) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, door[i].worldCol, door[i].worldRow, door[i].width, door[i].height) == 1) {
            if (door[i].ishit == 1) {
                if (player.floorlevel + 1 < 4) {
                    player.goUp = 1;
                    player.floorlevel++;


                    vOff-=33;


                }
            }
        }
}
    }

    if ((!(~(oldButtons) & ((1 << 7))) && (~buttons & ((1 << 7))))) {
    button++;
    for (int i = 0; i <2; i++) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, curtain[i].worldCol + 1, curtain[i].worldRow, curtain[i].width -6, curtain[i].height) == 1) {
            player.ishiding = 1;
            curtain[i].ishit = 1;
            player.hide = 1;

        }
    }

        for (int i = 0; i < 4; i++) {
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



    }
    for (int i = 0; i <14; i++) {

            if (poster[i].ishit != 1) {
                if (collision(player.worldCol, player.worldRow, player.width, player.height, poster[i].worldCol, poster[i].worldRow, poster[i].width, poster[i].height) == 1) {
                    poster[i].ishit = 1;
                    postershit+=1;
            }
        }
    }

    for (int i = 0; i <3; i++) {
        framesmos++;
        if (player.ishit != 1) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, enemy[i].worldCol + 2, enemy[i].worldRow, enemy[i].width - 8, enemy[i].height) == 1) {
# 680 "game.c"
            if (player.ishiding == 0) {
                playSoundB(collide_data, collide_length, 0);
                player.ishit = 1;

                hit += 1;
                player.ishiding = 0;

                (*(volatile unsigned short *)0x400004C) = (1 << 8) | (1 << 12);
                shadowOAM[0].attr0 |= (1 << 12);






            }
        }
        }
}

    for (int i = 0; i <4; i++) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, door[i].worldCol, door[i].worldRow, door[i].width, door[i].height) == 1) {
        door[i].ishit = 1;
        } else {
            door[i].ishit = 0;
        }
}

    for (int i = 0; i < 4; i++) {
        if (collision(player.worldCol, player.worldRow, player.width, player.height, door[i].worldCol, door[i].worldRow, door[i].width, door[i].height) == 1) {
        door[i].ishitD = 1;
        }
    }



if (player.goUp ==1 && player.worldRow >= 64) {

    player.worldRow -= 70;
    player.goUp = 0;
}

if (player.goDown == 1) {
    player.worldRow += 70;
    player.goDown = 0;
}
# 734 "game.c"
if ((!(~(oldButtons) & ((1 << 0))) && (~buttons & ((1 << 0))))) {
    if (changetimes == 0) {

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



        for (int i = 0; i <3; i++) {
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
    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1))))) {
        if (hit > 0) {
            hit -= 1;

        }
    }
    if (hit == 1) {
        livesleft = 2;
    } else if (hit == 2) {
        livesleft = 1;
    }
}




void animatePlayer() {

    player.prevAniState = player.aniState;
    player.aniState = PLAYERIDLE;


    if(player.aniCounter % 20 == 0) {
        player.curFrame = (player.curFrame + 1) % player.numFrames;
    }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 4)))) {
        player.aniState = PLAYERRIGHT;
    }
    if ((~((*(volatile unsigned short *)0x04000130)) & ((1 << 5)))){
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
            for (int i = 0; i <3; i++) {
            if(enemy[i].aniCounter % 12 == 0) {
                enemy[i].curFrame++;
                if (enemy[i].curFrame >= enemy[i].numFrames) {
                    enemy[i].curFrame = 0;
                }
        } enemy[i].aniCounter++;
        }
}


void drawPlayer() {
    if (player.hide) {
        shadowOAM[0].attr0 |= (2 << 8);


    } else {
        if (player.ishit == 0) {

            shadowOAM[0].attr0 = ((0xFF & player.worldRow) - vOff) |(2 << 14);
            shadowOAM[0].attr1 = ((0x1FF & player.worldCol) - hOff) | (2 << 14);

            shadowOAM[0].attr2 = ((0) << 12) | ((player.curFrame*4)*32 + (player.aniState*2 + 10));

        }
        if (player.ishit == 1) {



                    initPlayer();
                    vOff = 25 + 70;
                    hOff = 0;
                    checkframe = 0;

        }
        if (hit == 2) {
            ((unsigned short *)0x5000000)[1] = ((31) | (0) << 5 | (0) << 10);
        }
    }
}

void drawPoster() {
    for (int i = 0; i < 14; i++) {
        if (poster[i].hide) {
            shadowOAM[1 + i].attr0 |= (2 << 8);
        } else {
            if (poster[i].ishit == 0) {
            shadowOAM[1 + i].attr0 = (0xFF & poster[i].worldRow - vOff) |(0 << 14);
            shadowOAM[1 + i].attr1 = (0x1FF & poster[i].worldCol - hOff) | (1 << 14);
            shadowOAM[1 + i].attr2 = ((0) << 12) | ((poster[i].curFrame * 2 + 6)*32 + (poster[i].aniState * 2));

            } else {

            shadowOAM[1 + i].attr0 = (0xFF & poster[i].worldRow - vOff) |(0 << 14);
            shadowOAM[1 + i].attr1 = (0x1FF & poster[i].worldCol - hOff) | (1 << 14);
            shadowOAM[1 + i].attr2 = ((0) << 12) | ((poster[i].curFrame * 2 + 6)*32 + (poster[i].aniState * 2 + 2));
            }
        }
    }
}

void drawDoor() {
    for (int i = 0; i < 4; i++) {
        if (door[i].hide) {
            shadowOAM[20 + i].attr0 |= (2 << 8);
        } else {
            if (door[i].ishit == 0) {
            shadowOAM[20 + i].attr0 = ((0xFF & door[i].worldRow) - vOff) |(0 << 14);
            shadowOAM[20 + i].attr1 = ((0x1FF & door[i].worldCol) - hOff) | (1 << 14);
            shadowOAM[20 + i].attr2 = ((0) << 12) | ((door[i].curFrame * 2 + 2)*32 + (door[i].aniState * 2));

            } else {
            shadowOAM[20 + i].attr0 = ((0xFF & door[i].worldRow) - vOff) |(0 << 14);
            shadowOAM[20 + i].attr1 = ((0x1FF & door[i].worldCol) - hOff) | (1 << 14);
            shadowOAM[20 + i].attr2 = ((0) << 12) | ((door[i].curFrame * 2 + 2)*32 + (door[i].aniState * 2 + 2));
            }
        }
    }
}

void drawLives() {
    if ((!(~(oldButtons) & ((1 << 1))) && (~buttons & ((1 << 1))))) {
        if (hit > 0) {
            hit -= 1;

        }
        }
    if (hit != 0) {
        if (hit == 1) {
            shadowOAM[70 + 2].attr0 |= (2 << 8);
        } else if (hit == 2) {
            shadowOAM[70 + 1].attr0 |= (2 << 8);
            shadowOAM[70 + 1].attr0 |= (2 << 8);
        }
    } else {
        for (int i = 0; i < livesleft; i++) {
            shadowOAM[70 + i].attr0 = lives[i].worldRow |(0 << 14);
            shadowOAM[70 + i].attr1 = lives[i].worldCol| (1 << 14);
            shadowOAM[70 + i].attr2 = ((0) << 12) | ((lives[i].curFrame * 2 + 2)*32 + (lives[i].aniState * 2 + 4));
        }
    }







}

void drawEnemy() {
        for (int i = 0; i < 3; i++) {
        if (enemy[i].hide) {
            shadowOAM[5 + i].attr0 |= (2 << 8);
        } else {
            if (enemy[i].ishit == 0) {
            shadowOAM[30 + i].attr0 = (0xFF & enemy[i].worldRow - vOff) |(2 << 14);
            shadowOAM[30 + i].attr1 = (0x1FF & enemy[i].worldCol - hOff) | (2 << 14);
            shadowOAM[30 + i].attr2 = ((0) << 12) | ((enemy[i].curFrame * 4)*32 + (enemy[i].aniState * 2 + 14));
            }

        }
    }
}

void drawCurtain() {
        for (int i = 0; i < 2; i++) {
        if (curtain[i].hide) {
            shadowOAM[45 + i].attr0 |= (2 << 8);
        } else {
            if (curtain[i].ishit == 0) {
            shadowOAM[45 + i].attr0 = (0xFF & curtain[i].worldRow - vOff) |(0 << 14);
            shadowOAM[45 + i].attr1 = (0x1FF & curtain[i].worldCol - hOff) | (1 << 14);
            shadowOAM[45 + i].attr2 = ((0) << 12) | ((curtain[i].curFrame * 2 + 10)*32 + (curtain[i].aniState));

            } else {
            shadowOAM[45 + i].attr0 = (0xFF & curtain[i].worldRow - vOff) |(0 << 14);
            shadowOAM[45 + i].attr1 = (0x1FF & curtain[i].worldCol - hOff) | (1 << 14);
            shadowOAM[45 + i].attr2 = ((0) << 12) | ((curtain[i].curFrame * 2 + 10)*32 + (curtain[i].aniState * 2 + 2));
            }
        }
    }
}
