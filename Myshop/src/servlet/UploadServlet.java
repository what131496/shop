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
				//�����ϴ��ļ�����·��
						String filePath = getServletContext().getRealPath("/") + "files";
						File file = new File(filePath);
						if(!file.exists()){
							file.mkdir();
						}
						
						SmartUpload su = new SmartUpload();
						//��ʼ������
						su.initialize(getServletConfig(), request, response);
						//�����ϴ��ļ���С
						su.setMaxFileSize(1024*1024*10);
						//���������ļ��Ĵ�С
						su.setTotalMaxFileSize(1024*1024*100);
						//���������ϴ��ļ�����
						su.setAllowedFilesList("jpg,gif");
						String result = "�ϴ��ɹ���";
						//���ý�ֹ�ϴ����ļ�����
						try {
							su.setDeniedFilesList("rar,jsp,js");
							//�ϴ��ļ�
							su.upload();
							
							int count = su.save(filePath);
							System.out.println("�ϴ��ɹ�" +  count + "���ļ���");
						} catch (Exception e) {
							result = "�ϴ�ʧ�ܣ�";
							if(e.getMessage().indexOf("1015")!=-1){
								result="�ϴ��ļ����Ͳ���ȷ";
							}else if(e.getMessage().indexOf("1010")!=-1){
							   result="�ϴ��ļ����Ͳ���ȷ";
							}else if(e.getMessage().indexOf("1105")!=-1){
								   result="�ϴ��ļ���С�������ֵ";
							}else if(e.getMessage().indexOf("1110")!=-1){
								   result="�ϴ��ļ��ܴ�С�������ֵ";
						   }
							e.printStackTrace();
						}
						
						for(int i =0; i < su.getFiles().getCount(); i++){
							com.jspsmart.upload.File tempFile = su.getFiles().getFile(i);
							System.out.println("---------------------------");
							System.out.println("������name����ֵ��" + tempFile.getFieldName());
							System.out.println("�ϴ��ļ�����" + tempFile.getFieldName());
							System.out.println("�ϴ��ļ�����:" + tempFile.getSize());
							System.out.println("�ϴ��ļ�����չ����" + tempFile.getFileExt());
							System.out.println("�ϴ��ļ���ȫ����" + tempFile.getFilePathName());
							System.out.println("---------------------------");
						}
						
						request.setAttribute("result", result);
						request.getRequestDispatcher("admin/main/fileUpload.jsp").forward(request, response);
					}

				}
