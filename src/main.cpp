#include <boost/thread.hpp>
#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/opencv.hpp>

using namespace std;

void display(cv::Mat &im, cv::Mat &bbox) {
    int n = bbox.rows;
    for (int i = 0; i < n; i++) {
        cv::line(im, cv::Point2i(bbox.at<float>(i, 0), bbox.at<float>(i, 1)),
             cv::Point2i(bbox.at<float>((i + 1) % n, 0), bbox.at<float>((i + 1) % n, 1)),
             cv::Scalar(255, 0, 0), 3);
    }
    imshow("Result", im);
}

void CamCapture() {
    cv::VideoCapture cap;
    cv::Mat          frame;
    cap.open(0, cv::CAP_V4L2);

    if (cap.isOpened()) {
        cout << "size=" << cap.get(cv::CAP_PROP_FRAME_WIDTH) << "*"
             << cap.get(cv::CAP_PROP_FRAME_HEIGHT) << endl;
        cv::namedWindow("Video");
    } else {
        return;
    }

    while (1) {
        cap >> frame;
        cv:cvtColor(frame,frame,cv::COLOR_RGB2GRAY);
        cv::imshow("Video", frame);

        boost::this_thread::sleep(boost::posix_time::milliseconds(199));
        int key_value = cv::waitKey(1);
        if (key_value == 27) {
            break;
        }
        cv::QRCodeDetector qrDecoder;

        cv::Mat bbox, rectifiedImage;

        std::string data = qrDecoder.detectAndDecode(frame, bbox, rectifiedImage);
        if (data.length() > 0) {
            cout << "Decoded Data : " << data << endl;

            display(frame, bbox);
            rectifiedImage.convertTo(rectifiedImage, CV_8UC3);
            imshow("Rectified QRCode", rectifiedImage);

            cv::waitKey(0);
        } else
            cout << "QR Code not detected" << endl;
    }

    cv::destroyAllWindows();
    cap.release();
}

int main(int argc, char *argv[]) {
    boost::thread t(CamCapture);
    t.join();
    return 0;
}