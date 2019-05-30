package www.util;

import java.io.*;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;

import freemarker.cache.WebappTemplateLoader;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FreeMarkerUtil {

	
	/**
	 * 删除文件
	 * @param servletContext
	 * @param fileName
	 * @param ids
	 */
	public static void deleteHtml(ServletContext servletContext,String fileName,Integer ids[]) {
		// 把静态页页删除
		for (int i = 0; i < ids.length; i++) {
			int id = ids[i];
			// 获取文件路径
			String path = servletContext.getRealPath("/html");
			// 拼接文件路径
			String filePath = path + "/" +fileName+id+ ".html";

			// 创建一个文件
			File file = new File(filePath);
			// 判断文件存在否
			if (file.exists()) {
				file.delete();// 删除文件
			}
		}
	}
	
	/**
	 * 生成静态页面效果
	 * @param servletContext 上下文对象
	 * @param templateName   模版名称
	 * @param fileName   生成文件的名称
	 * @param root   存放的数据
	 */
	public static void generateHtml(ServletContext servletContext,String templateName,
			String fileName,Map<String,Object> root) throws IOException, TemplateException {

			//声明配置对象
			Configuration conf = new Configuration(Configuration.VERSION_2_3_28);
			conf.setEncoding(Locale.getDefault(), "UTF-8");
			
			//声明模板加载器  模版的路径是固定的
			WebappTemplateLoader wtl = new WebappTemplateLoader(servletContext, "/WEB-INF/templates");
			//绑定到配置对象
			conf.setTemplateLoader(wtl);
			
			//根据创建模版对象
			Template tmplt = conf.getTemplate(templateName);
			//根据模板与数据模型生成静态网页
			String path = servletContext.getRealPath("/html");
			String filePath = path+"/"+fileName;
			
			//创建一个一个文件
			File file = new File(filePath);
		
		    //获取文件的父目录
			if(!file.getParentFile().exists()) {
				//创建文件
				file.getParentFile().mkdirs();
			}
			//根据文件创建输出流对象
			FileOutputStream fos = new FileOutputStream(file);
			
			OutputStreamWriter osw = new OutputStreamWriter(fos,"UTF-8");
			
			BufferedWriter bw = new BufferedWriter(osw);
			
			tmplt.process(root, bw);
			
			fos.flush();
			fos.close();

	}
}
