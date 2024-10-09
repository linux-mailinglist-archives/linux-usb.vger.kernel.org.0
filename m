Return-Path: <linux-usb+bounces-15950-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BAE9973B0
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 19:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A54A0287D61
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 17:49:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F6B1E25F4;
	Wed,  9 Oct 2024 17:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOwGSiu7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407DE1A0BFF
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 17:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728495891; cv=none; b=XjPb4S5RPulWt8p5umrkTOg0GxNaklUyNzei6fHA26TjLpcFhJ0On1/hCVd3fBESCw6WSRqtP3fmboYD0CRiVWLHa6gVf8liBFbPNRbAkIzeVHu1q09N+/7jMX/4sfbA5EfmmdMZgRrZfV+NOomP1uxpoQEJeiiWIp+AiJ0lug0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728495891; c=relaxed/simple;
	bh=VgJlaCxC+ytOCS96fad6kRHVn25KeEJQnX6VxxuK9kE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PIvhm7yYObbEdrRNDPAoROIEql8D6ri8/wwUbmvOuE0DNucgMcD7EM7/IfZ+H/yLwKsvrm8GXCHzSxNcZHpXXRfXmP+dV7tTsc421ULf0JhYyNol1eV5qVwDRP3SQ/2sVkJZR8jgW+jC5/mzrpEVqbgYKEOorXunrdsqsZ0ltfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOwGSiu7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA135C4CECE
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 17:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728495890;
	bh=VgJlaCxC+ytOCS96fad6kRHVn25KeEJQnX6VxxuK9kE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JOwGSiu7Hy1dwsH3eElhs//j5omhmTmEJ7DpAOOj48CB3Mp2b21DZoJd8xeUqW3Qw
	 TXmP1455s5Nf3/6fe6GXAolnCTqrtqxPVAd042YsHR+cPRVvXJYXQxAAXJfAMM3fXO
	 RKSfKif8/N+PMD6yorHXmb38qYyegFwy602C6cEYHDCdoC30epATYqbGaDTsMYlshC
	 ihDnwsr/S8FE2RLwpfXJFuqHJg8FR4Szf/bZzxJtbi76j71rKQcPzGlKXwykhcu/HG
	 Z/HO0u2Q4+RCnOjx3GSlTTHV7sXhshukDU3ZGW1YXhIVTNY/ITD+Mxs+fchzlg12Hi
	 1pN3Mw6l8chUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9F6E0C53BBF; Wed,  9 Oct 2024 17:44:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Wed, 09 Oct 2024 17:44:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Power Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219362-208809-1roYxLE7XJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #17 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
These operations are asynchronous and they don't even seem to be synchroniz=
ed
against each other. This is what I got from s followed u:

[ 9oct 19:21] sysrq: Emergency Sync
[  +0,000028] sysrq: Emergency Remount R/O
[  +0,019142] EXT4-fs (sda2): re-mounted ef717e3d-539d-4988-9a02-ca541d6433=
79
ro. Quota mode: disabled.
[  +0,002201] Emergency Sync complete
--- some long error message here
              Emergency Remount complete

If subsequent o would execute before the u is done, the u would only increa=
se
risk of data loss by making the disk busy right before powerdown and by
exercising the remount code against a concurrent loss of power, which might=
 be
a neglected case due to its rarity.

You will never know whom to blame without hours of debugging. Myself, I wou=
ld
try
sync ; poweroff -f

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

