Return-Path: <linux-usb+bounces-21761-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5934AA60CC1
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 10:07:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9CA864614E3
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 09:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 740701E521B;
	Fri, 14 Mar 2025 09:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dm6gzurV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CB81DE3AD
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 09:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741943201; cv=none; b=qIwJ9Mp8GhIJfve3k1pF1G6l63yhGfPw5VAAKo3VfgMuh60MEuROrEjgdPZvSryt5NmMvWX2RXvC+Hfk5DNkjMZD2077Ovb7Bga6QeeMmNJDnucJPk3KJLXUXPvh3wFivpMZKDVm8bvwZHFMASVIG8sH8XVKxwWxMKYyQYx4Qdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741943201; c=relaxed/simple;
	bh=zh79m+aBR/R3osP8DaAEVScCgXYv2B1WHf+RQpr0KFk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OQWuGNa80yM1PjC1Cwq/dfpqsbVVCdkSGZ4USVJzrlyFIoY0e9Y5B3c52+4uV/S4vguZArDtgbxL9Z9ym9dg6r9govFLAeP9b8lkZFCw5r4FN7jXPtN5DTa5fVAfLLk1O++CykNjj3Lb0uSqTJMJyTteH7AuHzOcVesp0C4c2IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dm6gzurV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6600CC4CEF0
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 09:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741943200;
	bh=zh79m+aBR/R3osP8DaAEVScCgXYv2B1WHf+RQpr0KFk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dm6gzurVD9qJt1Mz1Q3dcZZyGlxVH6f82ARmQGkYQDVFGDCCNKg5AOD67880Rpdg2
	 6LXnE+dy005ybzOL7FLZowmmXGVBIPtRNHIfiLJohDfyZY9NSczMm48joZTGq5BnmC
	 5CrZSTZmQ0KrZDEp+7c3VVuK0ZBE0SGmyj3+ParEQ3DztVEfFSAjU8LB1kgRm/pvnM
	 Ss4aANFD5WkM8U+gaqtuQv75NOOOL5TJiEm0HNu75mJQ8V8WHpxaRgScLGVsDVKulY
	 HCROPS9P0JmNijrH6PNEcPmaR9YSbVkzhPssD7Z3kSfcgpjnpnhL/2xAto8ADTZV4i
	 me/ipPG+gSGbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5AE52C3279F; Fri, 14 Mar 2025 09:06:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Fri, 14 Mar 2025 09:06:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-j7cqbZbT2f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #22 from Artem S. Tashkinov (aros@gmx.com) ---
6.13.7 absolutely includes it:

https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.13.7

> commit 80cb8e694110dee4ac6fbf0956ba7439aeb0603d
> Author: Michal Pecio <michal.pecio@gmail.com>
> Date:   Tue Mar 4 13:31:47 2025 +0200
>=20
>     usb: xhci: Fix host controllers "dying" after suspend and resume
>=20=20=20=20=20
>     commit c7c1f3b05c67173f462d73d301d572b3f9e57e3b upstream.
>=20=20=20=20=20
>     A recent cleanup went a bit too far and dropped clearing the cycle bit
>     of link TRBs, so it stays different from the rest of the ring half of
>     the time. Then a race occurs: if the xHC reaches such link TRB before
>     more commands are queued, the link's cycle bit unintentionally matches
>     the xHC's cycle so it follows the link and waits for further commands.
>     If more commands are queued before the xHC gets there, inc_enq() flips
>     the bit so the xHC later sees a mismatch and stops executing commands.
>=20=20=20=20=20
>     This function is called before suspend and 50% of times after resuming
>     the xHC is doomed to get stuck sooner or later. Then some Stop Endpoi=
nt
>     command fails to complete in 5 seconds and this shows up
>=20=20=20=20=20
>     xhci_hcd 0000:00:10.0: xHCI host not responding to stop endpoint comm=
and
>     xhci_hcd 0000:00:10.0: xHCI host controller not responding, assume de=
ad
>     xhci_hcd 0000:00:10.0: HC died; cleaning up
>=20=20=20=20=20
>     followed by loss of all USB decives on the affected bus. That's if you
>     are lucky, because if Set Deq gets stuck instead, the failure is sile=
nt.
>=20=20=20=20=20
>     Likely responsible for kernel bug 219824. I found this while searching
>     for possible causes of that regression and reproduced it locally befo=
re
>     hearing back from the reporter. To repro, simply wait for link cycle =
to
>     become set (debugfs), then suspend, resume and wait. To accelerate the
>     failure I used a script which repeatedly starts and stops a UVC camer=
a.
>=20=20=20=20=20
>     Some HCs get fully reinitialized on resume and they are not affected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

