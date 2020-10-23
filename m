Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3D642977EC
	for <lists+linux-usb@lfdr.de>; Fri, 23 Oct 2020 21:57:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755208AbgJWT4C convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 23 Oct 2020 15:56:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:35916 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755205AbgJWT4A (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Oct 2020 15:56:00 -0400
From:   bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-usb@vger.kernel.org
Subject: [Bug 209835] New: Logitech G11 Keyboard's G Keys stopped working
 since support of G15/G510 keyboard was added to the kernel
Date:   Fri, 23 Oct 2020 19:55:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: phobosk@fastmail.fm
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-209835-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=209835

            Bug ID: 209835
           Summary: Logitech G11 Keyboard's G Keys stopped working since
                    support of G15/G510 keyboard was added to the kernel
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.9.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: phobosk@fastmail.fm
        Regression: No

Ever since support for Logitech G15/G510 G keys was added to the kernel, my
Logitech G11's G keys stopped working.
This is because the hid-lg-g15 loads and "steals" the keys, but it cannot
activate the M1, M2, M3, MR keys (the latter is just my guess).
When I blacklist the module hid-lg-g15, the keys start working normally again
(I use also hwdb to remap them)

Here is more info:
Kernel: 5.9.1
Last kernel working: 5.5.2 ( the hid-lg-g15.mod.c is still missing the line
MODULE_ALIAS("hid:b0003g*v0000046Dp0000C225"); )


The G keys input device (with blacklisted hid-lg-g15):

I: Bus=0003 Vendor=046d Product=c225 Version=0111
N: Name="G11 Keyboard Keypad"
P: Phys=usb-0000:00:12.0-5.4/input0
S:
Sysfs=/devices/pci0000:00/0000:00:12.0/usb6/6-5/6-5.4/6-5.4:1.0/0003:046D:C225.000E/input/input45
U: Uniq=
H: Handlers=sysrq kbd event4
B: PROP=0
B: EV=100013
B: KEY=100043d900c07 ff980000003007ff febeffdffe6fffe0 7ffffffffffff02
B: MSC=10

The other entries for the keyboard:

I: Bus=0003 Vendor=046d Product=c221 Version=0110
N: Name="Gaming Keyboard"
P: Phys=usb-0000:00:12.0-5.1/input0
S:
Sysfs=/devices/pci0000:00/0000:00:12.0/usb6/6-5/6-5.1/6-5.1:1.0/0003:046D:C221.000C/input/input42
U: Uniq=
H: Handlers=sysrq kbd leds event2
B: PROP=0
B: EV=120013
B: KEY=1000000000007 ff800000000007ff febeffdfffefffff fffffffffffffffe
B: MSC=10
B: LED=1f

I: Bus=0003 Vendor=046d Product=c221 Version=0110
N: Name="Gaming Keyboard Consumer Control"
P: Phys=usb-0000:00:12.0-5.1/input1
S:
Sysfs=/devices/pci0000:00/0000:00:12.0/usb6/6-5/6-5.1/6-5.1:1.1/0003:046D:C221.000D/input/input43
U: Uniq=
H: Handlers=kbd event3
B: PROP=0
B: EV=13
B: KEY=7800000000 e000000000000 0
B: MSC=10


lsusb:
Bus 006 Device 016: ID 046d:c225 Logitech, Inc. G11/G15 Keyboard / G keys
Bus 006 Device 015: ID 046d:c221 Logitech, Inc. G11/G15 Keyboard / Keyboard
Bus 006 Device 014: ID 046d:c223 Logitech, Inc. G11/G15 Keyboard / USB Hub


the evtest with the loaded hid-lg-g15 module produces only one type of entries
like:
type 1 (EV_KEY), code 656 (??), value 1
-------------- SYN_REPORT ------------
type 1 (EV_KEY), code 656 (??), value 0
-------------- SYN_REPORT ------------

for G1 and for G18:

type 1 (EV_KEY), code 673 (??), value 1
-------------- SYN_REPORT ------------
type 1 (EV_KEY), code 673 (??), value 0
-------------- SYN_REPORT ------------

The M1,M2,M3 and MR keys also produce such entries + their leds do not work at
all...


As I said a workaround for me is to blacklist the hid-lg-g15 module, but could
this module be made to be more precise when loading and not load for the G11
keyboard?

Another thing is if you want I may help (by testing mainly :) ) in adding
support to this module for the G11 keyboard?

Thanks

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
