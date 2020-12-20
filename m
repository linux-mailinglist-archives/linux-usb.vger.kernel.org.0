Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9542F2DF611
	for <lists+linux-usb@lfdr.de>; Sun, 20 Dec 2020 17:19:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727692AbgLTQTn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 20 Dec 2020 11:19:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:50312 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727468AbgLTQTm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 20 Dec 2020 11:19:42 -0500
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 210801] New: TopSeed Technology Corp. eHome Infrared
 Transceiver spams log with Error: urb status = -71
Date:   Sun, 20 Dec 2020 16:19:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hpj@urpla.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-210801-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210801

            Bug ID: 210801
           Summary: TopSeed Technology Corp. eHome Infrared Transceiver
                    spams log with Error: urb status = -71
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: hpj@urpla.net
        Regression: No

Hi,

using a TopSeed Technology Corp. eHome Infrared Transceiver here, my kernel log
is spammed with:

Dec 20 17:03:46 kernel: mceusb 6-10.4:1.0: Error: urb status = -71

with the rate of > 40/second.

Device is shown as:
Bus 006 Device 006: ID 1784:0006 TopSeed Technology Corp. eHome Infrared
Transceiver

lsusb -vs 006:048

Bus 006 Device 048: ID 1784:0006 TopSeed Technology Corp. eHome Infrared
Transceiver
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0 
  bDeviceSubClass         0 
  bDeviceProtocol         0 
  bMaxPacketSize0         8
  idVendor           0x1784 TopSeed Technology Corp.
  idProduct          0x0006 eHome Infrared Transceiver
  bcdDevice            1.01
  iManufacturer           1 TopSeed Technology Corp.
  iProduct                2 eHome Infrared Transceiver
  iSerial                 3 TS002j0C
  bNumConfigurations      1
  Configuration Descriptor:
    bLength                 9
    bDescriptorType         2
    wTotalLength       0x0020
    bNumInterfaces          1
    bConfigurationValue     1
    iConfiguration          0 
    bmAttributes         0xa0
      (Bus Powered)
      Remote Wakeup
    MaxPower              100mA
    Interface Descriptor:
      bLength                 9
      bDescriptorType         4
      bInterfaceNumber        0
      bAlternateSetting       0
      bNumEndpoints           2
      bInterfaceClass       255 Vendor Specific Class
      bInterfaceSubClass    255 Vendor Specific Subclass
      bInterfaceProtocol    255 Vendor Specific Protocol
      iInterface              0 
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x01  EP 1 OUT
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
      Endpoint Descriptor:
        bLength                 7
        bDescriptorType         5
        bEndpointAddress     0x81  EP 1 IN
        bmAttributes            3
          Transfer Type            Interrupt
          Synch Type               None
          Usage Type               Data
        wMaxPacketSize     0x0020  1x 32 bytes
        bInterval               0
can't get device qualifier: Resource temporarily unavailable
can't get debug descriptor: Resource temporarily unavailable
Device Status:     0x0001
  Self Powered

When plugged in, these messages are triggered:

Dec 20 17:13:57 kernel: usb 6-10.4: new full-speed USB device number 49 using
xhci_hcd
Dec 20 17:13:58 kernel: usb 6-10.4: config 1 interface 0 altsetting 0 endpoint
0x1 has an invalid bInterval 0, changing to 10
Dec 20 17:13:58 kernel: usb 6-10.4: config 1 interface 0 altsetting 0 endpoint
0x81 has an invalid bInterval 0, changing to 10
Dec 20 17:13:58 kernel: usb 6-10.4: New USB device found, idVendor=1784,
idProduct=0006, bcdDevice= 1.01
Dec 20 17:13:58 kernel: usb 6-10.4: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
Dec 20 17:13:58 kernel: usb 6-10.4: Product: eHome Infrared Transceiver
Dec 20 17:13:58 kernel: usb 6-10.4: Manufacturer: TopSeed Technology Corp.
Dec 20 17:13:58 kernel: usb 6-10.4: SerialNumber: TS002j0C
Dec 20 17:13:58 kernel: Registered IR keymap rc-rc6-mce
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: rc rc0: Media Center Ed. eHome Infrared Remote
Transceiver (1784:0006) as
/devices/pci0000:00/0000:00:14.0/usb6/6-10/6-10.4/6-10.4:1.0/rc/rc0
Dec 20 17:13:58 kernel: rc rc0: lirc_dev: driver mceusb registered at minor =
0, raw IR receiver, raw IR transmitter
Dec 20 17:13:58 kernel: input: Media Center Ed. eHome Infrared Remote
Transceiver (1784:0006) as
/devices/pci0000:00/0000:00:14.0/usb6/6-10/6-10.4/6-10.4:1.0/rc/rc0/input50
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Registered TopSeed Technology Corp.
eHome Infrared Transceiver with mce emulator interface version 1
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: 2 tx ports (0x0 cabled) and 2 rx
sensors (0x0 active)
Dec 20 17:13:58 mtp-probe[6430]: checking bus 6, device 49:
"/sys/devices/pci0000:00/0000:00:14.0/usb6/6-10/6-10.4"
Dec 20 17:13:58 mtp-probe[6430]: bus: 6, device: 49 was not an MTP device 
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 upowerd[5834]: treating change event as add on
/sys/devices/pci0000:00/0000:00:14.0/usb6/6-10/6-10.4
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: mce write urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 systemd-logind[1892]: Watching system buttons on
/dev/input/event26 (Media Center Ed. eHome Infrared Remote Transceiver
(1784:0006))
Dec 20 17:13:58 upowerd[5834]: treating change event as add on
/sys/devices/pci0000:00/0000:00:14.0/usb6/6-10/6-10.4/6-10.4:1.0
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 mtp-probe[6449]: checking bus 6, device 49:
"/sys/devices/pci0000:00/0000:00:14.0/usb6/6-10/6-10.4"
Dec 20 17:13:58 mtp-probe[6449]: bus: 6, device: 49 was not an MTP device 
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kcminit[6453]: Initializing  "kcm_mouse" :  "kcminit_mouse"
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:58 kernel: mceusb 6-10.4:1.0: Error: urb status = -71
Dec 20 17:13:59 kernel: mceusb 6-10.4:1.0: Error: urb status = -71


It used to work fine with earlier kernels.

openSUSE Tumbleweed 20201216
5.10.1-7-preempt #1 SMP PREEMPT Tue Dec 15 08:33:02 UTC 2020 (c8c5afb) x86_64
x86_64 x86_64 GNU/Linux

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
