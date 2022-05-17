# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"



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
# 5 "main.c" 2
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
# 6 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 7 "main.c" 2
# 1 "background.h" 1
# 22 "background.h"
extern const unsigned short backgroundTiles[208];


extern const unsigned short backgroundMap[1024];


extern const unsigned short backgroundPal[256];
# 8 "main.c" 2
# 1 "startscreen.h" 1
# 22 "startscreen.h"
extern const unsigned short startscreenTiles[1360];


extern const unsigned short startscreenMap[1024];


extern const unsigned short startscreenPal[256];
# 9 "main.c" 2
# 1 "instructscreen.h" 1
# 22 "instructscreen.h"
extern const unsigned short instructscreenTiles[3824];


extern const unsigned short instructscreenMap[1024];


extern const unsigned short instructscreenPal[256];
# 10 "main.c" 2
# 1 "pausescreen.h" 1
# 22 "pausescreen.h"
extern const unsigned short pausescreenTiles[2432];


extern const unsigned short pausescreenMap[1024];


extern const unsigned short pausescreenPal[256];
# 11 "main.c" 2
# 1 "losescreen.h" 1
# 22 "losescreen.h"
extern const unsigned short losescreenTiles[2576];


extern const unsigned short losescreenMap[1024];


extern const unsigned short losescreenPal[256];
# 12 "main.c" 2
# 1 "nextlevelOwin.h" 1
# 22 "nextlevelOwin.h"
extern const unsigned short nextlevelOwinTiles[704];


extern const unsigned short nextlevelOwinMap[1024];


extern const unsigned short nextlevelOwinPal[256];
# 13 "main.c" 2
# 1 "bg0.h" 1
# 22 "bg0.h"
extern const unsigned short bg0Tiles[4784];


extern const unsigned short bg0Map[4096];


extern const unsigned short bg0Pal[256];
# 14 "main.c" 2
# 1 "lvl2background.h" 1
# 22 "lvl2background.h"
extern const unsigned short lvl2backgroundTiles[448];


extern const unsigned short lvl2backgroundMap[4096];


extern const unsigned short lvl2backgroundPal[256];
# 15 "main.c" 2
# 1 "zelda.h" 1
# 22 "zelda.h"
extern const unsigned short zeldaTiles[11696];


extern const unsigned short zeldaMap[4096];


extern const unsigned short zeldaPal[256];
# 16 "main.c" 2
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
# 17 "main.c" 2
# 1 "winner.h" 1
# 22 "winner.h"
extern const unsigned short winnerTiles[4608];


extern const unsigned short winnerMap[4096];


extern const unsigned short winnerPal[256];
# 18 "main.c" 2
# 1 "gameSong.h" 1


extern const unsigned int gameSong_sampleRate;
extern const unsigned int gameSong_length;
extern const signed char gameSong_data[];
# 19 "main.c" 2
# 1 "collide.h" 1


extern const unsigned int collide_sampleRate;
extern const unsigned int collide_length;
extern const signed char collide_data[];
# 20 "main.c" 2





void initialize();
void goToGame();
void game();


enum {START,GAME, PAUSE, WIN, LOSE, HOWTO};
int state;
OBJ_ATTR shadowOAM[128];
SPRITE box;


unsigned short buttons;
unsigned short oldButtons;
int seed;
int screenBlock;
int hOff1;
int vOff1;
int tapped;





int main() {

    initialize();
# 105 "main.c"
    while(1) {


        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);


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


void initialize() {



    (*(volatile unsigned short *)0x4000000) = 0 | (1 << 9) | (1 << 10) | (1 << 12);
    (*(volatile unsigned short *)0x400000A) = ((0) << 2) | ((12) << 8) | (0 << 14);


    (*(volatile unsigned short *)0x4000008) = ((2) << 2) | ((20) << 8) | (2 << 14);

    (*(volatile unsigned short *)0x400000C) = ((3) << 2) | ((15) << 8) | (1 << 14);

    oldButtons = buttons;
    buttons = (*(volatile unsigned short *)0x04000130);

    screenBlock = 15;
    hOff1 = 0;
    vOff1 = 0;

    setupSounds();
# 166 "main.c"
    goToStart();




}




void goToStart() {
    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000016) = 0;

    (*(volatile unsigned short *)0x04000012) = 0;
    (*(volatile unsigned short *)0x04000010) = 0;

    (*(volatile unsigned short *)0x4000000) = 0 | (1 << 9)| (1 << 12);



    DMANow(3, startscreenPal, ((unsigned short *)0x5000000), 512/ 2);
    DMANow(3, startscreenTiles, &((charblock *)0x6000000)[0], 2720/2);
    DMANow(3,startscreenMap, &((screenblock *)0x6000000)[12], 2048/2);


    state = START;
}


