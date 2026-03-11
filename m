Return-Path: <linux-usb+bounces-34542-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EP1vLTlMsWlCtAIAu9opvQ
	(envelope-from <linux-usb+bounces-34542-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 12:04:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F8262B3E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 12:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B9EAA3017273
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 11:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D466D3B2FD5;
	Wed, 11 Mar 2026 11:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eqrMWJxo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69A1A3D6483
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773227045; cv=none; b=j/TekRJcna4UHoGO1g2rY9ezVcEdEPsfDcAkbobTuRFS8B0Qx/Wq9MVsyOIXZ9CoKuep79vcYcyTiJ4UYKtQX39WOKelRApQ2cnOL/N1SBDMLyJvN8+jiQRltj3xoKelrr4+hqXkY5qZ7rI+ihKD9rIVu5JtY4Z2NARZFCelz+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773227045; c=relaxed/simple;
	bh=GwRhih5DFJ/cJ2IPHwkEymrH4sRZRjbe7Uz+5HhYQEw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=feIFKmGIshIaaydJDKhC74/l1jW3e7IqHHPz6oNVgytYMMQ/Kv5OdpyK8y0DHBdF+lccPcewFHSroKQU3+9+HUp2CPMm4fdEQuT4cuNr+5XfA6DRDcWkPYe01TRNddeIAwxeCNaiM7Wkn15Qn25jO4sFUj/h4VsHLw5z2i6AVI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eqrMWJxo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1867C2BC9E
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 11:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773227044;
	bh=GwRhih5DFJ/cJ2IPHwkEymrH4sRZRjbe7Uz+5HhYQEw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eqrMWJxoDdZraGr/jTewvQAC2OWi2yUbYBnTJXSWIXG4p/fVoYmJCm38vhyW+RoRk
	 P5H0NyQeFuY1Ou/eU/ghJbzuiREKwsmg8558zxIRrDmRz0VLfqnpV36lUmiJWUpmhX
	 kgssaWk8EG3BQ9VTO589ORUUKvnrcSt27I53hHcZ14RYwBvVzwKdAqsH3YnAZnMgFP
	 sCIgnw/TaoMRiKMMdy364H+KBq9cG9noG6gLb5krAm9fo7f2i9mqWM658x3ngewM8m
	 NxyukKmIhzEfgTEiMzwQjnC01WyGHIu0EVy8Ex0IipG/b1Nbibr/Bod697Ae8jShJT
	 SwCT1P612jfrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BB1AEC3279F; Wed, 11 Mar 2026 11:04:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221184] mouse/keyboard (connected via hub) usb reset under
 system load with weak cpu
Date: Wed, 11 Mar 2026 11:04:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221184-208809-wLf7T56gIP@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 614F8262B3E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34542-lists,linux-usb=lfdr.de];
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

--- Comment #38 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
I have a repro of usbhid toggle mismatch and unnecessary packet loss on xHC=
I.

1. press and hold a key
2. briefly disconnect D+ to break communication (D- if a full speed device)
3. xhci-hcd resets host toggle, but device toggle is unaffected
4. release the key - the host ignores device packet due to toggle mismatch

There is 50% chance that host toggle is already zero and reset does nothing=
. If
the above doesn't work, flip toggle by pressing two keys one by one and
releasing them together to generate three packets. Then repeat steps 1-4.

Moving the EPROTO case to EPIPE case seems to fix it. (I also added msleep(=
500)
before the call to usb_clear_halt() to give myself time to reconnect D+,
otheriwse usb_clear_halt() fails and the device is reset).

I wonder if this change would help for any of the xHCI problems mentioned h=
ere?
And what effect it has on the EHCI problems?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

