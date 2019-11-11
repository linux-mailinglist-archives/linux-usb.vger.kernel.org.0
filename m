Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72FE7F7981
	for <lists+linux-usb@lfdr.de>; Mon, 11 Nov 2019 18:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbfKKRJJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Nov 2019 12:09:09 -0500
Received: from tr-host.de ([138.201.124.202]:55504 "EHLO kolab.tr-host.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbfKKRJJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 11 Nov 2019 12:09:09 -0500
X-Greylist: delayed 481 seconds by postgrey-1.27 at vger.kernel.org; Mon, 11 Nov 2019 12:09:08 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tr-host.de; s=dkim;
        t=1573491666;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=6uciDxJ7Zwh7ytZ1p2UtI1a07rDUGGTmb26HMosgxvg=;
        b=L0IqW5hXAtaxmWZrqp1TTM/wlitDJAXJ6s7xa6Yk8dXIFg6qIov/y4TI0gnlzG2t12DwuC
        c+2pWM8PQnThYwoEKDa5xCWoBNChJb+Wpr3nipJ38sAl4k08a/WEBWvf7rggpXAgMrc7Ff
        K1YF+ET9lJ8H0Z2wH3AylPFeX4dH66A=
Received: from kolab.tr-host.de (localhost [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: haensch@tr-host.de)
        by kolab.tr-host.de (Postfix) with ESMTPSA id 534623AFD338
        for <linux-usb@vger.kernel.org>; Mon, 11 Nov 2019 18:01:06 +0100 (CET)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 11 Nov 2019 18:01:06 +0100
From:   Alexander Haensch <ah.outfittery@tr-host.de>
To:     linux-usb@vger.kernel.org
Subject: USB3.0 PCI-E Card with NEC chip crashes host on systemd-suspend
User-Agent: Kolab 16/Roundcube 1.4-git
Message-ID: <f76fef8389e10154cc49759f0f5753d4@tr-host.de>
X-Sender: ah.outfittery@tr-host.de
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have an evolving problem with a PCI-E Card. Since some time i cannot 
wake the system anymore if i suspend-to-ram with systemd-suspend.
The wakeup works 1 time only. After a second suspend. The system somehow 
wakes up with fan turning on, but does not show any reaction to input. 
Display stays off. I have to hard reset the system to get it back.
For me the problem started with 4.20 series but it was working partly 
until recently by disconnection the peripherals from the USB card.
Since 5.2 (i think) it is too broken so my temporary fix is to remove 
the card.

Unfortunately i have no idea to debug this, as i am not getting any 
messages after the second suspend.

Here is a dmesg of the xhci module since boot until first suspend. After 
first suspend, the device is not logging anything:
-- snip --
Nov 10 16:31:14 alex kernel: xhci_hcd 0000:06:00.0: xHCI Host Controller
Nov 10 16:31:14 alex kernel: xhci_hcd 0000:06:00.0: new USB bus 
registered, assigned bus number 8
Nov 10 16:31:14 alex kernel: xhci_hcd 0000:06:00.0: hcc params 
0x014042cb hci version 0x96 quirks 0x0000000000000004
Nov 10 16:31:14 alex kernel: input: Logitech Logitech Illuminated 
Keyboard Consumer Control as 
/devices/pci0000:00/0000:00:13.0/usb5/5-1/5-1:1.1/0003:046D:C318.0003/input/input7
Nov 10 16:31:14 alex kernel: usb usb8: New USB device found, 
idVendor=1d6b, idProduct=0002, bcdDevice= 5.03
Nov 10 16:31:14 alex kernel: usb usb8: New USB device strings: Mfr=3, 
Product=2, SerialNumber=1
Nov 10 16:31:14 alex kernel: usb usb8: Product: xHCI Host Controller
Nov 10 16:31:14 alex kernel: usb usb8: Manufacturer: Linux 5.3.9-gentoo 
xhci-hcd
Nov 10 16:31:14 alex kernel: usb usb8: SerialNumber: 0000:06:00.0
Nov 10 16:31:14 alex kernel: hub 8-0:1.0: USB hub found
Nov 10 16:31:14 alex kernel: hub 8-0:1.0: 2 ports detected
Nov 10 16:31:14 alex kernel: xhci_hcd 0000:06:00.0: xHCI Host Controller
Nov 10 16:31:14 alex kernel: xhci_hcd 0000:06:00.0: new USB bus 
registered, assigned bus number 9
Nov 10 16:31:14 alex kernel: xhci_hcd 0000:06:00.0: Host supports USB 
3.0 SuperSpeed
Nov 10 16:31:14 alex kernel: usb usb9: We don't know the algorithms for 
LPM for this host, disabling LPM.
Nov 10 16:31:14 alex kernel: usb usb9: New USB device found, 
idVendor=1d6b, idProduct=0003, bcdDevice= 5.03
Nov 10 16:31:14 alex kernel: usb usb9: New USB device strings: Mfr=3, 
Product=2, SerialNumber=1
Nov 10 16:31:14 alex kernel: usb usb9: Product: xHCI Host Controller
Nov 10 16:31:14 alex kernel: usb usb9: Manufacturer: Linux 5.3.9-gentoo 
xhci-hcd
Nov 10 16:31:14 alex kernel: usb usb9: SerialNumber: 0000:06:00.0
Nov 10 16:31:14 alex kernel: hub 9-0:1.0: USB hub found
Nov 10 16:31:14 alex kernel: hub 9-0:1.0: 2 ports detected
.
.
.
Nov 10 17:15:10 alex kernel: xhci_hcd 0000:06:00.0: WARN: xHC CMD_RUN 
timeout
Nov 10 17:15:10 alex kernel: PM: suspend_common(): 
xhci_pci_suspend+0x0/0xc0 [xhci_pci] returns -110
Nov 10 17:15:10 alex kernel: PM: pci_pm_suspend(): 
hcd_pci_suspend+0x0/0x20 returns -110
Nov 10 17:15:10 alex kernel: PM: dpm_run_callback(): 
pci_pm_suspend+0x0/0x130 returns -110
Nov 10 17:15:10 alex kernel: PM: Device 0000:06:00.0 failed to suspend 
async: error -110
.
Nov 10 17:15:10 alex kernel: PM: Some devices failed to suspend, or 
early wake event detected
.
.
.
-- snap --

