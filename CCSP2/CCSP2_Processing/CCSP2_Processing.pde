import processing.serial.*; 
Serial myPort;

int counter1 = 0;
int counter2 = 0;
int counter3 = 0;

void setup() {

  ConfigurationBuilder cb = new ConfigurationBuilder(); 
  cb.setOAuthConsumerKey("sYpVLbonr9naiS18mKAVgPwvD"); 
  cb.setOAuthConsumerSecret("3JYcotKUPfKgie4DbAF5SreIJ0Xt5bi22IPWt4Hfs4DhDRaWaz"); 
  cb.setOAuthAccessToken("15223120-PjINgfWFhDbYgd2ajz1YnhhKu3ZO3wmlocFC7aclx"); 
  cb.setOAuthAccessTokenSecret("x7WocioqIiYDx2gRsp6fWxJL7nteuAPUjTcYlmtybZBit");

  String portName = Serial.list()[3];
  myPort = new Serial(this, portName, 9600);

  // if you enter keywords here it will filter, otherwise it will sample
  String keywords[] = {
    "raiva", "medo", "felicidade"
  };

  ///////////////////////////// End Variable Config ////////////////////////////

  TwitterStream twitter = new TwitterStreamFactory(cb.build()).getInstance();

  twitter.addListener(listener);
  twitter.filter(new FilterQuery().track(keywords));
}

void draw() {
}


// This listens for new tweet
StatusListener listener = new StatusListener() {
  public void onStatus(Status status) {

    if (counter1 == 255 || counter2 == 255 || counter3 == 255)
    {
      counter1 = 0;
      counter2 = 0;
      counter3 = 0;
    }

    if (match(status.getText(), "raiva") != null)
    {
      println(status.getText());
      counter1++;
      myPort.write("a" + counter1 + "f");
      println("a" + counter1 + "\n");
    } else if (match(status.getText(), "medo") != null && (match(status.getText(), "sem")) == null)
    {
      println(status.getText());
      counter2++;
      myPort.write("b" + counter2 + "g");
      println("b" + counter2 + "\n");
    } else if (match(status.getText(), "felicidade") != null)
    {
      println(status.getText());
      counter3++;
      myPort.write("c" + counter3 + "h");
      println("c" + counter3 + "\n");
    }
  }

  public void onDeletionNotice(StatusDeletionNotice statusDeletionNotice) {
    //System.out.println("Got a status deletion notice id:" + statusDeletionNotice.getStatusId());
  }
  public void onTrackLimitationNotice(int numberOfLimitedStatuses) {
    //  System.out.println("Got track limitation notice:" + numberOfLimitedStatuses);
  }
  public void onScrubGeo(long userId, long upToStatusId) {
    System.out.println("Got scrub_geo event userId:" + userId + " upToStatusId:" + upToStatusId);
  }

  public void onException(Exception ex) {
    ex.printStackTrace();
  }
};

