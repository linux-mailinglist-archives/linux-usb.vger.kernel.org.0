Return-Path: <linux-usb+bounces-25396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B45AF0D7A
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 10:07:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04C2F1C2428F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 08:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 613AD22FAFD;
	Wed,  2 Jul 2025 08:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEBzO07n"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDA68137923
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751443614; cv=none; b=gJDSdYaVj7S3JSfNu589ci8xMexXKjkmXGY/zvW6H/taElsm8oVSZMBy6zanXd/rTrbfiw1tX4IgSZ4IOYKxApbrwRNLDLszkuOHQneqM7w7uQxO3uloNUVAwmzD/j2K1e0/Q+S7X6oHNUZq/5L88eCo7FNkH6Ai5IGliF5C0JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751443614; c=relaxed/simple;
	bh=uorj/zoOcq9cYDkKyZ867NUb1Wroo+3TWoyPaO+gu6Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tIZ3CpQX0XPbHpTUvJwCjGwltAgn0zftbS15Fpl7wG6c28xXoAT/G/v3WAA5uuYoFU9rRyq5MkAS84XWMP6FnwskjEyzl2TNV1WurZVihm8aiZbftSI0oOJyl0ylCK7Km3+V5NTwGimsa0cLy6U6FBMhod0SO4162HeUWR3FBDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEBzO07n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79136C4CEED
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 08:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751443614;
	bh=uorj/zoOcq9cYDkKyZ867NUb1Wroo+3TWoyPaO+gu6Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AEBzO07nzeC490qynGQAmc5yj8AyDVluezyYEJYqtWzwYCNwGOWvYysXCklAZBalS
	 2eIJYndarULWAHdBCjVzQ+NgEnGObkl0KT4peadpKRNNL4YxEcdEwraDRsVJYqiPeA
	 Fig+qZQbo2FEQalMsm2D/mxtz1G407DnmbdR8C2i8/naMBe5VWSLJDwsaLXGJ5P/FO
	 kfriwjAw8MkjBEgas7FLvFSQMLYiT7sM991D8L1ef8zOhobSgDH56Sy1KignR8pAyS
	 QYaPhZVSPBgsUPvDRyz1X6vx+9lw1HJJ0stDWC1b8Q+KWZ/esZ3TijKbuTez5FYoV0
	 qjivRdu++Hx5g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 717F5C3279F; Wed,  2 Jul 2025 08:06:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Wed, 02 Jul 2025 08:06:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220272-208809-UZqAjcJoss@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

Oliver Neukum (oliver@neukum.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oliver@neukum.org

--- Comment #26 from Oliver Neukum (oliver@neukum.org) ---
(In reply to Alan Stern from comment #23)

>=20
> There's nothing to indicate why the mouse is misbehaving in this way.  Ma=
ybe
> it just needs to be initialized twice before it will work right.  Whatever
> the reason is, it certainly looks like the fault is in the mouse, not in =
the
> computer's software.

This is exactly what you'd expect to see if the CPU were operating on stale
buffers. They are memset to zero before being used for IO. That is the whole
point of the code which triggers this bug, isn't it?

This really looks like we are not invalidating a cache line we should
invalidate.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

