Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 670BF2ACB84
	for <lists+linux-usb@lfdr.de>; Tue, 10 Nov 2020 04:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729336AbgKJDLt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Nov 2020 22:11:49 -0500
Received: from nl101-3.vfemail.net ([149.210.219.33]:36325 "EHLO
        nl101-3.vfemail.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728607AbgKJDLs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Nov 2020 22:11:48 -0500
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Mon, 09 Nov 2020 22:11:48 EST
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=vfemail.net; h=date:from
        :to:cc:subject:message-id:mime-version:content-type
        :content-transfer-encoding; s=2018; bh=iaqyz8WDU2SGr8rxdy5LcZHKE
        7YhvzKuXoTGn8TTe3M=; b=Hwy18rQ7lfvBTJ/fwmvkkldoxxPcVq1ZxEkIsN0qL
        +XZ4KO/jMghUZGe1O/dGvcpUYFrR66EYqQXMi967sPQNSGLh6aELqSDy/VnwLisP
        OuTImfYfeO1Yf7L7t4J55px/2KUWDdyr+oRpM3ngA9EGJCLrQV/YPr4IjHVEWb6o
        J8=
Received: (qmail 68737 invoked from network); 10 Nov 2020 03:05:06 -0000
Received: by simscan 1.4.0 ppid: 68677, pid: 68730, t: 0.2183s
         scanners:none
Received: from unknown (HELO d3d3MTkyLnZmZW1haWwubmV0) (aGdudGt3aXNAdmZlbWFpbC5uZXQ=@MTkyLjE2OC4xLjE5Mg==)
  by nl101.vfemail.net with ESMTPA; 10 Nov 2020 03:05:06 -0000
Date:   Mon, 9 Nov 2020 22:00:00 -0500
From:   David Niklas <Hgntkwis@vfemail.net>
To:     <linux-usb@vger.kernel.org>
Cc:     <linux-kernel-owner@vger.kernel.org>
Subject: I need advice with UPS connection.
Message-ID: <20201109220000.2ae98fa5@Phenom-II-x6.niklas.com>
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,
I'm running Linux Kernel 5.8.X on a Devuan (Debian) system. I connected
my UPS (OPTI-UPS Thunder Shield TS2250B) via USB cable and got:

[739229.454592][T25544] usb 9-4: new low-speed USB device number 2 using ohci-pci
[739229.635343][T25544] usb 9-4: config index 0 descriptor too short (expected 9, got 0)
[739229.635348][T25544] usb 9-4: can't read configurations, error -22
[739229.791290][T25544] usb 9-4: new low-speed USB device number 3 using ohci-pci
[739229.982414][T25544] usb 9-4: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
[739229.982421][T25544] usb 9-4: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[739229.982426][T25544] usb 9-4: Product: HID UPS Battery
[739229.982430][T25544] usb 9-4: Manufacturer: POWERCOM Co.,LTD
[739229.982433][T25544] usb 9-4: SerialNumber: 004-0D9F-000
[739230.027616][T25544] hid-generic 0003:0D9F:0004.0004: hiddev1,hidraw2: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:00:16.0-4/input0
[739233.484723][T25544] usb 9-4: USB disconnect, device number 3
[739236.257951][T25544] usb 9-4: new low-speed USB device number 4 using ohci-pci
[739236.475434][T25544] usb 9-4: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
[739236.475442][T25544] usb 9-4: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[739236.520783][T25544] hid-generic 0003:0D9F:0004.0005: hiddev1,hidraw2: USB HID v1.00 Device [HID 0d9f:0004] on usb-0000:00:16.0-4/input0
[739239.933809][T25544] usb 9-4: USB disconnect, device number 4
[739242.701322][T25544] usb 9-4: new low-speed USB device number 5 using ohci-pci
[739242.880035][T25544] usb 9-4: device descriptor read/all, error -62
[739243.034561][T25544] usb 9-4: new low-speed USB device number 6 using ohci-pci
[739243.252040][T25544] usb 9-4: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
[739243.252042][T25544] usb 9-4: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[739243.296444][T25544] hid-generic 0003:0D9F:0004.0006: hiddev1,hidraw2: USB HID v1.00 Device [HID 0d9f:0004] on usb-0000:00:16.0-4/input0
[739246.720152][T25544] usb 9-4: USB disconnect, device number 6
[739249.491330][T13473] usb 9-4: new low-speed USB device number 7 using ohci-pci
[739249.718707][T13473] usb 9-4: New USB device found, idVendor=0d9f, idProduct=0004, bcdDevice= 0.02
[739249.718709][T13473] usb 9-4: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[739249.718710][T13473] usb 9-4: Product: HID UPS Battery
[739249.718711][T13473] usb 9-4: Manufacturer: POWERCOM Co.,LTD
[739249.718712][T13473] usb 9-4: SerialNumber: 004-0D9F-000
[739249.751173][T13473] hid-generic 0003:0D9F:0004.0007: unknown main item tag 0x0
<snip class="spam-repeated-previous-message">
[739250.162392][T13473] hid-generic 0003:0D9F:0004.0007: unknown main item tag 0x0
[739250.162813][T13473] hid-generic 0003:0D9F:0004.0007: hidraw2: USB HID v1.00 Device [POWERCOM Co.,LTD HID UPS Battery] on usb-0000:00:16.0-4/input0
[739253.165518][T13473] usb 9-4: USB disconnect, device number 7
...


I'd appreciate any advice trying to get my UPS to stay connected and not
spam the kernel log. The UPS is about 1 year old. It's working fine. I
just want to use nut or apcupsd with it.

Thanks,
David
