Return-Path: <linux-usb+bounces-21562-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8AA58922
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 00:12:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50795169C21
	for <lists+linux-usb@lfdr.de>; Sun,  9 Mar 2025 23:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A31AF22172C;
	Sun,  9 Mar 2025 23:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pdUJinFN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A9842A93
	for <linux-usb@vger.kernel.org>; Sun,  9 Mar 2025 23:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741561936; cv=none; b=hXd5F3laMmH91JLvsJCRdmC5+41pMPib3X0KRQZfKoa1rRut4Q9roTDZwsUACv1tFk+4KUZtrKWuKcfA7aDfgShYwEOtSOdFZZWqSzlziDXIoNAGA8nfH0ovatkb36XzBGAxw3NcN3/z7R0pvpPECrfraaK+lFe7+jc68Gn3FD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741561936; c=relaxed/simple;
	bh=njNMb12cNQunQAwyD7C7h0pVsvjaMzqnhVE/CEipFXo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dxQFTyB4ycbrNwPcCsXvtcDZsQPVHBkSj9jvRvHgMTwxJwL4t1RlCoQT2QhzAnfG12eeJki6iku3RbtSxdLSWwVec2HaS84V0sqfBFuAlQRVWCwgjj1oiwjSqKu+8iayipPkdUErby2TQqmCaNbrGaPvRCTeZCvPBCuSHtAjJbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pdUJinFN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E831C4CEF0
	for <linux-usb@vger.kernel.org>; Sun,  9 Mar 2025 23:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741561935;
	bh=njNMb12cNQunQAwyD7C7h0pVsvjaMzqnhVE/CEipFXo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pdUJinFN87TDGKuyHbRS3PAcaIwj1JTUW5gHVt8qBDmFAZjnENJgnYunBoOSF0dqk
	 iK/X8NIC4KQRctd77glE4JANsXoBg8UvoK1CsFTBeM3/EKYHoFlWJZqK2viWy8mROB
	 Dcm1em2eIloLQ6Udk/BsWDE5kNtUD0GMkqwOLuUcagfrHvpanDK3WuVQgtsSDUTZVv
	 poNbfXLnAeXlqbmB2wjyYpZgUKNip34rU6m6xaoaSc+j1JErAT0qtfKG2sKI9CoOaA
	 I4vy6viAMofQ0VbWf+FYlOp8LHG6W3gjv6jOS+BbrY+RYGXxNq/H1OlogO0WzndaGn
	 F8sQw3OH8rvcQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 84FFBC41614; Sun,  9 Mar 2025 23:12:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Sun, 09 Mar 2025 23:12:15 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-1K91ZFBh3g@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #29 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
This should now be fixed by
c133ec0e5717 usb: xhci: Enable the TRB overfetch quirk on VIA VL805

which hit mainline today and is bound for stable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

