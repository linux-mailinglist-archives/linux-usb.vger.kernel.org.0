Return-Path: <linux-usb+bounces-10669-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8A88D35C1
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 13:46:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAB9D2825C2
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 11:46:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80ACD1BC57;
	Wed, 29 May 2024 11:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bGKIl9mM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AECA17F39A
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 11:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983174; cv=none; b=Qc76M7pgzZGT3VVv2oMAz5K+1pEn0bzD5ou5IuPqdb7NYOgWLEqpEVoOD9F+6ywMiNkHZ3nzdyvqncpMsBGt0IQtOkhMTxzGt+LyAL+EMjGnZ4DgQoKVsIT47Z7YKz1jRdca3vDsFCUvgM7DZ4DjQKMCm2Vjlj5IhX0pRVQvEpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983174; c=relaxed/simple;
	bh=D1YO7ZInUp1l5TZU98iGoZ4cxD+9EZRy6jKN+oIn8HU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QPLrFgK5r9yHi3KsiU2j7uo035Sqh2kWbK0QMw6urDgzBspp9aC+8N8BbrTRSW3bjpGiHX69VCKRIe9sQaKj5p0gY7QIsfwXyWwVPp6QenMzBQRVz756IiHge2NYjBm5oDKKF7ZYSx5i9g0cVndGa6wxUZrPOY3CBEHZCXqCk6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bGKIl9mM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F6B4C32786
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 11:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716983173;
	bh=D1YO7ZInUp1l5TZU98iGoZ4cxD+9EZRy6jKN+oIn8HU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bGKIl9mMs1T8fvaIBBQSAkgKQDH0x4VLF4Se8fGn6ST5Ac5Y/xL1g5/c0OEpcoza4
	 ITT4b3qAV8hdFLzA2MhGqwlWfG6/xce8p/WEEPVnLnzQBaPA/fW2w/P/ki1KEX4lcp
	 MQ6UZkacllaf4PL+0VUgjqHS7IQvkJYySq+veE9DUGPZ6tepXKjfGclLxrujzs1Yx3
	 E3Q9ZrY6wkWG4iKkChb2mzHsbvRe2Obz5mqd5FpA0lVEpGsT+l05TX3rYM9DEQen5F
	 OnUsyv/q+N6IBD4t6Efdc6mJZc2j947lcXTngVaVYQ3so0S/ttuggdkhZgDS4YEitK
	 t1eyR2pJY/ysQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8CF0BC53B7E; Wed, 29 May 2024 11:46:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Wed, 29 May 2024 11:46:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218890-208809-PPcdtXjipg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #8 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
FWIW, to make sure this is known: another regression was bisected to the
culprit and a patch for it exists:
https://lore.kernel.org/all/eec6ebbf-061b-4a7b-96dc-ea748aa4d035@googlemail=
.com/
Does not sound related, but I might be wrong here, so I thought I quickly
mention it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

