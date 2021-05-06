Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCAE93757D0
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 17:45:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235712AbhEFPqj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 11:46:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:52878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235136AbhEFPqj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 11:46:39 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 2C051610A1
        for <linux-usb@vger.kernel.org>; Thu,  6 May 2021 15:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620315941;
        bh=n8GPl5X+63tgsH7iCGCztHY8aQi/4hgCEO3XA3ZqDs0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=t4Uu5r0FNaVGh+n2i4GWFmfl0m7yBNjjDc2v/VjybnQRYtdskvTaOxsFWuCfkiVs2
         AxBVAVN3ubwXtxmcJzu4UOHMi6zwIo15J+Vn4Nm5svWFSvCdtMIiizxhaEMRFLL40x
         R1pcK0aE/nwUfcGLVvgK7l2rRp2mLAwJgylVHxBL4sM+p9C/QVvI7VTpyvZwFn59KN
         B3ClZLKrCXQQNMvQV5VbDMuHihXQlERhLysWaKHyTeDbHQlWu6+oxQ+0mieXblLzwl
         OKXp7spbytSMEgCevhT3zXKOiqEIYsCc9jtfLt9nuRbJ+wnRKSgISLLetryiQVRB8c
         biEch+Jqx8WOw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 19D4F6129E; Thu,  6 May 2021 15:45:41 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Thu, 06 May 2021 15:45:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-LeFy6MNh2h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
Unfortunately the logs and traces didn't show anything definitive.  The wor=
king
and non-working versions are essentially the same up to the point where in =
the
non-working version, the devices fails to respond to a Set-Interface reques=
t.

There's no indication of why the failure occurred.  The same request succee=
ded
earlier in the trace, and it succeeds in the working trace.

Incidentally, you can restrict the usbmon trace to include only devices on a
particular bus by copying the appropriate debugfs file.  For example, to
include only communications with devices on bus 4, you would copy the 4u fi=
le.

Can you collect a similar usbmon trace for the USB-2 port under an earlier
kernel where it was working?

Although there have been a few changes to the ehci-hcd driver in the last
couple of years, I don't see any changes that would have this effect.  The =
only
commit which might be relevant is 64cc3f12d1c7 ("USB: EHCI: Do not return
-EPIPE when hub is disconnected"), and that would affect only what happens
after the error has occurred -- and it is already present in 5.9.  You can =
try
reverting the commit anyway, just to see if it really does make any differe=
nce.

In the end, the only was to solve the puzzle may be bisection.  You can cut
down the size of a git clone operation by using the --shallow-exclude=3D op=
tion.=20
In your case, you would exclude everything before v5.9 (or whatever kernel
version you identify as most recently working).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
