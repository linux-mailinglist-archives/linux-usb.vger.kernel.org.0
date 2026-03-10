Return-Path: <linux-usb+bounces-34400-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFwqIJcDsGkWegIAu9opvQ
	(envelope-from <linux-usb+bounces-34400-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 12:42:15 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E5724B5C3
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 12:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 69ED131C20A7
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 11:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE6A389113;
	Tue, 10 Mar 2026 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gh+4SPHv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481B22ED141
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 11:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773142726; cv=none; b=LvhzaC14UQaJIFhFanz3vq2mpeFEGn2rxyUnDVsS+UOEVYg6FYGPl54voaGxnABLSN4KN8R5kAVJ1CR1EwIst1vWhg4cfbDaWtlYSL2doSQUCWnFq/M1sijJcP8PDlwAUFciAT/y1Jduv9sGK3nKvbopWEg3ua308Y8zd7lrWrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773142726; c=relaxed/simple;
	bh=lCbhFVX5Ld7YFf50c4b2A+iLUisDyEnYZXjl1yizUUs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MFL/GkbS5O35ZpyQ1c+twV9v8WLQ7FH06rYieTcwWp/HSLa5/K/7Mc1crGIJWbBd3T6pptS3feaLvNSG8AtVO/+vZVz2OaDAiWbh8oshi4fvfj/ssPmVmSws49LmGCNGMyteMjSywiB0MBTUcS+YE3E2WJMWzzhSJhYCijpAL5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gh+4SPHv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D44DAC2BCB1
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 11:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773142725;
	bh=lCbhFVX5Ld7YFf50c4b2A+iLUisDyEnYZXjl1yizUUs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Gh+4SPHvo1Q/Mp6SnemcFQvrMi2T07aHOcs+WzRKMwtIE2kSiEGTf42ATp4jxF9de
	 5tkz3IwfRRuve77Wn6irfWBkLBuV/MnUlynHmL0nyg0bbDg6shAXgMo6/IELNxFBgt
	 MQk7qSeraCTpGMbr8D4evujmOZk6Y63Ya4jmQ9r9fVbV9jBGAHfkGMpjq8k/tgQeVf
	 Efvexm4nvcuyCKtU2dKEse3ptbK47YluIWN0mPN3VkIpFpMy54aCTrcVfOGPcgdJ92
	 xb2yPGRMwoJR2yBlFxGXiS6AXgU4vXQMaPi4WoUYyWRnCHm8b07a76KPqvU0fwlVTi
	 n/ymi9FuPLe/Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C47FEC433E1; Tue, 10 Mar 2026 11:38:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217475] Foxconn / Hon Hai Bluetooth adapter 0489:e0cd stops
 working on ThinkPad T14s AMD Gen1
Date: Tue, 10 Mar 2026 11:38:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: berto@igalia.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217475-208809-sZcSmtoYTv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217475-208809@https.bugzilla.kernel.org/>
References: <bug-217475-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: D2E5724B5C3
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34400-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D217475

--- Comment #5 from Alberto Garcia (berto@igalia.com) ---
Hi, I'm on Linux 6.12.73 now.

I found that btusb.enable_autosuspend=3Dn seems to solve the problem.

Commit 67dba2c28fe0 ("btmtk: Fix failed to send func ctrl for MediaTek
devices.") prevents the device from suspending during btmtk_usb_shutdown() =
to
avoid timeout errors similar to the ones I'm experiencing:

   btmtk_usb_hci_wmt_sync() hci0: Execution of wmt command timed out
   btmtk_usb_shutdown() hci0: Failed to send wmt func ctrl (-110)

So I wonder if the same thing is happening during btmtk_usb_setup().

There's a long gap until the bluetooth driver is loaded. This computer has =
an
external USB-C dock that sometimes takes a long time to initialize, also the
hard drive is encrypted with LUKS so the btusb driver (and its firmware) ca=
nnot
be loaded until I enter the password and the rootfs is decrypted. All this =
can
take easily 20 seconds.

So maybe the bluetooth adapter suspends before the driver is loaded and tha=
t's
why the initialization fails, does that make sense?

I tried patching btmtk_usb_setup() with the same approach and so far I have=
n't
been able to reproduce the issue anymore.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

