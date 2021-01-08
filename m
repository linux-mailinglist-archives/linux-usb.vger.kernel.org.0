Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 784C22EF99A
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jan 2021 21:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729201AbhAHUx2 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Fri, 8 Jan 2021 15:53:28 -0500
Received: from mail.kernel.org ([198.145.29.99]:50188 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729181AbhAHUx2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Jan 2021 15:53:28 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 68F9423A80
        for <linux-usb@vger.kernel.org>; Fri,  8 Jan 2021 20:52:47 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5D69E8162A; Fri,  8 Jan 2021 20:52:47 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211097] New: Resume from suspend sometimes makes some programs
 freeze for 30s
Date:   Fri, 08 Jan 2021 20:52:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yesmichel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-211097-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=211097

            Bug ID: 211097
           Summary: Resume from suspend sometimes makes some programs
                    freeze for 30s
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.10
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: yesmichel@gmail.com
        Regression: No

Created attachment 294577
  --> https://bugzilla.kernel.org/attachment.cgi?id=294577&action=edit
dmesg

Sometimes (it seems random but let's say about 50% of the time), when my system
resumes from suspend, some programs are frozen for about 30s, then become
usable again after that. 
When I say "some programs", I actually mean 2 programs in particular:
plasmashell and lsusb. When they are frozen, I can use pretty much any other
program in the meantime, firefox, dolphin, kwin, etc... without any visible
problem.


What I noticed is that after a freeze, dmesg always ouputs the following
messages several times:
[43629.789713] usb usb3-port4: Cannot enable. Maybe the USB cable is bad?
[43633.849690] usb usb3-port4: Cannot enable. Maybe the USB cable is bad?
[43633.849786] usb usb3-port4: unable to enumerate USB device
And when I check lsusb on that bus it say: 
 Hub Port Status:
   Port 1: 0000.02a0 5Gbps power Rx.Detect
   Port 2: 0000.02a0 5Gbps power Rx.Detect
   Port 3: 0000.02b0 5Gbps power Rx.Detect RESET
   Port 4: 0000.02b0 5Gbps power Rx.Detect RESET
I don't know what RESET is exactly (a state I assume), but when I resume and
the issue doesn't happen, I get this ouput instead:
 Hub Port Status:
   Port 1: 0000.02a0 5Gbps power Rx.Detect
   Port 2: 0000.02a0 5Gbps power Rx.Detect
   Port 3: 0000.02b0 5Gbps power Rx.Detect
   Port 4: 0000.02b0 5Gbps power Rx.Detect


Additional info:
The bug can happen wether something is plugged in the usb ports or not.
(Besides the webcam and the touchscreen, always plugged internally)
The bug was introduced in kernel 5.9.0. I've been able to reproduce with every
kernel release (from the archlinux repositories) after that. I can't reproduce
with an older kernel.
I'm not sure if this this is actually usb related, but given what I've written
above, I tend to think so. But feel free to reassign to another component if
needed.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
