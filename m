Return-Path: <linux-usb+bounces-23599-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE56AA5B65
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 09:29:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B9035465BBE
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 07:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6049326C38C;
	Thu,  1 May 2025 07:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGnHw6OB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75AA944F
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 07:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746084588; cv=none; b=qAOp3EMlpFJ6OAp3PhkYj4+ZFiOAcOmtROBT2sBUcEYk4a25lGr0fLWgokY7Uh1H65wx2rlMpMT8IrshkTISH+9cBcr953uBTtxgONZGkMUCyOOdBBdJrvyX+vSAxjENQTgr3dUKLjhRayVBbAkivrIrIl8hNtZtwdSXxQjrCVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746084588; c=relaxed/simple;
	bh=qv732NIcU52qOcCQjah6wxz3tLjitoT7ikJb2QJMl8g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DJDr0IwKKf2/XdWrPys2cca+Y5S6hM5WgPD3W3uQQm1DP7odIxk//NhMOjYX5WMVdnQuqqcU0Wa4wbJIxMMZQcNb2Hua1FmGRhhp35BFwLE+5o37nguyNkVwG6lVfInHXedFXQMQzJFFpSVPx9s3PfQDjIRA7RAYGraZqwRg8Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGnHw6OB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A8A7C4CEE9
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 07:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746084588;
	bh=qv732NIcU52qOcCQjah6wxz3tLjitoT7ikJb2QJMl8g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fGnHw6OBOUpRVIrPqbm/w1qyRORyeBQlfkuIyb0nRM2xFJ5rhtoO4i4rRqDHPktvU
	 BnBWTbluo/NkFz1beWCQ/9jwSA6rBi7gSYakdJUvt5+b62IaV8gC5V2n/3HWN1Nhq/
	 e9YQfH4t2kZGx1TIUhosL/BZkqJq148sYe3z5RjeYZONvTxtXB1QZLk/TKmhqgucu5
	 G3bodZM0drOUyhutmaoMHJ/Nkc2ByFjAp5UXwIrHUdXh5WpdX4LAzrtvifjc75Jk3f
	 TF/FA2Ts1m/uV/u2vk73ubNwA0Jij6pnGAubC4lyNNUtHW++yNJg4l22ETK4bEzU0t
	 nSAtzvUMQv6ZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3D49BC433E1; Thu,  1 May 2025 07:29:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Thu, 01 May 2025 07:29:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-5VzjYjVWrJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #12 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Claudio Wunder from comment #10)
> > I think you said you have more of those logs, is the above always appea=
ring
> a
> > few seconds before "hc died"? It seems related to the 8-3 device, a VIA=
 USB
> > 3.0 hub.
>=20
> For the sample of two items I have so far, it appears that these are show=
ing
> up. Note that on both the original regression and the current "apparent" =
one
> (if we can even call it a regression?), these errors above are happening.=
 I
> will need to wait to see the next crash also happens to have said logs;
Wait, this is important. If you were seeing "Abort failed to stop command r=
ing:
-110" instead of "xHCI host not responding to stop endpoint command" before
6.13.7 then it is at least possible, if not likely, that you were already
running into a different problem than the one fixed in 6.13.7. And it gets
doubly suspicious if you also saw "ERROR unknown event type <some number>" a
few seconds before "HC died". Do you still have those logs by any chance?

As Mathias Nyman explained, the known 6.13 issue was a simple driver bug:
commands were written incorrectly, chips correctly ignored them, the driver
incorrectly pronounced them dead.

Mathias further suggests that this or similar bug may still somehow exist in
your kernel and that command abort fails because the chip believes there ar=
e no
pending commands. That is possible, but unlikely because command abort is n=
ot
supposed to fail like that. So if you ever seem command abort timeout, eith=
er
the abort code is buggy (and it looks like no one touched that part in ages=
) or
the chip is buggy in one way or another.

It would be sad if this turns out to be a regression due to the commits
initially suspected back in February:
https://bugzilla.kernel.org/show_bug.cgi?id=3D219824#c5

These are present in all 6.12 and higher releases from this year, so the on=
ly
supported kernels without them are old LTS series. Not sure if you have mea=
ns
of testing those for a few weeks on the same HW, userspace and workload?

I could also suggest some stress tests which exercise this code (and the USB
controller). I found webcams and USB serial dongles to be particularly
suitable, do you have some of such stuff at hand?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

