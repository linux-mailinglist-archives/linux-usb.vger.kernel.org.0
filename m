Return-Path: <linux-usb+bounces-21161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 56744A4865C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 18:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 147041885B15
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 17:14:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A3D1DE3A8;
	Thu, 27 Feb 2025 17:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSUOCbYJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A164A1DE2AA
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 17:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740676472; cv=none; b=a+9Y3vzRO605/8peo1tE1PiTUeP6bcHFcDpwYX1At8pTtLbthHmzWvYxywB/wYHYd3Jg6hsEIq7tz87dy4bYpEXgu/7JeEWIaF5oDh9KZ87f6V0/b4N9g7UR094e0oBZYMGjbI8JnbNswfMnCOGh7SQRdgRU/eqvvakFUKhAAXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740676472; c=relaxed/simple;
	bh=UogCCHgyHKAand1lzVHayQbpcvPALXyevR1kArroPj0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SLP6EpjfFwQqyD/X6usla1kPG/rC+5qm0iqgdx2MAEGmR/zG1nF0tufTgc6YvT8UQpN9rXu0H293PQ2f0KQT34S2U8u4YL0Pcn5PnOnbtVNxyDGYUoxYLGK7K+WdfIMp7zzBju+VIMYAp8+0SE1ciTAYZInF5YrVqjqgJG6JEvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSUOCbYJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1AAFBC4CEE7
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 17:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740676472;
	bh=UogCCHgyHKAand1lzVHayQbpcvPALXyevR1kArroPj0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lSUOCbYJy1EnbhtEOTNaTP1JTn4iVqSqB1+kEXGj8Tf8AL6isp7Cs+sRdc68QLy+f
	 QE9/KxBmCDadXTctKOc40xkTXtDGliFsyIU7BYUsuve1cOuPAcNgbSb1QC5h4RhoGe
	 IxBupUMPvd2W/SJXnFBY9XNsN8NjDosl/FKfFtorS546R8K36p2y0cxkeH5uMXuPgz
	 hGMRqUnxed730L93KPCnEi0qGrsQJ52clA6rViVxcR98tCsyMiVHW3uup5TGDnf5H/
	 CRNAT1H20hghyut4dVb80mqGwwGSku5KYj74+1jSJGUMwS2Mu8C2pDexJ810kNgmXN
	 MXMYEL4We115Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 05214C433E1; Thu, 27 Feb 2025 17:14:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Thu, 27 Feb 2025 17:14:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219824-208809-F651s15w2m@https.bugzilla.kernel.org/>
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

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #7 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Which exact versions were you running successfully and for how long?

These patches listed by Mathias are instant first suspects, but they were a=
ll
backported to v6.12.7 in December. Most of them also to v6.11.11 in early
December and later in January to some LTS series.

Any chance that hibernation is indeed a (delayed) trigger and you weren't d=
oing
it as often in the past?

Did you come across similar reports from stable kernel branches in this yea=
r?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

