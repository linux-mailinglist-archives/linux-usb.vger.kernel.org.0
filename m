Return-Path: <linux-usb+bounces-30076-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 669FDC349C4
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 09:55:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 351D7192094D
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 08:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29C692E6CA6;
	Wed,  5 Nov 2025 08:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJRKzdsC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08A02DCF6C
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 08:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332809; cv=none; b=i4tYvTr9o/86KQltF+0n5ZJpwSbZe6oUC+k51U1O8vmGl4VdwR/LDpvfhpyGJTbW6Wd5CH9sX23sfAVS+oAEL2yR2Y+BCG9zzWF332yDtZPRaAZaeH0H7nzx6Nzt3pIlU5T3ldNJEA0P/VwFu3c8D7MGtsAWFP+6XvhzUusigog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332809; c=relaxed/simple;
	bh=G1T930tFz8bhMss+cFHbZMsMDjVgdUFMxSwGTHGp7QQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=noQFZROSjowkzeKjGnDK0W2ppBkJ+Be12oH9tzPoKnH7olnEq+ustTgn0T0vCJ+9BPTqlIjUR5BJu9VSkQ4wbcRNnG8OJcNTJ6GZeSeexdHRps/bxcy9W0TR/netHX322T2HGUykT2z54sTKyGiP922910EXHq2L2ZHZCzImbMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJRKzdsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29FEAC19424
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762332809;
	bh=G1T930tFz8bhMss+cFHbZMsMDjVgdUFMxSwGTHGp7QQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BJRKzdsCWUqM6OvUqYRM46jxb1RfR2tDlBuagVGBRxDS5uUPWLBzhKe7vkzVZHkUL
	 V0icLDSkPBYpPrc2ovENFBhjC8VPeTxHiDV8FIifO1l2s12PAB8QlfUOvLcbKtN5fD
	 SYzvFAfVUsuJrWV0gpi2haf+DFucF4NOj2L7Lod0QbxpuHa/NvMH41Uuny4apht3W6
	 RNC2LvGCO4jYpnFuYDVIJZG2MD4Qc3mybo7w/NIdDX0YHzW9AM3eUTKCpej0NmS9U/
	 4UjuIzJviM62tQw8MkPSsaG3Kvhcobsf7CU1dz5GODcbky3fjQikCKVnLiG190PEOU
	 HCO0vTVWfVpxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 251BEC433E1; Wed,  5 Nov 2025 08:53:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 05 Nov 2025 08:53:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick83ola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-OIrCBObNgv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #3 from Nicola Lunghi (nick83ola@gmail.com) ---
sorry haven't finished responding. I can try to skip directly to
skip_start_over but the logic in ehci-sched seems more complicated than that
and not being familiar with usb protocol I don't know how for example debug
this. what could be a test setup to see the frames or record the frame that=
 are
sent and the timing? with the ASAP scheduling if a driver try to send the
frames at a specific intervals the xhci driver 'breaks' all the syncronizat=
ions
in the way is this implemented.

the issue arised from a Motu AVB interface that expect a precise message ra=
te
and without it it looses the channel synchronization as it expect a specific
rate for the messages.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

