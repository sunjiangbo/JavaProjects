package cn.edu.csu.dbhospital.action;

import org.eclipse.jface.action.Action;
import org.eclipse.ui.IEditorInput;
import org.eclipse.ui.IEditorPart;
import org.eclipse.ui.IWorkbenchPage;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.PartInitException;

import cn.edu.csu.dbhospital.Activator;
import cn.edu.csu.dbhospital.editor.DoctorManageEditor;
import cn.edu.csu.dbhospital.editor.DoctorManageEditorInput;

/**
 * 
 * 医生管理action
 * 
 */
public class DoctorManageAction extends Action {

	private final IWorkbenchWindow window;

	public DoctorManageAction(IWorkbenchWindow window) {
		this.window = window;
		// 设置菜单项文本，并给该菜单项添加快捷键以及键绑定
		this.setText("医生管理");
		// 工具栏上提示性信息
		this.setToolTipText("医生管理");
		// 添加工具栏图形按钮
		this.setImageDescriptor(Activator.getImageDescriptor("/icons/User.ico"));
	}

	public void run() {
		if (window != null) {
			IEditorInput input = DoctorManageEditorInput.EDITOR_INPUT;
			IWorkbenchPage workbenchPage = window.getActivePage();
			IEditorPart editor = workbenchPage.findEditor(input);
			String editorID = DoctorManageEditor.ID;
			if (editor != null) {
				workbenchPage.bringToTop(editor);
			} else {
				try {
					workbenchPage.openEditor(input, editorID);
				} catch (PartInitException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
