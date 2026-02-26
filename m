Return-Path: <linux-usb+bounces-33728-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMrOKeQVoGlifgQAu9opvQ
	(envelope-from <linux-usb+bounces-33728-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:44:04 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 226651A3A60
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 10:44:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A5F5E3156F83
	for <lists+linux-usb@lfdr.de>; Thu, 26 Feb 2026 09:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F172749E6;
	Thu, 26 Feb 2026 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCLC60KP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085AB2D063A
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 09:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772098218; cv=none; b=bAZA9hp3fnfA1uYsw6Dw9RaO38CEjRYSk+RL4aj6hjE39f07MFT5MoENUMGe/19yP0+h77WDPAghjMb/7TqdY4XnpaMKI0Cfb2A4Y5kCk1JJG/C+25eGiWUJGTba6d43O9DiRPYPiAjHGilaAinMW1+EcRUTHjFDjA3POPSuhUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772098218; c=relaxed/simple;
	bh=aYJEhtNlCp1nHZDQqRaQdiv8mU5MAIL2ULRySivW6lA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q5eYWGz2jaIhIYjJyH0tZHVhDQdk+2qA8y9Su1B9v44PZECiLuE+5F3VhaDf79svkIxjqu7YsEiLdxi7SMWgtmuYScT6l6SgkHGAvLLOQ0wcYFt7e2cnynTZtA+o2K9mrnVT1yQhmGKmXiMot6fRHqnWCTLTFwb7kFYsw7SCeF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCLC60KP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E16FAC19422
	for <linux-usb@vger.kernel.org>; Thu, 26 Feb 2026 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098217;
	bh=aYJEhtNlCp1nHZDQqRaQdiv8mU5MAIL2ULRySivW6lA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PCLC60KPP2j/dqLZiruzABILEYBvImwRh/suvAO404GaHqJdIY7v3SFnB1NOxp+G8
	 36Oy8vDcdUWtNBuwD+q3GZyI3ARbwjV06BonQ51+kQWH5klCWqle27Okb9EVu+mQrD
	 fHjglx1eT2JZdyFcgqvUwaFQv/yS4/yVs9SEY1Nlo/TRfrC6wM6LSUtAkysguvz2r3
	 xEu86XqmVAcjVqz+zH6wfw/47Kx+O9ogK5oSXN1ubvDePYEMdWTW4IH7tXO8PB+/n5
	 k3uqGG0XCwMBOhAA/qYT/UUSe1ds6RFXnhmhRaCr6piJzMVp/gOfCQqFRlhDaKEj1T
	 GiH4RattcPLGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D9C53CAB781; Thu, 26 Feb 2026 09:30:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 26 Feb 2026 09:30:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: superveridical@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-qa3sTdoN3n@https.bugzilla.kernel.org/>
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33728-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 226651A3A60
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #10 from Alexander F (superveridical@gmail.com) ---
Also experience this issue on ASUS Z13 (2025) with Strix Halo

BIOS: 311
OS: Gentoo Linux, sys-kernel/vanilla-kernel-6.19.3

The probability of it occurring on resume is between 1/3 and 1/10, resume w=
ith
the issue takes 10 seconds, and after that all devices (internal cameras) t=
hat
are connected to this particular bus disappear. The unbind/bind restores the
devices.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

