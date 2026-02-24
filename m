Return-Path: <linux-usb+bounces-33631-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCOJOhdnnWlgPQQAu9opvQ
	(envelope-from <linux-usb+bounces-33631-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 09:53:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC3A184081
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 09:53:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E0A18303F5F4
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8801936920D;
	Tue, 24 Feb 2026 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rG70VY+S"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1449E368290
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 08:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771923164; cv=none; b=VcsHtNneBu3Zhjieq5LU+MGkP8YYZu7TuKocopR+lX7kS1LFYLGWeoptAr3vBW3NnurqaLCnAqs+40e52bI4LsoVUbkBSm/ArB7WEY+z17TmzeBz5q+cqX1Ms1ZpWYRlA1u+zSq5cB1O0m44UP4eocUAKigxdZGPkaKSgnKSMUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771923164; c=relaxed/simple;
	bh=8oxehaWEyVMM201KxKlBnpaI2LbGFkWnoVyn61p0qV8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XLxQ+fjN9TpFQK/YbrGW+0FYpUw1dun3TEPEQK6eZkx0M3rGUARUIrzdLzvZrxsrWiDtR5PeYdI/L26a6P8yc1zEw1ASrm9NqMkHUgPHDlPS/277OHCppG/qkDBlSm0WKBIE15q1bbpE+wVok3YKyxqQu+JN1sb/Ucz6/JcnhmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rG70VY+S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4CDAC19423
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923163;
	bh=8oxehaWEyVMM201KxKlBnpaI2LbGFkWnoVyn61p0qV8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rG70VY+SVV/vVmtwzzPRwBUegsgmajCQ72bHVOrE+btBL7ePFzM7rHxYz7EvqqZY5
	 3G+2dQ0XAh1Th8ohj6oYRK+HZ4olA5508tI1ZqoBfW6ANXUYVa21xaaJxtrddxvC/Z
	 JJUvGdLNpM4d9jNAxo0f8YNAB7a2dOzSY+J7SKY7BQx6PeikE2ePJKiIV69VfL5DxO
	 jcbKKEoV2DOx51t2otB+TT/k4l96m4bNcdF6CdTLu+AreEAg8r91n0iruV2ExDwiKj
	 MllTxwIOLVwD1Th5j/9zIMnacVepDDi3/w6dxpE6WYnhQ0bQtWzl1WwfNMtrBd0a/y
	 0/1NoCxbDsQvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A6DAFC433E1; Tue, 24 Feb 2026 08:52:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 24 Feb 2026 08:52:43 +0000
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
Message-ID: <bug-221103-208809-6ZVh0KjdKw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33631-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4FC3A184081
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #20 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Have you ever seen this "Controller not ready / post-resume error / HC died"
sequence without the machine hanging? It would probably be hard not to noti=
ce,
because the whole bus with all devices becomes unavailable.

This is coming from xhci_resume() calling xhci_handshake() and getting -ENO=
DEV,
which means that the hardware malfunctions (or is misconfigured by PCI laye=
r?)
and returns 0xffffffff on register read.

I patched this code to pretend that it happened and I got the same log
messages, but still no crash or freeze.

Maybe I need to try it a few more times, but it seems that real users are
seeing a hang every time the HC dies while opening /dev/bus/usb/ files, bec=
ause
otherwise we would get a separate bug about "HC died" and loss of all devic=
es
when running ADB. Or maybe not, because the bus being suspended means that
nobody is actively using its devices, so nobody would notice if they
disappear...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

