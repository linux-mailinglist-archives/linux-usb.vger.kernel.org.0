Return-Path: <linux-usb+bounces-14201-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33057961873
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 22:20:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D2E1D1F24CE0
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 20:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC4B1D31B5;
	Tue, 27 Aug 2024 20:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rsmyq5gH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FEC1D318B
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 20:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724790044; cv=none; b=cTvnLl/5PL6QI4OOUKiOE7oYdjVfvRrIw9P8MIajrFWn3uROk7vwM/+brqJTcgUxBq0vV4eeTjtT/ov9ySuZKL4yFN2nPnzmNofd96p0LoOKy4oLp7ozjrs1OENUApuX20DSJrRWKkH8a6hI+XP5HUgBsNjTrzbEvytyw74byAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724790044; c=relaxed/simple;
	bh=V4U21VPr1rTxOckbkq4QnNpdOHVqFEx9Z5lqocCVKdA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rqx0eY2AVBSL5/bTrR2skMrDMZIzxDg7TsCgHro4y6YJxVc0SIr3qbegZpnibKd+w0/A7GrTN9wrqdPI2TAI6YZuQMOq9fyRleHjjrG2AOgTbhZqdDEvlHhspCfo1V2zIghD79HkM5SnCzgdUbToC1RVkBKA9rGEiKsD/fBpxP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rsmyq5gH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14136C4AF0F
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 20:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724790044;
	bh=V4U21VPr1rTxOckbkq4QnNpdOHVqFEx9Z5lqocCVKdA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Rsmyq5gHcRPJ02bCBSQamXFFBRjXuSSubNINbjMZ2qTcsYE6/Fa2Pm/o39FDzQOW6
	 jCBeEpU8c4Zguplw+2+GzYHJKAU86u3w5mcThVTdiGGEdTuDPi7G/1ij5vRd5cv8NP
	 gl5NxPCwInX70tFGStVrv9dyIdRjp9F9jb8XtAJtafx4Ql8MgUh9Mg7DhSS3UqaYES
	 dJZjfAwVReLRFV4mdiUAcJV8CNvXbCqNLrCwBqHvIUdf7SKLa1cnivqJG++TTa3FCC
	 7nmJ2n90b5CG+x69Xe8WWUqNr1g2HAGsEKitwhu1Q6sr25W/WLwjScFHPkalwADvU3
	 iAQadE24ege7Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 09824C53BC0; Tue, 27 Aug 2024 20:20:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Tue, 27 Aug 2024 20:20:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-tX04dXdcha@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #14 from Markus Rathgeb (maggu2810@gmail.com) ---
I did a git checkout aba9753c0677e860f982edff98c7fe5a2b97758c (the commit id
before 04d17331ca33744e1426fdeee7ba5e975c4b2239).
It seems to trigger the same error.

So, I already tried a some different kernel builds / commit IDs and the RCs.
They all result into non recognized USB devices.
But additional behaviour differs. On some kernels if the error is hit, the
system is not usable anymore as the mouse does not react for seconds. Other
ones shows kernel dumps, other ones only non working USB...

I still try to find the commit / merge that stops USB first.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

