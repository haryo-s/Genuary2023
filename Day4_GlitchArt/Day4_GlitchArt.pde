// Genuary prompt: Glitch art
// Idea:
// Idea for first iteration: take an image, and swap pixels with neighbors
// Let's see what that gives us

PImage img;

void settings() {
  img = loadImage("rabbit.jpg");
  size(img.width, img.height);
}

void setup() {
  background(0, 0, 0);

  img.loadPixels();
  for (int i = 0; i <= 500; i++) {
    swapPixel(img);
  }
}

void draw() {
  image(img, 0, 0);
}

void swapPixel(PImage image) {
  for (int i = 0; i < image.pixels.length-1; i++) {
    //println(hex(image.pixels[i]));

    int randomValue = int(random(0, 4));

    switch(randomValue) {
      // Case 0: do nothing
    case 0:
      break;
      // Case 1: Swap with pixel before
    case 1:
      if (i == 0) {
        break;
      } else {
        color bufferPixel = image.pixels[i-1];
        image.pixels[i-1] = image.pixels[i];
        image.pixels[i] = bufferPixel;
        break;
      }
      // Case 2: Swap with pixel after
    case 2:
      if (i == image.pixels.length) {
        break;
      } else {
        color bufferPixel = image.pixels[i+1];
        image.pixels[i+1] = image.pixels[i];
        image.pixels[i] = bufferPixel;
        break;
      }
      // Case 3: Swap with pixel above
    case 3:
      if (i <= image.width) {
        break;
      } else {
        color bufferPixel = image.pixels[i-img.width];
        image.pixels[i-img.width] = image.pixels[i];
        image.pixels[i] = bufferPixel;
        break;
      }

      //Case 4: Swap with pixel below
      // The pixel would be in the last row if it's in between img.pixels.length and img.pixels.length-img.width
    case 4:
      println(i / img.width);
      if (i / img.width == img.height) {
        break;
      } else {
        color bufferPixel = image.pixels[i+img.width];
        image.pixels[i+img.width] = image.pixels[i];
        image.pixels[i] = bufferPixel;
        break;
      }
    }
  }
}
