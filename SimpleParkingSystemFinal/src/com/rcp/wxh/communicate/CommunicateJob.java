package com.rcp.wxh.communicate;

import java.util.Date;
import java.util.Iterator;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.eclipse.core.runtime.IProgressMonitor;
import org.eclipse.core.runtime.IStatus;
import org.eclipse.core.runtime.Status;
import org.eclipse.core.runtime.jobs.Job;
import org.eclipse.swt.widgets.Display;
import org.eclipse.ui.IEditorPart;
import org.eclipse.ui.IWorkbenchPage;
import org.eclipse.ui.PartInitException;

import parkingsystem.Activator;
import parkingsystem.ApplicationActionBarAdvisor;

import com.rcp.wxh.editors.EnterEditor;
import com.rcp.wxh.editors.EnterEditorInput;
import com.rcp.wxh.pojo.TCarEnter;
import com.rcp.wxh.pojo.TCarRecord;
import com.rcp.wxh.pojo.TCard;
import com.rcp.wxh.pojo.TMember;
import com.rcp.wxh.resource.IimageKeys;
import com.rcp.wxh.service.impl.CarEnterService;
import com.rcp.wxh.service.impl.CardService;
import com.rcp.wxh.utils.CarMonitorUtil;
import com.rcp.wxh.utils.CardComm;
import com.rcp.wxh.utils.CardUtil;
import com.rcp.wxh.utils.MessageDialogUtil;

/**
 * ���ն�ͨ����ҵ
 * 
 * @author wuxuehong 2011-11-18
 * 
 */
public class CommunicateJob extends Job {

	private static final Log log = LogFactory.getLog(CommunicateJob.class);

	private EnterEditor enterEditor = null;
	private boolean changeEditor = false; // ���ڿ����л������� Ĭ��Ϊ��  //TODO:yinger  ���������Կ��Էŵ�������
	private boolean validate = false; // �볡/������֤

	public CommunicateJob(String name) {
		super(name);
	}

	/**
	 * job run
	 * �����Ŷ�ȡ�ն���Ϣ
	 */
	protected IStatus run(IProgressMonitor monitor) {
		log.info("��ʼ��ͨ�Ŵ���...");
		boolean init = false;
		try {
			try {
				init = CardComm.init(); // ��ʼ�� CardCommʵ�� �� ��ʼ��ǰ�����DLLģ��
			} catch (CommunicateException e) {
				showMessage(e.getMessage());// ͨ�Ź����еı���������ʾ��״̬����
			}
		} catch (Error e) { // ����DLL���ش���
			showMessage("ͨ��ģ�����ӿ����ʧ��!");
			return Status.OK_STATUS;
		}
		byte[] data = new byte[100];// [1, -54, 125, -4, 32, 0, 0,....]
		// [1, -22, 61, 40, 33, 0,0,...]
		int op = 0;
		if (init) {// ��ʼ���ɹ�
			log.info("���ڳ�ʼ���ɹ�...");
			while (true) {
				op = 0;
				try {
					
					System.out.println("��ʼ������ȡ��Ϣ...");//TODO��yinger
					
					op = CardComm.read(data); // ��ȡ�ն���Ϣ �ڴ˴��߳�������һֱ�ȴ���ˢ������
				} catch (MachineException e) {
					showMessage(e.getMessage()); // ��״̬����ʾ�쳣��Ϣ
				} catch (CommunicateException e) {
					showMessage(e.getMessage());
				} catch (Error e) {
					showMessage("ͨ��ģ�����:" + e.getMessage());
					break;
				}
				if (op == CardComm.GETCARDID && data != null) {// op=1
					new Thread(new DealWithCardThread(data)).start();// �����µ��߳̽��д�������ô�Ϳ��Դ������ˢ������
				}
			}
		}
		return Status.OK_STATUS;
	}

	/**
	 * ͨ����Ϣ�����߳�
	 * 
	 * @author wuxuehong 2011-11-20
	 * 
	 */
	class DealWithCardThread implements Runnable {
		byte[] data = null; // �ն˷�����Ϣ
		StringBuffer sb = new StringBuffer(); // UI��ʾ��Ϣ
		TCard card = null; // TCardʵ��
		String cardid = null; // ����
		TCarRecord carRecord = null; // ͣ����¼

