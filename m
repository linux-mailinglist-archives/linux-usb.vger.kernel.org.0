Return-Path: <linux-usb+bounces-20263-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FD9A2AD09
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 16:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C335A16997D
	for <lists+linux-usb@lfdr.de>; Thu,  6 Feb 2025 15:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64B534C8E;
	Thu,  6 Feb 2025 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxolEfQq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC431F4165
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 15:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738857081; cv=none; b=iPRHIYLjWgEoNf5H+ALCMukz//vaBo55MNKVYXTbHGQDe38jPqgetv9r+mFAZGKMNTPUtfJFKdGW5rsprOKtKbtQgHSWJJw8ZDlIP69KmVYYcV7pdqVI354G685pFZxS3LQkwiOQmb76zINSw/dDIYamXqtFr7mvZ+kSbHdQwz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738857081; c=relaxed/simple;
	bh=o1JxjoiLIvceqnInnZxWj/ohtFjxnjQOKv/Xdts8FYc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bVp3ROGpLMUF7BZ1K9LJSKY/k5yEUJLTik1b1Y+LrMiR/wvcNox6/adYcgJp7OXWrLYgdiZ2f2tP9MyZETU+r1BAwBOD/4Q03EO4lhObGlnsZfwu4EQmynlfsgZiOIsxmEG8DDX/AKk+SAgIm9w3LZDwKlarcRgJ4SUyqSebM3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxolEfQq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD874C4CEDD
	for <linux-usb@vger.kernel.org>; Thu,  6 Feb 2025 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738857080;
	bh=o1JxjoiLIvceqnInnZxWj/ohtFjxnjQOKv/Xdts8FYc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qxolEfQq6HBY0HRCfZHoDPDtF5p9d1PDWkgyYKY/m8nR/fHo6Zq1j1UQX9m73zeDO
	 SNmBb6XjwoKPY15LfHCvIq+MLLZt8+fRLACsl2v2KEjFPmgw3syYC4g5qPa2T2GbWe
	 cv5Y9IBRpt/cUkb3ChbU0gGIePKmjCH5ByyWXuR15yX8kbqzvmQP1MkD7JRbTGtqaR
	 rJWWpNOEv0oDMU5cynqLF8chM4nodxjG2LBPtMAjUlHrJrSL1j8VAaADUIUOtURfTQ
	 lBm0eF6sLT1mLORylBXj7BSwkkv7bdEz9Zpt/oaw4U/EBJrnAebJ+G8YDfoqtCc9wN
	 9SVHd5MuEWh6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B3E57C41614; Thu,  6 Feb 2025 15:51:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Thu, 06 Feb 2025 15:51:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-xtAwLuIxE8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #6 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Created attachment 307579
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307579&action=3Dedit
Try to shorten SB access timeout

Thanks for the logs! From the trace it looks like similar what already was =
seen
with Pluggable hub connected to Intel hardware. The sideband accesses take =
some
time and the hub interprets this as "issue" and triggers disconnect (or thi=
s is
what it looks like). The attached patch shortens the timeouts to half. Can =
you
try with it and see if that makes any difference?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

