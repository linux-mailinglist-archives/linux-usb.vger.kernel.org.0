Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C209119D551
	for <lists+linux-usb@lfdr.de>; Fri,  3 Apr 2020 12:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403768AbgDCKw5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Apr 2020 06:52:57 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:49219 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727854AbgDCKw4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 3 Apr 2020 06:52:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=karl-arne.no; s=ds201912; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=zO7TWWSWETZVhbR9nZUfzr5yHtbTdLFs18kNQppvS74=; b=HqHXMjdoiIQOECU3RSm7LQK6qh
        A+X1wpCQR8DqM2BdSaM8kLFJNr2MXPnoM1bwdg5OukcrG7l5k8ux5+mOXvOYgHJrdFcys5hP+G4Sk
        Uk19nID9FqeqbCGHPicYKloiN7muE42APi7uJ/id2qo4yIAFq2iMAYeAi8DPjDXcFYIh/7qDh7PWx
        OAddn0B26+BAJV1wi8mSSArWaS+zuRqSgt4Dtfn8PxlGrfo5QBtwRhGqHQbrtw/WDJHToeljDXtJ5
        ETb6hL1MVgNi+wc7U4k5bo0xb1ID2Web4a06Kl/eiF52QEa7ve9PHWQ20Mi5znG3plqMLz9IpGU0M
        UpXlNSiw==;
Received: from [2a05:9cc4:7d:5592:a944:2af9:8958:43ad] (port=33050)
        by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <linux@karl-arne.no>)
        id 1jKJwT-0005mx-St
        for linux-usb@vger.kernel.org; Fri, 03 Apr 2020 12:52:53 +0200
To:     linux-usb@vger.kernel.org
From:   "Linux@karl-arne.no" <linux@karl-arne.no>
Subject: Panasonic NV GS27E on Linux Mint
Message-ID: <07a9e05d-4a19-0f05-ae6e-48a5e28409c5@karl-arne.no>
Date:   Fri, 3 Apr 2020 12:52:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello.

I am new to this list. I have a question.

After some investigation can I now see my camera registred in the 
kernel. I can still not see the usb device listed and have no access to 
the camera. Here is a lot of information that Ihope can be in your 
interests if you can help me out...

$ dmesg

[131379.369857] usb 2-3: new full-speed USB device number 54 using xhci_hcd
[131379.520713] usb 2-3: New USB device found, idVendor=04da, 
idProduct=231d, bcdDevice= 1.00
[131379.520717] usb 2-3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[131379.520719] usb 2-3: Product: DVC
[131379.520722] usb 2-3: Manufacturer: Panasonic
[131379.520724] usb 2-3: SerialNumber: 0000b16313d5
[131379.527065] uvcvideo: Found UVC 1.00 device DVC (04da:231d)
[131379.528890] uvcvideo 2-3:1.0: Entity type for entity SU was not 
initialized!
[131379.528896] uvcvideo 2-3:1.0: Entity type for entity Camera was not 
initialized!
[131379.528900] uvcvideo 2-3:1.0: Entity type for entity MTIT was not 
initialized!
[131379.529170] input: DVC: Web-Camera as 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/input/input42


:~$ sudo udevadm monitor
monitor will print the received events for:
UDEV - the event which udev sends out after rule processing
KERNEL - the kernel uevent

