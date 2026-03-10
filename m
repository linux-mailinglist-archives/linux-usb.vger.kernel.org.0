Return-Path: <linux-usb+bounces-34502-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPp0CC+QsGkukgIAu9opvQ
	(envelope-from <linux-usb+bounces-34502-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 22:42:07 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8485B2586AA
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 22:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A09A3308933E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 21:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D21EC3EAC87;
	Tue, 10 Mar 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GNKDsnt8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612F8368975
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178877; cv=none; b=LE+W+cbIZHfWcSjw/jSvx7e2mm4n2X3FIIMeD/Sy/4lkC7P7jdNeUQCAGZAnKY5QRf+3chWeJPcLiwAKzntTrzyf1S/HD1ODyUKT2yBmDHP1hH7d6PywdNEJz1v5uQ/tIscqthX68H/avpfdcpbRWtV0RnZ2jinnVauBCFiGFTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178877; c=relaxed/simple;
	bh=pfTcfJ2FginIpiSVfg/CrrLWmhQICatv12CLS2ktWN8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r92y5gBIgRgpNfIG3HZbkfctHFp0DOw94llYX3IW78qmDqMDP9mDeKKXOeGS4nGUvH6BojCVDH5PCW19/KBoE7MwFe4Q3EOZnyZiyafqu7Wgv2j5BUVOiy0i0X+Zibj+qWwdzmcfYZudL4cOqxp+wsHVajEKkSe6zq0qKBQAl9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GNKDsnt8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05790C2BCAF
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 21:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773178877;
	bh=pfTcfJ2FginIpiSVfg/CrrLWmhQICatv12CLS2ktWN8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GNKDsnt8Mw6SuLjwxos01GNUHoNo5OqzSLrRdJJmd2dzZyj9s79Hs1HkJ1FPE0LJA
	 bIe0KALykGFAjRf4J2BewKYgc7Ga8GpxO0tSgk/l0DrJ49xcGr3yYuNe84aRp84iFN
	 otKdClyNAiXPZJ6wWY8bGYT4bYC0JIi77F9hPfQn+XQA+A6L3eUApjWA3UhRn3zrXA
	 7Vnz/wZ9Bd6LMH4SkiN2QYQBkoWV0c40a3CqRMcikZCcJnstSQSKS4QCdkSg4pBVrZ
	 M6DjB7sb0qF7dm0wrLzcG1q2tfkqhbtILFlsiOsJoQ1FrhkOqXvem9G6EjzFD371Ok
	 8H+tg1TL+Fq3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0C29C41614; Tue, 10 Mar 2026 21:41:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Tue, 10 Mar 2026 21:41:16 +0000
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
Message-ID: <bug-221184-208809-XbrUkPawpM@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 8485B2586AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34502-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #35 from Alan Stern (stern@rowland.harvard.edu) ---
Yes, EPROTO represents a communication failure.  However, it only means that
the host thinks there was a failure; there's no way to know what the device
thinks.  Furthermore, xHCI controllers require an endpoint reset in order to
recover from the failure.

As a result of these two facts, it is entirely possible that the endpoint s=
tate
held in the host is no longer in agreement with the state held in the devic=
e.=20
If it isn't, a retry would apparently succeed but in fact the device would
ignore the data that was sent or repeat the data that it sent previously, or
maybe not respond at all.

The only way to make sure the two states are back in agreement is to reset =
them
both.  That's what usb_clear_halt() does.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

