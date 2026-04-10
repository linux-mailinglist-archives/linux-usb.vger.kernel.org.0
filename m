Return-Path: <linux-usb+bounces-36144-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLaFBf0q2WnhmwgAu9opvQ
	(envelope-from <linux-usb+bounces-36144-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 18:53:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7181E3DABDF
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 18:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56213301F9D7
	for <lists+linux-usb@lfdr.de>; Fri, 10 Apr 2026 16:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC0BD3DEAE3;
	Fri, 10 Apr 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTwfzqYq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7F73783D1
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775839552; cv=none; b=qisyd5DSF3zCY18uWhqnainFhIYHntBg0w/144/w3y/pfQQnJTYBnSdlGoP2A8DjuTSnq3a0MSDVRT/cd8ozFxuKtWCYPj5ugzgKSR4IK+Yl4XnAm8shhiiUhHIkEs0e+I7KzUDXQ87hAgYfzbSmn/1fj9nVtSfTv83qGCpNEfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775839552; c=relaxed/simple;
	bh=7sA2rkIUGoC7zOVq9WvR/2YXvUw6U7F07GbYEg/An3M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HcyFWKWW2tpM7KpszQPfQCF4A4pq0ooUqPSWDT6KCxmYrOxOQJW9GxQlL5V6m/Lsf9MCjPgjxIQc5f89v12xyRoCpnEhhPOFStWGaNEufPuJius93pu4sJ7m4p0EHRt0mjM96ZnoFIBVUgrikPFMfO+tI5sLZGGx9d8R/2XL6Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTwfzqYq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50DC4C19421
	for <linux-usb@vger.kernel.org>; Fri, 10 Apr 2026 16:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775839552;
	bh=7sA2rkIUGoC7zOVq9WvR/2YXvUw6U7F07GbYEg/An3M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LTwfzqYqzKzwsI6eet/GZHtiwR66ecHVslK2g9OjIGgOgk6OLOtCQKhZXEwZ1J5D5
	 ngVINIrtDttVtWUcZGtHmdzmTPxM02hT7XXGwgMMeclnWS0KJhv2qic2arYJtflvbT
	 +JhP6unM+VgGYsdhK1wAwd89A44Xv/DROP+VbBkCokHBYu6I4h0cPlmI9NXlPB4/EW
	 AaOtYUIXEqknotY/+x6SFfbVu+yhK6/kraXmUq4XrLOMVM9vyxl9Ef8qqCVklZIQSH
	 AIarZBrzmgWc/6fv6vXhwTfClBahMYZKeOyZ1zr8tmM7gJTtzb/nic2U2P3a/XXbIX
	 ADzu/k685phDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 48B0AC41612; Fri, 10 Apr 2026 16:45:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Fri, 10 Apr 2026 16:45:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: DaisyTheFoxxo@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221340-208809-ZK2QbFWGJE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221340-208809@https.bugzilla.kernel.org/>
References: <bug-221340-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36144-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,proton.me:email]
X-Rspamd-Queue-Id: 7181E3DABDF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #4 from DaisyTheFoxxo@proton.me ---
(In reply to Micha=C5=82 Pecio from comment #3)
> There is also Unmap/Read sub-channel in this log.
>=20
> By "hang", do you mean that no I/O happens for 30 seconds or some other t=
ime
> before these messages show up?

yes

>=20
> BTW, if you run (as root)
> echo 'func handle_tx_event +p' >/proc/dynamic_debug/control
>=20
> do you see anything new appear in dmesg at this time?
>=20
> That would point to some "action" at xHCI layer, though I suppose it's al=
so
> possible that nothing interesting happens and the device simply never
> responds to some commands under some circumstances.

I have been having difficulties reproducing the bug recently, I will let you
know when it happens again

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