		public DealWithCardThread(byte[] data) {
			this.data = data;
//		System.out.println(Arrays.toString(data));
		}

		public void run() {
			final byte type = data[0]; // ����ڷ�ʽ 1-��� 2-����
			changeEditor = false; // �Ƿ�Ҫ�л������� Ĭ��Ϊ��

			// ////////////////////////////////////����Ƿ���Ҫ�л�������//////////////////////////////////////////
//			switch (type) {
//			case CardComm.ENTERANCE: // ��ڿ�����Ϣ
//				if (EnterEditor.STYLE == EnterEditor.EXIT_ONLY) { // �����ǰ���Ǵ򿪵���ڼ�����
//					EnterEditor.STYLE = EnterEditor.ENTER_EXIT; // �涨 ֻҪ��ǰ�����岻�������Ϣ��ͻ ͳһת�� ����ڼ�����
//					changeEditor = true; // ��Ҫ�л����������
//				}
//				break;
//			case CardComm.EXITANCE: // ���ڿ�����Ϣ
//				if (EnterEditor.STYLE == EnterEditor.ENTER_ONLY) { // �����ǰ�򿪵���ڼ�����
//					EnterEditor.STYLE = EnterEditor.ENTER_EXIT;
//					changeEditor = true; // ��Ҫ�л����������
//				}
//				break;
//			default: // �쳣�� ������
//				showMessage("�쳣����");
//				return;
//			}
			
			//////////////////////////////////////////����������ʾ����ǰ/////////////////////////////////////////
			Display.getDefault().asyncExec(new Runnable() {
				public void run() {
					IWorkbenchPage workbenchPage = Activator.getDefault().getWorkbench().getActiveWorkbenchWindow()
							.getActivePage();
					IEditorPart editor = workbenchPage.findEditor(EnterEditorInput.eei); // ��ȡ�༭��
					try {
						if (editor != null) { // ����������Ѿ���
//							if (changeEditor) { // ��Ҫ�л�������
//								workbenchPage.closeEditor(editor, true); // �رյ�ǰ������
//								editor = workbenchPage.openEditor(EnterEditorInput.eei, EnterEditor.ID);
//							} else
								workbenchPage.bringToTop(editor); // ����������ʾ����ǰ
						} else { // ���³�ʼ���ñ༭��
							editor = workbenchPage.openEditor(EnterEditorInput.eei, EnterEditor.ID);
						}
					} catch (PartInitException ei) {
						log.info("�������л��쳣!");
						showMessage("�������л��쳣!");
					}
					enterEditor = (EnterEditor) editor;
				}
			});

			// /////////////////////////////////////////////��֤��Ƭ��Ч��///////////////////////////////////////////////
			// ����card���� ������Ƭ��Ϣ
			byte[] cardNum = new byte[4];
			System.arraycopy(data, 1, cardNum, 0, 4); // ��data��1-4���ֽ�(������)������cardNum��
			cardid = CardUtil.bytes2long(data, 1) + ""; // 1-4���ֽ�Ϊ����
			try {
				card = getCard(cardid);
			} catch (Exception e) {
				sb.append("��ȡ��Ƭ��Ϣʧ��!�����������������!");
				// ע�⣬������ʾ��Ϣ���첽ִ�еģ����ܵõ�e������ʹ������ַ�������sb
				Display.getDefault().asyncExec(new Runnable() {
					public void run() {
						MessageDialogUtil.showWarningMessage(Display.getDefault().getActiveShell(), sb.toString());
					}
				});
				return;
			}
			TCarEnter carEnter = null;
			if (card != null) {
				carEnter = getCarEnter(card);//����õ���carEnter������null
			}

			// ����� ��֤ �������֤��ʽ��ͬ
			switch (type) {
			case CardComm.ENTERANCE: // �����֤
				// ��ȡ��Ƭ��Ϣ�� �Կ�Ƭ������֤ (�Ƿ�ע�ᣬ�Ƿ񼤻�����Ϣ,�Ƿ��Ѿ��볡)
				validate = CarMonitorUtil.isAviliable(card, carEnter, sb);
				try {
					if (validate) { // �����Ƭ��Ч
						CardComm.write(cardNum, CardComm.SUCCESS, type); // ������Ϣ���ն� ���� �ɹ�/ʧ�� ���/����
						addCarEnter(card);// ���������볡��Ϣ
					} else {
						CardComm.write(cardNum, CardComm.FAIL, type); // ������Ϣ���ն� ���� �ɹ�/ʧ�� ���/����
					}
				} catch (CommunicateException e) {
//					e.printStackTrace();
					showMessage(e.getMessage());
					log.info(e.getMessage());
				}
				break;
			case CardComm.EXITANCE:// ����ǳ�����������ã�
				if (carEnter == null) {
					Display.getDefault().asyncExec(new Runnable() {
						public void run() {
							MessageDialogUtil.showWarningMessage(Display.getDefault().getActiveShell(), "�޷���ȡ�ó����볡��Ϣ!");
						}
					});
					return;
				} else { // �ն���ʾͣ�����
//						  delCarEnter(carEnter);
					carRecord = CarMonitorUtil.getCarRecord(carEnter); // ��ȡ����ͣ����¼����������Ϣ
					if (carRecord != null) {
//							  addCarRecord(carRecord);
						float exp = carRecord.getFactexpense();
						try {
							CardComm.setTimeMoney(carRecord.getStoptime().intValue(), (int) (exp * 10 / 10),
									(int) (exp * 10 % 10));// Ԫ ��
						} catch (CommunicateException e) {
							showMessage(e.getMessage());
							log.info(e.getMessage());
						}
					}
				}
				break;
			}

			// //////////////////////////////////////////////UIչʾ��֤�����Ϣ//////////////////////////////////
			Display.getDefault().asyncExec(new Runnable() {
				public void run() {
					enterEditor.dealEnterCar(card, sb, validate, type, carRecord); // param:��Ƭ���� ��Ƭ��֤��Ϣ ��֤���
				}
			});

		}

	}

