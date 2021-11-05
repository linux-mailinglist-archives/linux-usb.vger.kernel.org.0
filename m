Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 103774468B5
	for <lists+linux-usb@lfdr.de>; Fri,  5 Nov 2021 19:56:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbhKES7E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Nov 2021 14:59:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:59042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229722AbhKES7C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Nov 2021 14:59:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 09B1961242
        for <linux-usb@vger.kernel.org>; Fri,  5 Nov 2021 18:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636138583;
        bh=//JIY3OoDh6sIzx45A2hdJl8MapcfJeLas8ROWrb3nM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=E/0YCPxZQd5SR+d5WfyNNt+cGlWFL3T+poWumIAolRKTmBJbfZMe8t7+lbHKBtYw0
         S27ruw3kdWeqmrNFdjI2FCW2I3huVX0sZzICCMVp2tIAPCNrUESKzDsXeDWj9NJHdU
         rT/rrRJ5Ac0WwYqBx0I+4iy8ww4dWCrqQPLrZH7U8sCD13eQXQy8HViDUgXMNeb4vO
         uTN/OipGBAIORNYk9a76QJXRwc1tkmO9gpqVNxRP4bHLjDzfXLt62fWDF1+0zX4bjg
         eLCrRsLfBEoT0xgTTGVF1xqHmcl85Xdzgii1Y/U4FZlPheW/8w0cX7qaAK5Xoe+MU3
         DdOsfzdx/uvZg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EF4DD61108; Fri,  5 Nov 2021 18:56:22 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Fri, 05 Nov 2021 18:56:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: scott.c.arnold@nasa.gov
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-FQns2um8K0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #23 from Scott Arnold (scott.c.arnold@nasa.gov) ---
pci=3Dnoioapicquirk fixes it.

-----Original Message-----
From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla.kernel.=
org>=20
Sent: Monday, November 1, 2021 2:41 PM
To: Arnold, Scott C. (JSC-CD13)[SGT, INC] <scott.c.arnold@nasa.gov>
Subject: [EXTERNAL] [Bug 214789] ehci-hcd.c ISR

https://gcc02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D214789&amp;data=3D04%7C01%7Cscott.c.arno=
ld%40nasa.gov%7C5df722eafbb3426ea8e708d99d6f8ef1%7C7005d45845be48ae8140d43d=
a96dd17b%7C0%7C0%7C637713924742064413%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dhb=
1Mm3rBbLg%2FUZQIk8WY0Pr%2BSqo9XBRJBLS2vmapYio%3D&amp;reserved=3D0

--- Comment #20 from Alan Stern (stern@rowland.harvard.edu) --- There were =
no
significant changes at all to the ehci-hcd driver between 5.6.1 and 5.7.1.=
=20
Which indicates that the cause of the problem lies somewhere else in the
kernel.

At this point, your best approach would be to carry out a git bisect between
those two kernel versions.  Or maybe just between 5.6 and 5.7 (I assume that
5.6 is okay, just like 5.6.1, and 5.7 is bad, just like 5.7.1).  That would=
 let
you identify the exact commit where the problem started.

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
