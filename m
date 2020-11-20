Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F9B82BAB7A
	for <lists+linux-usb@lfdr.de>; Fri, 20 Nov 2020 14:44:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728239AbgKTNnp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Nov 2020 08:43:45 -0500
Received: from smtp4-g21.free.fr ([212.27.42.4]:17500 "EHLO smtp4-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727379AbgKTNnp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Nov 2020 08:43:45 -0500
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:5b0:6190:59c4:df84:50f2:d889])
        (Authenticated sender: manchette)
        by smtp4-g21.free.fr (Postfix) with ESMTPSA id 9B1A719F58A
        for <linux-usb@vger.kernel.org>; Fri, 20 Nov 2020 14:43:41 +0100 (CET)
To:     linux-usb@vger.kernel.org
From:   manchette <manchette@free.fr>
Subject: Webcam not working , HD Web Camera (18d1:0002)
Message-ID: <6affe2b1-1f99-14c6-7cde-f73ca18576b0@free.fr>
Date:   Fri, 20 Nov 2020 14:43:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

A webcam is not working here :
here is what i know of it :

System:    Host: linux-815u Kernel: 5.3.18-lp152.47-default x86_64 bits: 
64 Desktop: KDE Plasma 5.18.5
            Distro: openSUSE Leap 15.2

[19563.481204] usb 1-7: Product: HD Web Camera
[19563.481207] usb 1-7: Manufacturer: Ingenic Semiconductor CO., LTD.
[19563.481210] usb 1-7: SerialNumber: Ucamera001
[19563.488049] uvcvideo: Found UVC 1.00 device HD Web Camera (18d1:0002)



How can i know which kernel is needed or driver ?

Thank you in advance


[19564.008124] uvcvideo: Failed to query (GET_INFO) UVC control 2 on 
unit 1: -110 (exp. 1).
[19564.384883] uvcvideo: Failed to query (GET_INFO) UVC control 7 on 
unit 2: -32 (exp. 1).
[19564.504294] uvcvideo: Failed to query (GET_INFO) UVC control 8 on 
unit 2: -71 (exp. 1).
[19564.504410] uvcvideo: Failed to query (GET_INFO) UVC control 9 on 
unit 2: -71 (exp. 1).
[19564.504454] uvcvideo: Failed to query (GET_INFO) UVC control 10 on 
unit 2: -71 (exp. 1).
[19564.504575] uvcvideo: Failed to query (GET_INFO) UVC control 1 on 
unit 2: -71 (exp. 1).
[19564.504619] uvcvideo: Failed to query (GET_INFO) UVC control 4 on 
unit 2: -71 (exp. 1).
[19564.504691] uvcvideo: Failed to query (GET_INFO) UVC control 5 on 
unit 2: -71 (exp. 1).
[19564.504768] uvcvideo: Failed to query (GET_INFO) UVC control 11 on 
unit 2: -71 (exp. 1).
[19564.504927] uvcvideo: UVC non compliance - GET_DEF(PROBE) not 
supported. Enabling workaround.
[19564.505008] uvcvideo: Failed to query (129) UVC probe control : -71 
(exp. 26).
[19564.505011] uvcvideo: Failed to initialize the device (-5).
[19564.506319] usb 1-7: 3:1: cannot set freq 16000 to ep 0x83
[19564.507162] usb 1-7: 6:2: cannot get min/max values for control 2 (id 6)
[19564.507830] usb 1-7: USB disconnect, device number 11
[19564.816059] usb 1-7: new high-speed USB device number 12 using xhci_hcd
[19564.965025] usb 1-7: New USB device found, idVendor=18d1, 
idProduct=0002, bcdDevice= 1.00
[19564.965031] usb 1-7: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[19564.965034] usb 1-7: Product: HD Web Camera
[19564.965037] usb 1-7: Manufacturer: Ingenic Semiconductor CO., LTD.
[19564.965040] usb 1-7: SerialNumber: Ucamera001
[19564.972089] uvcvideo: Found UVC 1.00 device HD Web Camera (18d1:0002)
[19564.992728] uvcvideo: Failed to query (GET_INFO) UVC control 6 on 
unit 2: -32 (exp. 1).
[19565.013777] uvcvideo: Failed to query (GET_INFO) UVC control 9 on 
unit 2: -32 (exp. 1).
[19565.034851] uvcvideo: Failed to query (GET_INFO) UVC control 4 on 
unit 2: -32 (exp. 1).
[19565.050689] uvcvideo: Failed to query (GET_INFO) UVC control 11 on 
unit 2: -32 (exp. 1).
[19565.077788] input: HD Web Camera: HD Web Camera as 
/devices/pci0000:00/0000:00:14.0/usb1/1-7/1-7:1.0/input/input23
[19565.080928] usb 1-7: Warning! Unlikely big volume range (=3072), 
cval->res is probably wrong.
[19565.080934] usb 1-7: [6] FU [Mic Capture Volume] ch = 1, val = 
-1536/1536/1
[19565.678936] uvcvideo: Failed to query (GET_DEF) UVC control 6 on unit 
2: -32 (exp. 2).
[19569.544151] uvcvideo: Failed to query (GET_DEF) UVC control 6 on unit 
2: -32 (exp. 2).
[19630.608999] st: Version 20160209, fixed bufsize 32768, s/g segs 256
[19651.239080] parport0: PC-style at 0x378 (0x778) [PCSPP,TRISTATE,EPP]
[19651.239732] parport0: irq 7 detected
[19651.358797] lp0: using parport0 (polling).
[19651.483508] parport0: PC-style at 0x378 (0x778) [PCSPP,TRISTATE,EPP]
[19651.484214] parport0: irq 7 detected
[19651.602002] lp0: using parport0 (polling).
[19652.349661] parport0: PC-style at 0x378 (0x778) [PCSPP,TRISTATE,EPP]
[19652.350323] parport0: irq 7 detected
[19652.462407] lp0: using parport0 (polling).
[19652.589183] ppa: Version 2.07 (for Linux 2.4.x)

18d1:0002

-- 
Fabrice
