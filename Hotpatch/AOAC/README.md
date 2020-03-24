

## Vá AOAC

### Với phần cứng, bạn hãy nâng cấp lên 1 chiếc SSD xịn cũng như firmware SSD thường xuyên nếu có hoặc là 1 mainboard có support ASPM

### Với phần mềm
- Cấm S3  ngủ bằng SSDT-Disable_S3
- Tăng khả năng SSD vào trạng thái nghỉ bằng SSDT-Deepldle và NVMeFix.kext để bật APST cho SSD
- SSDT-AOAC  Bản vá chung màn hình sáng
- Vá phím tắt để đánh thức máy:
    + SSDT-FnQ-AOACWake: bản vá chung cho đa số máy, chỉ việc thay đổi phím _LID(_Qxx) phù hợp
    + SSDT-Dell-AOACWake: bản vá chỉ dành cho laptop Dell (Fn + Insert)
