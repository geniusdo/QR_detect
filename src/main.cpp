#include <boost/thread.hpp>
#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/objdetect.hpp>
#include <opencv2/opencv.hpp>
#include <chrono>

using namespace std;

void display(cv::Mat &im, cv::Mat &bbox)
{
    int n = bbox.rows;
    for (int i = 0; i < n; i++)
    {
        cv::line(im, cv::Point2i(bbox.at<float>(i, 0), bbox.at<float>(i, 1)),
                 cv::Point2i(bbox.at<float>((i + 1) % n, 0), bbox.at<float>((i + 1) % n, 1)),
                 cv::Scalar(255, 0, 0), 1);
    }
    imshow("Result", im);
}

cv::Mat QR_expand(cv ::Mat inImg, int times)
{
    cv::Mat OutImg;
    int n = inImg.rows;
    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            for (int row = 0; row < times; row++)
            {
                for (int col = 0; col < times; col++)
                {
                    OutImg.at<uchar>(i * times + row, j * times+ col) = inImg.at<uchar>(i, j);
                }
            }
        }
    }
    return OutImg;
}

void CamCapture()
{
    cv::VideoCapture cap;
    cv::Mat frame;
    cap.open(0, cv::CAP_V4L2);

    if (cap.isOpened())
    {
        cout << "size=" << cap.get(cv::CAP_PROP_FRAME_WIDTH) << "*"
             << cap.get(cv::CAP_PROP_FRAME_HEIGHT) << endl;
        cv::namedWindow("Video");
    }
    else
    {
        return;
    }

    while (1)
    {
        cap >> frame;
        cvtColor(frame, frame, cv::COLOR_RGB2GRAY);
        cv::imshow("Video", frame);

        boost::this_thread::sleep(boost::posix_time::milliseconds(199));
        int key_value = cv::waitKey(1);
        if (key_value == 27)
        {
            break;
        }
        cv::QRCodeDetector qrDecoder;

        cv::Mat bbox, rectifiedImage;
        auto start = chrono::system_clock::now();
        std::string data = qrDecoder.detectAndDecode(frame, bbox, rectifiedImage);
        if (data.length() > 0)
        {
            cout << "Decoded Data : " << data << endl;

             display(frame, bbox);
            rectifiedImage.convertTo(rectifiedImage, CV_8UC1);
            cv::Mat result;
            cv::resize(rectifiedImage,result,cv::Size(256,256),0,0,cv::INTER_AREA);
            //cv::Mat result = QR_expand(rectifiedImage, 5);
            imshow("Rectified QRCode", result);
            //imshow("Rectified QRCode", rectifiedImage);
            auto end = chrono::system_clock::now();
            auto duration = chrono::duration_cast<chrono::microseconds>(end - start);
            cout << "duration =" << double(duration.count()) * chrono::microseconds::period::num / chrono::microseconds::period::den << endl;

        }
        else
        {
            cout << "QR Code not detected" << endl;
        }
    }

    cv::destroyAllWindows();
    cap.release();
}

int main(int argc, char *argv[])
{
    boost::thread t(CamCapture);
    t.join();
    return 0;
}

