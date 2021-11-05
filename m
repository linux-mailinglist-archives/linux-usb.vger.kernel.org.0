Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C88EB4462AA
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 12:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232409AbhKEL3P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Nov 2021 07:29:15 -0400
Received: from jazz.pogo.org.uk ([213.138.114.167]:59125 "EHLO
        jazz.pogo.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbhKEL3P (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 Nov 2021 07:29:15 -0400
X-Greylist: delayed 1682 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Nov 2021 07:29:14 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pogo.org.uk
        ; s=swing; h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender
        :Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ZwsCGBHJXHurtORheUgy2SpaAb0HmZqOHew/V9ebGOA=; b=UpzThWTQPUOhLxfWMicj3o19KM
        YphvgJz+poRCvvbkor59uPR22ljGjQHT5l6i0zMO+DzrK1Ue7zCm1Ony3LQwch9tG3d2DfKadzLZy
        qLZqCahitNQ1Ua7DrAhJ/8hMkSqM4pSFL/dq/X0I5qnVnIC8ErzZrEuMciLT3IaVWg4o=;
Received: from [2001:470:1d21:0:428d:5cff:fe1b:f3e5] (helo=stax)
        by jazz.pogo.org.uk with esmtps  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2 (FreeBSD))
        (envelope-from <mark@xwax.org>)
        id 1miwvY-000EOR-1u
        for linux-usb@vger.kernel.org; Fri, 05 Nov 2021 10:58:32 +0000
Received: from localhost (stax.localdomain [local])
        by stax.localdomain (OpenSMTPD) with ESMTPA id 99c2327e
        for <linux-usb@vger.kernel.org>;
        Fri, 5 Nov 2021 10:58:31 +0000 (UTC)
Date:   Fri, 5 Nov 2021 10:58:31 +0000 (GMT)
From:   Mark Hills <mark@xwax.org>
To:     linux-usb@vger.kernel.org
Subject: XHCI unplug of USB-C device is not detected
Message-ID: <2111051005210.3125@stax.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

My only USB-C device is a Logitech StreamCam, which seems to cause some 
kind of lock on resources when unplugged.

The symptom is it works when first plugged in to a PC. But after 
unplugging it can't be made to work again.

I don't have prior experience of these components. I enabled debug 
messages:

  echo -n "module xhci_hcd =p" > /sys/kernel/debug/dynamic_debug/control

Plugging in the webcam produces the dmesg below.

But unplugging simply results in no activity -- zero output in dmesg. Same 
when plugging in again.

After unplugging the device is still listed:

  $ lsusb
  Bus 004 Device 002: ID 046d:0893  Logitech StreamCam
  Bus 004 Device 001: ID 1d6b:0003 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
  Bus 003 Device 001: ID 1d6b:0002 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
  Bus 002 Device 001: ID 1d6b:0003 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
  Bus 001 Device 007: ID 046d:c52f Logitech USB Receiver
  Bus 001 Device 006: ID 056a:037b Wacom Co.,Ltd. CTL-672
  Bus 001 Device 005: ID 1a40:0101  USB 2.0 Hub
  Bus 001 Device 004: ID 04d9:0340  USB-HID Keyboard
  Bus 001 Device 003: ID 04d9:0339  USB-HID Keyboard
  Bus 001 Device 002: ID 1a40:0101  USB 2.0 Hub
  Bus 001 Device 001: ID 1d6b:0002 Linux 5.14.2-mh xhci-hcd xHCI Host Controller

and the associated uvcvideo module is free and can be removed with rmmod:

  $ lsmod | grep uvcvideo
  uvcvideo              110592  0
  videobuf2_vmalloc      20480  1 uvcvideo
  videobuf2_v4l2         28672  1 uvcvideo
  videobuf2_common       45056  4 videobuf2_vmalloc,videobuf2_v4l2,uvcvideo,videobuf2_memops
  videodev              200704  3 videobuf2_v4l2,uvcvideo,videobuf2_common
  mc                     53248  5 videodev,snd_usb_audio,videobuf2_v4l2,uvcvideo,videobuf2_common

The USB subsystem isn't entirely locked up. A USB keyboard on a different 
type A port is picked up as expected.

I have access to a Thinkpad X230 laptop (Alpine Linux; kernel 
5.10.61-0-lts), and everything works as expected.

So it seems to be specific to the PC hardware (Gigabyte H170-D3HP 
motherboard -- a single USB-C port and several regular ones). Or perhaps 
even the kernel config.

What debugging can I do next?

Thanks

-- 
Mark

# uname -a
Linux stax 5.14.2-mh #152 SMP PREEMPT Fri Sep 10 20:21:40 BST 2021 x86_64 Intel(R) Core(TM) i5-6500 CPU @ 3.20GHz GenuineIntel GNU/Linux

<plug in webcam>

[   49.715691] xhci_hcd 0000:06:00.0: // Setting command ring address to 0xffffe001
[   49.715885] xhci_hcd 0000:06:00.0: xhci_resume: starting port polling.
[   49.715897] xhci_hcd 0000:06:00.0: xhci_hub_status_data: stopping port polling.
[   49.715925] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x10202e0, return 0x10341
[   49.715937] xhci_hcd 0000:06:00.0: Port change event, 4-1, id 3, portsc: 0x10202e0
[   49.715950] xhci_hcd 0000:06:00.0: handle_port_status: starting port polling.
[   49.715970] xhci_hcd 0000:06:00.0: Get port status 3-1 read: 0x2a0, return 0x100
[   49.715997] xhci_hcd 0000:06:00.0: Get port status 3-2 read: 0x2a0, return 0x100
[   49.716033] xhci_hcd 0000:06:00.0: xhci_hub_status_data: stopping port polling.
[   49.716045] xhci_hcd 0000:06:00.0: clear port1 connect change, portsc: 0x10002e0
[   49.716061] xhci_hcd 0000:06:00.0: Get port status 4-2 read: 0x2a0, return 0x2a0
[   49.716259] xhci_hcd 0000:06:00.0: Port change event, 4-1, id 3, portsc: 0x21203
[   49.716270] xhci_hcd 0000:06:00.0: handle_port_status: starting port polling.
[   49.818616] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x21203, return 0x10203
[   49.818649] xhci_hcd 0000:06:00.0: clear port1 connect change, portsc: 0x1203
[   49.818664] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x1203, return 0x203
[   49.819416] xhci_hcd 0000:06:00.0: xhci_hub_status_data: stopping port polling.
[   49.845567] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x1203, return 0x203
[   49.872556] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x1203, return 0x203
[   49.899605] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x1203, return 0x203
[   49.926609] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x1203, return 0x203
[   49.926642] xhci_hcd 0000:06:00.0: // Ding dong!
[   49.926776] xhci_hcd 0000:06:00.0: Slot 1 output ctx = 0xfffd7000 (dma)
[   49.926789] xhci_hcd 0000:06:00.0: Slot 1 input ctx = 0xfffd6000 (dma)
[   49.926803] xhci_hcd 0000:06:00.0: Set slot id 1 dcbaa entry 000000001dd6a88f to 0xfffd7000
[   49.926846] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x1203, return 0x203
[   49.926870] xhci_hcd 0000:06:00.0: set port reset, actual port 4-1 status  = 0x1311
[   49.926915] xhci_hcd 0000:06:00.0: Port change event, 4-1, id 3, portsc: 0x201203
[   49.926927] xhci_hcd 0000:06:00.0: handle_port_status: starting port polling.
[   49.988604] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x201203, return 0x100203
[   49.988637] xhci_hcd 0000:06:00.0: clear port1 reset change, portsc: 0x1203
[   49.988652] xhci_hcd 0000:06:00.0: clear port1 warm(BH) reset change, portsc: 0x1203
[   49.988664] xhci_hcd 0000:06:00.0: clear port1 link state change, portsc: 0x1203
[   49.988675] xhci_hcd 0000:06:00.0: clear port1 connect change, portsc: 0x1203
[   49.988685] xhci_hcd 0000:06:00.0: Get port status 4-1 read: 0x1203, return 0x203
[   50.040541] xhci_hcd 0000:06:00.0: Set root hub portnum to 3
[   50.040550] xhci_hcd 0000:06:00.0: Set fake root hub portnum to 1
[   50.040555] xhci_hcd 0000:06:00.0: udev->tt = 0000000000000000
[   50.040560] xhci_hcd 0000:06:00.0: udev->ttport = 0x0
[   50.040566] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.040733] xhci_hcd 0000:06:00.0: Successful setup address command
[   50.040744] xhci_hcd 0000:06:00.0: Op regs DCBAA ptr = 0x000000fffff000
[   50.040751] xhci_hcd 0000:06:00.0: Slot ID 1 dcbaa entry @000000001dd6a88f = 0x000000fffd7000
[   50.040759] xhci_hcd 0000:06:00.0: Output Context DMA address = 0xfffd7000
[   50.040763] xhci_hcd 0000:06:00.0: Internal device address = 1
[   50.040770] usb 4-1: new SuperSpeed USB device number 2 using xhci_hcd
[   50.054070] xhci_hcd 0000:06:00.0: Waiting for status stage event
[   50.054230] xhci_hcd 0000:06:00.0: Waiting for status stage event
[   50.054330] xhci_hcd 0000:06:00.0: Waiting for status stage event
[   50.054378] usb 4-1: New USB device found, idVendor=046d, idProduct=0893, bcdDevice= 3.17
[   50.054388] usb 4-1: New USB device strings: Mfr=0, Product=2, SerialNumber=3
[   50.054394] usb 4-1: Product: Logitech StreamCam
[   50.054398] usb 4-1: SerialNumber: 8D89C845
[   50.055055] xhci_hcd 0000:06:00.0: add ep 0x85, slot id 1, new drop flags = 0x0, new add flags = 0x800
[   50.055075] xhci_hcd 0000:06:00.0: add ep 0x83, slot id 1, new drop flags = 0x0, new add flags = 0x880
[   50.055087] xhci_hcd 0000:06:00.0: add ep 0x87, slot id 1, new drop flags = 0x0, new add flags = 0x8880
[   50.055092] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.055101] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.055297] xhci_hcd 0000:06:00.0: Successful Endpoint Configure command
[   50.055341] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.055369] xhci_hcd 0000:06:00.0: Stopped on No-op or Link TRB for slot 1 ep 10
[   50.055386] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.055660] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.055714] xhci_hcd 0000:06:00.0: Stopped on No-op or Link TRB for slot 1 ep 6
[   50.055764] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.056047] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.056104] xhci_hcd 0000:06:00.0: Stopped on No-op or Link TRB for slot 1 ep 14
[   50.056151] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.056640] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.056784] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.057250] xhci_hcd 0000:06:00.0: Waiting for status stage event
[   50.057347] xhci_hcd 0000:06:00.0: Stalled endpoint for slot 1 ep 0
[   50.057357] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.057389] xhci_hcd 0000:06:00.0: Ignoring reset ep completion code of 1
[   50.057394] xhci_hcd 0000:06:00.0: Removing canceled TD starting at 0xfffd5280 (dma).
[   50.057401] xhci_hcd 0000:06:00.0: Set TR Deq ptr 0xfffd52a0, cycle 1

