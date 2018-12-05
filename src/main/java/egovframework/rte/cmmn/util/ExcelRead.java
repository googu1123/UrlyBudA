package egovframework.rte.cmmn.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import egovframework.rte.cms.service.TsmVO;

public class ExcelRead {

/*	public static void main(String[] args) {
		ExcelRead ex = new ExcelRead();

		try {
			List list = ex.ReadXLSX("C:/Users/tsis/Desktop/스마트 메시징서비스/20160222/문구 Import파일.xlsx");
			
			System.out.println("SIZE : " + list.size());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/

	public List ReadXLS(FileInputStream fis) {
		// 파일을 읽기위해 엑셀파일을 가져온다
		try {
			//FileInputStream fis = new FileInputStream(filePath);
			HSSFWorkbook workbook = new HSSFWorkbook(fis);

			
			List<TsmVO> list = new ArrayList<TsmVO>();
			TsmVO vo = null;
			int rowindex = 0;
			// 시트 수 (첫번째에만 존재하므로 0을 준다)
			// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
			HSSFSheet sheet = workbook.getSheetAt(0);
			// 행의 수
			int rows = sheet.getPhysicalNumberOfRows();
			
			
			for (rowindex = 1; rowindex < rows; rowindex++) {
				// 행을 읽는다
				HSSFRow row = sheet.getRow(rowindex);
				if (row != null) {
					vo = new TsmVO();
					
					//코드
					HSSFCell cell = row.getCell(0);
					String code = getValue(cell);
					vo.setCode(code);
						
					//제목
					cell = row.getCell(1);
					String subject = getValue(cell);
					vo.setSubject(subject);
							
					//문구내용
					cell = row.getCell(2);
					String content = getValue(cell);
					content = content.replaceAll("#\\{(.*?)\\}","#");
					vo.setContent(content);
					
					//알림톡 유무
					cell = row.getCell(3);
					String use_yn = getValue(cell);
					vo.setUse_yn(use_yn);
									
					//발송 순서
					cell = row.getCell(4);
					String priority = getValue(cell);
					vo.setPriority(priority);
					
					//심의번호
					cell = row.getCell(5);
					String deli_no = getValue(cell);
					vo.setDeli_no(deli_no);
								
					//테이블구분
					cell = row.getCell(6);
					String table_div = getValue(cell);
					vo.setTable_div(table_div);
					
					//정보성 유무
					cell = row.getCell(7);
					String info_yn = getValue(cell);
					vo.setInfo_yn(info_yn);
					
					//설명
					cell = row.getCell(8);
					String description = getValue(cell);
					vo.setDescription(description);
					
					//설명
					cell = row.getCell(9);
					String use = getValue(cell);
					vo.setUse(use);
					
					//추가문구사용여부
					cell = row.getCell(10);
					vo.setAdd_content_yn(getValue(cell));
					
					//추가문구내용
					cell = row.getCell(11);
					vo.setAdd_content(getValue(cell));
					
					if(vo.getCode() == null || vo.getCode().equals("false"))
						continue;
					else 
						list.add(vo);
				}
			}

			return list;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
	public List ReadXLSX(FileInputStream fis) {
		// 파일을 읽기위해 엑셀파일을 가져온다
		try {
			//FileInputStream fis = new FileInputStream(filePath);
			XSSFWorkbook workbook = new XSSFWorkbook(fis);
			int rowindex = 0;
			int columnindex = 0;
			
			List<TsmVO> list = new ArrayList<TsmVO>();
			TsmVO vo = null;
			
			
			// 시트 수 (첫번째에만 존재하므로 0을 준다)
			// 만약 각 시트를 읽기위해서는 FOR문을 한번더 돌려준다
			XSSFSheet sheet = workbook.getSheetAt(0);
			// 행의 수
			int rows = sheet.getPhysicalNumberOfRows();
			for (rowindex = 1; rowindex < rows; rowindex++) {
				// 행을읽는다
				XSSFRow row = sheet.getRow(rowindex);
				if (row != null) {
					vo = new TsmVO();
	
					//코드
					XSSFCell cell = row.getCell(0);
					String code = getValue(cell);
					
					
					
					vo.setCode(code);
						
					//제목
					cell = row.getCell(1);
					String subject = getValue(cell);
					vo.setSubject(subject);
							
					//문구내용
					cell = row.getCell(2);
					String content = getValue(cell);
					content = content.replaceAll("#\\{(.*?)\\}","#");
					vo.setContent(content);
					
					//알림톡 유무
					cell = row.getCell(3);
					String use_yn = getValue(cell);
					vo.setUse_yn(use_yn);
									
					//발송 순서
					cell = row.getCell(4);
					String priority = getValue(cell);
					vo.setPriority(priority);
					
					//심의번호
					cell = row.getCell(5);
					String deli_no = getValue(cell);
					vo.setDeli_no(deli_no);
								
					//테이블구분
					cell = row.getCell(6);
					String table_div = getValue(cell);
					vo.setTable_div(table_div);
					
					//정보성 유무
					cell = row.getCell(7);
					String info_yn = getValue(cell);
					vo.setInfo_yn(info_yn);
					
					//설명
					cell = row.getCell(8);
					String description = getValue(cell);
					vo.setDescription(description);
					
					//설명
					cell = row.getCell(9);
					String use = getValue(cell);
					vo.setUse(use);
					
					//추가문구사용여부
					cell = row.getCell(10);
					vo.setAdd_content_yn(getValue(cell));
					
					//추가문구내용
					cell = row.getCell(11);
					vo.setAdd_content(getValue(cell));
					
					if(vo.getCode() == null || vo.getCode().equals("false"))
						continue;
					else 
						list.add(vo);
					
				}
			}
			
			return list;

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}
	
	public String getValue(XSSFCell cell){
		String value= "";
		
		switch (cell.getCellType()) {
		case XSSFCell.CELL_TYPE_FORMULA:
			value = cell.getCellFormula();
			break;
		case XSSFCell.CELL_TYPE_NUMERIC:
			value = cell.getNumericCellValue() + "";
			break;
		case XSSFCell.CELL_TYPE_STRING:
			value = cell.getStringCellValue() + "";
			break;
		case XSSFCell.CELL_TYPE_BLANK:
			value = cell.getBooleanCellValue() + "";
			break;
		case XSSFCell.CELL_TYPE_ERROR:
			value = cell.getErrorCellValue() + "";
			break;
		}
		
		return value;
	}
	
	public String getValue(HSSFCell cell){
		
		String value= "";
		
		switch (cell.getCellType()) {
		case HSSFCell.CELL_TYPE_FORMULA:
			value = cell.getCellFormula();
			break;
		case HSSFCell.CELL_TYPE_NUMERIC:
			value = cell.getNumericCellValue() + "";
			break;
		case HSSFCell.CELL_TYPE_STRING:
			value = cell.getStringCellValue() + "";
			break;
		case HSSFCell.CELL_TYPE_BLANK:
			value = cell.getBooleanCellValue() + "";
			break;
		case HSSFCell.CELL_TYPE_ERROR:
			value = cell.getErrorCellValue() + "";
			break;
		}
		
		return value;
	}
}
