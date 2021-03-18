Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2175D3404EF
	for <lists+linux-usb@lfdr.de>; Thu, 18 Mar 2021 12:49:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbhCRLse (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 18 Mar 2021 07:48:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:36396 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229810AbhCRLsB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 18 Mar 2021 07:48:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6562564F72
        for <linux-usb@vger.kernel.org>; Thu, 18 Mar 2021 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616068081;
        bh=E0mXMvrBr61/kDyPaTZWI50XfxG/6SWkGY1oTB3j6uQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XR9KbB3aYQQAW4TIgBWAt/ngz5nDnqx2/hMaW6RNqLIBeGLPdcO0vC19vN4xhsL0/
         wUbMtN0Hbj1bc12ACX97GTxHyjmesfA7CIEblZnsJv+7ZpWCrftc68MngsC60Cxpg6
         eiO2x1borBgOLxzu4RXTpLtcu89GEjJQQasgrQOnyxx8eLF5Zejq9iLeFmA5Vlq+TC
         WeE1A017mpBPEUBnQujEAwmjKzldy3EZ2c6CP/yDbfd9NJc8qizlkf/trRxCEV+yaV
         qyhS9S/+6GriEtVuNYQg0KG0j+FW8EWu5AkkwXOnVy1wPqdSHycZcWugkY4T4nZwUe
         0Ms5GdnlWLmfw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 46043653CB; Thu, 18 Mar 2021 11:48:01 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Thu, 18 Mar 2021 11:48:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: catchall-kernelbug@blubbbla.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207887-208809-VJuSq8lNVd@https.bugzilla.kernel.org/>
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

Johannes Wegener (catchall-kernelbug@blubbbla.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |catchall-kernelbug@blubbbla
                   |                            |.de

--- Comment #6 from Johannes Wegener (catchall-kernelbug@blubbbla.de) ---
Hello everyone,

I have the same problem with a TeX Shinobi. On Kernel 5.11.7. Is there anyt=
hing
that could help to debug the issue? It is a bit hard because it seems to ha=
ppen
sporadic at some time. I also think it is weird that the kernel sees the Ma=
ss
Storage Device even the jumper is inactive.

Best regards,
Johannes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
