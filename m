Return-Path: <linux-usb+bounces-33193-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAVaC+njiWnGCwAAu9opvQ
	(envelope-from <linux-usb+bounces-33193-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 14:40:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8A110FD3F
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 14:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B93F73006808
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 13:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A1E3793A6;
	Mon,  9 Feb 2026 13:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xay/mUlX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022EB36BCF5
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770644452; cv=none; b=EUFkVl15cq7Hv19Qq9HP/QNIoY5/eIF40l2wfaVALkDDl172f3jnPtoUxVN9rYqhuM/pFFvNSyHEXtHzQTPkj4wxryviRXpp2eqkbYE1NgcNYku56APeffaQeinG4XrM3MC6LvkoxffYcixbwUkQ6VCt7xyaafr7GSa1BNBP1VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770644452; c=relaxed/simple;
	bh=WF61ypo5YbAtEwNx38uiJegRKr7lUECFiozJBBJeuVk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bahyFsszFhwBcs8CbI9s4CmZhCK07n6yz0ZUe7mV7p8taRjl72Er683fGAL7qvAkk7Ex0WbkO7MAYnFUoAvjFj6m6jKXhIhnhJzbr8YO85fafb9XASfvvBoMaRFEJYHKkViZ3CUGQjkja/ix313+NrgPZSE8lRBmK6/agEuqNiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xay/mUlX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95643C19423
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 13:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770644451;
	bh=WF61ypo5YbAtEwNx38uiJegRKr7lUECFiozJBBJeuVk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xay/mUlX1+pUvaGKtA3kw68pwfNlJYBPVhA7w2EU11bSI+02elsetOngxP/kju+oU
	 MYeJ0KiNS0Rl24L6RZLRXwDA8nOdUNg8ityUr8Ef6MFeri0+8MlGm2Dwn9ajcVwGTC
	 nIKIAnHckfKrrmnbyCh2H7B5QNrIYejFWQ4+5Dpj97oRLIDGHyIomeeHki4KmMwoj9
	 PVlvL+dWqAxfxpZawYW8yPTLnkjqhihMROwhE0/OCBZiv7YReFO/kfZAo5wMGGBlTQ
	 T2uk/ALEfcRS6fO/yOQa2gQGVJxuLRRFY6dS+Lp6C7rGRJslQaluYWY2hAI6Hm/xxb
	 08+2v4+cddDKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 89753C53BBF; Mon,  9 Feb 2026 13:40:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221022] [REGRESSION] Kernel panic in ucsi_reset_ppm on 6.1.0-42
 after HP USB-C Dock G5 firmware update
Date: Mon, 09 Feb 2026 13:40:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221022-208809-fFFxSHLpQw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221022-208809@https.bugzilla.kernel.org/>
References: <bug-221022-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,leemhuis.info:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33193-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: AC8A110FD3F
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221022

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Could you please bisect and check if mainline is affected, too? See
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html=
 for
details. And a more complete stack trace when things hang would be helpful =
(and
might avoid the need for a bisection if you are lucky).

Without these details nobody might look into this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

