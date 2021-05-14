Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28B6938026B
	for <lists+linux-usb@lfdr.de>; Fri, 14 May 2021 05:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231390AbhENDVa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 23:21:30 -0400
Received: from smtp3.avnet.com ([12.9.139.123]:3364 "EHLO smtp3.avnet.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229984AbhENDV2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 13 May 2021 23:21:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Avnet.com;
        s=20201119; t=1620962415;
        bh=xSNu0r0c9ib4ckmqQSWoMv32o4b6E+3eCjr9N9hcauc=;
        h=From:To:Subject:Date;
        b=SRG76xn42V3nPCxBSnA+xWDCUZYiopZ1GKziljC+hWhFU467MW1K9adM2UPBLOcao
         7ry/b/UuUEStHYFWQ+PbIg/wFEUkQk8aqT8xsMkgxwAH6+qQrXUtaLaHWA8dK34auT
         eCk/FCUhCUa/qhZr//m3MY5sqAgXKBHjusVV/BwosITvohbU73yRxb5MYUKO/TxLmA
         y7cnbI03zWbJ+YUyr2/iKvIvXU4emSVuov9gCH1J+lIpQLGnFIk1i/PeDWoxOiZQAz
         dPdd25U5uIu4ya5FGZoZ0LpSe9dzi4pLigNZD0d6ClBM+Qz0v2NfcM1ZjXAP1lHY+W
         CKx1eReIsX0Ug==
Received: from CMX2401EX1604.AVNET.COM (Not Verified[172.16.125.26]) by smtp3.avnet.com with Trustwave SEG (v8,2,6,11305) (using TLS: TLSv1.2, AES256-GCM-SHA384)
        id <B609dec6f0001>; Thu, 13 May 2021 20:20:15 -0700
Received: from CMX2401EX1604.AVNET.COM (172.16.125.26) by
 CMX2401EX1604.AVNET.COM (172.16.125.26) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 13 May 2021 20:20:15 -0700
Received: from CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83]) by
 CMX2401EX1604.AVNET.COM ([fe80::3838:ad6:3b52:4f83%2]) with mapi id
 15.01.2242.008; Thu, 13 May 2021 20:20:15 -0700
From:   "Chow, Watson" <Watson.Chow@Avnet.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer bandwidth
 on UVC gadget driver
Thread-Topic: [BUG REPORT] usb: dwc3: Bug while setting the USB transfer
 bandwidth on UVC gadget driver
Thread-Index: AddIcAtgBDXAgCQbQXSu/5dHZ1drkQ==
Date:   Fri, 14 May 2021 03:20:14 +0000
Message-ID: <6bc8ab9c4e3f4bafae13a7574b1ae0e3@Avnet.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.125.136]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-SEG-SpamProfiler-Analysis: v=2.3 cv=QMUWuTDL c=1 sm=1 tr=0 a=lcmS3RsgbsgHW2lJplWpEQ==:117 a=xqWC_Br6kY4A:10 a=6yu5SQbkyS8A:10 a=8nJEP1OIZ-IA:10 a=5FLXtPjwQuUA:10 a=yMhMjlubAAAA:8 a=EG6sGpfcAAAA:20 a=54o8oKSQAAAA:8 a=8hghKbX9AAAA:20 a=hoQjWNIC-BGPQJjTSukA:9 a=wPNLvfGTeEIA:10
X-SEG-SpamProfiler-Score: 0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I'm using the SoC (Xilinx MPSoC) with DWC3 USB controller. I need to emulat=
e my hardware to work like a USB camera and so make use of the USB UVC gadg=
et driver - g_webcam.

[My problem]

Refer to this link and the driver source code, I find 3 parameters to confi=
gure the ISOC transfer bandwidth.
https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/transfer-d=
ata-to-isochronous-endpoints#isochronous-transfer-example

They are:

streaming_maxpacket : range [1 - 3072]=20
streaming_maxburst : range [0 - 15]
streaming_interval : [1 - 16]

So, I load the driver in this way
# modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D9 strea=
ming_interval=3D2

Create my own app base on
https://github.com/wlhe/uvc-gadget

Test result
In my evaluation, I can set the combination of parameters up to this. The s=
treaming is ok.
# modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D9 strea=
ming_interval=3D2

This should be around 900Mbit/sec. Far less than 5Gbps bandwidth of USB3.0


When I increase the parameter combination to:
# modprobe g_webcam streaming_maxpacket=3D3072 streaming_maxburst=3D10 stre=
aming_interval=3D2

I get the below error message and everything stop.

[ 1089.751559] g_webcam gadget: uvc: VS request completed with status -18.

1.	This error is somehow related to the underflow of the transfer queue. Is=
 my understanding correct?=20
If so, how to solve?
2.	My goal is to utilize the full bandwidth of USB3.0. How can I achive?


[Some background information and my test setup]

I started from the Xilinx TRD here.
https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/541786361/Zynq+UltraS=
cale+MPSoC+VCU+TRD+2020.1+-+Xilinx+Low+Latency+PS+DDR+NV12+HDMI+Audio+Video=
+Capture+and+Display

With kernel version v5.4:
https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v5.4_2020.2


Enabled the UVC gadget and made my own test code to evaluate the transfer t=
hroughput on the USB3.0 port.

Test platform:
.	Xilinx ZCU106 evaluation board connected to PC through USB3.0 cable
.	Xilinx ZCU106 evaluation board would emulate a webcam through USB UVC gad=
get

My test app:
.	Capture 3840x2160@60 video and scale to 1920x1080@60
.	Queue the frames to UVC gadget driver
Host PC side:
.	X86 PC with Ubuntu 18.04LTS OS
.	Use ffplay to capture and display frame from ZCU106
# ffplay /dev/video2 -video_size 1920x1080 -framerate 30



Best regards,

Watson Chow
Design Manager
Avnet Technology Hong Kong Limited
=A0


