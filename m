Return-Path: <linux-usb+bounces-29325-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 23509BDE359
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 13:09:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ADE854F9D2A
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 11:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F346731A560;
	Wed, 15 Oct 2025 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPD3ypar"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74CEF1CD15
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 11:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760526461; cv=none; b=nksaFFfUroEv8yHVwnKDyyV7dAROMT0FUqcw57wp4w6yIyQhdbz0mM8K5PtFpeSgH52KFXJg6ORe51nEgzOZfXHfTrdf0jbf6XCKSFhtm1sBtnpjTF4faLmcOwilOklrZIE1st4gBC5XySVShn9DrusJy3ZtJogwFO8l6zVaMSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760526461; c=relaxed/simple;
	bh=KriGeU+Am0HcRNUVW1z/9G8Xdib3Pjq8OcNZFR4woYM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MOA8PYDTgroL5f+/doFerAGp24EkvLdLvRQs/4yKPk7BjzZUjotfazT4+Tpzj4sCwa+zXh8QnKlIDOvmF6PIEaw0fYhRDTmts5muDWLQ2PU3gg0SCrN6EbkDvX9+UQXsCrzEjrjq8arlwT4/vvpPaFIcbpvnkcbYxpzh+evpYmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPD3ypar; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BADEC4CEF8
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760526461;
	bh=KriGeU+Am0HcRNUVW1z/9G8Xdib3Pjq8OcNZFR4woYM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KPD3yparPuCxZv9+3rgKl2QsWuEIc6vMGWQND6VIsxEfLZrUxtE3d2GbuQi5YIj96
	 H40j2VQuwzr27qpCfmlVZaiccRFwlKT2OeLICJKN60gXGZvhUbQ1hl44vK3lRBTSuS
	 Nxx4YK6Xds4k9gMDI8PbZ4tnxs1+5k72KskEZO9XugFg+2IrPjWpM73iv8psO1yMg6
	 RCk+AnZ++uQO5flxuBhgkpjNwz6fHU0EhlB4x+IGInh1C1Wqfzl9SSbyb9SU8Vq0rA
	 9KtHY33wY9t8EHSpocrJktmLO/9Z4tp2HEKkR58T/Hwp3BhDcodHfxdAquD64U6SU+
	 6OzWMd/rDnLvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01ACBC53BBF; Wed, 15 Oct 2025 11:07:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220667] xhci_hcd prevents S3 suspend to RAM from working on Zen
 5 system
Date: Wed, 15 Oct 2025 11:07:40 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220667-208809-r9N3bYqqmu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220667-208809@https.bugzilla.kernel.org/>
References: <bug-220667-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220667

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #2 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
The empty USB 3.0 hub should be gone in v6.18.

The non-empty USB 2.0 hub is gone too, which is a bug to be fixed in v6.18-=
rc2.

Please start with checking if this commit also solves your suspend issue.
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?h=3D=
usb-linus&id=3D8607edcd1748503f4f58e66ca0216170f260c79b

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

