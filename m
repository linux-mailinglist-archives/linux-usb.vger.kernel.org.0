Return-Path: <linux-usb+bounces-23644-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA98AA702B
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 13:02:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE6624A4504
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 11:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7090231845;
	Fri,  2 May 2025 11:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oxb3KjEv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA474C8E
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 11:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746183732; cv=none; b=RsJxOfQxNhaT72aVJNuk2NK/8KilVzmhIrsXD3/hQP7xyR48Y6MeWmMGHIaeW+4xo8HHwXxHWTTD2NFtce+V3C/9dPMVOPnQAuc2DcY6YNazS1TD009ZePxLlHW/st+XRG5hLGSlkkbwCsamI5hIH9isqTPrM96wfIE1NRpbVQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746183732; c=relaxed/simple;
	bh=TSvPjIUuTzNjfN/ti2tTVPtWrY/ZL/o2wuH8YYJu3LE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=awDXDr68s4yI2fex52KXWCwhXxmiOQjV/Qn+AtKSVQ7v6J0ouQ1TMlc81q2WAcEJxa+T9cHGevFQa1BdlChC2TzVB31thU0V/ILCf5nwd9vQpIGxJtksuCdOAZflkykaA8q+SgdUmiwNCA8Ta2EZwUovfScbJ9YKM18TrgpPoOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oxb3KjEv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9CAAEC4CEE4
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746183731;
	bh=TSvPjIUuTzNjfN/ti2tTVPtWrY/ZL/o2wuH8YYJu3LE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Oxb3KjEv/f3CbBSj7e693zL/Gm1Ad50hkggHU9FBxN7puRbmTUX+HXOXW+d4nQaFb
	 qK8tVUyYsAcBO6nRfjeoGU64cgAVYhYVGuTCJlY8gQuMvvkMK/klDNkvLBoTS8BxH6
	 SReA0uIon3jl3wv6bBzSC5iXLa1ku3EbACQ9QEOQj3BDnEgfCxlacYByOHsiZAWL55
	 I+uCz6Auy8Tw9gxw2MBr9rtheympSsRoWo+BoSiz5lbq39JijMaKsFiQUIEdRWdSZm
	 89gTSCrv/mZva6CdchALtZrWwNZcTfWSnuZG+aqr+vvbgvU8F0fJ8sBnD4Q4LQFktD
	 NLzaHUusZ8fAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 913D2C4160E; Fri,  2 May 2025 11:02:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Fri, 02 May 2025 11:02:11 +0000
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
Message-ID: <bug-220069-208809-ioeZBxlEPJ@https.bugzilla.kernel.org/>
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

--- Comment #21 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Claudio Wunder from comment #18)
> In the last 2 times these match times I've been playing games. Another
> symptom before the reset, is the system freezes for a few seconds, includ=
ing
> audio, but then it unfreezes with the devices then disconnecting.
If my tricks fail to accelerate the failure you can always go back to gamin=
g ;)

The freeze is a known (at least to me) bug. I believe it's caused by the dr=
iver
waiting for the command abort to complete with xhci->lock held, which blocks
the IRQ handler for a few seconds as it tries to acquire the same lock, whi=
ch
apparently causes other random IRQs to get delayed as well. I have been put=
ting
off looking into it properly since December, maybe it's time to alert
Mathias...

> The mount was done after I ran unbind/bind from `ssh`...
> But here's the zip anyways, maybe it helps.
> https://gist.github.com/ovflowd/0b0aa5c748683eca33909dc3ed7c66f7#file-
> debugfs-zip

This zip is OK, but it contains current data from normal operation, not a
failure. A few random transfers on some devices and it looks like the famil=
iar
8-3 hub is periodically getting autosuspended, maybe that's what sometimes =
goes
wrong.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

