Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82016205A63
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jun 2020 20:17:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733176AbgFWSRp convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 23 Jun 2020 14:17:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:54864 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728916AbgFWSRo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jun 2020 14:17:44 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 208305] New: HID++ device behind a USB C hub fails to properly
 initialize
Date:   Tue, 23 Jun 2020 18:17:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mcgrof@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208305-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=208305

            Bug ID: 208305
           Summary: HID++ device behind a USB C hub fails to properly
                    initialize
           Product: Drivers
           Version: 2.5
    Kernel Version: v5.7.5
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mcgrof@kernel.org
        Regression: No

I've purchased now about 3 different wireless mice, and they work gloriously if
I connect them onto my laptop directly onto one of its USB C ports. Mind you
the mice are USB, they come with a USB to USB converter. This works well,
however if you run low on USB C ports you'll need a USB HUB.

I've now tried two USB C HUBs, and when I connect the USB mice on the USB HUBs
the device initialize and *sometimes* you get to finagle movement out of them
but its clearly not working as expected.

This should be easily reproducible with any HID++ mice connected to a USB C
hub.

This is what I get from a full journalctl -f output for example if I connect
the mice directly to the laptop:

May 29 21:02:15 phoebe kernel: usb 1-1: new full-speed USB device number 29
using xhci_hcd
May 29 21:02:15 phoebe kernel: usb 1-1: New USB device found, idVendor=046d,
idProduct=c52b, bcdDevice=24.07
May 29 21:02:15 phoebe kernel: usb 1-1: New USB device strings: Mfr=1,
Product=2, SerialNumber=0
May 29 21:02:15 phoebe kernel: usb 1-1: Product: USB Receiver                   
May 29 21:02:15 phoebe kernel: usb 1-1: Manufacturer: Logitech                  
May 29 21:02:15 phoebe kernel: logitech-djreceiver 0003:046D:C52B.0030:
hiddev0,hidraw4: USB HID v1.11 Device [Logitech USB Receiver] on
usb-0000:00:14.0-1/input2
May 29 21:02:15 phoebe mtp-probe[8911]: checking bus 1, device 29:
"/sys/devices/pci0000:00/0000:00:14.0/usb1/1-1"
May 29 21:02:15 phoebe mtp-probe[8911]: bus: 1, device: 29 was not an MTP
device
May 29 21:02:15 phoebe kernel: input: Logitech M570 as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.2/0003:046D:C52B.0030/0003:046D:1028.0031/input/input64
May 29 21:02:15 phoebe kernel: logitech-hidpp-device 0003:046D:1028.0031:
input,hidraw5: USB HID v1.11 Mouse [Logitech M570] on
usb-0000:00:14.0-1/input2:1
May 29 21:02:15 phoebe mtp-probe[8925]: checking bus 1, device 29:
"/sys/devices/pci0000:00/0000:00:14.0/usb1/1-1"
May 29 21:02:15 phoebe mtp-probe[8925]: bus: 1, device: 29 was not an MTP
device
May 29 21:02:15 phoebe solaar[1995]: gtk_widget_get_scale_factor: assertion
'GTK_IS_WIDGET (widget)' failed
May 29 21:02:15 phoebe solaar[1995]: gtk_widget_get_scale_factor: assertion
'GTK_IS_WIDGET (widget)' failed
May 29 21:02:48 phoebe kernel: logitech-hidpp-device 0003:046D:1028.0031: HID++
1.0 device connected.

The last line does not appear if I use a USB C hub:
May 29 21:03:42 phoebe kernel: usb 1-6.3: new full-speed USB device number 30
using xhci_hcd
May 29 21:03:43 phoebe kernel: usb 1-6.3: New USB device found, idVendor=046d,
idProduct=c52b, bcdDevice=24.07
May 29 21:03:43 phoebe kernel: usb 1-6.3: New USB device strings: Mfr=1,
Product=2, SerialNumber=0
May 29 21:03:43 phoebe kernel: usb 1-6.3: Product: USB Receiver                 
May 29 21:03:43 phoebe kernel: usb 1-6.3: Manufacturer: Logitech                
May 29 21:03:43 phoebe kernel: logitech-djreceiver 0003:046D:C52B.0034:
hiddev0,hidraw4: USB HID v1.11 Device [Logitech USB Receiver] on
usb-0000:00:14.0-6.3/input2
May 29 21:03:43 phoebe mtp-probe[8991]: checking bus 1, device 30:
"/sys/devices/pci0000:00/0000:00:14.0/usb1/1-6/1-6.3"
May 29 21:03:43 phoebe mtp-probe[8991]: bus: 1, device: 30 was not an MTP
device
May 29 21:03:43 phoebe kernel: input: Logitech M570 as
/devices/pci0000:00/0000:00:14.0/usb1/1-6/1-6.3/1-6.3:1.2/0003:046D:C52B.0034/0003:046D:1028.0035/input/input65
May 29 21:03:43 phoebe kernel: logitech-hidpp-device 0003:046D:1028.0035:
input,hidraw5: USB HID v1.11 Mouse [Logitech M570] on
usb-0000:00:14.0-6.3/input2:1
May 29 21:03:43 phoebe mtp-probe[9003]: checking bus 1, device 30:
"/sys/devices/pci0000:00/0000:00:14.0/usb1/1-6/1-6.3"
May 29 21:03:43 phoebe mtp-probe[9003]: bus: 1, device: 30 was not an MTP
device
May 29 21:03:43 phoebe solaar[1995]: gtk_widget_get_scale_factor: assertion
'GTK_IS_WIDGET (widget)' failed
May 29 21:03:43 phoebe solaar[1995]: gtk_widget_get_scale_factor: assertion
'GTK_IS_WIDGET (widget)' failed

Given this is super easy to reproduce I figured this should be most of the
information needed, let me know if you need more.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
