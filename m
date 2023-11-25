Return-Path: <linux-usb+bounces-3312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F1F37F87A3
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 03:03:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB14928194A
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 02:03:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73B511109;
	Sat, 25 Nov 2023 02:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e2OiIW83"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA69FA21
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 02:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46575C433CB
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 02:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700877798;
	bh=GnBWUkU+F+fLvPf1y4emFUyTJnAglZ+1o8Lj8ndkB/4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e2OiIW83XsT62o9TfiVua20akQuT0vrEm7mPaEg72vw4LtgpRSrbPFqDn9z7n4flp
	 rNKWe79rUJmFNFh9BFNiiTRGm//Of/ERRLQwqRfMHevOnRYJvPMw1xvLj9vW1oRuEc
	 ZBxssGzmrseqAZotyuBkqr9PoVjNr2GaF28gwvONUj+r0sOIiSoYlaTQWGdIzcm9lC
	 +g0iCI6io+y76KnY8qpmLcWmvP/6ifxqyw/Y6BKin1bRt5x9ZZbQYwql9UNofHjily
	 nNj2k/qXNAY8fFDcqYLhZq/SZ45MRKvqQCW9UoX5sq3WD2K+ArR1xFt7Z2NMl2WrnL
	 R4nOr5Fq9+MfQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 31E1AC53BD3; Sat, 25 Nov 2023 02:03:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Sat, 25 Nov 2023 02:03:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-BUvlsH8HDz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #31 from Alan Stern (stern@rowland.harvard.edu) ---
I don't know why my local test didn't reproduce the problem -- and I haven't
tried to find out what's happening.  My best guess is that the allocations =
of
hub->buffer and hub->status end up (by random chance) being non-adjacent, so
they aren't in the same cache line.  But I haven't even run the test patches
attached to this bug report.

Regardless, changing the allocation size to 64 merely hides the problem.  T=
he
real problem is that the DMA debugging code is wrong and needs to be fixed.=
  It
should not complain about two different mappings of the same cache line on =
x86,
unless the mappings actually overlap.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

