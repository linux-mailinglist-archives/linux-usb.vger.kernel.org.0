Return-Path: <linux-usb+bounces-33328-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KD2iB778jWm0+AAAu9opvQ
	(envelope-from <linux-usb+bounces-33328-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 17:15:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE8012F411
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 17:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBED03055DC0
	for <lists+linux-usb@lfdr.de>; Thu, 12 Feb 2026 16:15:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 158B91519AC;
	Thu, 12 Feb 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5/cxcJy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993E69476
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 16:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770912953; cv=none; b=pxDxKg6Bo6JlBSZeBHLfZYcegUW65QY0dCovQedVunR5CUoYgs6T7R1wZAf+C9i+OZ9iaueRYgqUQxcStyuLmJ9nmOdhgbm0zqMC5dcm6gsobuAtA0eDIZScpUmZKqC7zQQfNKEcg0xk7xJikCrg5LGy+u35kuiZygoh16kJrxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770912953; c=relaxed/simple;
	bh=f6DDZsMWquqdo/AzzYy6bTQTEPakTwvjO2Ltn9F6ktg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NcjGn5BJNk5AtQLkTEhXMtDajJDObUgwbD6iTsKdZMqiqUY2MEu5Q0khB9y+6qdnGMYMIePg20Sy3GMRtXbEkOsnNPjh42mRXHJ41V5klriEd9uOwhHiVux2Ot4TPWsRx2dsutIw9ZJ6Ykw0xCkQk9R6YAx4jqUdj9p8nH0vbqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5/cxcJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54C1AC19424
	for <linux-usb@vger.kernel.org>; Thu, 12 Feb 2026 16:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770912953;
	bh=f6DDZsMWquqdo/AzzYy6bTQTEPakTwvjO2Ltn9F6ktg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=i5/cxcJy4a0LKXnAVbYrE4XcSF/eWo7yf7dI3lCxd5tfMsx0IXAugwF2w2gEsrCjz
	 Bt8o1r+dw4vmJwlKpNKkBCV8aM2DUQZ8quxYHn6NaP1LKmh+us5TYVbeDN4LY16xP5
	 diWh5iGSpxeJyzvoevF4CpQ1Zp5Edui0pIcpblR8H4EZm4X3nUMkdt9kbuj2vDjfuj
	 3kyJxtassvVjotAsbIdQHEJlmTCz5AFVyMvV0rXBQ99CCVxSULZBC1lGcAFB197bzZ
	 jXh2Ijdr/SxA1GheQoChoLnbuUc2XH9Re6dlE2xwBeTcCg7nxj2PKi1e1sT2NprwV0
	 AvWpEttl6RCIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40FFEC41613; Thu, 12 Feb 2026 16:15:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Thu, 12 Feb 2026 16:15:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-Fios7CoZJF@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33328-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 6DE8012F411
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #6 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> Is this unique to s2idle or can it also happen after suspend to RAM or
> hibernation?

The hardware doesn't support s3, only s2idle.

> @davidhubbard isolated iGPU memory allocation as a variable:

That's really odd to me to change things.  Are you 100% sure?   This issue
feels like a race condition of some sort, especially if you can unbind and
rebind after the issue happens to recover.

> The RESET_ON_RESUME quirk may possibly work as bandaid, try
> xhci_hcd.quirks=3D0x80 boot parameter or pass it to xhci_hcd module if us=
ing
> one. All USB devices will be dropped and re-enumerated on resume.

This doesn't seem ideal to me if most suspends are fine.  Until we get to t=
he
bottom of this maybe we want a RESET_ON_FAILURE type of behavior instead to=
 use
in the resume routine?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

