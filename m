Return-Path: <linux-usb+bounces-20658-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B59A3666D
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 20:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 095D8189220A
	for <lists+linux-usb@lfdr.de>; Fri, 14 Feb 2025 19:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12D2519F121;
	Fri, 14 Feb 2025 19:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnRP4Nol"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CFA18FDA5
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 19:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739562427; cv=none; b=HjwOEmpUTaEYqTmrBEL9bakPESmM/aXIn7u5Yi4ySAiCrdH/RPzWYBWzlzv8Ke8WR1HRIs67+Sdpf4sg9KRh5oeWff6BZJfNMDGRXDafCh2uICuvR1w9FeQEN83bSfd+WgrR2SbXkY2wRMl81mwSdjBasOuWOJIVctc/sdIi2Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739562427; c=relaxed/simple;
	bh=VBGLuPub73Zgm8kD4gfHEn8ZgVaV8NVr5BZzrsMAiRU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HozvMc39Yf4PIiIIvuulOTVQFjTw0Y24xyNOsZTMOnnthrr60jq5Wv2TJYBa4+aGw+DGT7cfmjD9jHUFwFM5wtgSTWbyN1mV/4tZjkK0C4cWLuRes4Dg4v2Y0GYMekueWuEizukDYw2/CqoV/UecjW+egrGy/AEAzaCow7+BWWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnRP4Nol; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E422AC4CEDD
	for <linux-usb@vger.kernel.org>; Fri, 14 Feb 2025 19:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739562425;
	bh=VBGLuPub73Zgm8kD4gfHEn8ZgVaV8NVr5BZzrsMAiRU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qnRP4NolKvf74cwPBkUT4hioMtX2DkHcIfVazm36k4LXVYy+mbKoARji3g1p0zRNV
	 q1sokcrD5IP4Z03aA7r2wkY903oUPhoapdLNeDXsGfBgsGAf9WuRfrr1iElGM7LFaa
	 WwEY35QuFtLRsW5VmuSqbE1tPSuPmRNYEMHCcD4k7PNrA9+nnkPLozj0nqIZU0MtQv
	 heISe0kexUGWYDmR5xpOFHcLzUUS2zW9UeONRt1n7pBoRrMhStnKbfrKqFlf74BYTI
	 E/FuY+OZDb9JDGfzEQ3jWrwov+UB06UjnI+UpqwX3JzPbHkJ0ADY0OUcujWNeU/szx
	 6ZhmMPQc9Fzag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DA6CCC41614; Fri, 14 Feb 2025 19:47:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Fri, 14 Feb 2025 19:47:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-ScYD11X1y5@https.bugzilla.kernel.org/>
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

--- Comment #10 from Thomas (lyz27@yahoo.com) ---
Created attachment 307660
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307660&action=3Dedit
dmesg with skip retimer patch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

