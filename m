Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EEC464AC7
	for <lists+linux-usb@lfdr.de>; Wed,  1 Dec 2021 10:38:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348291AbhLAJlS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Dec 2021 04:41:18 -0500
Received: from sin.source.kernel.org ([145.40.73.55]:36530 "EHLO
        sin.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237675AbhLAJlR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Dec 2021 04:41:17 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 6B90CCE1D92
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 09:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 682FCC53FCC
        for <linux-usb@vger.kernel.org>; Wed,  1 Dec 2021 09:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638351473;
        bh=q71cDuR8blVwXExx3kTimn5HDzlgXxZmUnbrQjR5vfY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=au6vl9Pwt3feW2Csl96G5PTvJzeKSeSbSXqbAn00aDQvT1blBqb84gTkyL9YlBMrq
         7Dtohl5ewdB1j7+sB5hgAbdb7mnNA8TMjqfqwHqPwA2rrs4QA9HXI4LZAGiWzXMBwW
         who7P2N44ITiQ8gW2q25uE8mlbsAqTyBNhKWUg7UNWw+soBor6QYsrN5WcSxt30hYk
         /jgFE41wz/ET8HRoEb+DZhuDqxBL+vDzGLa+5jW6QkXhLodLep6iWHvKCIe0vGDz6F
         Vr+IdUjfkpEiCht8gaNMwWJukC4u3Ek+qWHLbzdtp0D3ocejZMJ6tWOmIQx3OPlej9
         YwgTe/ZFjbpog==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 5260D60E91; Wed,  1 Dec 2021 09:37:53 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215175] thunderbolt: consistent system freezes with Dell
 U4021QW, general protection fault, probably for non-canonical address
 0xdead000000000108, Workqueue: events tb_cfg_request_work [thunderbolt]
Date:   Wed, 01 Dec 2021 09:37:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leho@kraav.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215175-208809-tvBo9Y7LZV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215175-208809@https.bugzilla.kernel.org/>
References: <bug-215175-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215175

--- Comment #2 from Leho Kraav (leho@kraav.com) ---
Thanks for the tip, I'm running with thunderbolt.dyndbg now.

It might take a few days for this corruption to occur again, will post upda=
tes
then.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
