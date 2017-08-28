package servlet;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;

@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 doPost(request,response);
			}

			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//设置上传文件保存路径
						String filePath = getServletContext().getRealPath("/") + "files";
						File file = new File(filePath);
						if(!file.exists()){
							file.mkdir();
						}
						
						SmartUpload su = new SmartUpload();
						//初始化对象
						su.initialize(getServletConfig(), request, response);
						//设置上传文件大小
						su.setMaxFileSize(1024*1024*10);
						//设置所有文件的大小
						su.setTotalMaxFileSize(1024*1024*100);
						//设置允许上传文件类型
						su.setAllowedFilesList("jpg,gif");
						String result = "上传成功！";
						//设置禁止上传的文件类型
						try {
							su.setDeniedFilesList("rar,jsp,js");
							//上传文件
							su.upload();
							
							int count = su.save(filePath);
							System.out.println("上传成功" +  count + "个文件！");
						} catch (Exception e) {
							result = "上传失败！";
							if(e.getMessage().indexOf("1015")!=-1){
								result="上传文件类型不正确";
							}else if(e.getMessage().indexOf("1010")!=-1){
							   result="上传文件类型不正确";
							}else if(e.getMessage().indexOf("1105")!=-1){
								   result="上传文件大小超过最大值";
							}else if(e.getMessage().indexOf("1110")!=-1){
								   result="上传文件总大小超过最大值";
						   }
							e.printStackTrace();
						}
						
						for(int i =0; i < su.getFiles().getCount(); i++){
							com.jspsmart.upload.File tempFile = su.getFiles().getFile(i);
							System.out.println("---------------------------");
							System.out.println("表单当中name属性值：" + tempFile.getFieldName());
							System.out.println("上传文件名：" + tempFile.getFieldName());
							System.out.println("上传文件长度:" + tempFile.getSize());
							System.out.println("上传文件的拓展名：" + tempFile.getFileExt());
							System.out.println("上传文件的全名：" + tempFile.getFilePathName());
							System.out.println("---------------------------");
						}
						
						request.setAttribute("result", result);
						request.getRequestDispatcher("admin/main/fileUpload.jsp").forward(request, response);
					}

				}
