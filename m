Return-Path: <linux-usb+bounces-27248-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 397C8B33B49
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 11:39:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A57C189A893
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 09:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C29FE2D060C;
	Mon, 25 Aug 2025 09:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YK7WFXKM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489DF2D0274
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 09:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756114782; cv=none; b=GBDOtWN/ZxYB3yVdXmJxb4EvebLKNOwMikwfRZFngvYJeg5vXXAE8YRKiz+a3bLKjB014+hu3POAn64ygJJM9Q1ABEbaONiXHMQALqzcsGRj3FIXdeeBGmPxAztT7I3rMwO2G50FXlfZ4p1JuhJh3vRDkIu6/u2kZW8ka0OQ9ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756114782; c=relaxed/simple;
	bh=pMdb3YsTQmoAgkYQXhs8I3PPADw8rxB9dL7ApKvahAk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NRNLKJ/JBTXyEH0NculA4TUevDA9CoZR8WSsKAm4LL1KYmFZt86jULh0zVtB4UsjGbWTW1RMuNnQxVDD1RZ/IoUxF2j2HCs7qnUiL/pjOLGtrKHMwHZDmrvPLDCcxw0unKUfzsKW0HxTw4b/onB2eg3COjtwED/gbyZHaRx6VRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YK7WFXKM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D80BEC19421
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 09:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756114780;
	bh=pMdb3YsTQmoAgkYQXhs8I3PPADw8rxB9dL7ApKvahAk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YK7WFXKMRi5MNUb+2pUYV8In0DXJnciofCXJDM1mq364VlexUraSh639I1sHZiS55
	 RXA2b4aWTvi0ptKcGLH4+TeZFjNQy2rrvifqBbzI7PiUX5o7FB+zFNkA02wQFUS9hl
	 kh4GlG9qX1TDawaj9bF2s/k0A2g/nlv8h6coYaXR+HxuTrmEP0MMpAVAKRiD3qqCJo
	 5FyVEV+JPmTiIHbDCO+YbZ2YUJvgUaCCizNzug7hXH3bRIpH+cpIxASZaRBLx69FfP
	 rX9iCDQrf5DnTagec3WYMNRaJOQZmoe58BXcjwTnrLMoZeGqSnRxN/wKoucG9+52PM
	 p0ydpY5Zvddvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D03E9C53BC9; Mon, 25 Aug 2025 09:39:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Mon, 25 Aug 2025 09:39:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: niklas.neronin@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220181-208809-DWZRBElTyu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

--- Comment #15 from Niklas Neronin (niklas.neronin@gmail.com) ---
I believe it was built for kernel version 6.15.
But I tested and it cleanly applies to 6.16.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

