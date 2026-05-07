# Report 1 page - Lab 4 DES / TripleDES

## Mục tiêu

Mục tiêu của bài lab là nghiên cứu và hiện thực hóa cấu trúc thuật toán mã hóa khối DES (Data Encryption Standard) và biến thể TripleDES (3DES). Thông qua việc lập trình, sinh viên hiểu rõ quy trình hoán vị, thay thế (S-box), hàm Feistel, cơ chế sinh khóa con (Key Schedule) và cách vận hành mã hóa trên các khối dữ liệu thực tế.
## Cách làm / Method

Từ khung mã nguồn cơ bản, tôi đã triển khai các thành phần sau:

Hệ thống bảng hoán vị: Thiết lập đầy đủ các bảng IP, FP, PC-1, PC-2, E và P chuẩn theo tài liệu NIST.

Thuật toán lõi (Core DES): Xây dựng hàm permute tổng quát, hàm Xor, và logic xử lý 16 vòng Feistel trong lớp DES.

TripleDES (EDE): Triển khai cấu trúc Encrypt-Decrypt-Encrypt cho Mode 3 và 4, sử dụng 3 bộ khóa khác nhau để tăng cường độ bảo mật.

Quản lý chế độ (Modes): Phân loại đầu vào qua biến mode (1: DES Enc, 2: DES Dec, 3: 3DES Enc, 4: 3DES Dec).

Xử lý dữ liệu: Bổ sung cơ chế Padding đơn giản (thêm bit 0) để xử lý các bản rõ có độ dài không chia hết cho 64 bit (Multi-block).

## Kết quả / Result

Chương trình đã vượt qua tất cả các bài kiểm tra tự động (make test):

Vector mẫu (NIST): Mã hóa bản rõ mẫu với khóa chuẩn cho ra Ciphertext chính xác: 01111110...11111000.

Tính đúng đắn (Round-trip): Thực hiện quy trình mã hóa sau đó giải mã ngược lại với cùng một khóa, kết quả thu được bản rõ ban đầu chính xác 100%.

Xử lý khối: Với bản rõ dài 80 bit, chương trình tự động thực hiện padding và xuất ra 128 bit ciphertext (2 block), đảm bảo tính toàn vẹn của dữ liệu.

Tính nhạy cảm: Các bài test âm tính (Negative tests) xác nhận rằng chỉ cần sai 1 bit khóa hoặc 1 bit bản mã, kết quả giải mã sẽ ra dữ liệu rác, chứng minh tính chất xáo trộn (diffusion) của thuật toán.

## Kết luận / Conclusion

Bài lab đã giúp tôi nắm vững cơ chế vận hành của mã hóa khối. Mặc dù DES không còn an toàn trước các cuộc tấn công brute-force hiện đại do độ dài khóa ngắn (56 bit), nhưng cấu trúc của nó là nền tảng quan trọng để hiểu các thuật toán hiện đại hơn như AES.

Hạn chế: Hiện tại chương trình mới chỉ hỗ trợ Padding bit 0 đơn giản, chưa triển khai các chuẩn Padding phức tạp như PKCS#7.

Mở rộng: Hướng phát triển tiếp theo có thể là tích hợp các chế độ vận hành khối (Block Cipher Modes) như CBC hoặc CTR để tăng cường bảo mật cho dữ liệu lớn.
