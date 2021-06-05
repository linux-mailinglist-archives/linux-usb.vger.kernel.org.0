Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC7639C586
	for <lists+linux-usb@lfdr.de>; Sat,  5 Jun 2021 05:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230323AbhFEDh4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 23:37:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229726AbhFEDhz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 23:37:55 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id B9EEC61185
        for <linux-usb@vger.kernel.org>; Sat,  5 Jun 2021 03:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622864168;
        bh=rlG9CRbUUNgmj/pQ2b5GUhtwx8wtI1DvmPZZClXgrJ4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QP6JZeHPe7WBz5rNgnM0Oc0HqkseY/1EgfGnNBJFkwg9WDwZLGXQzXPoAQJxOAywe
         pYhNRQV2F+EsFVih+twb0IZKaDVmI4F9k/AZzwiIn23kfuUyaTvdRsx0cLCO59s857
         4n61Wuhc67pedY1AmefhXWgbK8XStEhdGI+ZHodwClkTd2pxRziStpMhJzTaWPxy9B
         g5xVvsEOI169u2aM+FLp/Mp41UJsboKthaJKCCD0HKYJRxHqHKE07O+TGBwbQ8Vnhi
         AbGiP35i/sRJXt2Gn4sJizoj37HXDKYGpJ0QJ6Szf+JHjLQJXxRx+JuvgWjX9VSqXT
         zDarg4QWyaMPw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A64B46124C; Sat,  5 Jun 2021 03:36:08 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Sat, 05 Jun 2021 03:36:08 +0000
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
Message-ID: <bug-212955-208809-R6xSdPsLmH@https.bugzilla.kernel.org/>
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

--- Comment #19 from Lucas Endres (jaffa225man@gmail.com) ---
(In reply to Lucas Endres from comment #18)
> (In reply to Lucas Endres from comment #15)
> > Tonight, before I attempt anything that major, I'll build the commit ju=
st
> > before 51e6f07cb12e to see if it's working (although it probably already
> was
> > tested during one of the aforesaid bisect iterations).
> >=20
> > Hopefully, that will be enough to prove that the glitch-causing commit =
was
> > 51e6f07cb12e, or prove to me that you're right and I'll have to spend m=
any
> > more days at this.
>=20
> Well, thanks Alan, you've been proven correct, as neither it or its prior
> commit worked.  So I'm back to the drawing board, but have begun with my
> closest logged and tested commits.  I've only just begun to compile the
> first bisect suggestion, although it hasn't started to estimate how many
> commits I'll need to test yet:
>=20
> git bisect reset
> Updating files: 100% (12637/12637), done.
> Previous HEAD position was bf05bf16c7 Linux 5.12-rc8
> Switched to branch 'master'
> Your branch is up to date with 'origin/master'.
> git bisect start
> git bisect bad b208108638c4bd3215792415944467c36f5dfd97 # May 3rd
> git bisect good 698f99ed5e06946764c3be035ce9d62a2691e08c # April 29
> Bisecting: a merge base must be tested
> [6daa755f813e6aa0bcc97e352666e072b1baac25] Merge tag 's390-5.13-1' of
> git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux # April 27 so pr=
ior
> to known-good for to test a merge base?...  I'm building it anyway.

Sorry to bother you over something so trivial, but the last "bad" point I c=
hose
turned out good in the end after the couple compilations I needed to test, =
so I
have a re-pretested truly bad one that will be a much longer journey, but I
hope will lead to the ultimate truth:


git bisect reset
Previous HEAD position was 51e6f07cb1 Merge tag 'm68knommu-for-v5.13' of
git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu
Switched to branch 'master'
Your branch is up to date with 'origin/master'.
git bisect start
git bisect good b208108638c4bd3215792415944467c36f5dfd97
git bisect bad 51e6f07cb12e50bfc71181bd08bad5f0a9b5e9e2
Bisecting: a merge base must be tested
[6daa755f813e6aa0bcc97e352666e072b1baac25] Merge tag 's390-5.13-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux

That already definitely tested good during the previous stint, so:
git bisect good
Bisecting: 5295 revisions left to test after this (roughly 12 steps)

git bisect good
Bisecting: 2647 revisions left to test after this (roughly 11 steps)
[2342eb1afe00586a018536c4bf9e04d7aa4bf63e] llc2: Remove redundant assignmen=
t to
rc

This is what I'm currently building, but I'll get back to you when I'm fina=
lly
finished again, this time with even the suspect and prior commit tested.

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