[   50.057406] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.057427] xhci_hcd 0000:06:00.0: Successful Set TR Deq Ptr cmd, deq = @fffd52a0
[   50.057433] xhci_hcd 0000:06:00.0: Giveback URB 00000000f7763f8e, len = 0, expected = 0, status = -32
[   50.058065] hid-generic 0003:046D:0893.000B: hiddev99,hidraw9: USB HID v1.11 Device [Logitech StreamCam] on usb-0000:06:00.0-1/input5
[   50.073227] mc: Linux media interface: v0.10
[   50.093391] videodev: Linux video capture interface: v2.00
[   50.106411] xhci_hcd 0000:06:00.0: xhci_hub_status_data: stopping port polling.
[   50.114447] xhci_hcd 0000:06:00.0: Waiting for status stage event
[   50.114612] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.114839] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.114929] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.118401] xhci_hcd 0000:06:00.0: add ep 0x84, slot id 1, new drop flags = 0x0, new add flags = 0x201
[   50.118412] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.118422] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.118619] xhci_hcd 0000:06:00.0: Successful Endpoint Configure command
[   50.120094] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.120162] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.120210] xhci_hcd 0000:06:00.0: xhci_drop_endpoint called for udev 00000000dd872f78
[   50.120235] xhci_hcd 0000:06:00.0: drop ep 0x84, slot id 1, new drop flags = 0x200, new add flags = 0x0
[   50.120243] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.120250] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.120492] xhci_hcd 0000:06:00.0: Successful Endpoint Configure command
[   50.120911] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.120999] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.124448] usb 4-1: current rate 16000 is different from the runtime rate 24000
[   50.124464] xhci_hcd 0000:06:00.0: add ep 0x84, slot id 1, new drop flags = 0x0, new add flags = 0x200
[   50.124472] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.124481] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.124720] xhci_hcd 0000:06:00.0: Successful Endpoint Configure command
[   50.126226] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.126334] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.126395] xhci_hcd 0000:06:00.0: xhci_drop_endpoint called for udev 00000000dd872f78
[   50.126418] xhci_hcd 0000:06:00.0: drop ep 0x84, slot id 1, new drop flags = 0x200, new add flags = 0x0
[   50.126427] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.126434] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.126684] xhci_hcd 0000:06:00.0: Successful Endpoint Configure command
[   50.127152] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.127262] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.130442] usb 4-1: current rate 16000 is different from the runtime rate 32000
[   50.130459] xhci_hcd 0000:06:00.0: add ep 0x84, slot id 1, new drop flags = 0x0, new add flags = 0x200
[   50.130467] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.130476] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.130679] xhci_hcd 0000:06:00.0: Successful Endpoint Configure command
[   50.132127] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.132243] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.132289] xhci_hcd 0000:06:00.0: xhci_drop_endpoint called for udev 00000000dd872f78
[   50.132314] xhci_hcd 0000:06:00.0: drop ep 0x84, slot id 1, new drop flags = 0x200, new add flags = 0x0
[   50.132322] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.132329] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.132537] xhci_hcd 0000:06:00.0: Successful Endpoint Configure command
[   50.132984] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.133099] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.136435] usb 4-1: current rate 16000 is different from the runtime rate 48000
[   50.136451] xhci_hcd 0000:06:00.0: add ep 0x84, slot id 1, new drop flags = 0x0, new add flags = 0x200
[   50.136460] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.136469] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.136726] xhci_hcd 0000:06:00.0: Successful Endpoint Configure command
[   50.138236] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.138302] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.138339] xhci_hcd 0000:06:00.0: xhci_drop_endpoint called for udev 00000000dd872f78
[   50.138386] xhci_hcd 0000:06:00.0: drop ep 0x84, slot id 1, new drop flags = 0x200, new add flags = 0x0
[   50.138395] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.138402] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.138659] xhci_hcd 0000:06:00.0: Successful Endpoint Configure command
[   50.139128] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.139197] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.170573] usbcore: registered new interface driver snd-usb-audio
[   50.170683] usb 4-1: Found UVC 1.00 device Logitech StreamCam (046d:0893)
[   50.171979] xhci_hcd 0000:06:00.0: xhci_check_bandwidth called for udev 00000000dd872f78
[   50.172091] usb 4-1: Disable U1, ESIT shorter than exit latency
[   50.172149] usb 4-1: Disable U2, ESIT shorter than exit latency
[   50.173376] input: Logitech StreamCam as /devices/pci0000:00/0000:00:1b.0/0000:02:00.0/0000:03:02.0/0000:06:00.0/usb4/4-1/4-1:1.0/input/input25
[   50.173585] usbcore: registered new interface driver uvcvideo
[   50.177637] xhci_hcd 0000:06:00.0: Cancel URB 000000009418ab65, dev 1, ep 0x85, starting at offset 0xfffc1000
[   50.177655] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.177676] xhci_hcd 0000:06:00.0: Stopped on Transfer TRB for slot 1 ep 10
[   50.177690] xhci_hcd 0000:06:00.0: Removing canceled TD starting at 0xfffc1000 (dma).
[   50.177699] xhci_hcd 0000:06:00.0: Set TR Deq ptr 0xfffc1010, cycle 1

