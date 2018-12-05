package egovframework.rte.cmmn.util;

import java.io.File;
import java.util.List;
import java.util.Map;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Border;
import jxl.format.BorderLineStyle;
import jxl.format.Colour;
import jxl.format.ScriptStyle;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class CreateExcelFile {

	
	public void CreateExcelHistory(File file, List<Map<String,Object>> data, String SheetName) throws Exception{

		//WorkBook 생성
		WritableWorkbook wb = Workbook.createWorkbook(file);
		
		//WorkSheet 생성
		WritableSheet sh = wb.createSheet(SheetName, 0);
		
		
		//PIDX, MTYPE, AIDX, UKEY, MESSAGE, RECEIVE_NUM, SENDER, REQ_DATE, RESERVE_DATE, REPORT_DATE, REQ_RESULT
		sh.setColumnView(0, 10);
		sh.setColumnView(1, 10);
		sh.setColumnView(2, 10);
		sh.setColumnView(3, 30);
		sh.setColumnView(4, 100);
		sh.setColumnView(5, 15);
		sh.setColumnView(6, 15);
		sh.setColumnView(7, 20);
		sh.setColumnView(8, 20);
		sh.setColumnView(9, 20);
		sh.setColumnView(10, 30);
		
		//셀 형식
		//헤더내용
		WritableCellFormat textHeader = new WritableCellFormat(
				new WritableFont (WritableFont.ARIAL,               //폰트 타입.Arial 외 별다른건 없는듯 하다.                              
				12,                                    //폰트 크기 
                WritableFont.BOLD,               //Bold 스타일
                false,                                 //이탤릭체여부
                UnderlineStyle.NO_UNDERLINE, //밑줄 스타일
                Colour.WHITE,                      //폰트 색
                ScriptStyle.NORMAL_SCRIPT));
		textHeader.setAlignment(Alignment.CENTRE);
		textHeader.setVerticalAlignment(VerticalAlignment.CENTRE);
		textHeader.setBackground(Colour.DARK_BLUE);
		textHeader.setBorder(Border.TOP, BorderLineStyle.THIN, Colour.WHITE);
		textHeader.setBorder(Border.RIGHT, BorderLineStyle.THIN, Colour.WHITE);
		
		
		WritableCellFormat textFormat = new WritableCellFormat();
		textFormat.setAlignment(Alignment.CENTRE);
		
		
		//테두리
		textFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		int row = 0;
		//헤더설정
		Label label1 = new Label(0, row, "번호", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(1, row, "발송 타입", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(2, row, "관리자ID", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(3, row, "UMS KEY", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(4, row, "메시지", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(5, row, "문구코드", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(6, row, "수신번호", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(7, row, "발송번호", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(8, row, "요청시간", textHeader);
		sh.addCell(label1);
		
		
		label1 = new Label(9, row, "결과시간", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(10, row, "결과", textHeader);
		sh.addCell(label1);
		
		row++;
		
		for (Map<String, Object> tem : data) {
			//PIDX, MTYPE, AIDX, UKEY, MESSAGE, RECEIVE_NUM, SENDER, REQ_DATE, RESERVE_DATE, REPORT_DATE, REQ_RESULT

			label1 = new Label(0, row, (String) tem.get("pidx"),textFormat);
			sh.addCell(label1);
			
			
			label1 = new Label(1, row, (String) tem.get("mtype") ,textFormat);
			sh.addCell(label1);
			
			// 버전
			label1 = new Label(2, row, (String) tem.get("aidx"),textFormat);
			sh.addCell(label1);
			
			// Hash
			label1 = new Label(3, row, (String) tem.get("ukey"),textFormat);
			sh.addCell(label1);

			// Os 버전
			label1 = new Label(4, row, (String) tem.get("message"),textFormat);
			sh.addCell(label1);
			
			label1 = new Label(5, row, (String) tem.get("code"),textFormat);
			sh.addCell(label1);
			
			// 디바이스 모델 명
			label1 = new Label(6, row, (String) tem.get("receive_num"),textFormat);
			sh.addCell(label1);
			
			// 처리 결과
			label1 = new Label(7, row, (String) tem.get("sender"),textFormat);
			sh.addCell(label1);

			label1 = new Label(8, row, (String) tem.get("req_date"),textFormat);
			sh.addCell(label1);
			
			label1 = new Label(9, row, (String) tem.get("report_date"),textFormat);
			sh.addCell(label1);
			
			label1 = new Label(10, row, (String) tem.get("req_result"),textFormat);
			sh.addCell(label1);
			
			row++;
		}

		
		wb.write();
		wb.close();
		
		//return file.getAbsolutePath();
	}
	
	public void CreateExcelChart(File file, List<Map<String,Object>> data, String SheetName) throws Exception{

		//WorkBook 생성
		WritableWorkbook wb = Workbook.createWorkbook(file);
		
		//WorkSheet 생성
		WritableSheet sh = wb.createSheet(SheetName, 0);
		
		sh.setColumnView(0, 20);
		sh.setColumnView(1, 20);
		sh.setColumnView(2, 20);
		sh.setColumnView(3, 20);
		sh.setColumnView(4, 20);
		sh.setColumnView(5, 20);
		sh.setColumnView(6, 20);
		sh.setColumnView(7, 20);
		sh.setColumnView(8, 20);
		
		
		//셀 형식
		//헤더내용
		WritableCellFormat textHeader = new WritableCellFormat(
				new WritableFont (WritableFont.ARIAL,               //폰트 타입.Arial 외 별다른건 없는듯 하다.                              
				12,                                    //폰트 크기 
                WritableFont.BOLD,               //Bold 스타일
                false,                                 //이탤릭체여부
                UnderlineStyle.NO_UNDERLINE, //밑줄 스타일
                Colour.WHITE,                      //폰트 색
                ScriptStyle.NORMAL_SCRIPT));
		textHeader.setAlignment(Alignment.CENTRE);
		textHeader.setVerticalAlignment(VerticalAlignment.CENTRE);
		textHeader.setBackground(Colour.DARK_BLUE);
		textHeader.setBorder(Border.TOP, BorderLineStyle.THIN, Colour.WHITE);
		textHeader.setBorder(Border.RIGHT, BorderLineStyle.THIN, Colour.WHITE);
		
		
		WritableCellFormat textFormat = new WritableCellFormat();
		textFormat.setAlignment(Alignment.CENTRE);
		
		//테두리
		textFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		int row = 0;
		//헤더설정
		Label label1 = new Label(0, row, "일자", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(1, row, "NMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(2, row, "NMS 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(3, row, "알림톡 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(4, row, "알림톡 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(5, row, "SMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(6, row, "SMS 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(7, row, "LMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(8, row, "LMS 실패", textHeader);
		sh.addCell(label1);
		
		
		
		row++;
		
		int n_succ =0, n_fail =0, s_succ=0, s_fail =0, a_succ=0, a_fail=0, l_succ=0, l_fail=0;
		for (Map<String, Object> tem : data) {
			
			// 일자
			label1 = new Label(0, row, (String) tem.get("report_date"),textFormat);
			sh.addCell(label1);
			
			// NMS성공
			n_succ += (Integer) tem.get("n_succ");
			label1 = new Label(1, row, String.format("%,d", (Integer)  tem.get("n_succ")),textFormat);
			sh.addCell(label1);
			
			// NMS 실패
			n_fail += (Integer)tem.get("n_fail");
			label1 = new Label(2, row, String.format("%,d",(Integer) tem.get("n_fail")),textFormat);
			sh.addCell(label1);
			
			// 알림톡 성공건
			a_succ += (Integer)tem.get("a_succ");
			label1 = new Label(3, row, String.format("%,d",(Integer) tem.get("a_succ")),textFormat);
			sh.addCell(label1);
			
			// 알림톡 실패건
			a_fail += (Integer)tem.get("a_fail");
			label1 = new Label(4, row, String.format("%,d",(Integer) tem.get("a_fail")),textFormat);
			sh.addCell(label1);
			
			// SMS 성공
			s_succ +=(Integer)tem.get("s_succ");
			label1 = new Label(5, row, String.format("%,d",(Integer) tem.get("s_succ")),textFormat);
			sh.addCell(label1);

			// SMS실패
			s_fail += (Integer)tem.get("s_fail");
			label1 = new Label(6, row, String.format("%,d",(Integer) tem.get("s_fail")),textFormat);
			sh.addCell(label1);
			
			// SMS 성공
			l_succ +=(Integer)tem.get("l_succ");
			label1 = new Label(7, row, String.format("%,d",(Integer) tem.get("l_succ")),textFormat);
			sh.addCell(label1);
	
			// SMS실패
			l_fail += (Integer)tem.get("l_fail");
			label1 = new Label(8, row, String.format("%,d",(Integer) tem.get("l_fail")),textFormat);
			sh.addCell(label1);
			
			

			row++;
		}
		
		label1 = new Label(0, row, "합계",textFormat);
		sh.addCell(label1);
		
		label1 = new Label(1, row, String.format("%,d",n_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(2, row, String.format("%,d",n_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(3, row, String.format("%,d",a_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(4, row, String.format("%,d",a_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(5, row, String.format("%,d",s_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(6, row, String.format("%,d",s_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(7, row, String.format("%,d",l_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(8, row, String.format("%,d",l_fail),textFormat);
		sh.addCell(label1);
		
		
		

		
		wb.write();
		wb.close();
		
		//return file.getAbsolutePath();
	}
	
	public void CreateExcelChart(File file, List<Map<String,Object>> data, String SheetName, String date) throws Exception{

		//WorkBook 생성
		WritableWorkbook wb = Workbook.createWorkbook(file);
		
		//WorkSheet 생성
		WritableSheet sh = wb.createSheet(SheetName, 0);
		
		sh.setColumnView(0, 20);
		sh.setColumnView(1, 20);
		sh.setColumnView(2, 20);
		sh.setColumnView(3, 20);
		sh.setColumnView(4, 20);
		sh.setColumnView(5, 20);
		sh.setColumnView(6, 20);
		sh.setColumnView(7, 20);
		sh.setColumnView(8, 20);
		
		//셀 형식
		//헤더내용
		WritableCellFormat textHeader = new WritableCellFormat(
				new WritableFont (WritableFont.ARIAL,               //폰트 타입.Arial 외 별다른건 없는듯 하다.                              
				12,                                    //폰트 크기 
                WritableFont.BOLD,               //Bold 스타일
                false,                                 //이탤릭체여부
                UnderlineStyle.NO_UNDERLINE, //밑줄 스타일
                Colour.WHITE,                      //폰트 색
                ScriptStyle.NORMAL_SCRIPT));
		textHeader.setAlignment(Alignment.CENTRE);
		textHeader.setVerticalAlignment(VerticalAlignment.CENTRE);
		textHeader.setBackground(Colour.DARK_BLUE);
		textHeader.setBorder(Border.TOP, BorderLineStyle.THIN, Colour.WHITE);
		textHeader.setBorder(Border.RIGHT, BorderLineStyle.THIN, Colour.WHITE);
		
		
		WritableCellFormat textFormat = new WritableCellFormat();
		textFormat.setAlignment(Alignment.CENTRE);
		
		//테두리
		textFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		
		
		sh.setColumnView(0, 40);
		
		Label title = new Label(0, 0, "검색 기간 : " + date, new WritableCellFormat(
				new WritableFont (WritableFont.ARIAL,               //폰트 타입.Arial 외 별다른건 없는듯 하다.                              
				13,                                    //폰트 크기 
                WritableFont.BOLD,               //Bold 스타일
                false,                                 //이탤릭체여부
                UnderlineStyle.NO_UNDERLINE, //밑줄 스타일
                Colour.BLACK,                      //폰트 색
                ScriptStyle.NORMAL_SCRIPT)));
		sh.addCell(title);
		
		
		sh.setColumnView(0, 20);
		
		int row = 1;
		//헤더설정
		Label label1 = new Label(0, row, "문구 코드", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(1, row, "NMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(2, row, "NMS 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(3, row, "알림톡 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(4, row, "알림톡 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(5, row, "SMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(6, row, "SMS 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(7, row, "LMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(8, row, "LMS 실패", textHeader);
		sh.addCell(label1);
		
		
		
		row++;
		
		int n_succ =0, n_fail =0, s_succ=0, s_fail =0, a_succ=0, a_fail=0, l_succ=0, l_fail=0;
		for (Map<String, Object> tem : data) {
			
			// 일자
			label1 = new Label(0, row, (String) tem.get("code"),textFormat);
			sh.addCell(label1);
			
			// NMS성공
			n_succ += (Integer) tem.get("n_succ");
			label1 = new Label(1, row, String.format("%,d", (Integer)  tem.get("n_succ")),textFormat);
			sh.addCell(label1);
			
			// NMS 실패
			n_fail += (Integer)tem.get("n_fail");
			label1 = new Label(2, row, String.format("%,d",(Integer) tem.get("n_fail")),textFormat);
			sh.addCell(label1);
			
			// 알림톡 성공건
			a_succ += (Integer)tem.get("a_succ");
			label1 = new Label(3, row, String.format("%,d",(Integer) tem.get("a_succ")),textFormat);
			sh.addCell(label1);
			
			// 알림톡 실패건
			a_fail += (Integer)tem.get("a_fail");
			label1 = new Label(4, row, String.format("%,d",(Integer) tem.get("a_fail")),textFormat);
			sh.addCell(label1);
			
			// SMS 성공
			s_succ +=(Integer)tem.get("s_succ");
			label1 = new Label(5, row, String.format("%,d",(Integer) tem.get("s_succ")),textFormat);
			sh.addCell(label1);

			// SMS실패
			s_fail += (Integer)tem.get("s_fail");
			label1 = new Label(6, row, String.format("%,d",(Integer) tem.get("s_fail")),textFormat);
			sh.addCell(label1);
			
			// LMS 성공
			l_succ +=(Integer)tem.get("l_succ");
			label1 = new Label(7, row, String.format("%,d",(Integer) tem.get("l_succ")),textFormat);
			sh.addCell(label1);

			// LMS실패
			l_fail += (Integer)tem.get("l_fail");
			label1 = new Label(8, row, String.format("%,d",(Integer) tem.get("l_fail")),textFormat);
			sh.addCell(label1);
			

			row++;
		}
		
		label1 = new Label(0, row, "합계",textFormat);
		sh.addCell(label1);
		
		label1 = new Label(1, row, String.format("%,d",n_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(2, row, String.format("%,d",n_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(3, row, String.format("%,d",a_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(4, row, String.format("%,d",a_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(5, row, String.format("%,d",s_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(6, row, String.format("%,d",s_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(7, row, String.format("%,d",l_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(8, row, String.format("%,d",l_fail),textFormat);
		sh.addCell(label1);
		

		
		wb.write();
		wb.close();
		
		//return file.getAbsolutePath();
	}
	
	
	public void CreateExcelCodeChart(File file, List<Map<String,Object>> data, String SheetName) throws Exception{

		//WorkBook 생성
		WritableWorkbook wb = Workbook.createWorkbook(file);
		
		//WorkSheet 생성
		WritableSheet sh = wb.createSheet(SheetName, 0);
		
		sh.setColumnView(0, 20);
		sh.setColumnView(1, 20);
		sh.setColumnView(2, 20);
		sh.setColumnView(3, 20);
		sh.setColumnView(4, 20);
		sh.setColumnView(5, 20);
		sh.setColumnView(6, 20);
		sh.setColumnView(7, 20);
		sh.setColumnView(8, 20);
		
		//셀 형식
		//헤더내용
		WritableCellFormat textHeader = new WritableCellFormat(
				new WritableFont (WritableFont.ARIAL,               //폰트 타입.Arial 외 별다른건 없는듯 하다.                              
				12,                                    //폰트 크기 
                WritableFont.BOLD,               //Bold 스타일
                false,                                 //이탤릭체여부
                UnderlineStyle.NO_UNDERLINE, //밑줄 스타일
                Colour.WHITE,                      //폰트 색
                ScriptStyle.NORMAL_SCRIPT));
		textHeader.setAlignment(Alignment.CENTRE);
		textHeader.setVerticalAlignment(VerticalAlignment.CENTRE);
		textHeader.setBackground(Colour.DARK_BLUE);
		textHeader.setBorder(Border.TOP, BorderLineStyle.THIN, Colour.WHITE);
		textHeader.setBorder(Border.RIGHT, BorderLineStyle.THIN, Colour.WHITE);
		
		
		WritableCellFormat textFormat = new WritableCellFormat();
		textFormat.setAlignment(Alignment.CENTRE);
		
		//테두리
		textFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		int row = 0;
		//헤더설정
		Label label1 = new Label(0, row, "문구 코드", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(1, row, "NMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(2, row, "NMS 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(3, row, "알림톡 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(4, row, "알림톡 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(5, row, "SMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(6, row, "SMS 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(7, row, "LMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(8, row, "LMS 실패", textHeader);
		sh.addCell(label1);
		
		
		
		row++;
		
		int n_succ =0, n_fail =0, s_succ=0, s_fail =0, a_succ=0, a_fail=0, l_succ=0, l_fail=0;
		for (Map<String, Object> tem : data) {
			
			// 일자
			label1 = new Label(0, row, (String) tem.get("code"),textFormat);
			sh.addCell(label1);
			
			// NMS성공
			n_succ += (Integer) tem.get("n_succ");
			label1 = new Label(1, row, String.format("%,d", (Integer)  tem.get("n_succ")),textFormat);
			sh.addCell(label1);
			
			// NMS 실패
			n_fail += (Integer)tem.get("n_fail");
			label1 = new Label(2, row, String.format("%,d",(Integer) tem.get("n_fail")),textFormat);
			sh.addCell(label1);
			
			// 알림톡 성공건
			a_succ += (Integer)tem.get("a_succ");
			label1 = new Label(3, row, String.format("%,d",(Integer) tem.get("a_succ")),textFormat);
			sh.addCell(label1);
			
			// 알림톡 실패건
			a_fail += (Integer)tem.get("a_fail");
			label1 = new Label(4, row, String.format("%,d",(Integer) tem.get("a_fail")),textFormat);
			sh.addCell(label1);
			
			// SMS 성공
			s_succ +=(Integer)tem.get("s_succ");
			label1 = new Label(5, row, String.format("%,d",(Integer) tem.get("s_succ")),textFormat);
			sh.addCell(label1);

			// SMS실패
			s_fail += (Integer)tem.get("s_fail");
			label1 = new Label(6, row, String.format("%,d",(Integer) tem.get("s_fail")),textFormat);
			sh.addCell(label1);
			
			// SMS 성공
			l_succ +=(Integer)tem.get("l_succ");
			label1 = new Label(7, row, String.format("%,d",(Integer) tem.get("l_succ")),textFormat);
			sh.addCell(label1);

			// SMS실패
			l_fail += (Integer)tem.get("l_fail");
			label1 = new Label(8, row, String.format("%,d",(Integer) tem.get("l_fail")),textFormat);
			sh.addCell(label1);
			
			

			row++;
		}
		
		label1 = new Label(0, row, "합계",textFormat);
		sh.addCell(label1);
		
		label1 = new Label(1, row, String.format("%,d",n_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(2, row, String.format("%,d",n_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(3, row, String.format("%,d",a_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(4, row, String.format("%,d",a_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(5, row, String.format("%,d",s_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(6, row, String.format("%,d",s_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(7, row, String.format("%,d",l_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(8, row, String.format("%,d",l_fail),textFormat);
		sh.addCell(label1);
		
		

		
		wb.write();
		wb.close();
		
		//return file.getAbsolutePath();
	}
	
	public void CreateExcelCodeChart(File file, List<Map<String,Object>> data, String SheetName, String code) throws Exception{

		//WorkBook 생성
		WritableWorkbook wb = Workbook.createWorkbook(file);
		
		//WorkSheet 생성
		WritableSheet sh = wb.createSheet(SheetName, 0);
		
		sh.setColumnView(0, 20);
		sh.setColumnView(1, 20);
		sh.setColumnView(2, 20);
		sh.setColumnView(3, 20);
		sh.setColumnView(4, 20);
		sh.setColumnView(5, 20);
		sh.setColumnView(6, 20);
		sh.setColumnView(7, 20);
		sh.setColumnView(8, 20);
		
		
		//셀 형식
		//헤더내용
		WritableCellFormat textHeader = new WritableCellFormat(
				new WritableFont (WritableFont.ARIAL,               //폰트 타입.Arial 외 별다른건 없는듯 하다.                              
				12,                                    //폰트 크기 
                WritableFont.BOLD,               //Bold 스타일
                false,                                 //이탤릭체여부
                UnderlineStyle.NO_UNDERLINE, //밑줄 스타일
                Colour.WHITE,                      //폰트 색
                ScriptStyle.NORMAL_SCRIPT));
		textHeader.setAlignment(Alignment.CENTRE);
		textHeader.setVerticalAlignment(VerticalAlignment.CENTRE);
		textHeader.setBackground(Colour.DARK_BLUE);
		textHeader.setBorder(Border.TOP, BorderLineStyle.THIN, Colour.WHITE);
		textHeader.setBorder(Border.RIGHT, BorderLineStyle.THIN, Colour.WHITE);
		
		
		WritableCellFormat textFormat = new WritableCellFormat();
		textFormat.setAlignment(Alignment.CENTRE);
		
		//테두리
		textFormat.setBorder(Border.ALL, BorderLineStyle.THIN);
		
		
		sh.setColumnView(0, 40);
		
		Label title = new Label(0, 0, "문구 코드 : " + code, new WritableCellFormat(
				new WritableFont (WritableFont.ARIAL,               //폰트 타입.Arial 외 별다른건 없는듯 하다.                              
				13,                                    //폰트 크기 
                WritableFont.BOLD,               //Bold 스타일
                false,                                 //이탤릭체여부
                UnderlineStyle.NO_UNDERLINE, //밑줄 스타일
                Colour.BLACK,                      //폰트 색
                ScriptStyle.NORMAL_SCRIPT)));
		sh.addCell(title);
		
		
		sh.setColumnView(0, 20);
		
		int row = 1;
		//헤더설정
		Label label1 = new Label(0, row, "일자", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(1, row, "NMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(2, row, "NMS 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(3, row, "알림톡 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(4, row, "알림톡 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(5, row, "SMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(6, row, "SMS 실패", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(7, row, "LMS 성공", textHeader);
		sh.addCell(label1);
		
		label1 = new Label(8, row, "LMS 실패", textHeader);
		sh.addCell(label1);
		
		
		
		row++;
		
		int n_succ =0, n_fail =0, s_succ=0, s_fail =0, a_succ=0, a_fail=0, l_succ =0 , l_fail=0;
		for (Map<String, Object> tem : data) {
			
			// 일자
			label1 = new Label(0, row, (String) tem.get("report_date"),textFormat);
			sh.addCell(label1);
			
			// NMS성공
			n_succ += (Integer) tem.get("n_succ");
			label1 = new Label(1, row, String.format("%,d", (Integer)  tem.get("n_succ")),textFormat);
			sh.addCell(label1);
			
			// NMS 실패
			n_fail += (Integer)tem.get("n_fail");
			label1 = new Label(2, row, String.format("%,d",(Integer) tem.get("n_fail")),textFormat);
			sh.addCell(label1);
			
			// 알림톡 성공건
			a_succ += (Integer)tem.get("a_succ");
			label1 = new Label(3, row, String.format("%,d",(Integer) tem.get("a_succ")),textFormat);
			sh.addCell(label1);
			
			// 알림톡 실패건
			a_fail += (Integer)tem.get("a_fail");
			label1 = new Label(4, row, String.format("%,d",(Integer) tem.get("a_fail")),textFormat);
			sh.addCell(label1);
			
			// SMS 성공
			s_succ +=(Integer)tem.get("s_succ");
			label1 = new Label(5, row, String.format("%,d",(Integer) tem.get("s_succ")),textFormat);
			sh.addCell(label1);

			// SMS실패
			s_fail += (Integer)tem.get("s_fail");
			label1 = new Label(6, row, String.format("%,d",(Integer) tem.get("s_fail")),textFormat);
			sh.addCell(label1);
			
			// LMS 성공
			l_succ +=(Integer)tem.get("l_succ");
			label1 = new Label(5, row, String.format("%,d",(Integer) tem.get("l_succ")),textFormat);
			sh.addCell(label1);

			// LMS실패
			l_fail += (Integer)tem.get("l_fail");
			label1 = new Label(6, row, String.format("%,d",(Integer) tem.get("l_fail")),textFormat);
			sh.addCell(label1);

			row++;
		}
		
		label1 = new Label(0, row, "합계",textFormat);
		sh.addCell(label1);
		
		label1 = new Label(1, row, String.format("%,d",n_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(2, row, String.format("%,d",n_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(3, row, String.format("%,d",a_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(4, row, String.format("%,d",a_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(5, row, String.format("%,d",s_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(6, row, String.format("%,d",s_fail),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(7, row, String.format("%,d",l_succ),textFormat);
		sh.addCell(label1);
		
		label1 = new Label(8, row, String.format("%,d",l_fail),textFormat);
		sh.addCell(label1);
		
		
		

		
		wb.write();
		wb.close();
		
		//return file.getAbsolutePath();
	}
}
