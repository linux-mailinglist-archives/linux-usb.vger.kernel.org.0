Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A47530B60E
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 04:51:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229872AbhBBDtr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Feb 2021 22:49:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:44700 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229614AbhBBDtp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Feb 2021 22:49:45 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A22A064ED5
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 03:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612237744;
        bh=VadDrJvAeKZpZvI0QjNr882xU47rVuQjvEynCPbsMgY=;
        h=From:To:Subject:Date:From;
        b=YSmoZW8fI36n2sbXjeRbET5zTnrYqKrgij/emuZNcgxbTCxi0KN+HDyBEw5yqcSKi
         39XBsGqsCvoNXGULtSzELgQ70NC+pipRDraAWS+zLjdJduQg27qnf1qIT0gFOQ5HKm
         29jG/0Nsnk/8HuMLwNhUDl3uDaft4zoDqd3tR+rpnJYwzElZvp+DMg/k+O0TyssmG5
         SNvZ0okAO7dlLxQ7H953aWO+9mfKjyf85Dhd61/iLjrMnF/jJExHC1uHuHxDIH8iX1
         0u5pzg/0/NUKVHe/8Hkp1gxcw/Ht8/KiJtaiwfLBLsbnL6BRwDJBQxXG5R6S6VFW8m
         jeHRSuAohm+LQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8BB9A65303; Tue,  2 Feb 2021 03:49:04 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 211525] New: USB Canon DSLR camera seen (lsusb/dmesg) but no
 longer accessible (not mountable)
Date:   Tue, 02 Feb 2021 03:49:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: lgd.beauchamp@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-211525-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D211525

            Bug ID: 211525
           Summary: USB Canon DSLR camera seen (lsusb/dmesg) but no longer
                    accessible (not mountable)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.0-65-generic
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: blocking
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: lgd.beauchamp@gmail.com
        Regression: No

I use a DSLR Canon EOS 77D without any problem since I installed Linux on my
computer (now I have Kubuntu 20.04LTS, kernel 5.4.0-65-generic). Tonight I
tried to communicate with it with the application gphoto2, its library
libgphoto2 and simply by mounting it to access the photographs on the SD ca=
rd
and it no longer works.


1) I see the camera with lsusb and dmesg.

2) The "new device" pop-up indicates when I plug it.

3) It is not mounted correctly, I cannot see it in the file system.

4) If I try to communicate with it using gphoto2 it fails ("the indicated p=
ort
is not found")

This was performed on a desktop with a MSI motherboard MPG Z390 Gaming Plus,
with a Core I7 9700K if it can be of any help...

I tried the same operations on a Raspberry Pi 4B and I succeeded, no proble=
m. I
also succeeded on Win 10 (sorry...! ;-) ) so I can assume it is not the DSLR
that is faulty. I tried many ports on my computer, with and without a hub, =
and
it always shows the same behavior.

I would like to precise that my system is up-to-date, I performed a few apt
update/upgrade during the tries.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
