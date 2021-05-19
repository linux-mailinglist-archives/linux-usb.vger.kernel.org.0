Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51A473897A4
	for <lists+linux-usb@lfdr.de>; Wed, 19 May 2021 22:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231134AbhESUNo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 19 May 2021 16:13:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:50726 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230494AbhESUNn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 19 May 2021 16:13:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E61706135A
        for <linux-usb@vger.kernel.org>; Wed, 19 May 2021 20:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621455142;
        bh=gjwWkbheZiQpnBt1fDuNE9JW+53Nq1B0kqunlHPk4kg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=az5oO9Kw2EbuefQEkU9NafJ0yzLBz+SMqxlsS4F/TjNNxZh2Lp0CouGCnnnI9qy6j
         /Nk/PJ5PIAB7QLgg+aUMf8EKLG70Ss3B9pnvyZg4vEIqgQ8qwW/t5fCeBTkzdR77Q1
         cL9lVExj57oDDqVXhvTOwfD3Se7GXCgxd/BE6FU+8w4giU29ObQeBM08p/3whr76nq
         t38NHXJhRU3mT1nzd1n7BR5lG+veY+X0LwceWLlu9QeDErCJFjBdJDUHXs67SUAhoR
         /bDwqDn4WEMZIFio8M9DQAUnWVgu7vWxka7RChGa4a/sX/vCoUfIEv7bXp5Sy+K1UB
         AuwQUG6R1ftNA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D80E861260; Wed, 19 May 2021 20:12:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Wed, 19 May 2021 20:12:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213081-208809-xfSqfY6D8X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #20 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
There is another recent fix for a 5.12 regression related to giving back UR=
Bs:
9b6a126ae58d xhci: Fix giving back cancelled URBs even if halted endpoint c=
an't
reset
It was added to v5.12.5 stable, so still missing from your 5.12.4 setup.

Could you add that patch as well, and if it still doesn't help then take mo=
re
detailed xhci traces and logs:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
< connect the card reader and insert card >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

note that trace file grows fast so copy the trace content somewhere soon
after you see the first "reset SuperSpeed Gen 1 USB device" after failure.

Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
