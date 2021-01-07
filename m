Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 680682ED14F
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jan 2021 15:03:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbhAGODN convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 7 Jan 2021 09:03:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:36736 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728517AbhAGODN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Jan 2021 09:03:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8B02C23142
        for <linux-usb@vger.kernel.org>; Thu,  7 Jan 2021 14:02:32 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 7AAB781F02; Thu,  7 Jan 2021 14:02:32 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210801] TopSeed Technology Corp. eHome Infrared Transceiver
 spams log with Error: urb status = -71
Date:   Thu, 07 Jan 2021 14:02:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210801-208809-jFiHs4J6vZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210801-208809@https.bugzilla.kernel.org/>
References: <bug-210801-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=210801

--- Comment #5 from Hans-Peter Jansen (hpj@urpla.net) ---
Okay, reverting 528222d853f92 does the trick. 

My RC is working fine again for VDR, I can pull and plug the RC controller, VDR
is complaining, but after restarting VDR, all is fine again. 

This is the kernel log of pulling and plugging the RC controller:
```
[    4.903556] rc rc0: lirc_dev: driver mceusb registered at minor = 0, raw IR
receiver, raw IR transmitter
[    5.084059] mceusb 5-10.4:1.0: long-range (0x1) receiver active
[    5.127510] mceusb 5-10.4:1.0: Registered TopSeed Technology Corp. eHome
Infrared Transceiver with mce emulator interface version 1
[    5.127512] mceusb 5-10.4:1.0: 2 tx ports (0x0 cabled) and 2 rx sensors (0x1
active)
[    5.127530] usbcore: registered new interface driver mceusb
[ 1537.725685] mceusb 5-10.4:1.0: Error: urb status = -71
[ 1537.733681] mceusb 5-10.4:1.0: Error: urb status = -71
[ 1537.741680] mceusb 5-10.4:1.0: Error: urb status = -71
[ 1537.749683] mceusb 5-10.4:1.0: Error: urb status = -71
[ 1537.757670] mceusb 5-10.4:1.0: Error: urb status = -71
[ 1537.765684] mceusb 5-10.4:1.0: Error: urb status = -71
[ 1537.773662] mceusb 5-10.4:1.0: Error: urb status = -71
[ 1537.781659] mceusb 5-10.4:1.0: Error: urb status = -71
[ 1537.789654] mceusb 5-10.4:1.0: Error: urb status = -71
[ 1540.361827] rc rc0: lirc_dev: driver mceusb registered at minor = 0, raw IR
receiver, raw IR transmitter
[ 1540.541769] mceusb 5-10.4:1.0: long-range (0x1) receiver active
[ 1540.585785] mceusb 5-10.4:1.0: Registered TopSeed Technology Corp. eHome
Infrared Transceiver with mce emulator interface version 1
[ 1540.585787] mceusb 5-10.4:1.0: 2 tx ports (0x0 cabled) and 2 rx sensors (0x1
active)
```

With 528222d853f92 applied, I wasn't able to recover at all, I had to stop VDR
and pulling the RC controller in order to stop flooding the log with the urb
status = -71 errors.

Sean, do you have any idea, what could have changed with 528222d853f92
resulting in this behavior?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
