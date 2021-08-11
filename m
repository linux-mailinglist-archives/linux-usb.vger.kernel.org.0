Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A586A3E94B4
	for <lists+linux-usb@lfdr.de>; Wed, 11 Aug 2021 17:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhHKPjX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Aug 2021 11:39:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:41742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232120AbhHKPjW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Aug 2021 11:39:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id CB4FD60F46
        for <linux-usb@vger.kernel.org>; Wed, 11 Aug 2021 15:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628696338;
        bh=Csgp003FOCCmeRzJjvATp4JTaXO2kH0zZuL4lQYi4rQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PpyC4Dm57tmI3Cd07leGdAOqy0Blv1Z7cm3ayOfDDicPWfMUsp6RMezQp/gGGQsNp
         l7JgYGxidd2wlPxIZZO5Whl1CnQU9LNBObR3cF3tZPw4b4yzVMDOH6BBOxnDe9i78+
         CBaih/QXjapt30Rs96lwoUEPUTHqWVmoog5Rz0kEH6Nsb9zDGeQzVFpwoh/ySxPZ0+
         i7fxbwxlCP93tnIIXf2yhEY7JXooJvYKAyjRG56T0uUpPGj0g8siQcKoHZEE/08PVr
         7CMHIZAOAuuVOzxOpuZhaye7B54eIYAmfNSl75+mYWMVCcF+ICrHTYp4vvcGkx2G9K
         P6kwCrtM9oSzA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id BFD7560ED5; Wed, 11 Aug 2021 15:38:58 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Wed, 11 Aug 2021 15:38:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-iuF4LpsbpH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
You can try changing the bPwrOn2PwrGood value in the kernel source to see if
that will make any difference.  The line to change is in
drivers/usb/host/xhci-hub.c in the function xhci_common_hub_descriptor().  =
It's
at the start of the function:

        desc->bPwrOn2PwrGood =3D 10;      /* xhci section 5.4.9 says 20ms m=
ax */

The value gets multiplied by two, so if you change it to 50 then the delay =
will
become 100 ms.

However I suspect that the length of this delay is not the cause of the pro=
blem
you see.  The actual error occurs in the usb_alloc_dev() function in
drivers/usb/core/usb.c.  You can try adding some printk statements in there=
 to
see which of the "return NULL" statements is the one you're getting.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
