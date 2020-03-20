Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D375F18DA99
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2020 22:54:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726855AbgCTVys convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 20 Mar 2020 17:54:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:44908 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726666AbgCTVys (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Mar 2020 17:54:48 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 206897] New: Huion tablet not recognized from kernel 5.3.1
Date:   Fri, 20 Mar 2020 21:54:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hebm12@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-206897-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=206897

            Bug ID: 206897
           Summary: Huion tablet not recognized from kernel 5.3.1
           Product: Drivers
           Version: 2.5
    Kernel Version: from 5.3.1 to 5.6-rc6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: hebm12@gmail.com
        Regression: No

Hi Kernel Experts!

My Huion 1060plus tablet is not recognized from kernel version 5.3.1

dmesg output is:


[ 4168.587592] usb 1-1.1: new full-speed USB device number 13 using xhci_hcd
[ 4168.990456] usb 1-1.1: New USB device found, idVendor=256c, idProduct=006e,
bcdDevice=30.00
[ 4168.990461] usb 1-1.1: New USB device strings: Mfr=5, Product=6,
SerialNumber=0
[ 4168.990463] usb 1-1.1: Product: PenTablet 
[ 4169.003082] usb 1-1.1: can't set config #1, error -32


Previous working versions have this output:

[   62.724538] usb 2-3.1: new full-speed USB device number 3 using xhci_hcd
[   62.851463] usb 2-3.1: New USB device found, idVendor=256c, idProduct=006e,
bcdDevice=30.00
[   62.851470] usb 2-3.1: New USB device strings: Mfr=5, Product=6,
SerialNumber=0
[   62.851475] usb 2-3.1: Product: PenTablet 
[   62.909757] hidraw: raw HID events driver (C) Jiri Kosina
[   62.929599] usbcore: registered new interface driver usbhid
[   62.929601] usbhid: USB HID core driver
[   62.939433] input: PenTablet  as
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1:1.0/0003:256C:006E.0001/input/input15
[   62.939691] input: PenTablet  Mouse as
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1:1.0/0003:256C:006E.0001/input/input16
[   62.939804] hid-generic 0003:256C:006E.0001: input,hidraw0: USB HID v1.11
Mouse [PenTablet ] on usb-0000:00:14.0-3.1/input0
[   62.943515] input: PenTablet  Mouse as
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1:1.1/0003:256C:006E.0002/input/input17
[   62.943646] input: PenTablet  as
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1:1.1/0003:256C:006E.0002/input/input18
[   62.943805] hid-generic 0003:256C:006E.0002: input,hiddev0,hidraw1: USB HID
v1.11 Mouse [PenTablet ] on usb-0000:00:14.0-3.1/input1
[   62.944370] input: PenTablet  Keyboard as
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1:1.2/0003:256C:006E.0003/input/input19
[   62.951136] usb 2-3.4: new high-speed USB device number 4 using xhci_hcd
[   62.997966] input: PenTablet  Consumer Control as
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1:1.2/0003:256C:006E.0003/input/input20
[   62.998070] input: PenTablet  System Control as
/devices/pci0000:00/0000:00:14.0/usb2/2-3/2-3.1/2-3.1:1.2/0003:256C:006E.0003/input/input21
[   62.998161] hid-generic 0003:256C:006E.0003: input,hidraw2: USB HID v1.0b
Keyboard [PenTablet ] on usb-0000:00:14.0-3.1/input2


Looking further down, the commit that creates the problem is (thanks to
https://bbs.archlinux.org/viewtopic.php?pid=1878478#p1878478):

commit ef513be0a9057cc6baf5d29566aaaefa214ba344
Author: Jim Lin <jilin@nvidia.com>
Date:   Mon Jun 3 18:53:44 2019 +0800

    usb: xhci: Add Clear_TT_Buffer

    USB 2.0 specification chapter 11.17.5 says "as part of endpoint halt
    processing for full-/low-speed endpoints connected via a TT, the host
    software must use the Clear_TT_Buffer request to the TT to ensure
    that the buffer is not in the busy state".

    In our case, a full-speed speaker (ConferenceCam) is behind a high-
    speed hub (ConferenceCam Connect), sometimes once we get STALL on a
    request we may continue to get STALL with the folllowing requests,
    like Set_Interface.

    Here we invoke usb_hub_clear_tt_buffer() to send Clear_TT_Buffer
    request to the hub of the device for the following Set_Interface
    requests to the device to get ACK successfully.

    Signed-off-by: Jim Lin <jilin@nvidia.com>
    Acked-by: Mathias Nyman <mathias.nyman@linux.intel.com>
    Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

drivers/usb/host/xhci-ring.c | 27 ++++++++++++++++++++++++++-
drivers/usb/host/xhci.c      | 21 +++++++++++++++++++++
drivers/usb/host/xhci.h      |  5 +++++
3 files changed, 52 insertions(+), 1 deletion(-)


Thanks for your help!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
