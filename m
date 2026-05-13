Return-Path: <linux-usb+bounces-37399-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGqfLKmgBGqbMAIAu9opvQ
	(envelope-from <linux-usb+bounces-37399-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:02:49 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 928BF536AEB
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:02:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B9F3F309E5F0
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 15:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B44AA4A13A4;
	Wed, 13 May 2026 15:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NcS2e3lQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BEE73921D0
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 15:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687612; cv=none; b=HHbw+CdsoKCBHi7RCkpvKFaPDIr3e0UUJxot1luN/PewcHxnPOAc/G1Rsl/N84EQmmZkoQXN3OFuzjjDbgt2FZm8+XpBOL7C26nTCbkDBEommhEgBnWsCuTmWJIsEGo83PAEj7112DSj3KdJrsHMOyjBi2lP6pfFGPI4slCmVBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687612; c=relaxed/simple;
	bh=UpYsMTVNvz5NGSKqfMICeqR6wDwAKcuoViG/FDvPAz4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lETsDVnw05YWj1g/iqz+F1QCJBhQsPSfMG8FEzywXhk959I/nfircb15SHgvDjeLH5UFTHhkBAszA5UKkldRTMLy1eNCCSK1cf0x4yGTWnw+Sx1VUADg2fM41J91GAuD4MShTPOz6QSK+Y28+AZuiNtGR2YxjNWFNxtVeRL9zwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NcS2e3lQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2679C2BCB7
	for <linux-usb@vger.kernel.org>; Wed, 13 May 2026 15:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778687611;
	bh=UpYsMTVNvz5NGSKqfMICeqR6wDwAKcuoViG/FDvPAz4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NcS2e3lQYI3iSHTRsIVOiOUja5Jw20vq2KX41nmzuV91tvUVYDqoOgYETj9NWFJyX
	 H05TjQdFAMPLRb9M8ZwBHt+rsioIsdzzZNCbuJ7zl3savU641AwexWBoGK7/VRELmw
	 SZw/rKbXIpy1hcDKYWRAkpNHAlmjFMbBOABO9NglPoSfV4G9zpcpP+D8UGseDlcy+W
	 it4/b1rGQ3OujKZ1BbSY1fpMQELqKhWav7VSovupDY1/PMSa1fsgPg59mirVKlAgGV
	 7I6s3WMFd4znV/o1oJvHOmeWhlnsZrePt2tjGsCAarYwKiLWaEa0wIH3L2wlh51aCD
	 iV/wD1e3jXjLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B624DC41616; Wed, 13 May 2026 15:53:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221510] CalDigit TS5+ Thunderbolt rear USB controller fails to
 enumerate on AMD Strix Point USB4 host
Date: Wed, 13 May 2026 15:53:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugzilla-kernel@andrewzah.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-221510-208809-MA7P1rCPVx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221510-208809@https.bugzilla.kernel.org/>
References: <bug-221510-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 928BF536AEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37399-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	RSPAMD_URIBL_FAIL(0.00)[andrewzah.com:query timed out];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,andrewzah.com:email]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221510

Andrew (bugzilla-kernel@andrewzah.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #2 from Andrew (bugzilla-kernel@andrewzah.com) ---
That fixed it, thank you. All the usb controllers enumerate now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

