Return-Path: <linux-usb+bounces-35999-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EcHKc7l0mlecAcAu9opvQ
	(envelope-from <linux-usb+bounces-35999-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 00:44:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E3C3A0088
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 00:44:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7EA113003715
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2026 22:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5562DC350;
	Sun,  5 Apr 2026 22:44:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBHJ2+Py"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF327370D48
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 22:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775429049; cv=none; b=oKhtNxXkhOxuHWWkzDiNsK/7mAswI6dpdgEK2MY5Csz6b/b0cb7MvLt7O0Xsn/eyYTH6IrLbJ6uXY0kd7PKNBpGwi9u45gm11CAZeEpNzM7/yHvogZ1CLBlk4cB580U4ZZU0Paau6NgFykdsr175SkF4M9/9t7FgPrsVoCUfS8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775429049; c=relaxed/simple;
	bh=+ayvcascu/jB6QBDpwMIItKmeA3EAwmQ8c0enEXgqxo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jD66TzrZkSVCjwtIJ0nbsJllw5Wz1Ktwc90AxibeLTpeGs3xGED54DR1OjJk6ceep2itt1zXDxki2vGNfW5j5FuZAX8jdI+AEUwdR0LhgqosIXd6h9+OL4H+3MC9zYJimyA7vCTlcb2Xozoau7P7/ycSyQhWAs9JsR6rmAnH5oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBHJ2+Py; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B159C116C6
	for <linux-usb@vger.kernel.org>; Sun,  5 Apr 2026 22:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775429049;
	bh=+ayvcascu/jB6QBDpwMIItKmeA3EAwmQ8c0enEXgqxo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LBHJ2+PyhHbvgDfVQCgXBK1YltQFIGjNWJ0NVryBoQ0Iggivm/yxBMHUPhzI3m72E
	 g6iHpe1CfMnSkY9hWY0stujRh1iTnjz27mHTvJ1NpARIqDE1V5kbGr8rDQjKzHwka8
	 txktSuQS/fmGaJLNJdTM5om4Q6aZs3v51Lt0HvkxTq1hE+uM6pDw2doI6C58X2uZF0
	 dMvXgFcW9lyb1bA+dVl9p59MF8SsaPF7DijF+O2m+LrAG5Z+zAQG2hXhUfmtGWYHzw
	 SRjVf+H3TNL0WPgmU7OqRrZoGGXWTgXHBUOQvp87FG5RAGvECDc1jDLACwymyxP6+F
	 pEZZOAaecrxog==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 82C68C41613; Sun,  5 Apr 2026 22:44:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Sun, 05 Apr 2026 22:44:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-ctg2WYyiOt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35999-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: C8E3C3A0088
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #10 from manauer.uel@gmail.com ---
Correction to my previous comment:

I said I could not rule out that the device disconnected on its own. Lookin=
g at
the new log more carefully, the mouse was already working with the rule act=
ive
when I started capturing. When I manually unplugged it, a split transaction
error appears right at the moment of disconnect. So that error is a consequ=
ence
of pulling the cable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

