package model;

import java.io.Serializable;
import java.util.Random;

public class GameNumber implements Serializable {
  private static final long serialVersionUID = 1L;
  private int value;
  
  public GameNumber() {
  }

  public GameNumber(int value) {
    this.value = value;
  }

  public int getValue() {
    return value;
  }

  public void setValue(int value) {
    this.value = value;
  }

  public static long getSerialversionuid() {
    return serialVersionUID;
  }
  
  public void setRandom(int min, int max) {
    Random rnum = new Random();
    int n = max - min + 1;
    this.value = min + rnum.nextInt(n);
  }
  public void increment() {
    this.value++;
  }
}
