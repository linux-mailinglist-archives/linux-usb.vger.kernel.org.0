Return-Path: <linux-usb+bounces-21522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 62854A578D5
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 07:57:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D32931892ABE
	for <lists+linux-usb@lfdr.de>; Sat,  8 Mar 2025 06:57:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D28F119047C;
	Sat,  8 Mar 2025 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yz9nVeH5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BE58137E
	for <linux-usb@vger.kernel.org>; Sat,  8 Mar 2025 06:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741417020; cv=none; b=oA3truIaGXtMRwTWCNzH/APQyBPNkXEkh3b9ql3O9KV0JND6OIL3ve3hpNEbsofTMbpI6BHH2P4WCmn0ol7i7HfSiL6kjVTYTEhzOdVPfAm5rqQL1Rq8jPRuxOVtdoNEUUL9+EXcxj1d43+Se8lTHTCmZFn3ur0aTUYCNJWu4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741417020; c=relaxed/simple;
	bh=zcOY4R6DRMfQEKfcCOMs1wkAtyKJWXYKTNpAl8YW+Tw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NhOdCtNrSpPtABbQMPuO9FGeRM8o3dm9j8RTm5EYoWmEffw7t/efKk4De23cnH2PsNGYS7iok2DnrOOvVF4vIj5iaaF3XzOBEeXYIrnrikaEWQQzPKub6u9V7+nUQGB6tO6BV7fykCQFFTncOtXauKhqdj54XUg6dvKJFxFLu/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yz9nVeH5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2A3FC4CEE8
	for <linux-usb@vger.kernel.org>; Sat,  8 Mar 2025 06:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741417019;
	bh=zcOY4R6DRMfQEKfcCOMs1wkAtyKJWXYKTNpAl8YW+Tw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yz9nVeH5f6FKRa5SBqJyAybyhu71yeN3KbKUfiiREyHiCnoY4bPQwOb90acum9m1x
	 BuchzBLNyWticTlnUB19UHaMb0y8eL1JcOuMvXramaonYmsBNjfJNxLCWqzMOBS2sO
	 IlIiYCyU4DRte6AdfMvx6LZDkUrEHl4xsB3pCX6kkUS5mWrJ7TEIEieuwVXNPkX+/E
	 AXrEl9Omi2vrFHQHTAiv/3ba8Nr6Sdz8qsUJ2G9aJ3xm1/bE2fOlEr0GDDbXqfykcv
	 hnt2MoaTTvPZ4L7P63BIvz3tcXUAYoxpBoHjPvnv388dZm05r2alCH64CuxcHhJI5J
	 yud21fIR2T9WA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C94BC53BC5; Sat,  8 Mar 2025 06:56:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Sat, 08 Mar 2025 06:56:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-b2SPRg4yY6@https.bugzilla.kernel.org/>
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

--- Comment #20 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Sorry about Reported-by, but if I added that then they would also want a Cl=
oses
and I wasn't sure if it really is this bug. It's something I produced on my
machine under my workload, using knowledge of how one commit is broken.

I guess I could have taken a gamble and tagged it anyway because it seemed
likely, but I had no confirmation and no idea if I would get any by the end=
 of
the week. Indeed, to this day the best I've seen is reports that downgradin=
g to
6.12 helps, I haven't heard from anyone previously affected reverting the
suspect patch.

Like Mathias, I was expecting some nightmare scenario and not that. I hope =
that
this is all there was to it, but we will really know next week.

My patch made it to Greg's usb-linus branch, which normally means it will l=
and
in the next -rc tomorrow and then propagate to stable. No other -rc has it
because they were released before it existed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

