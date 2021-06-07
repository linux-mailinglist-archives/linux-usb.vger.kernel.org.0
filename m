Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31CAA39D41D
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 06:39:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbhFGElF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 00:41:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:42872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229470AbhFGElF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Jun 2021 00:41:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 841DD6108D
        for <linux-usb@vger.kernel.org>; Mon,  7 Jun 2021 04:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623040754;
        bh=qq2IZrK4rnpdmozQgVSJClI0AySTFpvpRWWfG69S3NI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=BQDhwCTr0GHRbU/SrFw1ug0/2MgZmt0HPoTmH8YTFY9YFdgFUWMywGfXOH3OCD0pj
         zYRzxp2UU1LUgsIBTW+hPOsNtxXFzM8QAGTjsaMNSsymWAtgosGSwC3/F7gjje1B+x
         f2gmDAtYdt9WWSSVO8JdHX+LEbDxa/0osoZx+sclmT54aeJcf0ejV6x+wedX2HyVef
         Wd8xhTAY7G56+JCrV1bR/sQ2eA6jeIMuSGsdqhNgSYMRBkHFhnPcv2ZZGiWAjKGFyQ
         dLO08qxihhtEYfUIkBKFc2p8HOS09OIlBnF5Uyw/Yq87OFUNV8lGM9jWUB7kwKL7Xw
         SxG1DiB7LaySA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6FDCB612A2; Mon,  7 Jun 2021 04:39:14 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Mon, 07 Jun 2021 04:39:14 +0000
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
Message-ID: <bug-212955-208809-Dy8uQkIMa5@https.bugzilla.kernel.org/>
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

--- Comment #21 from Lucas Endres (jaffa225man@gmail.com) ---
According to my comment here:
https://bugzilla.kernel.org/show_bug.cgi?id=3D212477#c13

USB 1.1 mode was working for me there, but I was probably testing using the
previous patch (not the finalized version), and I had just reverted the oth=
er
BOSS/EDIROL/Roland quirk patches we'd been working on to rule out any confl=
icts
with them.  Although, they are included in the linux-next branch I've been
diagnosing here, they seem to appear after this, and otherwise shouldn't be
causing it, due to this patch blacklisting the UA-101 from snd-usb-audio.

Here's the culmination of the other BOSS/EDIROL/Roland quirk table patches:=
=20
https://patchwork.kernel.org/project/alsa-devel/patch/20210422120413.457-2-=
tiwai@suse.de/
And my bugzilla report leading to it:
https://bugzilla.kernel.org/show_bug.cgi?id=3D212519

Thanks for any light you can shed on the matter, but it seems to me that I =
will
have to contact Takashi Iwai again,

  Lucas

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
