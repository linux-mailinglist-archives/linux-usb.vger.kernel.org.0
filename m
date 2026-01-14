Return-Path: <linux-usb+bounces-32332-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D6D1F85F
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 15:43:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E3393025A53
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 14:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5DC3191B5;
	Wed, 14 Jan 2026 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AkyaZ62I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9DC2D9EC5
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 14:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768401800; cv=none; b=aoraFRsuKorccskdQmAYYwMJw0sTgdlfpIxMY8FirVwJQtLamYwz6FtdPmbkzyjWOzXOmGBxll4M6hkXCdybVom12PxLSA+SlfTPqUnB9xrA6QOnb/kr3LBLe7YbJ0424TkJQm8kZwLWNRBicsZtzJxlZlcWBuQciXN6gRa4sco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768401800; c=relaxed/simple;
	bh=odf3xXHoB80cz47CA9bnUM5ODlrZF3f0xnkw21iI6F0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JTjQLLzcs7fSwNaO6yK59gT5WlNnw67x7yxLkOkDwh7ngWqv06Nsf57RyQa3YpEpwSGQD3kqyeGmarhiUshR0q490wPBBRMeYMt9y84l+Z03EnUmCoLdpZzw8psuQlB0OIc6ZY2Df0taRVO2KxlGSuQrnb3voe6vRPUdhC45lGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AkyaZ62I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D39AFC4CEF7
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768401799;
	bh=odf3xXHoB80cz47CA9bnUM5ODlrZF3f0xnkw21iI6F0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AkyaZ62IR8kIgB7T7regBMzsLaysmncFGN/Pf2OvRne+cx3m+9y8qqTeG201rTRQS
	 yJXN2lmMkbEJ+VnqZhB5uOYts5mmndrSzGtKUf1a+K9JgmRI3fc6ePH5HsfEUdbeje
	 q5rRl0Dg+Fp1IsAYf2Bw5JmQN3DKUYWW9ohEf/QL0Um9sChIWwelwW7voMFno8Dt4A
	 srRj/HW8igbMhyVI7jpHsPrROyB55fVOTWCDtuGdxN7GfjLwauojBxVX8+VE9rx7qj
	 MhN4dVEqnAwoFyzQSuapSGbCAoufl38RTd6i1wTpEyE5ZhLwZSAnvR8ZnxodYSj2mB
	 PWxlxVXBAeTWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C9A46C41612; Wed, 14 Jan 2026 14:43:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220981] Potential data race in
 drivers/usb/class/cdc-wdm.c::wdm_read
Date: Wed, 14 Jan 2026 14:43:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: oliver@neukum.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220981-208809-DsuFZsZpD7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220981-208809@https.bugzilla.kernel.org/>
References: <bug-220981-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220981

Oliver Neukum (oliver@neukum.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |oliver@neukum.org

--- Comment #1 from Oliver Neukum (oliver@neukum.org) ---
(In reply to Francesco Vincenti from comment #0)

> By looking at wdm_read() implementation:
> wdm_read() copies data from desc->ubuf to userspace through copy_to_user(=
),
> without holding the spin-lock desc->iuspin,
> while the RX completion handler wdm_in_callback() may simultaneously write
> desc->ubuf under the same spin-lock.

wdm_in_callback() adds only to the tail of the buffer, while wdm_read() only
takes from the head of the buffer while having dropped the lock. So, yes, t=
here
can be simultaneous uses of the buffer, but they cannot corrupt data.

AFAICT this bug does not exist.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

