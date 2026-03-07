Return-Path: <linux-usb+bounces-34186-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CjqEyd1rGlCpwEAu9opvQ
	(envelope-from <linux-usb+bounces-34186-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 19:57:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D8022D4E6
	for <lists+linux-usb@lfdr.de>; Sat, 07 Mar 2026 19:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF014303EAA3
	for <lists+linux-usb@lfdr.de>; Sat,  7 Mar 2026 18:56:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01E92392C2C;
	Sat,  7 Mar 2026 18:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ch5eQIXR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D339280A
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 18:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772909797; cv=none; b=HGd7aBySnYoi7f8jWYwnwymf4Mtv4BU9mGllEZz1eYTFi+BOMszl123X6jBhceQBVyYO+a8EjOK4+s++iIqGTudDzQYSoT/N0sfb4VL3tzUCARgU00Uf1t+vq35TUHcOYYNtSEdcXrIITWGTH97bGG3h4c+vbgwCwxPHcuy1Qcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772909797; c=relaxed/simple;
	bh=XRVida5+JVh3yjt6YsIqR+/YTomtbPqe576FmSVkHvw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I01k2BMMzlwCftSFtrE+Zcqgun7lI0QlWL0uuWmkx8ePccrLuWF4bRLV7iQRBQvtL+DdDVtM5ij/7wbUv+tLoftdC4Rn8WrTTmbVOTsHeptoAqsdn6kMHVMa5w6R00XXxARH0w2QJs30/WAeoGQjNPrsaSxEBkdzH3zI8WqQXAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ch5eQIXR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 294B9C19422
	for <linux-usb@vger.kernel.org>; Sat,  7 Mar 2026 18:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772909797;
	bh=XRVida5+JVh3yjt6YsIqR+/YTomtbPqe576FmSVkHvw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ch5eQIXR35QeDRFLzYON620DqqeaDGQcYMQ23PKGgIrMmO1Q94O51408yQeSWcbgj
	 YTnlP4qGt/gIRXOKi9j0E9GK3uSTYCYux3gruqdGX6vYrukQtQbha5Q27b065iIMly
	 q32ixgsTc1xyekVGcPR6rZi1ogKZJi0xAfW6Y4vfr/FnJtPPqY6Rr6uK6bC9U2Al+f
	 ulWAZQEx0Ql67ZttUwxpZ2+k1z9SQF97zTX4OT+RVXa7PkY19hQA0oNJKISj2YJQlr
	 7CTcBaD/VWogk/xH0dkWQCIXdz2nWZEUniRyOeqsV5p/rXw0e7U12bMVJQw5yvBPeN
	 B1vLstkz8kd0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18265C3279F; Sat,  7 Mar 2026 18:56:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sat, 07 Mar 2026 18:56:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: roxmail@list.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-SwZVO4ryzI@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: A8D8022D4E6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34186-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.988];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #4 from Roman Elshin (roxmail@list.ru) ---
>  You don't unplug any USB devices while the test is running, do you?
I was`t touch anything (only move mouse)

> Can you describe the effect of the patch and explain why returning early
> should be the right thing to do?
I don`t know what i am doing here - it completely a shot in the dark while
looking at the broken commit.
With this patch mouse and keyboard work as expected, only messages like thi=
s :

[   67.986466] hid-generic 0003:046D:C53F.0004: can't resubmit intr,
0000:00:1d.7-5.4/input1, status -19
[   67.986604] hid-generic 0003:046D:C53F.0003: can't resubmit intr,
0000:00:1d.7-5.4/input0, status -19
[   67.986745] hid-generic 0003:0603:00F5.0002: can't resubmit intr,
0000:00:1d.7-5.3/input1, status -19

at removing a  hub (or single error if one device are  removed) in dmesg.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

