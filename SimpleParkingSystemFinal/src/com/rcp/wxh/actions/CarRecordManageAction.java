package com.rcp.wxh.actions;

import org.eclipse.ui.IEditorPart;
import org.eclipse.ui.IWorkbenchPage;
import org.eclipse.ui.IWorkbenchWindow;
import org.eclipse.ui.PartInitException;
import org.eclipse.ui.actions.ActionFactory.IWorkbenchAction;

import parkingsystem.Activator;

import com.rcp.wxh.editors.CarRecordEditor;
import com.rcp.wxh.editors.CarRecordInput;

/**
 * 车辆出入记录管理 响应
 * 
 * @author wuxuehong 2011-11-16
 * 
 */
public class CarRecordManageAction extends ValidateStatusAction implements IWorkbenchAction {

	public static final String ID = CarRecordManageAction.class.getName();

	private IWorkbenchWindow window;

	public CarRecordManageAction(IWorkbenchWindow window, String label, String image) {
		this.window = window;
		this.setText(label);
		setImageDescriptor(Activator.getImageDescriptor(image));
		this.setId(ID); // 一定要记住
	}

	public void run() {
		IWorkbenchPage workbenchPage = window.getActivePage();
		IEditorPart editor = workbenchPage.findEditor(CarRecordInput.cri); // 获取编辑器
		if (editor != null) { // 如果编辑器已经打开
			workbenchPage.bringToTop(editor); // 则显示该编辑器
		} else { // 重新初始化该编辑器
			try {
				editor = workbenchPage.openEditor(CarRecordInput.cri, CarRecordEditor.ID);
			} catch (PartInitException ei) {
				ei.printStackTrace();
			}
		}
	}

	public void dispose() {
		System.out.println(ID + "\tdisposed!!!");
	}

}