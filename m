Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B70E4265FD
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 10:33:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231923AbhJHIfX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 04:35:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:51952 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233313AbhJHIfT (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Oct 2021 04:35:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D42B66101A
        for <linux-usb@vger.kernel.org>; Fri,  8 Oct 2021 08:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633682004;
        bh=ysA8zzho+L4wVIWi9f+RL4w7H1bfMq7gMOaF6NC3Vr0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=NKz23Px8oVKO0Pmw9qgq4VycopQNO4uw0jWW27u25EVlKIgGuf7M80TtAixyzm4Uy
         cL7gjCFDFS+JE6jfxrKxYRGE69ncWLEjiKIlIa/27pX7Bv5nzMmDyx2dDQGegA5+Sm
         Hszuc/HbpF/je3zlbQNKUeig50oLXhH6LFo4Iuc+Df+ztX38h6Sz2sKJ+QnkGrPcWm
         e5l46hXIajIqNutu/J6UlhYZq988/5lxu/EHF1F0prJZfO+cHI+7xLyxR9L3puxpOc
         7fLGO1cyIuYTGAoqlmrsPB25Lt82F1PXFd1T6WAeVcqo3BDnG7S7zfhE/3pRjyPTfb
         tpDLqUftJT37g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id CDEF460F5C; Fri,  8 Oct 2021 08:33:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Fri, 08 Oct 2021 08:33:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wse@tuxedocomputers.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-214259-208809-G3rjg7Wz0s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

wse@tuxedocomputers.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #17 from wse@tuxedocomputers.com ---


*** This bug has been marked as a duplicate of bug 206459 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
