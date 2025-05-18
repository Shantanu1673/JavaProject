package com.model;

public class NewEpisode {
    private int episodeid;
    private int animeid;  // Foreign key reference to NewAnime
    private String video;
    private int episodeno;

    // Getter and Setter for episodeid
    public int getEpisodeid() {
        return episodeid;
    }

    public void setEpisodeid(int episodeid) {
        this.episodeid = episodeid;
    }

    // Getter and Setter for animeid
    public int getAnimeid() {
        return animeid;
    }

    public void setAnimeid(int animeid) {
        this.animeid = animeid;
    }

    // Getter and Setter for video
    public String getVideo() {
        return video;
    }

    public void setVideo(String video) {
        this.video = video;
    }

    // Getter and Setter for episodeno
    public int getEpisodeno() {
        return episodeno;
    }

    public void setEpisodeno(int episodeno) {
        this.episodeno = episodeno;
    }
}
