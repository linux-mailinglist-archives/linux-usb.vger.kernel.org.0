Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04E00420826
	for <lists+linux-usb@lfdr.de>; Mon,  4 Oct 2021 11:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbhJDJW7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 05:22:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:37960 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229716AbhJDJW6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Oct 2021 05:22:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D7BB661216
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 09:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633339269;
        bh=J2AxIpUyfgXThVbzDoBK/nJiEfgxai996A131lHxKyg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Yc3nA2iATf48rsmBclqLEN+xh0iuEHkUEqoueCVrFnmdQQ4bk4pHSiBVM80esb2jq
         mlN/Hj8CzEeecu2yj+yEo2AUYUuGOoREx/DDotOAwrAiBxBPx/kvOYxZYQm0pyhYg0
         EvRwo+T7cZUAFsLpTsVOghhlSlbimWwr0tF4OCudFy62NgJ+kt5ocKF5gu6hLgogc5
         StU+zpstU57gj29BFQTGHVd+1kwRU9EFvKTg48Kwu0mMNlmHYKXnQntJM5RazfR2rs
         pl0AaQ+9iQ12tA3p29ViJYqc60qoZLJAroHyQ0VEOw5zBSEsQv4Qs11nBEcTMAqf/M
         JKhcij3mM2ODg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C8C85610FA; Mon,  4 Oct 2021 09:21:09 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Mon, 04 Oct 2021 09:21:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brandys@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214131-208809-sY7jhlxx7J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214131-208809@https.bugzilla.kernel.org/>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

Bogus=C5=82aw Brandys (brandys@o2.pl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |brandys@o2.pl

--- Comment #9 from Bogus=C5=82aw Brandys (brandys@o2.pl) ---
5.4.0-88-generic #99-Ubuntu SMP Thu Sep 23 17:29:00 UTC 2021 x86_64 x86_64
x86_64 GNU/Linux

Ubuntu 20.04.3 LTS

problem with ch341 driver re-appeared while in 5.4.0.-86 is working fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
