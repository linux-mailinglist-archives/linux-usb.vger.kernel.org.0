Return-Path: <linux-usb+bounces-34193-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qB8iAQL6rGkewwEAu9opvQ
	(envelope-from <linux-usb+bounces-34193-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 05:24:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A8E22E760
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 05:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D52E0302AE31
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 04:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9609280308;
	Sun,  8 Mar 2026 04:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+g7YSWk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655AF1C84A6
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 04:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772943869; cv=none; b=mxDiRAlipoN2mNujefypg0cbf9DEt+ImB+l7WzXpDvrLhsfO5pPLVznIjzPcOi8t6oo+qsyVGtgJjMBo6vBFFR3ZBL/CTZVCwRa34Zsd74uQaMnx36bb2ohgFgv2hJEOkCXgshd1Xxn5H4QozmPtSIRy50NlfQ1e+Jf0BK24vHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772943869; c=relaxed/simple;
	bh=8SF4jLC5gyDhqa7tYd18l2APzyc5DSbmNgCgYeOud+g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lsVlnhJQ/8THpE90Za33iDU6XHoT3JyLp3IQvPLyVo1ZPwSuHG+jeRTMPM5OCNcZ4fF1MtsVIiOt7IzCGQ99yQqNvXWDBJxByV3LrIZI5K+YEMyeWVSNXbEZ5JB74EXFkDdl4C+mCmRFrkB4XOXrWG5rgKg+Z+MgXKK2DtkVrN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+g7YSWk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 098EAC116C6
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 04:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772943869;
	bh=8SF4jLC5gyDhqa7tYd18l2APzyc5DSbmNgCgYeOud+g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R+g7YSWkhhN758lxQYwmM3q1u6lQN90v1MufnDGjSEsDv1MIwr8AZYH/Rz1xW5RCy
	 jYncY4sWd1xknx7KOD+7zs7FAikg3wOFUo5E55GkuWeUYwvBC3951ALORKIDh8942n
	 EOKFxhYGRI/6dWh22GH9MX0cJCX3HycKncoxY0VCdNJCo8iRrOnXf0ar6Il+hnr8mm
	 b6GyVW9o5bufbDCU1nwtKluFg8Q9Ot7qvZk5gvoKvms5jBLgQcpa7qjQIq0NRI1UTZ
	 DM7l4yPMTay0wbAG9KPG8D6hvDasE2HmZMbQAhicpjbtxUjH0VaIJL08GLR66vYHwV
	 cmSHA1oSYCv9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6A55C4160E; Sun,  8 Mar 2026 04:24:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Sun, 08 Mar 2026 04:24:28 +0000
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
Message-ID: <bug-221184-208809-MtWQdrZrdc@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 53A8E22E760
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34193-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.989];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221184

--- Comment #8 from Roman Elshin (roxmail@list.ru) ---
> Your computer must be a rather old one for the load level to affect it th=
is
> way

yes it is Pentium-D 3.2gHz :), but it strange to see such HID behaviur  whi=
le,
for example, OS booted from usb disk connected to this hub works just fine
(except performance and this of course), thanks for detailed reply, will te=
st.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

