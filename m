Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFC1044210E
	for <lists+linux-usb@lfdr.de>; Mon,  1 Nov 2021 20:50:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhKATvi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Nov 2021 15:51:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:41964 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229931AbhKATve (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 1 Nov 2021 15:51:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E72166052B
        for <linux-usb@vger.kernel.org>; Mon,  1 Nov 2021 19:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635796140;
        bh=SXz8fL1Sk41SbW3rLSLzmdLNlbbx/NXNRGROgikN5jE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ou/0SNYd6KSPWexBO341WVjQoTaZKWhmHivHzHSR78iCWk4ZAdv1Ktc+FB1JRO4b3
         sb7nNOOEBLBDdGnQG+gcI529tKBi0oGIql5LnXCHdiRFjSuZge2DBptwqLhhMiFQDm
         iFj1vA+UDVpkqrNReNlPl81YjZiV0V7Yxk5Pr4wHg9gE7i1irX3q+BBcIHy+WuuZ17
         yvBsaGftPc41LlKN/O2Gui7n7oevA/TJB2rnIpCzdzbxlMFshIqUWJCH9wjENHP7pK
         10eAQ8TM+Ytv+WJ/48fh6RrYCFg6xKA1MyqPsc0dwBAQ5sCALTZ46/GStAnhFSaGEc
         Yaaq6FjYToVdg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D5E7260FC0; Mon,  1 Nov 2021 19:49:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Mon, 01 Nov 2021 19:49:00 +0000
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
Message-ID: <bug-214789-208809-2nwXW3u3MJ@https.bugzilla.kernel.org/>
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

--- Comment #21 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Hello,
I noticed there was not much diff in drivers/usb using meld on 5.6.1 and 5.=
7.1.
Git not easy due to network restrictions.
I am going to see if 4.8.5 compiler vs 8.3.1 makes any difference.
Also going to check and see if any bios settings could re-arrange the IRQ's=
 to
work around problem.
Thanks
Scott


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
