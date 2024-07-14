Return-Path: <linux-usb+bounces-12200-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A9930A50
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 16:03:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48F6D1C20E03
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 14:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6584A136E28;
	Sun, 14 Jul 2024 14:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tna3NdF+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46F91BDD3
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720965794; cv=none; b=svPX1Iyp0pjrFPred48mRxlsnYM9vTbupEo7ChocgmeIIGLxZ/KtXLM6maB9wXRZJ+BmCFPdKJ67L1u5U9Myry8L6vd/owlV4kfJ3FPKeg6gC+PZiFdfMj81FSXSOy3W1R4dqtuAhhpFViZKHigUonWwj27MdIBIkRtIPrblHFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720965794; c=relaxed/simple;
	bh=VgiNExa9ONkG0Un0N7ceFTzRiaz5xmOeJW1J8EyS/r8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gb+6fHIXton8qVP6PWywnWKJPLEFHgZmz9aYT0Tw5xnDUavBF85KYiTPAZsOeaJOa5v+0UxwaXEwVBCqJjU1HbWd4XeNAs10lrYPUIyHiPWfEH4h3kc6O362LTb9qQnKk4A/QKtGK4NaJkMY4KiblLCb0j431TDOTKLPuVgdhvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tna3NdF+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6E20CC116B1
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 14:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720965793;
	bh=VgiNExa9ONkG0Un0N7ceFTzRiaz5xmOeJW1J8EyS/r8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Tna3NdF+MC70RySkU35yEvepqVy/kadnIt2KTj1LDky5zDDkC0NZw3+Tyk9kBbHcj
	 tk3Zv8n7IK6yO0+2wPitgS1sxm+pzjm8Ovw6qS7SLcwqCQRT+KWjZ/YSDe/PErjtsQ
	 Zsux/74gAJF9MQlNvoZjfmErbfPI2tfBd2Pi+0JmLZ6DlcsGUbiRPoH1u9pUlTRwqs
	 Zq+jrsw/+sN1pTYkX8IQCYJATxMiftExbi7batXKp+jjjas8GIBia9bcj+Dy/4kgvC
	 sKRJ4PdwUZzFbBrg9+nZio6Kry42tdu+C/vzEZyJ5o4+KLL4dUa5Oo/0U9ZkH/wHor
	 2G6/u0RhUXk4g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B598C53B73; Sun, 14 Jul 2024 14:03:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219039] kernel 6.6.39 freezes with QNAP TL-D800C usb case
Date: Sun, 14 Jul 2024 14:03:13 +0000
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
Message-ID: <bug-219039-208809-Zzox9YDms0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219039-208809@https.bugzilla.kernel.org/>
References: <bug-219039-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

--- Comment #3 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Hi,

Good job finding the bad commit. I'm almost sure that I know what the
problem is - it appears that this commit effectively disables
incremeting event ring pointer under certain conditions, which causes
the IRQ handler to process the same event again and again and never
progress to the next one.

I would try changing the

    return 0;

added by the bad commit into

    inc_deq(xhci, ir->event_ring);
    return 0;

and see if this helps.


Other than that, the commit appears to be valid fix to a real problem
that may happen on isochronous endpoints when MISSED_SERVICE_ERROR is
immediately followed by STOPPED_LENGTH_INVALID, which I think could
occur. The over/underrun conditions are perhaps possible too.

Regards,
Michal

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

