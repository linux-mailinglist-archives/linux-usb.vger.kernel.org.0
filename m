Return-Path: <linux-usb+bounces-33786-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P1eGp6moWmqvQQAu9opvQ
	(envelope-from <linux-usb+bounces-33786-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 15:13:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D61021B88F8
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 15:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EDAD30FB0DE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 14:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B279413224;
	Fri, 27 Feb 2026 14:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZfH/Elm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3803ECBCC
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 14:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772201066; cv=none; b=U11U5O4V+cfR0fxwLBt0cfP2EMwE8YVt2ekXRSxG3hXiG1pKB9EOMut2cakU88KzI2JwU+lKfTlMw+Pm5cKZWVP3oVQFZbmzFTxrqY0Kr18rUsWF24VboIEqqESms0ZAzyAHNIUTxDLxBOdzWEiI7bixI1rcIzq9n1ADoP3c5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772201066; c=relaxed/simple;
	bh=vNwg/isVfaOZxhiPBBS+i0BRXY2I3DIdyEU/99yHDCE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XyDHqjng7TwbGES/vccMBnLMSGzYiiZ5pSmWY+PpAlrogoYF4jTJ8njueNVhQcyDUdg82NlPFSiqcEjrRt/6qWJ7dsgXaGp1CDoelVogdAbIqzcbLArUcerU8lkMUr0gr9t+Ei566UY8FlTNyMev9/6Lk0NxKeV/kKyGyy9LQQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZfH/Elm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E40CC19425
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 14:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772201066;
	bh=vNwg/isVfaOZxhiPBBS+i0BRXY2I3DIdyEU/99yHDCE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AZfH/ElmwmNg2MWUXNIJeLE9BwVhH2f4o3AVSHwxxKFCs8tO5d39bvgpkmV2fQF7t
	 rnQtsE1Ocg4ZoJ8UnCNr3MjHIaLvzlqRhDyHcQ4aWIXzbedj0P4sJ/QzqPPcMfT4Ep
	 1vXKT9jfdDVcHIuCEcxupvcwF8jHvbIokgquzeqTTR+yKpnAdJxZTDy4lA6ALDvau2
	 Sqd2S5Hee+yrXdZA8FkKjoQ4tAqFbVTTuUCa605MF57Z41N46QefCyUEarHvJnT56M
	 blkWshqTecWPwC9AzBpyqZyTlDE1VlW2bLGgQJXZr8bE5lUZDtw7EaIaTxF7GXr4fD
	 kxZ8FtYKbIsNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5400CC4160E; Fri, 27 Feb 2026 14:04:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221073] xHCI host controller dies on resume from s2idle on AMD
 Strix Halo [1022:1587]
Date: Fri, 27 Feb 2026 14:04:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-221073-208809-AFqWBugwSz@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33786-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: D61021B88F8
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221073

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #15 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
So xhci interrupt handler does not get called when it should.

The debugfs dump and xhci dynamic debug dmesg show that the controller hand=
led
all events, even completed the control transfer that the driver assumed tim=
ed
out, and thus cancelled. Event ring shows all the events:

0x00000000ffffd5d0: TRB 00000000ffffe020 status 'Success' len 0 slot 1 ep 0
type 'Command Completion Event' flags e:C

0x00000000ffffd5e0: TRB 0000000001000000 status 'Success' len 0 slot 0 ep 0
type 'Port Status Change Event' flags e:C

0x00000000ffffd5f0: TRB 00000000ffff5980 status 'Success' len 0 slot 1 ep 1
type 'Transfer Event' flags e:C

0x00000000ffffd600: TRB 00000000ffff5990 status 'Stopped - Length Invalid' =
len
0 slot 1 ep 1 type 'Transfer Event' flags e:C

0x00000000ffffd610: TRB 00000000ffffe000 status 'Success' len 0 slot 1 ep 0
type 'Command Completion Event' flags e:C
 0 0x00000000ffffd620: type 'UNKNOWN' -> raw 00000000 00000000 00000000
00000000

at event ring address 0ffffd5f0 we see the successful completion of a trans=
fer
ending at 0xffff5980, This would be the control transfer that dmesg shows
driver cancelled due to timeout. control transfer are 2-3 TRBs long, so
starting at 0xffff5960 and end at 0xffff5980.


[  +4.026739] xhci_hcd 0000:c4:00.4: Cancel URB 000000003faffdb9, dev 1, ep
0x0, starting at offset 0xffff5960

debugfs shows that event ring dequeue is at x00000000ffffd5e0, meaning this=
 is
the
last event the driver is aware of.

So xhci interrupt handler was not called for some reason even if xHC handled
all events, and USBSTS register EINT bit indicates xHC tried to inform of t=
he
pending unhandled events.

Only xHCI side issue I can think of is that xhci driver for some odd reason
turned off interrupt generation by clearing USBCMD register INTE bit. Other=
wise
I would look at PCI MSI/MSIX generation, or if something is preventing
interrupts on this cpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

