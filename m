Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B57C3223E0
	for <lists+linux-usb@lfdr.de>; Tue, 23 Feb 2021 02:53:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhBWBwT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 20:52:19 -0500
Received: from www262.sakura.ne.jp ([202.181.97.72]:55798 "EHLO
        www262.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhBWBwS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Feb 2021 20:52:18 -0500
Received: from fsav109.sakura.ne.jp (fsav109.sakura.ne.jp [27.133.134.236])
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 11N1pNPA046299;
        Tue, 23 Feb 2021 10:51:23 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav109.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp);
 Tue, 23 Feb 2021 10:51:23 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav109.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
        (authenticated bits=0)
        by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 11N1pM70046295
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
        Tue, 23 Feb 2021 10:51:23 +0900 (JST)
        (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH v2] usb: usbip: serialize attach/detach operations
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-usb@vger.kernel.org
References: <20210219094744.3577-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20210219150832.4701-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <YC/fF0c7PA3ndTPv@kroah.com>
 <68fe3981-27d2-1f8d-17c6-9cb773382e66@linuxfoundation.org>
 <f8110365-767d-6aa4-ff9e-3ab8380c0919@i-love.sakura.ne.jp>
 <YDCzLfhawx4u28dd@kroah.com>
 <e1fe719d-35df-3898-33dd-f8bfc6d10b5d@i-love.sakura.ne.jp>
 <50126879-0095-b556-308f-36d5c75c2db0@linuxfoundation.org>
From:   Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <1234dff1-fdaf-ef1e-b07e-192628ca5a41@i-love.sakura.ne.jp>
Date:   Tue, 23 Feb 2021 10:51:21 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <50126879-0095-b556-308f-36d5c75c2db0@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021/02/23 0:34, Shuah Khan wrote:
> usbip tools are part of the kernel source. Please look under:
> 
> tools/usb/usbip

Oh, I didn't know it. OK, I can rebuild that one without any modification.
Please explain it from usbip_test.sh .

> Please use the right tool version from the kernel sources. I usually
> run with server and client running on the same system, client going
> over the loopback interface. Server exports any input devices mouse
> or keyboard.

OK. I ran the test, and I did not find any difference between with and without my patch.

But I found there is a difference between the first run and the second run.
My patch is irrelevant to this difference.

~/linux/tools/testing/selftests/drivers/usb/usbip/usbip_test.sh -b 3-1 -p ~/linux/tools/usb/usbip/

@@ -45,15 +45,22 @@
 /:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=dummy_hcd/1p, 480M
 /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
 /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
-    |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 12M
+    |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=, 12M
 /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
 /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/6p, 480M
 ==============================================================
 Get exported devices from localhost - expect to see none
-usbip: info: no exportable devices found on localhost
+Exportable USB devices
+======================
+ - localhost
+        3-1: VMware, Inc. : Virtual Mouse (0e0f:0003)
+           : /sys/devices/pci0000:00/0000:00:15.0/0000:03:00.0/usb3/3-1
+           : (Defined at Interface level) (00/00/00)
+           :  0 - Human Interface Device / Boot Interface Subclass / Mouse (03/01/02)
+
 ==============================================================
 bind devices
-usbip: info: bind device on busid 3-1: complete
+usbip: error: device on busid 3-1 is already bound to usbip-host
 ==============================================================
 Run lsusb - bound devices should be under usbip_host control
 /:  Bus 37.Port 1: Dev 1, Class=root_hub, Driver=vhci_hcd/8p, 5000M
@@ -91,6 +98,7 @@
 /:  Bus 05.Port 1: Dev 1, Class=root_hub, Driver=dummy_hcd/1p, 480M
 /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
 /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
+    |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=, 12M
 /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=uhci_hcd/2p, 12M
 /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/6p, 480M
 ==============================================================
@@ -104,6 +112,7 @@
         3-1: VMware, Inc. : Virtual Mouse (0e0f:0003)
            : /sys/devices/pci0000:00/0000:00:15.0/0000:03:00.0/usb3/3-1
            : (Defined at Interface level) (00/00/00)
+           :  0 - Human Interface Device / Boot Interface Subclass / Mouse (03/01/02)

 ==============================================================
 unbind devices

