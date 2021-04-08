Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C68B7358D7E
	for <lists+linux-usb@lfdr.de>; Thu,  8 Apr 2021 21:30:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232748AbhDHTa0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Apr 2021 15:30:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:50208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231420AbhDHTaZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Apr 2021 15:30:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 67A76610E6
        for <linux-usb@vger.kernel.org>; Thu,  8 Apr 2021 19:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617910214;
        bh=euLfiPNGSIYfVa+dE5R58hj3+IMWSyAPEzEL6hzskyw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=G42gvYGRZfkR0XAnUAFEQ4bjjWv66rfkdzRVC/FlWHh0LKnFWrSw92xawhLwaRVZV
         I9+dSaGRDukSGlXoOWsXSU6OfqOtlMq2g98YOx4z3mjfkZpW9NGkIEvXCtS9o0ZCbw
         /RmN7OIgSEnStxIguXbyjXMxJdEamS5oC2lS5XuN6IG8qNVQUAnAuaMCYxSYC5WuzO
         D2RmVqzsYMSOSZu+x+Ou3y3uqRvyijf7JGZe4HszMNbtMb5mNc7xh9WYGheT5c8O5S
         BEGnMKUoS3EJkl83vqj8iDYthd5NWr7WDmmhsXQ2AocVyvE3Ve7KYdPVeZyAro49eK
         l9dSisj3NUbDg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5BB9461131; Thu,  8 Apr 2021 19:30:14 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Thu, 08 Apr 2021 19:30:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jonathan.chen@alumni.purdue.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207887-208809-dzCgwQxkxH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207887-208809@https.bugzilla.kernel.org/>
References: <bug-207887-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207887

jcchen (jonathan.chen@alumni.purdue.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jonathan.chen@alumni.purdue
                   |                            |.edu

--- Comment #10 from jcchen (jonathan.chen@alumni.purdue.edu) ---
I also have this issue- TEX Shinobi connected through a USB3 hub to a Think=
pad
X13 AMD Gen 1 (Fedora 33, kernel 5.11.11 but have experienced this back to =
at
least 5.9).  Previously, I had thought a USB Dock to also be at fault, but =
the
issue also occurs with a usb 4-port hub.=20=20

The last dmesg before the keyboard stops responding is a usb device reset:
  usb 6-2.4: reset full-speed USB device number 11 using xhci_hcd

In my case, it also causes udisksd to block on IO which ultimately prevents=
 a
clean shutdown.  I'm also interested in helping debug the issue but would n=
eed
some guidance.

Here are the things I'm going to try:
Per Alan's suggestion in #8, enabling Mass Storage mode (DIP 6 =3D on, per =
the
manual [https://tex.com.tw/pages/user-manual]).  This shows a 448KB disk (as
apposed to 'no media') and the keyboard continues to work.
Move other devices to a different USB hub (just keyboard -> hub -> computer)
Directly connect keyboard (expect the issue to not occur)

Thanks and best regards,
Jonathan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
