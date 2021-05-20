Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCF4C38B80B
	for <lists+linux-usb@lfdr.de>; Thu, 20 May 2021 22:04:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234520AbhETUFn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 May 2021 16:05:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:55260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232256AbhETUFn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 May 2021 16:05:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 50ABB6128A
        for <linux-usb@vger.kernel.org>; Thu, 20 May 2021 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621541061;
        bh=LzObFDFRIyprs1bNhbXAWUF2FvWeiEHrk4OD1m023LU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=fmX4AWa6wlW2ytSAAVKBKM8gOPa7BzLKm6yOSOJIFLYBYFhvycNinpi1W5yWV1LF/
         8WvM8JkwyWjJfSQXS4WYpMHPenzxjLwrGfHIF8aSGRO2XtCiQ/YA+ZzSWCIIX9EHPU
         6oFXPHVkeUxb0k+YCsl2DWQEVSUzHJon6DdqOl/QesR6G4K2yK2yyOL3HbfuKD3zrv
         Hv/vAClz/xza+hyVInA4leBQ66MeiqWoFnwxDn5EP2JzJHKQ2R3FZhsyRUjAv4wuaT
         OYaWTV2SQPlFBx20rWSYhfb7Xs+OhT+EWPqy78iRRJmvp5DVld02Z6cG4km2opN7vf
         htXI+l1Sg5p0g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 419566129B; Thu, 20 May 2021 20:04:21 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Thu, 20 May 2021 20:04:20 +0000
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
Message-ID: <bug-213081-208809-rUnvMXJO9X@https.bugzilla.kernel.org/>
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

--- Comment #25 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thanks, the trace gives a pretty good picture of what is going on.

Before 5.12 the xhci driver handled halted endpoints (TRB completed with ST=
ALL)
by immediately queuing both a reset endpoint command to clear the host side=
 of
the halted endpoint, and a "set TR dequeue" command to move past the Stalled
TRB.

In 5.12 the Reset endpoint command is queued first, and "set TR Dequeue"
command is queued when the reset endpoint command completes, if needed.
Traces show that hardware already moved past the stalled TRB when reset
endpoint completed, so driver won't issue a "Set TR Dequeu" command at all.
I think this command is anyway needed as it will also flush the TRB cache of
xHC controller.

From traces:

Stall on TRB at fffcb040:
56.024868: xhci_handle_event: EVENT: TRB 00000000fffcb040 status 'Stall Err=
or'
len 13 slot 5 ep 3 type 'Transfer Event' flags e:C

Queue reset endpoint command:
56.024873: xhci_queue_trb: CMD: Reset Endpoint Command: ctx 0000000000000000
slot 5 ep 3 flags t:C

When the reset endpoint command completes we see hardware dequeue is at
fffcb050:
56.024970: xhci_handle_command: CMD: Reset Endpoint Command: ctx
0000000000000000 slot 5 ep 3 flags t:C
56.024971: xhci_handle_cmd_reset_ep: State stopped mult 1 max P. Streams 0
interval 125 us max ESIT payload 0 CErr 3 Type Bulk IN burst 4 maxp 1024 deq
00000000fffcb051 avg trb len 0

No set TR Deq to move to fffcb050 is queued.

I'll start working on a patch that forces a "Set TR dequeue" command after a
stall

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
