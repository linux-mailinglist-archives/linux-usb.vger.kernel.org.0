Return-Path: <linux-usb+bounces-33934-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qM4+BPp6p2kshwAAu9opvQ
	(envelope-from <linux-usb+bounces-33934-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 01:21:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D6C1F8D74
	for <lists+linux-usb@lfdr.de>; Wed, 04 Mar 2026 01:21:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 70D62301BA67
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2026 00:20:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A6A2BD597;
	Wed,  4 Mar 2026 00:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uNdznszc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E938B23C39A
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 00:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772583636; cv=none; b=Yvn4oiqej7N3LL8VPrRgOIeLGLD2gEGK8Vq+6IBcSkX7iTzAEjjsb5ZMSwfaJyLYJ85RFwu5Me/byXDubYwGyavjbX8DeBnamPO0iuPTvBlg1uw3hdxMavlBW7yoYyLput072E9Q83tP63gOYgYz768a6Rp2S09Ez+85x4k9564=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772583636; c=relaxed/simple;
	bh=vIuYF5bymgcHxz13uV+VaKq+0zWlq253tBZnUeLr6kc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NN8szPnlz1HdOLmH9j3XqRmCXaHItm4WoVG6h4M5zNK1MXqSfIoLhaV1H9wPnDhl0JOrV+Nuzr83qEYOEx2ytnxk5IkS5b7HqxgHMvPiXWI3lOhAAz5fa63Ti0H5bBINoqptHV/zr/dntGaScbhMDo/s7MpsQ1sTwksfYZp06jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uNdznszc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C358EC2BCB0
	for <linux-usb@vger.kernel.org>; Wed,  4 Mar 2026 00:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772583635;
	bh=vIuYF5bymgcHxz13uV+VaKq+0zWlq253tBZnUeLr6kc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uNdznszcsuvkL+XJ1TNlDao8RGqjGruWHgACYSpV5diOfeFKeS1AA3TWJ9qBPjYLm
	 38ZSrUn+dcZ/Z3HY2HUeiCB/lXVKHc9cPp5xQA1KkmOutY0+W59CY/YILnYB62gS7E
	 4SUS+jH6pyFI24H5nA59KG3620C3xC17CUTjIpGa50twy+ZN6FWYCypLLqCLKEjkqU
	 5kAGhlJxgU6UkrLszW/gvnzIh3YXiYsiZd13Zs2UB14ajtxYqQCw7P4YUd4J/Ho46W
	 RjyPrvSlR/is7i2IZCtvSH2/hE494tCvO4h2qICDVFBDJckf4GSMWLKhZhEp1cOaOA
	 8Hh8BrLhD+RYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BA2A1C53BC7; Wed,  4 Mar 2026 00:20:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Wed, 04 Mar 2026 00:20:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221073-208809-YRucPGvm9t@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: B8D6C1F8D74
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TAGGED_FROM(0.00)[bounces-33934-lists,linux-usb=lfdr.de];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

--- Comment #30 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Alexander F from comment #19)
> The xhci_hcd.quirks=3D0x40 quirk resolves the 10 second resume issue, the
> devices on this bus also don't disappear and work nominally. Not sure if
> there are side effects to this quirk.
This should be harmless in principle, it just switches from MSI to (emulate=
d)
PCI INTx interrupt.

> - The device could accrue "brokenness" that is preserved between "soft"
> resets. This is also rare. For example one time it was systematically doi=
ng
> very long boots due to getting stuck on a btusb device, and it was cleared
> only by hard reset.
Unrelated. Onboard bluetooth chips are known to get flakey and fail to
enumerate until power cycled, which is tricky if they run off a standby rai=
l.

(In reply to David Hubbard from comment #23)
> I'm fascinated with diagnosing the xHC USBSTS with the EINT bit set, using
> the instructions in comment #5. I'm zeroing in on that. Maybe the issues
> with resume taking 10 seconds in comment #19 can be considered separately=
 in
> a different bug?
The delay is a consequence of missing interrupts *and* having some USB devi=
ce
connected. Your case is similar to the other one.

Sorry about the wrong instructions. Indeed, tar doesn't work with debugfs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

