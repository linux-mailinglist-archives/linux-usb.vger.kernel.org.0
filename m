Return-Path: <linux-usb+bounces-2406-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E167DD5CA
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 19:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27701C20CF7
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 18:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC2321364;
	Tue, 31 Oct 2023 18:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXLxsoTO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5785221113
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 18:07:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2F3FC433C8
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698775649;
	bh=LrId0kyTi/IpfBvWc+JVPhYjduwF8uz8B3ybq8KhXGo=;
	h=From:To:Subject:Date:From;
	b=GXLxsoTOhXHg1PR+NArEjCaUmtOLusY7/3ybUmIIuhmiDv+jpLN3tVPPVk0Ppc/aW
	 fcn0Xv2UZfcNbrM4LbXg+bQpLSm3n6QLBRZq1kSDWpzHRlit+RCHiMmpIOxRTyPYpJ
	 QBKQZfUci+xOQBP/vpQ8dKTPPcR30z7whV2nbbhbkYxCbGnbp5DoMneuuYL6UIfBEJ
	 sCC2C1neeIC4fh06tjxFGVIpyCOYGdDHlzVpsjUXoFSw1W2fM4HVNOtcmPmyuLn0hG
	 KMjqKHZCqxUBrO5e6xhD7f2FQ3LAe5wSaMzVMxtY0oG0pHLepgWlbw+JtRQDJVZHD4
	 Vc5DNNuLHxupw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A199BC4332E; Tue, 31 Oct 2023 18:07:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218093] New: Keyboard will not register any input after using
 certain FN-Combos
Date: Tue, 31 Oct 2023 18:07:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kotversuchung@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218093-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D218093

            Bug ID: 218093
           Summary: Keyboard will not register any input after using
                    certain FN-Combos
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kotversuchung@gmail.com
        Regression: No

MSI B550 A-Pro Motherboard
Sharkoon SGK3 Keyboard

I pretty much tried all Kernels. The Issue is always the same:

When pressing a FN-Combo for the Keyboard-LEDs in my Case FN+=3D. The keybo=
ard
might not be able to send any more input. "Normal" Combos like using the FN=
 key
to increase or decrease  the Volume like FN+F2/F3 will not cause this issue=
.=20
When checking with tools like evtest i noticed that sometimes no release
command of the keyboard is received and it spams the Terminal while no more
other input is recognized. Connecting the Keyboard to a USB3 Port (instead =
of
the USB "Keyboard Port") the keyboard stays responsive though you'll still =
see
the "terminal spam" caused by no release event.

I tried blacklisting certain combos so that i wouldn't accidently hit that =
key
though it just doesn't help. To be honest it seems to me that Linux
recognizes/receives that it shouldn't. Because even if the Input "freezes" =
i'm
still able to change the LED-Behaviour of the Keyboard..=20
On Windows this issue doesn't exist. So i'm pretty certain that it is relat=
ed
to Linux in some way. I also tried an Uefi-Update yet the Issue persisted.
I'm by no means a "Linux Pro" and actually have no clue what else i could t=
ry.
So i just wanted to report that here in case someone else is having this is=
sue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

