Return-Path: <linux-usb+bounces-33299-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SIubHeYKjWmLyAAAu9opvQ
	(envelope-from <linux-usb+bounces-33299-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 00:04:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 058F5128388
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 00:04:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B96230D0202
	for <lists+linux-usb@lfdr.de>; Wed, 11 Feb 2026 23:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 944A833A9EF;
	Wed, 11 Feb 2026 23:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErbCFaGU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B2714A4F0
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 23:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770851042; cv=none; b=b+kvN63YYRqp+8Xr9/k7gzgP1+mjilrKxCyspLjRF6aLE2DsDCA0+Vc0UjWPv6FJi+vKoU+SNuMqsXDxYngp8C5nG8ny/ACitymLqe42ybFAIovqccAWOdssXVZhSgQcBJI4ABpYIdiT+GQNN3BzILw0KnqJ0/3ofAf/86CRzho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770851042; c=relaxed/simple;
	bh=+4m3uR0hL14PjzvK35LpmsdabFFajszYgz2hF3vgmu4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sxtDzaJ9d4VV+8tBeciRwwNDoi/9mq0sJLUPzQnuSvUqE3iGCp+NFW1kbXMfpCeHRgmzWpQR/DYnWWcfQd3klLxLJM5a0a4NrJNdisg4vaIFkngHFAu6YOQI4pFTJmEOmqwf8UDpWdQpVGYmcxkA0j52UiJVFunwCT6OD5nLsng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErbCFaGU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7B06C4CEF7
	for <linux-usb@vger.kernel.org>; Wed, 11 Feb 2026 23:04:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770851041;
	bh=+4m3uR0hL14PjzvK35LpmsdabFFajszYgz2hF3vgmu4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ErbCFaGUYumJZWJ1CbpTrP5nkfg+COvGCpUgHUhK+7gnVj/4UNvreVUoM7K+wkPuU
	 hkaCVwPSN6ZK3gUL2E/G+6J0r/6uLt/GUOJVBupELfSRKiMTcSsCB5xoDN8+SmsWHp
	 GldPbqZKnGVNMaA7BW3m+H8NuISKeywlBeycqJ8fbJL5uE1Dj8frUOeOYORvDbxkRC
	 b/mro+lTXSYu8et0Iidc24HzoPWApcXXtZUFiXJ9I8U+z8Hx9eCqA0/blnGZ3UdmZf
	 EgrodVCHjxejtz4IfAh/m9RPRbl0vfMTEvzIb+oUOfdY+YiCxvFaR/absDBzHFuuib
	 uGyEJwceIhjZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A7C45C41612; Wed, 11 Feb 2026 23:04:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 11 Feb 2026 23:04:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mrh@frame.work
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-4XMu1XHL2c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221073-208809@https.bugzilla.kernel.org/>
References: <bug-221073-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33299-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 058F5128388
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #3 from mattwork (mrh@frame.work) ---
Thanks for looking at this. A few notes on the bisect request:

The regression data in the report already narrows the timeline: the bug exi=
sts
on 6.12 LTS (intermittent, ~40%) and is deterministic by 6.18. That's a wide
bisect range =E2=80=94 thousands of commits across multiple merge windows =
=E2=80=94 and the
result would land on whichever commit pushed the failure rate from "sometim=
es"
to "always," not the root cause.

The root cause evidence is already in the report:

- The resume path does not fully reinitialize the xHCI controller. The bind
path does. Unbind/rebind fixes it 100% of the time.

- The controller shares a PCI root complex with the amdgpu (c1:00.0). iGPU
memory allocation correlates with failure rate, suggesting PCI power state
management during s2idle is involved.

- This reproduces on non-Framework hardware (Lenovo ThinkPad T14 Gen 6 AMD)
with identical symptoms and identical workaround, ruling out platform-speci=
fic
firmware.

A bisect would confirm which commit worsened an already-broken resume path,=
 but
the xHCI maintainers likely already know what changed in the s2idle resume
sequence for AMD xHCI between 6.12 and 6.18. If a bisect is still needed af=
ter
review of the above, I can arrange one, but I'd like to get USB/xHCI mainta=
iner
eyes on the dmesg and the PCI topology first.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

