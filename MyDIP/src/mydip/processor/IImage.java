package mydip.processor;

import mydip.util.ImageUtil;

import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.graphics.ImageData;
import org.eclipse.swt.widgets.Display;

public class IImage implements IImageProcessor {

	@Override
	public Image process(Image image) {
		ImageData oldData = image.getImageData();
		ImageData newData = oldData;
		int[] pixelData = ImageUtil.getPixelData(oldData);// ���������е�����ֵ����С�� width * height
		int[] rgbData = new int[3];
		float[] ihsData = new float[3];
		int width = oldData.width;
		int height = oldData.height;
		for (int i = 0; i < height; i++) {
			for (int j = 0; j < width; j++) {
//				rgbData = ImageUtil.getRGBFromPixel(pixelData[i * width + j]);//�õ�rgb����
//				RGB rgb = new RGB(rgbData[0], rgbData[1], rgbData[2]);//ͨ�������õ�RGB��
				ihsData = ImageUtil.getYUVFromPixel(pixelData[i * width + j]);
//				hsiData = rgb.getHSB();//ͨ��RGB��õ�HSI����
				//����hsi�е�ĳһ�������õ��µ�RGB��Ȼ�����RGB�õ����أ������õ���Ӧ��λ�ü���
				newData.setPixel(j, i, ImageUtil.getPixelFromYUV(new float[]{ihsData[0],0,0}));
			}
		}
		Image newImage = new Image(Display.getDefault(), newData);
		Image newGreyImage = new Image(Display.getDefault(), newImage, SWT.IMAGE_GRAY);
		return newGreyImage;
	}

}