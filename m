Return-Path: <linux-usb+bounces-23738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B37AA9E4C
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 23:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 756911A8194F
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 21:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A03274668;
	Mon,  5 May 2025 21:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jqzzs+hm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF4E2741CF
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 21:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746481262; cv=none; b=BbYK/tBfsio0D+D1YyiLukQlOy5XP7FcHiGB6og20sg/UrvP1t+zhHOhjE0YP/U8fozOkiNrkx2CpLHMY80ZVg9Lt4tinHzVy1hgi1++TaXNjYwfOJhxyfHKnofOjTxUJSodpw27mera1ffZesgoYKTjCGigOLamnILVM57p2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746481262; c=relaxed/simple;
	bh=aft3bVpBHH/E4P6tbGOBGfJNp1WHbRoPUrX2st14F58=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YOEkEBqCbWm1f8oRgb7sU6OSUb5o6wAGTm2/33al+NKI1ffVbBwxanqE3kvz6IyOVkAB2Ecnad3B9qfiP+yuDwxdIF/CTocmRdjgkca5K9hTvKvvC/+kLXpLRXcY5cCyeUgP0gxkAwNl50emx0URNn4QhI3h/uW5wMRnQwNOCtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jqzzs+hm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D3CDC4CEE4
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 21:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746481262;
	bh=aft3bVpBHH/E4P6tbGOBGfJNp1WHbRoPUrX2st14F58=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jqzzs+hm6CTEljGXSJ9V/PbOHotJoqC9hrB0kv7rsJbgGfEs4i13rFgSw5xrIXZm8
	 CfLlfYJ4aIYXNjyS8mbwj7V0kpsnaQ3DnD/zwYgPO6hqYY3HPvzEN7m73338Vx3Nyh
	 WES0xr7AfZKu4zpQfPEZKCtRJGhBvYurU9K+UF/R6G2k0GsquABqNgPfoLe098Jb+n
	 W3s6uOi5055NqsOvfxS1yO0hVt4gCb0cj9tZ+iQODQzSBckjuNrMcBGcPSibi0S8hW
	 +v6L5oxbFwE1turI/kyfFhzTSJgVUx9MCxwVIVIOwlHPZ5M19sIcsyJ5piJqhPyoav
	 XR0HtiOypF8aQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 280B4C41614; Mon,  5 May 2025 21:41:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 21:41:01 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-eoiAn1ZkGG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #45 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
If you disconnect it from bus 5, you might as well connect it to bus 7 then.
This way the two buses will be simultaneously testing two different
configurations and time is saved ;)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

