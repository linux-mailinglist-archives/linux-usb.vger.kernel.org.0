Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 646D4399942
	for <lists+linux-usb@lfdr.de>; Thu,  3 Jun 2021 06:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229738AbhFCEo1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Jun 2021 00:44:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:44738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229501AbhFCEoD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Jun 2021 00:44:03 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id C0F02613B8
        for <linux-usb@vger.kernel.org>; Thu,  3 Jun 2021 04:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622695338;
        bh=pid+Oa00O7Y/tahp9VcBZJ2EcGKkPudrNGVR2WyyZR0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XKe0SkD8pSTDpOdY6/CWVWsiBFxYlZ3BXGpdY+WSwp9wVWsegliLhOZ2fIpk866/5
         hE+kU0eIc1+fxx3jwgC+y5fJZ3LiXI1pfqK+yIsFt25RRx5CMi6eGUc1l/kQv0awcI
         aodBJubky08uEUcZ4wM+sqbjO7Cuhy9kX3GxH4i/53sqJHM2vQgIZ62viBYcXhJFGh
         yBMiY26cwmvYg61uRdhExgdq9/os8bXHwejV1bGNshSEmioe6zpqdzQnlttCoBGGTO
         eBoCQJIWaP9uU0pBbWUpcAb5X4t76UkILW46ZuMG02J52bwz9okJBuDJhiPNWWYVyi
         h56s9xOIwTd0Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id AD40A611C0; Thu,  3 Jun 2021 04:42:18 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Thu, 03 Jun 2021 04:42:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaffa225man@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212955-208809-1PLYTnBHqY@https.bugzilla.kernel.org/>
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

--- Comment #18 from Lucas Endres (jaffa225man@gmail.com) ---
(In reply to Lucas Endres from comment #15)
> Tonight, before I attempt anything that major, I'll build the commit just
> before 51e6f07cb12e to see if it's working (although it probably already =
was
> tested during one of the aforesaid bisect iterations).
>=20
> Hopefully, that will be enough to prove that the glitch-causing commit was
> 51e6f07cb12e, or prove to me that you're right and I'll have to spend many
> more days at this.

Well, thanks Alan, you've been proven correct, as neither it or its prior
commit worked.  So I'm back to the drawing board, but have begun with my
closest logged and tested commits.  I've only just begun to compile the fir=
st
bisect suggestion, although it hasn't started to estimate how many commits =
I'll
need to test yet:

git bisect reset
Updating files: 100% (12637/12637), done.
Previous HEAD position was bf05bf16c7 Linux 5.12-rc8
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
git bisect start
git bisect bad b208108638c4bd3215792415944467c36f5dfd97 # May 3rd
git bisect good 698f99ed5e06946764c3be035ce9d62a2691e08c # April 29
Bisecting: a merge base must be tested
[6daa755f813e6aa0bcc97e352666e072b1baac25] Merge tag 's390-5.13-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux # April 27 so prio=
r to
known-good for to test a merge base?...  I'm building it anyway.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
