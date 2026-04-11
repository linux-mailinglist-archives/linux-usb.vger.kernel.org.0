Return-Path: <linux-usb+bounces-36165-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sUm/Oh7H2mk46QgAu9opvQ
	(envelope-from <linux-usb+bounces-36165-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2026 00:11:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 539383E1CF8
	for <lists+linux-usb@lfdr.de>; Sun, 12 Apr 2026 00:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1ACFA302D085
	for <lists+linux-usb@lfdr.de>; Sat, 11 Apr 2026 22:11:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4305D2BE057;
	Sat, 11 Apr 2026 22:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UHU+acXB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F311FC8
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 22:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775945497; cv=none; b=txS9dT8ZwKJa4rBYyg/d436dhXk+maPvXwOF/L+BvVaNntmH1K1yyHK4hnGIujGz9P7JAcv3ymKq1ihmscc6GTrb74ENCZ7p3KTr9ioru4D+itUf9ac+0MBONseByLxdj/tdz5tQVQV3Er7qqXdYNs0yB3E2Ujdl9bJ6E0VuI8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775945497; c=relaxed/simple;
	bh=kdwLv3lhgQF/pcP3VFAiM7Ghjvg954Q56ks3+wKmyew=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mCezcKueHcdyrdV7A5Hm5meBJaC1u/+uRFMAfAOi6XbIMjSNV8vnchSlWg8/wmaJ+moFNslGXcbK0GWwPs2B59LlP7n4vY/0jCN0MH2UEkk5h/ObYHHPPl7B/Q4AmYTe+Pz/wJD4/MS0CXLtmUfYau3vk9Xxzu9x3sm/CgLjY5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UHU+acXB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 507BFC116C6
	for <linux-usb@vger.kernel.org>; Sat, 11 Apr 2026 22:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775945497;
	bh=kdwLv3lhgQF/pcP3VFAiM7Ghjvg954Q56ks3+wKmyew=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UHU+acXBO051Y0VkTo4lJaeBb/iOd6bdmp9PU9WQXWPZt4412Qdgp5pnJ2kdtgy79
	 QVWGofG6N8rrdtbvrRpkP6q6oFHat8F1J722AMvuL4xNYBJLENRTXOxA1QOq4otoRm
	 0LZ94b3/VHtd/qcSY0Gpcl/m0+XLQvo/wM2oUxQFLVC3Xy7udBANcX4qKAfCysJnjf
	 jU0OKasCqPfkeWZUGE4a4mnlMsfrWsIwovv9M/r3fHVoRqyTKLEXHhVQOuDPoOnMPn
	 7IlWN8bADjQBfwzGiohvefnhM5rQc0t6n4qDuJFL18C+31W02q380p/kCawxf4xjeF
	 8JAl7n697B0zQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 46C4CC4160E; Sat, 11 Apr 2026 22:11:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221340] uas driver hangs and causes usb reset
Date: Sat, 11 Apr 2026 22:11:37 +0000
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
Message-ID: <bug-221340-208809-nNgleI8V0D@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_ONE(0.00)[1];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_FROM(0.00)[bounces-36165-lists,linux-usb=lfdr.de];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 539383E1CF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221340

--- Comment #7 from DaisyTheFoxxo@proton.me ---
(In reply to Micha=C5=82 Pecio from comment #6)
> This shows UAS driver unlinking URBs related to timed out commands as they
> are being aborted, but I wondered if anything unusual happens 30 seconds
> prior, when the device stops executing SCSI commands and makes them time =
out.
>=20
> IOW, was there anything related to uas or xhci before this snippet begins?

there are no other logs before the aborted commands get logged

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