KERNEL[137510.512307] add /devices/pci0000:00/0000:00:14.0/usb2/2-3 (usb)
KERNEL[137510.515438] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0 (usb)
KERNEL[137510.518719] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/video4linux/video2 
(video4linux)
KERNEL[137510.518954] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/video4linux/video3 
(video4linux)
KERNEL[137510.519151] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/media1 (media)
KERNEL[137510.519352] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/input/input45 (input)
KERNEL[137510.519490] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/input/input45/event17 
(input)
KERNEL[137510.519593] bind 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0 (usb)
KERNEL[137510.520607] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.1 (usb)
KERNEL[137510.520756] bind 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.1 (usb)
KERNEL[137510.520854] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2 (usb)
KERNEL[137510.522548] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2/sound/card2 (sound)
KERNEL[137510.523760] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2/sound/card2/pcmC2D0c 
(sound)
KERNEL[137510.523812] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2/sound/card2/controlC2 
(sound)
KERNEL[137510.523865] bind 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2 (usb)
KERNEL[137510.523910] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.3 (usb)
KERNEL[137510.523957] bind 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.3 (usb)
KERNEL[137510.524007] bind /devices/pci0000:00/0000:00:14.0/usb2/2-3 (usb)
UDEV  [137510.557083] add /devices/pci0000:00/0000:00:14.0/usb2/2-3 (usb)
UDEV  [137510.560369] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0 (usb)
UDEV  [137510.561955] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2 (usb)
UDEV  [137510.564563] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.1 (usb)
UDEV  [137510.567597] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2/sound/card2 (sound)
UDEV  [137510.569183] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.3 (usb)
UDEV  [137510.569242] bind 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.1 (usb)
UDEV  [137510.573796] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/media1 (media)
UDEV  [137510.575225] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/video4linux/video2 
(video4linux)
UDEV  [137510.575747] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/video4linux/video3 
(video4linux)
UDEV  [137510.579563] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2/sound/card2/pcmC2D0c 
(sound)
UDEV  [137510.581118] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/input/input45 (input)
KERNEL[137510.581594] change 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2/sound/card2 (sound)
UDEV  [137510.581964] bind 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.3 (usb)
UDEV  [137510.594775] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2/sound/card2/controlC2 
(sound)
UDEV  [137510.599292] bind 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2 (usb)
UDEV  [137510.634954] add 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/input/input45/event17 
(input)
UDEV  [137510.638198] bind 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0 (usb)
UDEV  [137510.640240] bind /devices/pci0000:00/0000:00:14.0/usb2/2-3 (usb)
UDEV  [137510.642502] change 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.2/sound/card2 (sound)




~$ sudo udevadm info --path=/devices/pci0000:00/0000:00:14.0/usb2/2-3
P: /devices/pci0000:00/0000:00:14.0/usb2/2-3
N: bus/usb/002/055
E: BUSNUM=002
E: DEVNAME=/dev/bus/usb/002/055
E: DEVNUM=055
E: DEVPATH=/devices/pci0000:00/0000:00:14.0/usb2/2-3
E: DEVTYPE=usb_device
E: DRIVER=usb
E: ID_BUS=usb
E: ID_MODEL=DVC
E: ID_MODEL_ENC=DVC
E: ID_MODEL_FROM_DATABASE=DVC Web Camera Device
E: ID_MODEL_ID=231d
E: ID_REVISION=0100
E: ID_SERIAL=Panasonic_DVC_0000b16313d5
E: ID_SERIAL_SHORT=0000b16313d5
E: ID_USB_INTERFACES=:0e0100:0e0200:010100:010200:
E: ID_VENDOR=Panasonic
E: ID_VENDOR_ENC=Panasonic
E: ID_VENDOR_FROM_DATABASE=Panasonic (Matsushita)
E: ID_VENDOR_ID=04da
E: MAJOR=189
E: MINOR=182
E: PRODUCT=4da/231d/100
E: SUBSYSTEM=usb
E: TYPE=239/2/1
E: USEC_INITIALIZED=132815614640


dmesg | tail
[138098.871354] usb 2-3: New USB device found, idVendor=04da, 
idProduct=231d, bcdDevice= 1.00
[138098.871360] usb 2-3: New USB device strings: Mfr=1, Product=2, 
SerialNumber=3
[138098.871364] usb 2-3: Product: DVC
[138098.871367] usb 2-3: Manufacturer: Panasonic
[138098.871370] usb 2-3: SerialNumber: 0000b16313d5
[138098.877601] uvcvideo: Found UVC 1.00 device DVC (04da:231d)
[138098.880262] uvcvideo 2-3:1.0: Entity type for entity SU was not 
initialized!
[138098.880268] uvcvideo 2-3:1.0: Entity type for entity Camera was not 
initialized!
[138098.880272] uvcvideo 2-3:1.0: Entity type for entity MTIT was not 
initialized!
[138098.880431] input: DVC: Web-Camera as 
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3:1.0/input/input47


in /etc/udev/rules.d I have created this file:

-usb.rules with those two lines.

SUBSYSTEM=="usb", ACTION=="add", DRIVER=="usb", 
ENV{DEVTYPE}=="usb_device" RUN+="/home/karl/koble_til_usb.sh"
SUBSYSTEM=="usb", ACTION=="remove", DRIVER=="usb" 
ENV{DEVTYPE}=="usb_device" RUN+="/home/karl/koble_fra_usb.sh"

I have never tried this before so therefore all this information. I love 
this stuff but now I need help!

Thanks for your advice.

Karl