	/**
	 * ��ȡ��Ƭ��Ϣ
	 * 
	 * @param cardID
	 * @return
	 * @throws Exception
	 */
	public TCard getCard(String cardid) throws Exception {
		CardService cs = new CardService();
		TCard card = null;
		try {
			card = cs.getCardById(cardid);
		} catch (Exception e) {
			log.info("��Ƭ��Ϣ��ȡ�쳣!");
			throw e;
		}
		return card;
	}

	/**
	 * ��ȡ�����볡��¼�����ݿ���id
	 * 
	 * @return
	 */
	private TCarEnter getCarEnter(TCard card) {
		CarEnterService ces = new CarEnterService();
		TCarEnter tce = null;
		try {
			tce = ces.getCarEnterByCardid(card.getCardid());
		} catch (Exception e) {
			log.info("�����볡��Ϣ��ȡ�쳣!");
//			throw e;//�����쳣���׳�ȥ
		}
		return tce;
	}

	/**
	 * ���������볡��¼
	 * 
	 * @param tce
	 */
	private void addCarEnter(TCard card) {
		TCarEnter tce = new TCarEnter();
		tce.setCardid(card.getCardid());
		tce.setTCard(card);
		Iterator<TMember> it = card.getTMembers().iterator();
		TMember member = null;
		if (it.hasNext()) {
			member = it.next();
		}
		tce.setCarnumber(member == null ? "δ֪" : member.getCarnumber());
		tce.setEntertime(new Date());
		CarEnterService ces = new CarEnterService();
		try {
			ces.addCarEnter(tce);
		} catch (Exception e) {
			log.info("���������볡��¼ʧ��!");
		}
	}

	// ״̬�� ��ʾ��Ϣ�������˴���ͽ��о��棡
	private void showMessage(final String msg) {
		Display.getDefault().asyncExec(new Runnable() {
			public void run() {
				// ��Ϣ��ʾ��Ĭ�ϵ�λ��
				ApplicationActionBarAdvisor.getInstance().getStatusLineManager()
						.setMessage(Activator.getImageDescriptor(IimageKeys.STATUS_WARN_TRAY).createImage(), msg);
			}
		});
	}

}