[   50.177704] xhci_hcd 0000:06:00.0: // Ding dong!
[   50.177720] xhci_hcd 0000:06:00.0: Successful Set TR Deq Ptr cmd, deq = @fffc1010
[   50.177725] xhci_hcd 0000:06:00.0: Giveback URB 000000009418ab65, len = 0, expected = 16, status = -115
[   52.263548] xhci_hcd 0000:06:00.0: // Ding dong!
[   52.263609] xhci_hcd 0000:06:00.0: Stopped on No-op or Link TRB for slot 1 ep 14
[   52.263624] xhci_hcd 0000:06:00.0: Stopped on No-op or Link TRB for slot 1 ep 6
[   52.263630] xhci_hcd 0000:06:00.0: Stopped on No-op or Link TRB for slot 1 ep 0
[   52.263682] xhci_hcd 0000:06:00.0: Set port 4-1 link state, portsc: 0x1203, write 0x11261
[   52.282593] xhci_hcd 0000:06:00.0: set port remote wake mask, actual port 4-1 status  = 0xe001263
[   52.282627] xhci_hcd 0000:06:00.0: set port remote wake mask, actual port 4-2 status  = 0xe0002a0
[   52.282657] xhci_hcd 0000:06:00.0: xhci_hub_status_data: stopping port polling.
[   52.282669] xhci_hcd 0000:06:00.0: config port 4-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[   52.282676] xhci_hcd 0000:06:00.0: config port 3-1 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[   52.282682] xhci_hcd 0000:06:00.0: config port 3-2 wake bits, portsc: 0xa0002a0, write: 0xa0202a0
[   52.282686] xhci_hcd 0000:06:00.0: xhci_suspend: stopping port polling.
[   52.282696] xhci_hcd 0000:06:00.0: // Setting command ring address to 0xffffe001


