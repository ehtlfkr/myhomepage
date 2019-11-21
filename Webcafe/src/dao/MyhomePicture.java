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
		Myhome Post = new Myhome("123aa", "tester", "��������");
		Post.setTitle("welcome");
		Post.setText("welcome to my homepage");
		Post.setDate("2019.09.19 ���� 10:22");
		Post.setImage(null);
		
		Myhome Post1 = new Myhome("223aa", "user", "�ϻ� �Խ���");
		Post1.setTitle("������ �Ϸ�");
		Post1.setText("������ �Ϸ�� ���� �������");
		Post1.setDate("2019.09.11 ���� 10:00");
		Post1.setImage("�ٿ�ε�.jpg");
		
		Myhome Post2 = new Myhome("323aa", "�кθ�", "���� �Խ���");
		Post2.setTitle("�츮 �Ƶ��� ������ �Ȱ���");
		Post2.setText("�Ƶ��� ���⿡ �ɷȴ��� ���� 40�� ���� �ö� �ʹ� �ʹ� ������ �˴ϴ�. �ְ� �׸� ���µ��� ������ �Ȱ����� ���� ���� �̸� ��� �ؾ�����....");
		Post2.setDate("2019.09.01 ���� 08:01");
		Post2.setImage(null);
		
		Myhome Post3 = new Myhome("423aa", "�ۡۡ�", "���� �Խ���");
		Post3.setTitle("�ۡۡ۴��� �����ϼ̽��ϴ�.");
		Post3.setText("�ȳ��ϼ��� ó���˰ڽ��ϴ�. ������ �ߺ�Ź �����.");
		Post3.setDate("2019.09.19 ���� 10:22");
		Post3.setImage("�ٿ�ε�.jpg");

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
