Return-Path: <linux-usb+bounces-36010-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGx5Ajtv02nAiAcAu9opvQ
	(envelope-from <linux-usb+bounces-36010-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 10:30:51 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 790043A2388
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 10:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32FDD301B713
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 08:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3E4229AAEA;
	Mon,  6 Apr 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BDe3onwk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762732DECBA
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775464223; cv=none; b=JL9rYcONVhtmbDh/0nLCMwBGvnDzjtqcD3sd9fdMtcorbtFLJyIGs/Vpvn84AWMo5It/9DAMNBWpH4yM7z5SiZdf0cFaYR4w4KJ//M7XXbFuIkLeWT7bc4J3LWDe3SpxY7yz/2e2UuFRc4uYnUNJcHtN63HzLd5HQqyh/9aL4fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775464223; c=relaxed/simple;
	bh=WvrM97o0BT7sF46xkfXFCdLk69YPlOOEeW21EmBbk6A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oH5gaozCLeUn+guzlb3nmY88P7lLpv8fW6+YqtDY71CuJaSxSoY5EkQpIbBUt/18S0EwZxGVefLg2yXOrgRRNT8JVSvGChPe05lQlmU60J1VhGPeQuDF08fH13c4Wll4j+0E6ssep3CwsI+mexG3W0xCA5l/1EycUjYVg194K9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BDe3onwk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D108C2BC9E
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775464223;
	bh=WvrM97o0BT7sF46xkfXFCdLk69YPlOOEeW21EmBbk6A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BDe3onwkY07mN+PWxipIICnwTo1+CXvzSRzCnGpVZTtJLoQUu6mec0DsgE+QJrUqU
	 KCTsy4dtUUFBKmnvUUCHPa5vffJUSFjgd9fXWdr2PcQ7D3yGlSbnKiNIqEjnEd/T6t
	 jnnvXq1WtSZ1wiW+gklbmq6yFgaI7M3CrUlzKvepa5OvztUtzHqg5wqaj4j01qtupc
	 BFLvXU/th9Oq4oVz0EY8ntr7cXfko+HffU6isS96kNQOQKcfbGe5viTqbxXe0yXSqJ
	 9NKjtfoa5tz85o11cIguCAMf50cCza3PjLn0L3K8aB9uqSCYtpVNDQywkbRFLGvyq5
	 yd854v/BH6Spg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EF4F4C3279F; Mon,  6 Apr 2026 08:30:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Mon, 06 Apr 2026 08:30:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-mrjXgr4mqV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-221318-208809@https.bugzilla.kernel.org/>
References: <bug-221318-208809@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36010-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 790043A2388
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #11 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to manauer.uel from comment #9)
> That would be bus 2, port 3 on the Intel controller, right? Checking sysfs
> says it is the Apple Internal Memory Card Reader (05ac:8406), the SD card
> slot built into the MacBook.
Right. Not sure what's happening here, but "rmmod usb-storage" would silence
it. But not a big deal, I filtered your logs with "grep -v 0000:00:14".

> I captured a new log with the rule enabled and replugged the mouse. I thi=
nk
> with the udev rule active the cancellation disappears as far as I can see.
> The enumeration looks the same as before up to the point where the mouse =
is
> recognized and the hidraw nodes are created. After that, the ASMedia
> controller goes completely silent. No Cancel URB on ep 0x81, no split
> transaction error, nothing. Just the Intel slot 2 ep 2 stalls in the
> background as usual. The mouse works.
Yep. I tried the quirk here and it eliminates the cancellation. Without the
quirk it happens when udev briefly opens and closes the mouse before the GUI
does. The kernel can't do much about it, besides the quirk.

I failed to reproduce this bug on two ASM1042 (non-A) controllers I have. T=
he
URB is canceled and later a new one is submitted and the mouse works.

> Some were definitely me replugging. But I cannot rule out that the device
> also disconnected on its own at some point before I pulled the cable. The
> split transaction error appeared very shortly before one of the disconnec=
ts,
> so it is possible both happened. I definitely followed your instruction
Yes, I asked to try with and without workarounds, but the log shows multiple
disconnections so I wasn't sure what's going on.

I suspect that Split Transaction Error on disconnection is seen when the mo=
use
works and not seen when it doesn't work. Because it looks like the next URB
submitted after cancellation is somehow ignored by the HC.

But I see nothing wrong here:
# usbhid unlinks its URB
[  393.432235] xhci_hcd 0000:0a:00.0: Cancel URB 00000000ea33d4b2, dev 1.1,=
 ep
0x81, starting at offset 0x1284000
# Stop Endpoint is queued (as it should) and succeeds on first try
[  393.432243] xhci_hcd 0000:0a:00.0: // Ding dong!
[  393.432340] xhci_hcd 0000:0a:00.0: Stopped on Transfer TRB for slot 3 ep=
 2
# Set TR Deq target pointer and cycle look right
[  393.432700] xhci_hcd 0000:0a:00.0: Removing canceled TD starting at
0x1284000 (dma) in stream 0 URB 00000000ea33d4b2
[  393.432706] xhci_hcd 0000:0a:00.0: Set TR Deq ptr 0x1284010, cycle 1
[  393.432708] xhci_hcd 0000:0a:00.0: // Ding dong!
[  393.432713] xhci_hcd 0000:0a:00.0: xhci_giveback_invalidated_tds: Keep
cancelled URB 00000000ea33d4b2 TD as cancel_status is 2
# and it completes successfully
[  393.432864] xhci_hcd 0000:0a:00.0: Successful Set TR Deq Ptr cmd, deq =3D
@01284010
[  393.432875] xhci_hcd 0000:0a:00.0: xhci_handle_cmd_set_deq: Giveback
cancelled URB 00000000ea33d4b2 TD
[  393.432877] xhci_hcd 0000:0a:00.0: Giveback URB 00000000ea33d4b2, len =
=3D 0,
expected =3D 10, status =3D -115
# the doorbell likely isn't rung due to no URBs, it shouldn't matter anyway
[  393.432881] xhci_hcd 0000:0a:00.0: xhci_handle_cmd_set_deq: All TDs clea=
red,
ring doorbell

> I already tried this with two different USB hub dongles placed between the
> monitor and the mouse. The behavior was identical. The problem persists
> regardless of which hub is in between, which made me think the issue is
> maybe with the ASMedia controller itself rather than the LG hub specifica=
lly.
Yes indeed, it's exactly why I thought about checking this.

> One observation that might or might not be related I already mentioned in=
 my
> initial report is that plugging in an unrelated wireless Logitech USB don=
gle
> into the monitor makes the wired mouse start working after replugging.
Bizarre. Does it prevent the cancellation, or does it work despite it?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