$ zcat /proc/config.gz | grep -i -E '(typec|usb|xhci)' | grep -v '^#'
CONFIG_BT_HCIBTUSB=m
CONFIG_BT_HCIBTUSB_AUTOSUSPEND=y
CONFIG_MEDIA_USB_SUPPORT=y
CONFIG_USB_VIDEO_CLASS=m
CONFIG_USB_VIDEO_CLASS_INPUT_EVDEV=y
CONFIG_SND_USB=y
CONFIG_SND_USB_AUDIO=m
CONFIG_SND_USB_AUDIO_USE_MEDIA_CONTROLLER=y
CONFIG_SND_USB_CAIAQ=m
CONFIG_SND_USB_CAIAQ_INPUT=y
CONFIG_USB_HID=y
CONFIG_USB_HIDDEV=y
CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=m
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_OTG=y
CONFIG_USB_OTG_FSM=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=m
CONFIG_USB_AUTOSUSPEND_DELAY=2
CONFIG_USB_MON=m
CONFIG_USB_XHCI_HCD=m
CONFIG_USB_XHCI_PCI=m
CONFIG_USB_XHCI_PCI_RENESAS=m
CONFIG_USB_XHCI_PLATFORM=m
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
CONFIG_USB_UHCI_HCD=y
CONFIG_USB_STORAGE=m
CONFIG_USB_UAS=m
CONFIG_USB_SERIAL=m
CONFIG_USB_SERIAL_GENERIC=y
CONFIG_USB_SERIAL_CH341=m
CONFIG_USB_SERIAL_FTDI_SIO=m
CONFIG_USB_PHY=y
CONFIG_TYPEC=m
CONFIG_TYPEC_TCPM=m
CONFIG_TYPEC_TCPCI=m
CONFIG_TYPEC_RT1711H=m
CONFIG_TYPEC_MT6360=m
CONFIG_TYPEC_TCPCI_MAXIM=m
CONFIG_TYPEC_FUSB302=m
CONFIG_TYPEC_UCSI=m
CONFIG_TYPEC_TPS6598X=m
CONFIG_TYPEC_HD3SS3220=m
CONFIG_TYPEC_STUSB160X=m
CONFIG_TYPEC_MUX_PI3USB30532=m
CONFIG_USB_ROLE_SWITCH=m
CONFIG_USB_ROLES_INTEL_XHCI=m



