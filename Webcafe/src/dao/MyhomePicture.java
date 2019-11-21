package dao;

import java.util.ArrayList;

import dto.Myhome;

public class MyhomePicture {
	
	private ArrayList<Myhome> listOfMyhome = new ArrayList<Myhome>();

	private static MyhomePicture instance = new MyhomePicture();

	public static MyhomePicture getInstance() {
		return instance;
	}

	public MyhomePicture() {
		Myhome Post = new Myhome("123aa", "tester", "공지사항");
		Post.setTitle("welcome");
		Post.setText("welcome to my homepage");
		Post.setDate("2019.09.19 오전 10:22");
		Post.setImage(null);
		
		Myhome Post1 = new Myhome("223aa", "user", "일상 게시판");
		Post1.setTitle("오늘의 하루");
		Post1.setText("오늘의 하루는 정말 재밌지비");
		Post1.setDate("2019.09.11 오전 10:00");
		Post1.setImage("다운로드.jpg");
		
		Myhome Post2 = new Myhome("323aa", "학부모", "가족 게시판");
		Post2.setTitle("우리 아들이 병원을 안가요");
		Post2.setText("아들이 감기에 걸렸는지 열이 40도 까지 올라서 너무 너무 걱정이 됩니다. 애가 그리 아픈데도 병원을 안가려고 떄를 쓰니 이를 어떻게 해야할지....");
		Post2.setDate("2019.09.01 오전 08:01");
		Post2.setImage(null);
		
		Myhome Post3 = new Myhome("423aa", "○○○", "가입 게시판");
		Post3.setTitle("○○○님이 가입하셨습니다.");
		Post3.setText("안녕하세요 처음뵙겠습니다. 앞으로 잘부탁 드려요.");
		Post3.setDate("2019.09.19 오후 10:22");
		Post3.setImage("다운로드.jpg");

		listOfMyhome.add(Post);
		listOfMyhome.add(Post1);
		listOfMyhome.add(Post2);
		listOfMyhome.add(Post3);


	}
	
	public ArrayList<Myhome> getAllMyhome() {
		return listOfMyhome;
	}
	
	public Myhome getMyhomeByPost(String myhomePost) {
		Myhome myhomeByPost = null;
		
		for(int i = 0; i < listOfMyhome.size(); i++) {
			Myhome myhome = listOfMyhome.get(i);
			if(myhome!=null && myhome.getMyhomePost() != null && myhome.getMyhomePost().equals(myhomePost)) {
				myhomeByPost = myhome;
				break;
			}
		}
		return myhomeByPost;
	}
	
	public void addMyhome(Myhome myhome) {
		listOfMyhome.add(myhome);
	}
}
