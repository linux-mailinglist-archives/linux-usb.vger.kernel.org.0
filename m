Return-Path: <linux-usb+bounces-27566-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D750B44A14
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 01:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D942DAA0F87
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 23:03:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A062EC0A3;
	Thu,  4 Sep 2025 23:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p91eJXnk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C292E3B07
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 23:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757026990; cv=none; b=VgTfDbjYlIghJ7Ujx62uL+XcHKCWTvOvWtAmoq9oRVD3VHilFez4Ul8gMU7Kllnjdncp7HIRg6H2oKW65og8xqR0n4xU8hgmIs/R2f0mWzDmUzMqKe54/IjvZTQouGELMJqmkm1encsyQ+l0RK9OL8a9JD6mCdqMkMiUzQME0is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757026990; c=relaxed/simple;
	bh=PfLtRLtdhq3zdSBPq+JbB0fSia3v9ubXPvRF/dOsoqY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aQD+zneDKnq1xdaC98W5wXpOV5fsS+ON8AM4tK2QIcHBucjNI6XjKIBMTUpnodnRexk4ykFsthNz3v953Fn/qBa/C5ECNPLYhpfzEeTffaMuuBKlSAyq7eobpReOp+nn1YLYeo6ptjvQHwyrXXtnK2ZTSFGFcdbwam3UsfLd7Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p91eJXnk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFFA6C4CEF4
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 23:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757026989;
	bh=PfLtRLtdhq3zdSBPq+JbB0fSia3v9ubXPvRF/dOsoqY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p91eJXnkXGgvNnuxWdWdxy2fT+41x8HtYqSsLb+Q/tFANdHeCkztgeVVjqajc5Rth
	 gCvp9dTv3/fKx4Utu/nqXbfmS2lNu70OCpJ92YHMqWWvK2yDOaRcRyZ6mKbOQhlc75
	 nddg161EhQSvuiWnCmWF4Ok4U8sVK1Zkw9n+pAPx145p6VzxDcXWsRPjRqPtytJU2+
	 +9LgA8rl5Yym+WFnfsAsY2EEjwRKhOgytTW01GDH4+JbNenzATFnVMOcH4jnV0ZCrQ
	 IkxL98jSi0rkZm7I4gDk6g314PiEgXpHpoIuEfD/IzafMnNV/fKnXNVwNgVq1zZtky
	 qFo1Kg63l8i2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A0537C3279F; Thu,  4 Sep 2025 23:03:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 04 Sep 2025 23:03:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-eRK93FVhpP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #41 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
I've installed the reset delay to both machines. With the default delay of
500ms, the ativ9 connected SD card now survives suspend/resume in that the =
card
remains mounted post resume, thus far >30 successive times. The reset delay=
 has
no effect on the emb-qm77 machine. My preliminary dmesg log study indicates
that the connected storage device is not being reset, perhaps because the
overcurrent error disqualifies it. I will investigate further when I return
from bike riding.

Alan, thank you very much for the delay code. Even if a more general soluti=
on
remains elusive, I can at least use my ativ9 laptop as I would like.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

