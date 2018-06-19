import processing.serial.*; 
Serial myPort;

void setup() {
  
ConfigurationBuilder cb = new ConfigurationBuilder(); 
cb.setOAuthConsumerKey("sYpVLbonr9naiS18mKAVgPwvD"); 
cb.setOAuthConsumerSecret("3JYcotKUPfKgie4DbAF5SreIJ0Xt5bi22IPWt4Hfs4DhDRaWaz"); 
cb.setOAuthAccessToken("15223120-PjINgfWFhDbYgd2ajz1YnhhKu3ZO3wmlocFC7aclx"); 
cb.setOAuthAccessTokenSecret("x7WocioqIiYDx2gRsp6fWxJL7nteuAPUjTcYlmtybZBit");

String portName = Serial.list()[3];
myPort = new Serial(this, portName, 9600);

// if you enter keywords here it will filter, otherwise it will sample
String keywords[] = {"raiva", "medo", "felicidade"
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
    
    
    if (match(status.getText(),"raiva") != null)
    {
      println(status.getText());
      myPort.write("1");

    }
    else if (match(status.getText(),"medo") != null && (match(status.getText(),"sem")) == null)
    {
      println(status.getText());
      myPort.write("2");

    }
    else if (match(status.getText(),"felicidade") != null)
    {
      println(status.getText());
      myPort.write("3");

    }
    
    else
    {
      myPort.write('0');
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


