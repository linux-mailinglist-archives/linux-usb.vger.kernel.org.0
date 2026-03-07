Return-Path: <linux-usb+bounces-34185-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KA0NNu1XrGnNowEAu9opvQ
	(envelope-from <linux-usb+bounces-34185-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 17:53:01 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA9322CC15
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 17:53:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD8BF301CF92
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 16:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00F233290AD;
	Sat,  7 Mar 2026 16:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LJoJVHY/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F543191D3
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772902316; cv=none; b=dRCOErUwZjJsvOTfrgDc+UT+xdPaeMwZ0p8VHk8x1luT4gp5HbhS1Hjv6KBUMTlT3Jh9RjvW6jzE9GBwMXHeCxWWI/bV26qrRz7OHRBsAhQQDhNjo2uHCBKCio8RcQ+NcItdX93pLVQCLLzmrTWjkYS3/2Vj7GcwNFZvlo9gGYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772902316; c=relaxed/simple;
	bh=06kr+tCZKklKOEilw2czHVzqV9P0fA4APCj/o+WR9+M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qUMXid9h6riS6oU41vYXRtWba7QoDjvX2nMs8zRdhBgRO+JQW5ISyXzmdzp3ZhVByKPd8o/EabaSZGmtfE1IJ9VBqL8OX09K8oL9q67JXVqfME7eEGGLx4xJdWFWOoCGcUgEXL0XrISjeju260pozDS8ttM3asaqI7J5TWG7ra4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LJoJVHY/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32ABFC19422
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 16:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772902316;
	bh=06kr+tCZKklKOEilw2czHVzqV9P0fA4APCj/o+WR9+M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LJoJVHY/3NzLJx/6aIIPkWPohW6iugcRW5kmpL5xbS0jTx8vbeVow/Trcv0uwYfp+
	 otRbHbtwsBtPRelTqoJvRVMEv2qfcJj3tns+XLftCNmubz9k2tQsufOZSD36jSO6c5
	 tNR6mZJC+VqV7suXeVNLUtp2N7B1j3FASqRWqiKP720HZj0X1KaM9L0eZNHduju7Yx
	 FdgSB1DsaKIF3hPmzLPNmute4iTE47zeYs0Z8arueEXcpgXCRtu3g3CvidwKUFYRfG
	 oPXqUJpdvMq30JnEZJ6zUU2e76B0BcYY+tjjKpAFB3cUBN821KTDJbCKqNKMNBjbnb
	 nq9sBlKDKImqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 27C9DC433E1; Sat,  7 Mar 2026 16:51:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sat, 07 Mar 2026 16:51:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-fH9Db5Muqm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221184-208809@https.bugzilla.kernel.org/>
References: <bug-221184-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 3BA9322CC15
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34185-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.990];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,harvard.edu:email]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
Can you carry out your test, without the patch in comment #2, while collect=
ing
a usbmon trace of the affected bus?  The trace ought to show us what's going
on, in some detail.

You don't unplug any USB devices while the test is running, do you?

Can you describe the effect of the patch and explain why returning early sh=
ould
be the right thing to do?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

