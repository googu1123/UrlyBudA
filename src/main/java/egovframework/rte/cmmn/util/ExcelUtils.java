package egovframework.rte.cmmn.util;

import java.util.*;
import java.io.File;
import jxl.*;
import org.hsqldb.lib.HashMap;

import org.apache.log4j.Logger;

public class ExcelUtils {

	private static Logger log = Logger.getLogger(ExcelUtils.class);
	
	public List xlsForList(String file_path) throws Exception {
		File file = new File(file_path);
		
		if(!file.exists()) {
			throw new Exception("파일 없슴");
		}
		
		Workbook workbook = null;
		Sheet sheet = null;
		List list = new ArrayList();
		
		try {
			
			workbook = Workbook.getWorkbook(file);
			sheet = workbook.getSheet(0);
			
			int row = sheet.getRows();
			int col = sheet.getColumns();
			
			if(row <= 0) { throw new Exception("내용 없슴"); }
			
			for(int i = 0; i < row; i++) {
				HashMap hm = new HashMap();
				
				for(int c = 0; c < col; c++) {
					hm.put("COL"+c, sheet.getCell(c, i).getContents());
				}
				
				list.add(i, hm);
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		} finally {
			try {
				if(workbook != null) {
					workbook.close();
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return list;
		}
	}
	
	
	
}
