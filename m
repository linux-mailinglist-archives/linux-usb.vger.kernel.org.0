Return-Path: <linux-usb+bounces-36360-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN3GL2xu5mmBwAEAu9opvQ
	(envelope-from <linux-usb+bounces-36360-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 20:20:28 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF70432B52
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 20:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 986DD301C814
	for <lists+linux-usb@lfdr.de>; Mon, 20 Apr 2026 18:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F411F3A8723;
	Mon, 20 Apr 2026 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RWJBu4nI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783A82772D
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 18:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776708275; cv=none; b=oDe3/gZxsMa+aB93d0J4nZV9ZoEZuT1H9uzifmz+zwXRRnd2Rf8ECuG+2jybSIIWvW9G9UGnvOCGN4EuDvOaJU4HIUnkKsryAX3mf/FM3+XqTvABDJwx3v09FstGl477/UbLXnP8m/Ujarscxby6WtBRgwhgsgHCyQA9OVrr08o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776708275; c=relaxed/simple;
	bh=C/AhVsDnHnV7njXlJfWz/VRSeEk7QcWPWSjpwJMjHjs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T9aODN7uBeBoxNBU9Wt8MZp9d4SeGjQ13WMe461GFRPm13ZfJ/FSOKzbrPOCCQHBMk4+qxNdB80HFDEHlypmh5e48G8uUh9x7opEq1q3J67XaWnlWD+HLHCyVq0tVU+4j1oVu1LxV1Xqxbr6JZBU1WvyQwnvjWq3W5Q40+wJZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RWJBu4nI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17EC5C2BCB0
	for <linux-usb@vger.kernel.org>; Mon, 20 Apr 2026 18:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776708275;
	bh=C/AhVsDnHnV7njXlJfWz/VRSeEk7QcWPWSjpwJMjHjs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RWJBu4nIBJY97FYC0eWq6U8nVJwb5Jygx6LlKTKLIKrBBTxosu2NS/UUN2VyYum5J
	 j64JNF8rkR+K2Z0VDCW3VM30keQqI8HHmDxUzbcyvuG2I1bvU2XzalM9KeFeHyORFd
	 BqNsvaopAUDjM+eUOa66U8ELyLs3vJH2pOxz5oeDAMPinr1F+i2Er4n8Vy617gT8Nk
	 R36h7TPRIqz9PloD7R9RRRm5DVhCfUM3OQ95Ciyc+/qtPRKuKrI9eyJP0FsNiKjWoQ
	 DsxCbaNpf6MrOgxeDeXyECzA+QwOgFEevSYJfTtEW138JBKGqhTefrk1bZPqaSU9rF
	 rZJkG48QZj25w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0C09BC41612; Mon, 20 Apr 2026 18:04:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Mon, 20 Apr 2026 18:04:34 +0000
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
Message-ID: <bug-221340-208809-K1jntDlQ1u@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36360-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DFF70432B52
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #13 from DaisyTheFoxxo@proton.me ---
(In reply to Oliver Neukum from comment #12)
> (In reply to DaisyTheFoxxo from comment #11)
> > Nevermind, It happened again. It took longer this time though
>=20
> Then please try the 'm' quirk.

The problem still persists

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

