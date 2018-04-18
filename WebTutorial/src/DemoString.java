
public class DemoString {

	// Chuyển đổi chuỗi thành các mảng kí tự
	public void StringToCharExample() {
		String s1 = "ABC";
		char[] ch = s1.toCharArray();

		for (int i = 0; i < ch.length; i++) {
			String str = "";
			String str2 = "";

			int sum = 0;
			str = String.valueOf(ch[i]);
			System.out.print("ch[i]====" + str);
			sum = sum++;
			str2 = String.valueOf(ch[i]) + String.valueOf(ch[sum]);
			System.out.println("ch[i]+ch[sum]" + str2);
			for (int j = i; j < ch.length; j++) {
				str2 = String.valueOf(ch[j]) + String.valueOf(ch[sum]);
				System.out.println("ch[i]+ch[sum]" + str2);
			}

		}

		// System.out.print(ch.length + "\n");
	}

	// Tìm chỉ mục của kí tự trong chuỗi
	public void SearchIndexOfString() {
		String str = "ABCDEF";

		char[] a = str.toCharArray();

		// tra ve vi tri xuat hien dau tien cua ki tu da cho || -1 neu ki tu ko xuat
		// hien
		int check = str.indexOf(str.substring(5));

		int check_2 = str.indexOf(str, 1);

		// System.out.println(check + "");
		System.out.println(String.copyValueOf(a) + "");
		System.out.println(check_2 + "");
	}

	public static int minNum() {
		/*
		 * Write your code here.
		 */
		int A = 5;
		int K = 4;
		int P = 1;
		int sum = 0;
		int kq = 0;
		for (int i = 0; i < 100; i++) {
			K = K + P;
			sum++;
			A++;
			System.out.println("K" + K);
			System.out.println("A" + A);
			System.out.println("----");
			if (K > A) {
				kq = sum;
				break;
			} else {
				kq = -1;

			}
		}

		return kq;

	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		// DemoString a = new DemoString();
		// a.StringToCharExample();
		// a.SearchIndexOfString();
		int b = minNum();

		System.out.println(b);
	}

}