# lsusb -v            # webcam and xhci devices only for brevity
Bus 004 Device 002: ID 046d:0893  Logitech StreamCam
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.20
  bDeviceClass          239 
  bDeviceSubClass         2 
  bDeviceProtocol         1 
  bMaxPacketSize0         9
  idVendor           0x046d 
  idProduct          0x0893 
  bcdDevice            3.17
  iManufacturer           0 
  iProduct                2 Logitech StreamCam
  iSerial                 3 8D89C845
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0933
    bNumInterfaces          6
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0x80
      (Bus Powered)
    MaxPower              896mA
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         0
      bInterfaceCount         2
      bFunctionClass         14 
      bFunctionSubClass       3 
      bFunctionProtocol       0 
      iFunction               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      1 
      bInterfaceProtocol      0 
      iInterface              0 
      VideoControl Interface Descriptor:
        bLength                13
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdUVC               1.00
        wTotalLength       0x00d8
        dwClockFrequency       30.000000MHz
        bInCollection           1
        baInterfaceNr( 0)       1
      VideoControl Interface Descriptor:
        bLength                18
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Camera Sensor
        bAssocTerminal          0
        iTerminal               0 
        wObjectiveFocalLengthMin      0
        wObjectiveFocalLengthMax      0
        wOcularFocalLength            0
        bControlSize                  3
        bmControls           0x00022a2e
          Auto-Exposure Mode
          Auto-Exposure Priority
          Exposure Time (Absolute)
          Focus (Absolute)
          Zoom (Absolute)
          PanTilt (Absolute)
          Roll (Absolute)
          Focus, Auto
      VideoControl Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      5 (PROCESSING_UNIT)
      Warning: Descriptor too short
        bUnitID                 3
        bSourceID               1
        wMaxMultiplier      16384
        bControlSize            2
        bmControls     0x0000175b
          Brightness
          Contrast
          Saturation
          Sharpness
          White Balance Temperature
          Backlight Compensation
          Gain
          Power Line Frequency
          White Balance Temperature, Auto
        iProcessing             0 
        bmVideoStandards     0x1b
          None
          NTSC - 525/60
          SECAM - 625/50
          NTSC - 625/50
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                14
        guidExtensionCode         {2c49d16a-32b8-4485-3ea8-643a152362f2}
        bNumControls            6
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            2
        bmControls( 0)       0x3f
        bmControls( 1)       0x00
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 6
        guidExtensionCode         {23e49ed0-1178-4f31-ae52-d2fb8a8d3b48}
        bNumControls           14
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            2
        bmControls( 0)       0xff
        bmControls( 1)       0x6f
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                27
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 8
        guidExtensionCode         {69678ee4-410f-40db-a850-7420d7d8240e}
        bNumControls            8
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            2
        bmControls( 0)       0x3f
        bmControls( 1)       0x0f
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                 9
        guidExtensionCode         {1f5d4ca9-de11-4487-840d-50933c8ec8d1}
        bNumControls           18
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            3
        bmControls( 0)       0xff
        bmControls( 1)       0xff
        bmControls( 2)       0x03
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                10
        guidExtensionCode         {49e40215-f434-47fe-b158-0e885023e51b}
        bNumControls           11
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            3
        bmControls( 0)       0xfa
        bmControls( 1)       0xff
        bmControls( 2)       0x01
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                28
        bDescriptorType        36
        bDescriptorSubtype      6 (EXTENSION_UNIT)
        bUnitID                11
        guidExtensionCode         {ffe52d21-8030-4e2c-82d9-f587d00540bd}
        bNumControls            4
        bNrInPins               1
        baSourceID( 0)          3
        bControlSize            3
        bmControls( 0)       0x00
        bmControls( 1)       0x41
        bmControls( 2)       0x01
        iExtension              0 
      VideoControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             4
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               3
        iTerminal               0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x85  EP 5 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0040  1x 64 bytes
        bInterval               8
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      VideoStreaming Interface Descriptor:
        bLength                            16
        bDescriptorType                    36
        bDescriptorSubtype                  1 (INPUT_HEADER)
        bNumFormats                         3
        wTotalLength                   0x05b9
        bEndpointAddress                 0x81  EP 1 IN
        bmInfo                              0
        bTerminalLink                       4
        bStillCaptureMethod                 0
        bTriggerSupport                     0
        bTriggerUsage                       0
        bControlSize                        1
        bmaControls( 0)                     0
        bmaControls( 1)                     0
        bmaControls( 2)                     0
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        1
        bNumFrameDescriptors               11
        guidFormat                            {32595559-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      16
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            176
        wHeight                           144
        dwMinBitRate                  2027520
        dwMaxBitRate                 12165120
        dwMaxVideoFrameBufferSize       50688
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 36864000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  8140800
        dwMaxBitRate                 48844800
        dwMaxVideoFrameBufferSize      203520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 32563200
        dwMaxBitRate                195379200
        dwMaxVideoFrameBufferSize      814080
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                 41472000
        dwMaxBitRate                248832000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                           896
        dwMinBitRate                114688000
        dwMaxBitRate                688128000
        dwMaxVideoFrameBufferSize     2867200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            30
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                        11
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           2304
        wHeight                          1296
        dwMinBitRate                238878720
        dwMaxBitRate                238878720
        dwMaxVideoFrameBufferSize     5971968
        dwDefaultFrameInterval        2000000
        bFrameIntervalType                  1
        dwFrameInterval( 0)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            11
        bDescriptorType                    36
        bDescriptorSubtype                  6 (FORMAT_MJPEG)
        bFormatIndex                        2
        bNumFrameDescriptors               10
        bFlags                              1
          Fixed-size samples: Yes
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 1 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                294912000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            176
        wHeight                           144
        dwMinBitRate                  2027520
        dwMaxBitRate                 24330240
        dwMaxVideoFrameBufferSize       50688
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            320
        wHeight                           240
        dwMinBitRate                  6144000
        dwMaxBitRate                 73728000
        dwMaxVideoFrameBufferSize      153600
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            424
        wHeight                           240
        dwMinBitRate                  8140800
        dwMaxBitRate                 97689600
        dwMaxVideoFrameBufferSize      203520
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         5
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                221184000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         6
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            848
        wHeight                           480
        dwMinBitRate                 32563200
        dwMaxBitRate                390758400
        dwMaxVideoFrameBufferSize      814080
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         7
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            960
        wHeight                           540
        dwMinBitRate                 41472000
        dwMaxBitRate                497664000
        dwMaxVideoFrameBufferSize     1036800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         8
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                884736000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                         9
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1600
        wHeight                           896
        dwMinBitRate                114688000
        dwMaxBitRate                1376256000
        dwMaxVideoFrameBufferSize     2867200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            58
        bDescriptorType                    36
        bDescriptorSubtype                  7 (FRAME_MJPEG)
        bFrameIndex                        10
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                1990656000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  8
        dwFrameInterval( 0)            166666
        dwFrameInterval( 1)            333333
        dwFrameInterval( 2)            416666
        dwFrameInterval( 3)            500000
        dwFrameInterval( 4)            666666
        dwFrameInterval( 5)           1000000
        dwFrameInterval( 6)           1333333
        dwFrameInterval( 7)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
      VideoStreaming Interface Descriptor:
        bLength                            27
        bDescriptorType                    36
        bDescriptorSubtype                  4 (FORMAT_UNCOMPRESSED)
        bFormatIndex                        3
        bNumFrameDescriptors                4
        guidFormat                            {3231564e-0000-0010-8000-00aa00389b71}
        bBitsPerPixel                      12
        bDefaultFrameIndex                  1
        bAspectRatioX                       0
        bAspectRatioY                       0
        bmInterlaceFlags                 0x00
          Interlaced stream or variable: No
          Fields per frame: 2 fields
          Field 1 first: No
          Field pattern: Field 1 only
        bCopyProtect                        0
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         1
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           480
        dwMinBitRate                 24576000
        dwMaxBitRate                147456000
        dwMaxVideoFrameBufferSize      614400
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         2
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                            640
        wHeight                           360
        dwMinBitRate                 18432000
        dwMaxBitRate                110592000
        dwMaxVideoFrameBufferSize      460800
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         3
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1280
        wHeight                           720
        dwMinBitRate                 73728000
        dwMaxBitRate                442368000
        dwMaxVideoFrameBufferSize     1843200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                            54
        bDescriptorType                    36
        bDescriptorSubtype                  5 (FRAME_UNCOMPRESSED)
        bFrameIndex                         4
        bmCapabilities                   0x00
          Still image unsupported
        wWidth                           1920
        wHeight                          1080
        dwMinBitRate                165888000
        dwMaxBitRate                995328000
        dwMaxVideoFrameBufferSize     4147200
        dwDefaultFrameInterval         333333
        bFrameIntervalType                  7
        dwFrameInterval( 0)            333333
        dwFrameInterval( 1)            416666
        dwFrameInterval( 2)            500000
        dwFrameInterval( 3)            666666
        dwFrameInterval( 4)           1000000
        dwFrameInterval( 5)           1333333
        dwFrameInterval( 6)           2000000
      VideoStreaming Interface Descriptor:
        bLength                             6
        bDescriptorType                    36
        bDescriptorSubtype                 13 (COLORFORMAT)
        bColorPrimaries                     1 (BT.709,sRGB)
        bTransferCharacteristics            1 (BT.709)
        bMatrixCoefficients                 4 (SMPTE 170M (BT.601))
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0180  1x 384 bytes
        bInterval               1
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0280  1x 640 bytes
        bInterval               1
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x03b0  1x 944 bytes
        bInterval               1
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       5
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       6
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       7
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               2
        Mult                    1
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       8
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               2
        Mult                    2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting       9
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               3
        Mult                    2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      10
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               4
        Mult                    2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      11
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               5
        Mult                    2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      12
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               6
        Mult                    2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      13
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               7
        Mult                    2
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        1
      bAlternateSetting      14
      bNumEndpoints           1
      bInterfaceClass        14 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               1
        bMaxBurst               9
        Mult                    2
    Interface Association:
      bLength                 8
      bDescriptorType        11
      bFirstInterface         2
      bInterfaceCount         2
      bFunctionClass          1 
      bFunctionSubClass       2 
      bFunctionProtocol       0 
      iFunction               0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        2
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 
      bInterfaceSubClass      1 
      bInterfaceProtocol      0 
      iInterface              0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      1 (HEADER)
        bcdADC               1.00
        wTotalLength       0x0026
        bInCollection           1
        baInterfaceNr(0)        3
      AudioControl Interface Descriptor:
        bLength                12
        bDescriptorType        36
        bDescriptorSubtype      2 (INPUT_TERMINAL)
        bTerminalID             1
        wTerminalType      0x0201 Microphone
        bAssocTerminal          0
        bNrChannels             2
        wChannelConfig     0x0003
          Left Front (L)
          Right Front (R)
        iChannelNames           0 
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 9
        bDescriptorType        36
        bDescriptorSubtype      3 (OUTPUT_TERMINAL)
        bTerminalID             3
        wTerminalType      0x0101 USB Streaming
        bAssocTerminal          0
        bSourceID               5
        iTerminal               0 
      AudioControl Interface Descriptor:
        bLength                 8
        bDescriptorType        36
        bDescriptorSubtype      6 (FEATURE_UNIT)
        bUnitID                 5
        bSourceID               1
        bControlSize            1
        bmaControls(0)       0x03
          Mute Control
          Volume Control
        iFeature                0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       0
      bNumEndpoints           0
      bInterfaceClass         1 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       1
      bNumEndpoints           1
      bInterfaceClass         1 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        16000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0044  1x 68 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       2
      bNumEndpoints           1
      bInterfaceClass         1 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        24000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0064  1x 100 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       3
      bNumEndpoints           1
      bInterfaceClass         1 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        32000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x0084  1x 132 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        3
      bAlternateSetting       4
      bNumEndpoints           1
      bInterfaceClass         1 
      bInterfaceSubClass      2 
      bInterfaceProtocol      0 
      iInterface              0 
      AudioStreaming Interface Descriptor:
        bLength                 7
        bDescriptorType        36
        bDescriptorSubtype      1 (AS_GENERAL)
        bTerminalLink           3
        bDelay                  1 frames
        wFormatTag         0x0001 PCM
      AudioStreaming Interface Descriptor:
        bLength                11
        bDescriptorType        36
        bDescriptorSubtype      2 (FORMAT_TYPE)
        bFormatType             1 (FORMAT_TYPE_I)
        bNrChannels             2
        bSubframeSize           2
        bBitResolution         16
        bSamFreqType            1 Discrete
        tSamFreq[ 0]        48000
      Endpoint Descriptor:
        bLength                 9
        bDescriptorType         5
        bEndpointAddress     0x84  EP 4 IN
        bmAttributes            5
          Transfer Type            Isochronous
          Synch Type               Asynchronous
          Usage Type               Data
        wMaxPacketSize     0x00c4  1x 196 bytes
        bInterval               4
        bRefresh                0
        bSynchAddress           0
        bMaxBurst               0
        AudioStreaming Endpoint Descriptor:
          bLength                 7
          bDescriptorType        37
          bDescriptorSubtype      1 (EP_GENERAL)
          bmAttributes         0x01
            Sampling Frequency
          bLockDelayUnits         0 Undefined
          wLockDelay         0x0000
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        4
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass       255 
      bInterfaceSubClass    255 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x83  EP 3 IN
        bmAttributes            2
          Transfer Type            Bulk
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0400  1x 1024 bytes
        bInterval               0
        bMaxBurst               0
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        5
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         3 
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
        HID Device Descriptor:
          bLength                 9
          bDescriptorType        33
          bcdHID               1.11
          bCountryCode            0 Not supported
          bNumDescriptors         1
          bDescriptorType        34 Report
          wDescriptorLength     108
         Report Descriptors: 
           ** UNAVAILABLE **
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x87  EP 7 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0002  1x 2 bytes
        bInterval               6
        bMaxBurst               0
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x0016
  bNumDeviceCaps          2
  USB 2.0 Extension Device Capability:
    bLength                 7
    bDescriptorType        16
    bDevCapabilityType      2
    bmAttributes   0x00000002
      HIRD Link Power Management (LPM) Supported
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x00
    wSpeedsSupported   0x000e
      Device can operate at Full Speed (12Mbps)
      Device can operate at High Speed (480Mbps)
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   2
      Lowest fully-functional device speed is High Speed (480Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat         256 micro seconds
Device Status:     0x0000
  (Bus Powered)

Bus 004 Device 001: ID 1d6b:0003 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.10
  bDeviceClass            9 
  bDeviceSubClass         0 
  bDeviceProtocol         3 
  bMaxPacketSize0         9
  idVendor           0x1d6b 
  idProduct          0x0003 
  bcdDevice            5.14
  iManufacturer           3 Linux 5.14.2-mh xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:06:00.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x001f
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
        bMaxBurst               0
Hub Descriptor:
  bLength              12
  bDescriptorType      42
  nNbrPorts             2
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  bHubDecLat          0.0 micro seconds
  wHubDelay             0 nano seconds
  DeviceRemovable    0x00
 Hub Port Status:
   Port 1: 0000.0203 lowspeed enable connect
   Port 2: 0000.02a0 lowspeed L1
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x002b
  bNumDeviceCaps          2
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x0008
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat         512 micro seconds
  SuperSpeedPlus USB Device Capability:
    bLength                28
    bDescriptorType        16
    bDevCapabilityType     10
    bmAttributes         0x00000023
      Sublink Speed Attribute count 3
      Sublink Speed ID count 1
    wFunctionalitySupport   0x1104
    bmSublinkSpeedAttr[0]   0x00050034
      Speed Attribute ID: 4 5Gb/s Symmetric RX SuperSpeed
    bmSublinkSpeedAttr[1]   0x000500b4
      Speed Attribute ID: 4 5Gb/s Symmetric TX SuperSpeed
    bmSublinkSpeedAttr[2]   0x000a4035
      Speed Attribute ID: 5 10Gb/s Symmetric RX SuperSpeedPlus
    bmSublinkSpeedAttr[3]   0x000a40b5
      Speed Attribute ID: 5 10Gb/s Symmetric TX SuperSpeedPlus
Device Status:     0x0001
  Self Powered

Bus 003 Device 001: ID 1d6b:0002 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 
  bDeviceSubClass         0 
  bDeviceProtocol         1 
  bMaxPacketSize0        64
  idVendor           0x1d6b 
  idProduct          0x0002 
  bcdDevice            5.14
  iManufacturer           3 Linux 5.14.2-mh xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:06:00.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
Hub Descriptor:
  bLength               9
  bDescriptorType      41
  nNbrPorts             2
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0x00
  PortPwrCtrlMask    0xff
 Hub Port Status:
   Port 1: 0000.0100 power
   Port 2: 0000.0100 power
Device Status:     0x0001
  Self Powered

Bus 002 Device 001: ID 1d6b:0003 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               3.00
  bDeviceClass            9 
  bDeviceSubClass         0 
  bDeviceProtocol         3 
  bMaxPacketSize0         9
  idVendor           0x1d6b 
  idProduct          0x0003 
  bcdDevice            5.14
  iManufacturer           3 Linux 5.14.2-mh xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:14.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x001f
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
        bMaxBurst               0
Hub Descriptor:
  bLength              12
  bDescriptorType      42
  nNbrPorts             8
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  bHubDecLat          0.0 micro seconds
  wHubDelay             0 nano seconds
  DeviceRemovable    0x00 0x00
 Hub Port Status:
   Port 1: 0000.02a0 5Gbps power Rx.Detect
   Port 2: 0000.02a0 5Gbps power Rx.Detect
   Port 3: 0000.02a0 5Gbps power Rx.Detect
   Port 4: 0000.02a0 5Gbps power Rx.Detect
   Port 5: 0000.02a0 5Gbps power Rx.Detect
   Port 6: 0000.02a0 5Gbps power Rx.Detect
   Port 7: 0000.02a0 5Gbps power Rx.Detect
   Port 8: 0000.02a0 5Gbps power Rx.Detect
Binary Object Store Descriptor:
  bLength                 5
  bDescriptorType        15
  wTotalLength       0x000f
  bNumDeviceCaps          1
  SuperSpeed USB Device Capability:
    bLength                10
    bDescriptorType        16
    bDevCapabilityType      3
    bmAttributes         0x02
      Latency Tolerance Messages (LTM) Supported
    wSpeedsSupported   0x0008
      Device can operate at SuperSpeed (5Gbps)
    bFunctionalitySupport   1
      Lowest fully-functional device speed is Full Speed (12Mbps)
    bU1DevExitLat          10 micro seconds
    bU2DevExitLat         512 micro seconds
Device Status:     0x0001
  Self Powered

Bus 001 Device 001: ID 1d6b:0002 Linux 5.14.2-mh xhci-hcd xHCI Host Controller
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            9 
  bDeviceSubClass         0 
  bDeviceProtocol         1 
  bMaxPacketSize0        64
  idVendor           0x1d6b 
  idProduct          0x0002 
  bcdDevice            5.14
  iManufacturer           3 Linux 5.14.2-mh xhci-hcd
  iProduct                2 xHCI Host Controller
  iSerial                 1 0000:00:14.0
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0019
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xe0
      Self Powered
      Remote Wakeup
    MaxPower                0mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           1
      bInterfaceClass         9 
      bInterfaceSubClass      0 
      bInterfaceProtocol      0 
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0004  1x 4 bytes
        bInterval              12
Hub Descriptor:
  bLength              13
  bDescriptorType      41
  nNbrPorts            16
  wHubCharacteristic 0x000a
    No power switching (usb 1.0)
    Per-port overcurrent protection
    TT think time 8 FS bits
  bPwrOn2PwrGood       10 * 2 milli seconds
  bHubContrCurrent      0 milli Ampere
  DeviceRemovable    0x00 0x00 0x00
  PortPwrCtrlMask    0xff 0xff 0xff
 Hub Port Status:
   Port 1: 0000.0100 power
   Port 2: 0000.0100 power
   Port 3: 0000.0100 power
   Port 4: 0000.0100 power
   Port 5: 0000.0100 power
   Port 6: 0000.0503 highspeed power enable connect
   Port 7: 0000.0100 power
   Port 8: 0000.0100 power
   Port 9: 0000.0100 power
   Port 10: 0000.0100 power
   Port 11: 0000.0100 power
   Port 12: 0000.0100 power
   Port 13: 0000.0100 power
   Port 14: 0000.0100 power
   Port 15: 0000.0100 power
   Port 16: 0000.0100 power
Device Status:     0x0001
  Self Powered
