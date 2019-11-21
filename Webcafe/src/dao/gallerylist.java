package dao;

import java.util.ArrayList;

import dto.gallery;

public class gallerylist {
	private ArrayList<gallery> listOfgallery = new ArrayList<gallery>();

	private static gallerylist instance = new gallerylist();

	public static gallerylist getInstance() {
		return instance;
	}

	public gallerylist() {
		
		gallery image = new gallery("123ab", "tester", "갤러리");
		image.setText("testimage");
		image.setDate("2019.09.19 오후 01:39");
		image.setImage("다운로드.jpg");
		
		gallery image1 = new gallery("123ac", "tester", "갤러리");
		image1.setText("testimage");
		image1.setDate("2019.09.19 오전 01:39");
		image1.setImage("다운로드.jpg");
		
		gallery image2 = new gallery("123ad", "tester", "갤러리");
		image2.setText("testimage");
		image2.setDate("2019.09.19 오후 01:39");
		image2.setImage("다운로드.jpg");
		
		gallery image3 = new gallery("123ae", "tester", "갤러리");
		image3.setText("testimage");
		image3.setDate("2019.09.19 오후 01:39");
		image3.setImage("다운로드.jpg");

		listOfgallery.add(image);
		listOfgallery.add(image1);
		listOfgallery.add(image2);
		listOfgallery.add(image3);

	}
	
	public ArrayList<gallery> getAllgallery() {
		return listOfgallery;
	}
	
	public gallery getMyhomeBygallery(String myhomegallery) {
		gallery myhomeBygallery = null;
		
		for(int i = 0; i < listOfgallery.size(); i++) {
			gallery myhome = listOfgallery.get(i);
			if(myhome!=null && myhome.getMyhomegallery() != null && myhome.getMyhomegallery().equals(myhomegallery)) {
				myhomeBygallery = myhome;
				break;
			}
		}
		return myhomeBygallery;
	}
	
	public void addMyhome(gallery gallery) {
		listOfgallery.add(gallery);
	}
}
