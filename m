Return-Path: <linux-usb+bounces-18737-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 010D69FAD66
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 12:02:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7901C16450C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 11:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA3F61922E6;
	Mon, 23 Dec 2024 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LIO9B2pE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3281F171CD
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 11:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734951725; cv=none; b=RX4NPN5WIM+b0t92IOZsJBZGAgaYePy/DWW8jp2jm4pyj1rTSTsp0X6JGbTfKGWV3MJiKVYVxQSQi2CemGlfKSDPuuYIf2aLpOqzagVs1goczOGxaFmHlbYk8D79DN5ninnXXmA5T1Z3QTLXxp1PHn5I9kkP2UBTgSXQeXoZGLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734951725; c=relaxed/simple;
	bh=8L3z5GXo3c2CZidxSXGsuystz5034/MEFhfJ10kfc1A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bzdYcB41xefEilyxFJ1LUEodbGuEP5cmJhNLWdtrd6+4uWj4NsAGAy8UydrY3I6hU0hIxcoDe5P0E9TWoMzkirs6lAp2q2TZS3WecWIhfbn125Q9u23d/DliMHFjyhv0BzeqErj3/Vsug7hRFpfRKF/W2t+ocVmDBsEtALXulPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LIO9B2pE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE77CC4CEDF
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 11:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734951724;
	bh=8L3z5GXo3c2CZidxSXGsuystz5034/MEFhfJ10kfc1A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LIO9B2pE0XG8cHPpH7J9pp0QoPYMTuvZLxtA3FGKZvNzhCVcFGYg7ax0/iLGQjrdn
	 rt3I/P+L6JOF3QJCDDhYZIR+dzJGKMSx3EMigvrS9gjbGyP6aoPjoO969mtqrFsYcj
	 10W+frwbPsZtLqXuhKHicXx8PGhT64tdfZeZGWu0uVZPaIa+juHbeQOBWt7C8dVa4t
	 c6DTsvoKCBEYUPDcCfLWlqx/qJ3wm7rnOcVFNyc21qChhCPODWl+fnmdd0mnsAwE2Q
	 XQW9FmdxVCm2yVEVoZnP0mixUAbOdPAWov+W1R09oMkcweAkhzijJrRof0kqh6RIyj
	 +ewmLKfC241jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B84D4C41612; Mon, 23 Dec 2024 11:02:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 23 Dec 2024 11:02:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lists.rolf@reintjes.nrw
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-nwSj9yCboJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #23 from Rolf Reintjes (lists.rolf@reintjes.nrw) ---
(In reply to Micha=C5=82 Pecio from comment #22)
> That's good to hear. Just to be sure, can you confirm that without this
> quirk the problem still exists today, on the same machine running the same
> kernel?

The problem still exists today.
rolf@i7-5820K-debian-testing1:~$ uname -a
Linux i7-5820K-debian-testing1 6.12.5-amd64 #1 SMP PREEMPT_DYNAMIC Debian
6.12.5-1 (2024-12-15) x86_64 GNU/Linux


> BTW, there is speculation that the Zhaoxin bug may be caused by odd page
> size requirements of some controllers. If your kernel has debugfs enabled,
> please also post the output of:
>=20
> grep PAGESIZE /sys/kernel/debug/usb/xhci/*/reg-op

rolf@i7-5820K-debian-testing1:~$ sudo grep PAGESIZE
/sys/kernel/debug/usb/xhci/*/reg-op
grep: /sys/kernel/debug/usb/xhci/*/reg-op: Datei oder Verzeichnis nicht
gefunden

Which is translated: File or directory not found


> lspci -nn |grep USB

rolf@i7-5820K-debian-testing1:~$ lspci -nn |grep USB
00:14.0 USB controller [0c03]: Intel Corporation C610/X99 series chipset USB
xHCI Host Controller [8086:8d31] (rev 05)
00:1a.0 USB controller [0c03]: Intel Corporation C610/X99 series chipset USB
Enhanced Host Controller #2 [8086:8d2d] (rev 05)
00:1d.0 USB controller [0c03]: Intel Corporation C610/X99 series chipset USB
Enhanced Host Controller #1 [8086:8d26] (rev 05)
05:00.0 USB controller [0c03]: VIA Technologies, Inc. VL805/806 xHCI USB 3.0
Controller [1106:3483] (rev 01)
06:00.0 USB controller [0c03]: ASMedia Technology Inc. ASM1142 USB 3.1 Host
Controller [1b21:1242]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

