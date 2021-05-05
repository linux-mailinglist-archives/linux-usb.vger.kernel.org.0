Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E22D3748BE
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 21:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbhEETf5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 15:35:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:34590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229579AbhEETf4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 May 2021 15:35:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A2DC261076
        for <linux-usb@vger.kernel.org>; Wed,  5 May 2021 19:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620243299;
        bh=dEePEeTvkaGZWi6qTZ+H3JIeIhPpy3dfl33ioaqzN+c=;
        h=From:To:Subject:Date:From;
        b=mgbejfD7oSCLhEVcHWywlCAiHTVG57feOUwmH711z8Q0GVDDEJTzctBhGq6Ikdlit
         Oa+X0QI+NrX8hBV/nazK3wiEUzG7IYuCWmvBHMDqalFxSz0rAhAaifHSQozt74hII1
         VDIPWN11R0vbJZeX0ckvO4EU3kPCtJ92AwpVQro2/FKTgxJ7T0fCegpZ1Ki+6n1XhS
         6WUca1kQnObFj1UM+m640w8Id01ZUx0P6H6pDLxjMl4fYHmu1SsKv6VtvN3qYYz1Uq
         y3Dy6GZfxV/p/jTTpW6umB80xt3JuUVrSRobpNwumg+oWGPv0J9Z1U6QkQNCuyXKfG
         2HSwrIp2DckHQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 8B51161263; Wed,  5 May 2021 19:34:59 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] New: Possible kernel regression USB2 (not USB3) port
 EDIROL UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Wed, 05 May 2021 19:34:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

            Bug ID: 212955
           Summary: Possible kernel regression USB2 (not USB3) port EDIROL
                    UA-101 (in USB 1.1 mode, not USB2) error -110
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.12.0-rc8-next-20210422
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jaffa225man@gmail.com
        Regression: No

While working helping to figure out universal EDIROL/Roland/BOSS snd-usb-au=
dio
support, I noticed a new issue with the last kernel.  Prior to using kernel
5.12.0-rc8-next-20210422, I'd been using 5.9.0-1-rt-amd64 from Debian's
package, and it worked on it.  I have a recollection of it working on kernel
5.11 too, but I'm away from the testing computer and don't have any notes o=
n it
at the moment.

The EDIROL UA-101 has a physical switch which sets it to either "Full speed"
(USB 1.1) mode, or "High speed" (USB 2) mode.  High Speed mode works on all
kernels, but its Full speed mode only works either with prior kernels (both
USB2 & USB3 port versions) or only USB3 ports on the current kernel.  These
results are unvaried and quite reproducible on my hardware.

Whatever causes it, breaks both capture and playback, but here's just a cap=
ture
example:

arecord -D plughw:UA101 -f S24_3LE -r 48000 -c 2 ./file.wav
arecord: main:830: audio open error: Connection timed out

(dmesg:)
[  188.956481] usb 4-1.5: cannot initialize interface; error -110: unknown
error
[  194.076450] usb 4-1.5: cannot initialize interface; error -110: unknown
error
[  199.196407] usb 4-1.5: cannot initialize interface; error -110: unknown
error

I have yet to narrow down the cause in the code, but plan to try eventually.

Takashi Iwai on the alsa-devel list, had this suggestion for me:
The error -110 is ETIMEDOUT, and the symptom implies that the problem
is rather in USB core side.  You'd better ask USB devs.  It might be
worth to run git bisect if it's a kernel regression and reliably
reproducible.

It seems I need the git repository to use bisect, and the sheer bandwidth
required would take me days or perhaps a week downloading, so if you can
suggest a method of downloading just the past 5.11.0 to 5.12.0 history I'd =
be
happy to do that.

I'll be glad to test whatever you wish, thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