void start() {
    level = 0;
    seed++;
    waitForVBlank();
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {

        goToHowto();


    }


}

void initBox() {
    box.worldCol = 151;
    box.worldRow = 137;
    box.ishiding = 0;
}



void goToHowto() {
    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000016) = 0;
    DMANow(3, instructscreenPal, ((unsigned short *)0x5000000), 512/ 2);
    DMANow(3, instructscreenTiles, &((charblock *)0x6000000)[0], 7648/2);
    DMANow(3,instructscreenMap, &((screenblock *)0x6000000)[12], 2048/2);

    state = HOWTO;
}

void howto() {
    waitForVBlank();
    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {

        stopSound();
        playSoundA(gameSong_data, gameSong_length, 1);
        goToGame();
        initGame();
    }
}



void goToPause() {
    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000016) = 0;



    DMANow(3, pausescreenPal, ((unsigned short *)0x5000000), 512/ 2);
    DMANow(3, pausescreenTiles, &((charblock *)0x6000000)[0], 4864/2);
    DMANow(3,pausescreenMap, &((screenblock *)0x6000000)[12], 2048/2);



    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);
    state = PAUSE;
}




void pause() {
    waitForVBlank();

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToGame();
        unpauseSound();
        unstopClock();
    }




}



void goToLose() {

    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000016) = 0;
    DMANow(3, losescreenPal, ((unsigned short *)0x5000000), 512/ 2);
    DMANow(3, losescreenTiles, &((charblock *)0x6000000)[0], 5152/2);
    DMANow(3,losescreenMap, &((screenblock *)0x6000000)[12], 2048/2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);
    state = LOSE;
}


void lose() {
    waitForVBlank();

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3)))))

        goToStart();
}

void goToWin() {
    (*(volatile unsigned short *)0x04000014) = 0;
    (*(volatile unsigned short *)0x04000016) = 0;

    (*(volatile unsigned short *)0x4000000) = 0 | (1 << 10);
    (*(volatile unsigned short *)0x400000C) = ((3) << 2) | ((15) << 8) | (1 << 14);



    DMANow(3, winnerPal, ((unsigned short *)0x5000000), 512/ 2);
    DMANow(3, winnerTiles, &((charblock *)0x6000000)[3], 9216/2);
    DMANow(3,winnerMap, &((screenblock *)0x6000000)[15], 8192/2);
    DMANow(3,winnerMap, &((screenblock *)0x6000000)[19], 1024);


    hOff1 = 0;
    vOff1 = 0;

    (*(volatile unsigned short *)0x04000018) = hOff1;
    (*(volatile unsigned short *)0x0400001A) = vOff1;


    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);
    state = WIN;
}


void win() {
# 338 "main.c"
hOff1++;
(*(volatile unsigned short *)0x04000018) = hOff1;

if (screenBlock == 18 && hOff1 > 256) {
    screenBlock = 15;
    hOff1 = 0;
}

if (hOff1 > 256) {
    hOff1 -= 256;
    screenBlock++;


}

    waitForVBlank();
    (*(volatile unsigned short *)0x400000C) = ((3) << 2) | ((screenBlock) << 8) | (1 << 14)| (0 << 7);



    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {


        goToStart();
    }
}



void goToGame() {
    (*(volatile unsigned short *)0x4000000) = 0 | (1 << 9)| (1 << 12);


    waitForVBlank();
# 386 "main.c"
            DMANow(3, backgroundPal, ((unsigned short *)0x5000000), 256);
            DMANow(3, backgroundTiles, &((charblock *)0x6000000)[0], 416 / 2);
            DMANow(3, backgroundMap, &((screenblock *)0x6000000)[12], 2048 / 2);
# 398 "main.c"
    (*(volatile unsigned short *)0x04000016) = vOff;
    (*(volatile unsigned short *)0x04000014) = hOff;

    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);
    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    hideSprites();
    DMANow(3, shadowOAM, ((OBJ_ATTR *)(0x7000000)), 128 * 4);
# 414 "main.c"
    state = GAME;
}


void game() {
    srand(seed);
# 431 "main.c"
    updateGame();
    drawGame();

    if ((!(~(oldButtons) & ((1 << 3))) && (~buttons & ((1 << 3))))) {
        goToPause();
        pauseSound();
        stopClock();


    }

    if (hit == 3) {
        stopSound();
        goToLose();
    }
    if (postershit > 12) {
        stopSound();
        goToWin();
        level+=1;
# 465 "main.c"
    }
    if (hit == 2) {
        playSoundB(collide_data, collide_length, 0);
    }
}
