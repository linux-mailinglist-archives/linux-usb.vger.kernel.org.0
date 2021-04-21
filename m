Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E47E36719B
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 19:43:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244804AbhDURoA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 13:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243224AbhDURn5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 13:43:57 -0400
X-Greylist: delayed 349 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 21 Apr 2021 10:43:24 PDT
Received: from rin.romanrm.net (rin.romanrm.net [IPv6:2001:bc8:2dd2:1000::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78413C06174A
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 10:43:24 -0700 (PDT)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
        by rin.romanrm.net (Postfix) with SMTP id A26B64DC
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 17:37:32 +0000 (UTC)
Date:   Wed, 21 Apr 2021 22:37:32 +0500
From:   Roman Mamedov <rm@romanrm.net>
To:     linux-usb@vger.kernel.org
Subject: Not enough bandwidth for new device state -- with Etron USB3
 controller only
Message-ID: <20210421223732.27080321@natsu>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I have a mouse and keyboard plugged into a 4-port USB 2.0 hub, plugged into a
10-meter extender (which seems to also appear as an USB 2.0 hub).

When this combination is plugged into "Etron Technology, Inc. EJ168 USB 3.0 Host
Controller (rev 01)", it fails to work:

[Wed Apr 21 21:48:03 2021] usb 2-2: new high-speed USB device number 2 using xhci_hcd
[Wed Apr 21 21:48:03 2021] usb 2-2: New USB device found, idVendor=1a40, idProduct=0101, bcdDevice= 1.11
[Wed Apr 21 21:48:03 2021] usb 2-2: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[Wed Apr 21 21:48:03 2021] usb 2-2: Product: USB 2.0 Hub
[Wed Apr 21 21:48:03 2021] hub 2-2:1.0: USB hub found
[Wed Apr 21 21:48:03 2021] hub 2-2:1.0: 4 ports detected
[Wed Apr 21 21:48:04 2021] usb 2-2.4: new high-speed USB device number 3 using xhci_hcd
[Wed Apr 21 21:48:04 2021] usb 2-2.4: New USB device found, idVendor=05e3, idProduct=0606, bcdDevice= 7.02
[Wed Apr 21 21:48:04 2021] usb 2-2.4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[Wed Apr 21 21:48:04 2021] usb 2-2.4: Product: USB2.0 Hub
[Wed Apr 21 21:48:04 2021] hub 2-2.4:1.0: USB hub found
[Wed Apr 21 21:48:04 2021] hub 2-2.4:1.0: 4 ports detected
[Wed Apr 21 21:48:04 2021] usb 2-2.4.3: new low-speed USB device number 4 using xhci_hcd
[Wed Apr 21 21:48:04 2021] usb 2-2.4.3: New USB device found, idVendor=046e, idProduct=52c5, bcdDevice= 1.23
[Wed Apr 21 21:48:04 2021] usb 2-2.4.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[Wed Apr 21 21:48:04 2021] usb 2-2.4.3: Product: USB Multimedia Keyboard
[Wed Apr 21 21:48:04 2021] usb 2-2.4.3: Manufacturer: BTC
[Wed Apr 21 21:48:04 2021] usb 2-2.4.3: Not enough bandwidth for new device state.
[Wed Apr 21 21:48:04 2021] usb 2-2.4.3: can't set config #1, error -28
[Wed Apr 21 21:48:04 2021] usb 2-2.4.4: new low-speed USB device number 5 using xhci_hcd
[Wed Apr 21 21:48:04 2021] usb 2-2.4.4: New USB device found, idVendor=0957, idProduct=0006, bcdDevice= 3.10
[Wed Apr 21 21:48:04 2021] usb 2-2.4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[Wed Apr 21 21:48:04 2021] usb 2-2.4.4: Product: ADNS-3080 Mouse
[Wed Apr 21 21:48:04 2021] usb 2-2.4.4: Manufacturer: Agilent Mouse
[Wed Apr 21 21:48:04 2021] usb 2-2.4.4: Not enough bandwidth for new device state.
[Wed Apr 21 21:48:04 2021] usb 2-2.4.4: can't set config #1, error -28
[Wed Apr 21 21:48:11 2021] usb 2-2: USB disconnect, device number 2
[Wed Apr 21 21:48:11 2021] usb 2-2.4: USB disconnect, device number 3
[Wed Apr 21 21:48:11 2021] usb 2-2.4.3: USB disconnect, device number 4
[Wed Apr 21 21:48:11 2021] usb 2-2.4.4: USB disconnect, device number 5

But works just fine when plugged into the onboard "Advanced Micro Devices,
Inc. [AMD/ATI] SB7x0/SB8x0/SB9x0 USB EHCI Controller":

[Wed Apr 21 21:48:31 2021] usb 4-4: new high-speed USB device number 3 using ehci-pci
[Wed Apr 21 21:48:31 2021] usb 4-4: New USB device found, idVendor=1a40, idProduct=0101, bcdDevice= 1.11
[Wed Apr 21 21:48:31 2021] usb 4-4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[Wed Apr 21 21:48:31 2021] usb 4-4: Product: USB 2.0 Hub
[Wed Apr 21 21:48:31 2021] hub 4-4:1.0: USB hub found
[Wed Apr 21 21:48:31 2021] hub 4-4:1.0: 4 ports detected
[Wed Apr 21 21:48:32 2021] usb 4-4.4: new high-speed USB device number 4 using ehci-pci
[Wed Apr 21 21:48:32 2021] usb 4-4.4: New USB device found, idVendor=05e3, idProduct=0606, bcdDevice= 7.02
[Wed Apr 21 21:48:32 2021] usb 4-4.4: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[Wed Apr 21 21:48:32 2021] usb 4-4.4: Product: USB2.0 Hub
[Wed Apr 21 21:48:32 2021] hub 4-4.4:1.0: USB hub found
[Wed Apr 21 21:48:32 2021] hub 4-4.4:1.0: 4 ports detected
[Wed Apr 21 21:48:32 2021] usb 4-4.4.3: new low-speed USB device number 5 using ehci-pci
[Wed Apr 21 21:48:32 2021] usb 4-4.4.3: New USB device found, idVendor=046e, idProduct=52c5, bcdDevice= 1.23
[Wed Apr 21 21:48:32 2021] usb 4-4.4.3: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[Wed Apr 21 21:48:32 2021] usb 4-4.4.3: Product: USB Multimedia Keyboard
[Wed Apr 21 21:48:32 2021] usb 4-4.4.3: Manufacturer: BTC
[Wed Apr 21 21:48:33 2021] input: BTC USB Multimedia Keyboard as /devices/pci0000:00/0000:00:13.2/usb4/4-4/4-4.4/4-4.4.3/4-4.4.3:1.0/0003:046E:52C5.0006/input/input33
[Wed Apr 21 21:48:33 2021] hid-generic 0003:046E:52C5.0006: input,hidraw2: USB HID v1.10 Keyboard [BTC USB Multimedia Keyboard] on usb-0000:00:13.2-4.4.3/input0
[Wed Apr 21 21:48:33 2021] input: BTC USB Multimedia Keyboard System Control as /devices/pci0000:00/0000:00:13.2/usb4/4-4/4-4.4/4-4.4.3/4-4.4.3:1.1/0003:046E:52C5.0007/input/input34
[Wed Apr 21 21:48:33 2021] input: BTC USB Multimedia Keyboard Consumer Control as /devices/pci0000:00/0000:00:13.2/usb4/4-4/4-4.4/4-4.4.3/4-4.4.3:1.1/0003:046E:52C5.0007/input/input35
[Wed Apr 21 21:48:33 2021] hid-generic 0003:046E:52C5.0007: input,hiddev0,hidraw3: USB HID v1.10 Device [BTC USB Multimedia Keyboard] on usb-0000:00:13.2-4.4.3/input1
[Wed Apr 21 21:48:33 2021] usb 4-4.4.4: new low-speed USB device number 6 using ehci-pci
[Wed Apr 21 21:48:33 2021] usb 4-4.4.4: New USB device found, idVendor=0957, idProduct=0006, bcdDevice= 3.10
[Wed Apr 21 21:48:33 2021] usb 4-4.4.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[Wed Apr 21 21:48:33 2021] usb 4-4.4.4: Product: ADNS-3080 Mouse
[Wed Apr 21 21:48:33 2021] usb 4-4.4.4: Manufacturer: Agilent Mouse
[Wed Apr 21 21:48:33 2021] input: Agilent Mouse ADNS-3080 Mouse as /devices/pci0000:00/0000:00:13.2/usb4/4-4/4-4.4/4-4.4.4/4-4.4.4:1.0/0003:0957:0006.0008/input/input37
[Wed Apr 21 21:48:33 2021] hid-generic 0003:0957:0006.0008: input,hidraw4: USB HID v1.10 Mouse [Agilent Mouse ADNS-3080 Mouse] on usb-0000:00:13.2-4.4.4/input0

Any ideas? Is this a bug?

Thanks

-- 
With respect,
Roman
