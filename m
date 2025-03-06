Return-Path: <linux-usb+bounces-21425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE07A54A2C
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 12:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21E87188BE13
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 11:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A179D20A5C1;
	Thu,  6 Mar 2025 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYsm1lMY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B68F1EE03B
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 11:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741262232; cv=none; b=A/OaaB8xvYZFTsL3c/xBCzGekwnJ6Y14aqcKj5gowYf0sWAoHwEZT6CgUI3H/SFW0YVdaIUqC+PXIXyCteMilFF2Tyh2pTef38z3PBf8B5E9N+qINYlUqStIAZNsxhWsQj5oUuI6vUaTyixF/cv2m4TctTbFyEozHzTDbdb4C68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741262232; c=relaxed/simple;
	bh=+zJhxc4EePyCDRJ4lgMwNhk8W6KwYkbpAz5PQIsFsXs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Bg6XmUaNMMYOhgorIfglMKrGBj6Y5kDWAYznR+Izt/HOyTmd+YV5JR46pRVyFVnU1ACABpGX3RDa2Ke1LkVkS8sf2hIUvR26mF1uuenwg2+xhaZRKOQOlbV4uw+UZ12WpNItpoRpUe+HrTzcRkRs7N4mKRMT3RQJyb2ngyykkRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYsm1lMY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A81A8C4CEE0
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 11:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741262231;
	bh=+zJhxc4EePyCDRJ4lgMwNhk8W6KwYkbpAz5PQIsFsXs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LYsm1lMYL7OG8FxBOUb1leQJmP01U+GPaMEls3BnBbO3DS80bBjXQcJ1gBUYaVkO0
	 vd6GpOA0cpkzjtRedDgNPCBIWSyUDOxeZRk7/H2l1AW3smbOiHk5pt50Zj+NEriwnS
	 qnusy+8pUtZUAQ7oLnqcW4M30EEhQ/F0r7cnhPaDowkqwEbyJEmXMkAI19PFJFH1J+
	 nwqs2mWVPsaK1YbiHn91+hhIudNqQTYyrb8WvEJnTmBTx5znFu8quWag/kduX04YJs
	 jOOsyZsTMKrcDLBw7bf7oMG8w42c9SZmcz/OQN0SDkczynS2wQFQeTVLcVcS8xlpQt
	 UQ07UwnPyOVDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9E95DC3279F; Thu,  6 Mar 2025 11:57:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Thu, 06 Mar 2025 11:57:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-GYLobdqNGB@https.bugzilla.kernel.org/>
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

--- Comment #17 from Artem S. Tashkinov (aros@gmx.com) ---
Also, if you're able to compile your kernel, please try to revert commit
36b972d4b7cef on top of e.g. 6.13.5 and check it you can reproduce the issu=
e.

The patch can be downloaded here:
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D36b972d4b7cef5d098de63fee8d00720c051f335

You'll need to `patch -R < patch` it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

