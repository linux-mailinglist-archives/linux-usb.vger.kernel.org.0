Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8DEA38816F
	for <lists+linux-usb@lfdr.de>; Tue, 18 May 2021 22:33:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237752AbhERUeo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 May 2021 16:34:44 -0400
Received: from m.b4.vu ([203.16.231.148]:49986 "EHLO m.b4.vu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236628AbhERUen (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 18 May 2021 16:34:43 -0400
X-Greylist: delayed 301 seconds by postgrey-1.27 at vger.kernel.org; Tue, 18 May 2021 16:34:43 EDT
Received: by m.b4.vu (Postfix, from userid 1000)
        id CFFF8604B6D7; Wed, 19 May 2021 05:58:23 +0930 (ACST)
Date:   Wed, 19 May 2021 05:58:23 +0930
From:   "Geoffrey D. Bennett" <g@b4.vu>
To:     linux-usb@vger.kernel.org
Subject: ehci-pci: Scarlett Gen 2 mixer driver init failure
Message-ID: <20210518202823.GA89630@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi there,

I'm investigating an issue with the Focusrite Scarlett Gen 2 ALSA
mixer driver (linux/sound/usb/mixer_scarlett_gen2.c) where the driver
fails to correctly perform the proprietary USB initialisation sequence
with the device when plugged in to a USB port that uses ehci-pci.

Here's what I've found so far:

- The issue happens all the time when the device is plugged in to a
  USB port that uses ehci-pci. xhci_hcd USB ports work fine.

- The issue occurs when sending the first vendor-specific control
  input USB command, but only when sending from the kernel driver
  (that's scarlett2_usb() in mixer_scarlett_gen2.c). Sending the same
  USB packet from user-space with libusb works fine.

- "usbmon -s 10000 -fu" shows no difference between the messages sent
  in the success and failure cases:

working (packet sent from user-space):

ffff8881088b1d00 265130488 S Ci:2:029:0 s a1 00 0000 0005 0018 24 <
ffff8881088b1d00 265130569 C Ci:2:029:0 0 24 = 66191018 73190604 01000000 01000000 00040000 00000000

not working (same packet sent from kernel driver):

ffff88810be96d00 986255933 S Ci:2:030:0 s a1 00 0000 0005 0018 24 <
ffff88810be96d00 991378740 C Ci:2:030:0 -2 0

- When I enabled ehci debugging, I still see no difference in the
  submitted packet between working and non-working:

kernel: ehci-pci 0000:00:1d.0: submit_async 1.2 urb 00000000de165beb ep0out len 24, qtd 0000000056de0c60 [qh 00000000d43a72d3]
kernel: ehci-pci 0000:00:1d.0: ehci_urb_done 1.2 urb 00000000de165beb ep0in status 0 len 24/24

kernel: ehci-pci 0000:00:1d.0: submit_async 1.2 urb 000000004f9d8dbb ep0out len 24, qtd 0000000055a1f6c8 [qh 00000000312c985a]
kernel: ehci-pci 0000:00:1d.0: ehci_urb_done 1.2 urb 000000004f9d8dbb ep0out status -115 len 0/24

- If I pass through the USB device to a KVM VM, it uses xhci_hcd
  within the VM and the driver initialisation succeeds even though the
  host is using ehci-pci.

Host:

[root@peta ~]# lsusb -d1235:
Bus 002 Device 011: ID 1235:8204 Focusrite-Novation Scarlett 18i8 2nd Gen
[root@peta ~]# lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 480M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/3p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/8p, 480M
        |__ Port 2: Dev 11, If 0, Class=Audio, Driver=usbfs, 480M
        |__ Port 2: Dev 11, If 1, Class=Audio, Driver=usbfs, 480M
        |__ Port 2: Dev 11, If 2, Class=Audio, Driver=usbfs, 480M
        |__ Port 2: Dev 11, If 3, Class=Audio, Driver=usbfs, 480M
        |__ Port 2: Dev 11, If 4, Class=Audio, Driver=usbfs, 480M
        |__ Port 2: Dev 11, If 5, Class=Vendor Specific Class, Driver=usbfs, 480M
        |__ Port 6: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
        |__ Port 6: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=ehci-pci/3p, 480M
    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/6p, 480M
        |__ Port 1: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 12M
        |__ Port 5: Dev 4, If 0, Class=Video, Driver=uvcvideo, 480M
        |__ Port 5: Dev 4, If 1, Class=Video, Driver=uvcvideo, 480M

Guest VM:

[root@fedora ~]# lsusb -d1235:
Bus 001 Device 005: ID 1235:8204 Focusrite-Novation Scarlett 18i8 2nd Gen
[root@fedora ~]# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 5000M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/15p, 480M
    |__ Port 1: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid, 480M
    |__ Port 4: Dev 5, If 3, Class=Audio, Driver=snd-usb-audio, 480M
    |__ Port 4: Dev 5, If 1, Class=Audio, Driver=snd-usb-audio, 480M
    |__ Port 4: Dev 5, If 4, Class=Audio, Driver=snd-usb-audio, 480M
    |__ Port 4: Dev 5, If 2, Class=Audio, Driver=snd-usb-audio, 480M
    |__ Port 4: Dev 5, If 0, Class=Audio, Driver=snd-usb-audio, 480M
    |__ Port 4: Dev 5, If 5, Class=Vendor Specific Class, Driver=, 480M

I also noticed that if a control output USB packet is sent first, it
succeeds. When the next (control input) USB packet is sent, it fails.

This is what usbmon on the host shows when running the mixer driver in
the guest:

ffff88811d4d4b00 4018863624 S Co:2:012:0 s 21 02 0000 0005 0010 16 = 00000000 00000000 00000000 00000000
ffff88811d4d4b00 4018863805 C Co:2:012:0 0 16 >
ffff88811d4d4e00 4018865148 S Ci:2:012:0 s a1 03 0000 0005 0010 16 <
ffff88811d4d4e00 4018865306 C Ci:2:012:0 0 16 = 00000000 00000000 00000000 00000000

And this is running the mixer driver on the host:

ffff8881d2672200 3822282593 S Co:2:011:0 s 21 02 0000 0005 0010 16 = 00000000 00000000 00000000 00000000
ffff8881d2672200 3822282804 C Co:2:011:0 0 16 >
ffff8881d2672700 3822282907 S Ci:2:011:0 s a1 03 0000 0005 0010 16 <
ffff8881d2672700 3827753258 C Ci:2:011:0 -2 0

Based on the above, it seems to me that the problem lies with the
ehci-pci driver, but I am not sure where to go from here in tracking
down the problem further. I learnt only just enough about USB in order
to write this mixer driver, so problems that can't be debugged by
staring at usbmon output for hours are beyond me :-).

Thanks in advance for any assistance in debugging this!

Regards,
Geoffrey.
