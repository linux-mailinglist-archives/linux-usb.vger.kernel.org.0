Return-Path: <linux-usb+bounces-33510-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCKVOeY0mGn/CgMAu9opvQ
	(envelope-from <linux-usb+bounces-33510-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 11:18:14 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8490B166C30
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 11:18:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 994CF303B14D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Feb 2026 10:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7553C33C52A;
	Fri, 20 Feb 2026 10:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWaBSr5e"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F8F33C1A3
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771582673; cv=none; b=m4g69CgKEO5rot979E6gMBM4B1Ed3hrtIQp53p6kAnJmmX7VU+d8ud3e4fzL3M/2wkMQGntareznnOxjnVrizOg8nAqvDmo+GQ9aCybilvB5hMuIDl3HYvPQHpY+dj6fvGGIQTZDyyhG6Bsy2uON/FH8RCmf8XmQjlEgUSXNTUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771582673; c=relaxed/simple;
	bh=7GgnIMn4oBHh+5wA6jo7tEdqt89i9LNrqqKpCGV4ors=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IcoiETwrTaekP4jCiZeozKS6wekEmXU/G37r4TSyshbCrC/2KUXntLY1jCsPE05SAcv82L7vuAOVj2KS8Q/5NOqBWeajEHGSht0lN6+krmbLVes6+wxcnzVFdbvkfVG498yvimkRTrildSHLmGAwuSCaGi5OGljOJRnQpYQpwJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWaBSr5e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95310C116D0
	for <linux-usb@vger.kernel.org>; Fri, 20 Feb 2026 10:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771582672;
	bh=7GgnIMn4oBHh+5wA6jo7tEdqt89i9LNrqqKpCGV4ors=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AWaBSr5eEyaYbDb9+AuAZsqjKcE0CWf51kRFbDG19hEMWEci/M5Jtuf1vXsUzDIhb
	 XRVLj99GpB+zRFaGrzS8EE3bCijW3Ufp80ZBGEYl/sC14LZC8y2AMvic5KVQTSatdO
	 /GjC0bg2LtYBc/nL8dxkzVFWwi5dB8hyCTgTl5I3kktzxdW8HKf3B0N3QZDfspWl/k
	 WMWyJeGff3F38djwoUTLkDbx5KvIuugSWgn7zCYRZ9M8rACn087bz2eyRtJ3h0lNKi
	 knr3RVnVQXV1vwNStoU9694Gc5cpJUwVS5XshVA3AMnNZCDmH/xmZ50HhdXl4PZman
	 IrH2x2saC1Jug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7EE6BCAB781; Fri, 20 Feb 2026 10:17:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Fri, 20 Feb 2026 10:17:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-O79P2APbG5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221103-208809@https.bugzilla.kernel.org/>
References: <bug-221103-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33510-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,unnservice.com:email,kroah.com:email]
X-Rspamd-Queue-Id: 8490B166C30
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #10 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Feb 20, 2026 at 10:07:57AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D221103
>=20
> --- Comment #9 from Paul Alesius (paul@unnservice.com) ---
> > Or perhaps simply this would crash it?
> > while sleep .1 ; do true </dev/bus/usb/010/001 ; done
>=20
> Yes it froze the system on iteration 3000
>=20
> A C program without ioctl also froze it on iteration 887. Doing ioctl see=
ms
> to
> trigger it much faster at iteration ~200.
>=20
> I ordered a USB-to-ethernet adapter in the meantime to try to get more
> diagnostics through netconsole, instead of serial cable, will that work?

If the USB stack is locking up, dumping USB data out when that happens
would obviously not be possible :)

There is a special USB debug cable that will work instead, search around
on the web for one if you are curious about using it.

good luck!

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

