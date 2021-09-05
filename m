Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CB9A400DCF
	for <lists+linux-usb@lfdr.de>; Sun,  5 Sep 2021 04:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233055AbhIECgp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Sep 2021 22:36:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:43782 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230185AbhIECgp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 4 Sep 2021 22:36:45 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 8A25A60FD7
        for <linux-usb@vger.kernel.org>; Sun,  5 Sep 2021 02:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630809342;
        bh=hEMHblbdDuhFuY5NwPw2x0fjwZqDhJZ8OvtocpJog8M=;
        h=From:To:Subject:Date:From;
        b=RO4NpCCGJSKX1XvAykyTuYHScXxbp8d//5k1d1B1D5lmsh+8VszRtxmj/tBj4tSzU
         hZhVaVPMUTwPVCbPRBgKW9W42CcLBzO/V1l872kKuwFICT8VDRlS8k2wLxZeQM7mx/
         wps82xqJmxWkGeFxjdP0bMbDZ1Ylvj1/f/Rl4MjADEH1iqV891VVnbW97HyZMCKL1i
         xcZrJ0evBIaxiEhplDhvxRN1cOkow157cHNJ0+Blv/MYmbKNPA25iuMKs6YlO+bLGq
         usfPBMHz67EBljHNGrFY6ddTdJ3b+jb6yv7HFNUHP2nUgbY0anxHNIM/1VuFA+drwZ
         6e+an//KxudiQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7238D60E78; Sun,  5 Sep 2021 02:35:42 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214313] New: APC UPS USB connection is causing hid-generic
 errors: usb_submit_urb(ctrl) failed / control queue full
Date:   Sun, 05 Sep 2021 02:35:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-214313-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214313

            Bug ID: 214313
           Summary: APC UPS USB connection is causing hid-generic errors:
                    usb_submit_urb(ctrl) failed / control queue full
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.14.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: shtetldik@gmail.com
        Regression: No

Since kernel 5.14.x, dmesg is spammed with hid-generic errors. Here are the
relevant parts:

[    3.847150] usbhid: USB HID core driver
[    3.848424] hid-generic 0003:051D:0002.0001: hiddev0,hidraw0: USB HID v1=
.00
Device [American Power Conversion Back-UPS RS 1500MS FW:952.e3 .D USB FW:e3=
=20=20=20=20
] on usb-0000:09:00.3-4/input0
...
[   18.251610] usb 5-3: reset high-speed USB device number 4 using xhci_hcd
[   18.341396] hid-generic 0003:051D:0002.0001: usb_submit_urb(ctrl) failed:
-53
...
[   28.587367] hid-generic 0003:051D:0002.0001: control queue full

Device identified by lsusb:

051d:0002 American Power Conversion Uninterruptible Power Supply

It works perfectly fine with 5.13.x so it must be some regression in 5.14?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
