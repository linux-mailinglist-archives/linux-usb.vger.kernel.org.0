Return-Path: <linux-usb+bounces-33623-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kPIBMGZXnWk2OgQAu9opvQ
	(envelope-from <linux-usb+bounces-33623-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:46:46 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61D183355
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 08:46:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CDAA3034DF8
	for <lists+linux-usb@lfdr.de>; Tue, 24 Feb 2026 07:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E94D2DC35C;
	Tue, 24 Feb 2026 07:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X7nr4tRw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF02364E8F
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771919104; cv=none; b=LM/t5fnW4xUEsLLM6qlYTWLIXP4IAAFcyp/D5b8KOGiZ4owAVxk80Y01J+y/CF1GC1mCP/isyXHD+Y3/wjWEFx3GI95mdGUMrvBiN2pBFCNgGQcD/dsBjT/wagSY4GVzeixWlHeZpaFfcs2YmJbgtSN+GrSL7ReNzllKJS/66gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771919104; c=relaxed/simple;
	bh=X0j5W5pBfx89xviD7qStNDL/okDCbfkCuhxBrw2nvJ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wo4r06p0nYwk+rpBa9J42MLSw+2H5aW+JN4ITlD80WgLOrq+y9raCc8qzFvayWooQQk3rk+dAYzQhaauP/WBEpO018aPFFsW/NElEXEBidqkIhCtNBnq+jGFCRHmfC9GLKW2m4JoVmgPSTKWUgIXiT6zD1Mho2jgd/6fJsVcG9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X7nr4tRw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7E4FC116D0
	for <linux-usb@vger.kernel.org>; Tue, 24 Feb 2026 07:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771919103;
	bh=X0j5W5pBfx89xviD7qStNDL/okDCbfkCuhxBrw2nvJ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X7nr4tRwO1eH7OF56VPNCx1YYnnH6nj8VyutkSO4QoxGjkIMEdreSC/U5TG4e8/kK
	 zjhuRDoDS3HelafQ7b0SGXCaDtRS5DknzA2szLh2H8FX8rSsm0VfHmXdC9JClVvqIG
	 7LCYBPk169R/UHdmnxsR0tTeJDbgxDpWnYZSn4p/mUoG0i4KoMMMLf2z6WH9cmF6r7
	 4WAAdInork0gYgOcoHDSBaEATfEbnW0qjCrR8cWAdH+DJrXO0PsKGgSdNixhf8qsMa
	 u6+OflwLo2oI285qKwRgLwpPaTfDxxaqaYlD5Pe4vChRDflT7YvgGDoBFCAG4xLRcn
	 y3z+gmrS5qAZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B123EC41614; Tue, 24 Feb 2026 07:45:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221103] xhci_hcd: System lockup under CPU load during usbfs
 polling of USB devices on AMD platforms
Date: Tue, 24 Feb 2026 07:45:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paul@unnservice.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221103-208809-YI3kLaShqa@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33623-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.998];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,unnservice.com:email]
X-Rspamd-Queue-Id: 1B61D183355
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221103

--- Comment #19 from Paul Alesius (paul@unnservice.com) ---
(In reply to Micha=C5=82 Pecio from comment #18)
> Could you enable dynamic debug and check if simply toggling power/control
> between 'on' and 'auto' produces the same xhci_suspend/xhci_resume messag=
es?
> Would this be enough to hang the system
Enabling dynamic debug and changing power/control on/auto rapidly produces =
the
same suspend/resume messages on all devices. Changing control=3D on and auto
rapidly on 0000:7a:00.4 does not trigger the freeze.

> What's the state of power/control for those HCs which aren't causing
> problems? Are they also getting resumed and suspended under your test, but
> without crashing? That would be at least one optimistic result in this wh=
ole
> mess :)
About half of them are on and auto, those with control=3Dauto by default do=
 not
trigger the freeze (except the known-bad 7a:00.4, and I've not stressed the
others as much until arriving at the conclusion that it's 7a:00.4 triggering
the freeze). Here's their default values and notes on them:

 control=3Don 0000:0e:00.0 Bus 001 Device 001: ID 1d6b:0002 Linux Foundatio=
n 2.0
root hub
 control=3Don 0000:0e:00.0 Bus 001 Device 002: ID 13d3:3588 IMC Networks
Wireless_Device (Internal)
 control=3Don 0000:0e:00.0 Bus 001 Device 003: ID 0b05:19af ASUSTek Compute=
r,
Inc. AURA LED Controller (Internal)
 control=3Don 0000:0e:00.0 Bus 001 Device 004: ID 046d:c548 Logitech, Inc. =
Logi
Bolt Receiver (Plugged in)
 control=3Don 0000:0e:00.0 Bus 002 Device 001: ID 1d6b:0003 Linux Foundatio=
n 3.0
root hub
 control=3Don 0000:10:00.0 Bus 003 Device 001: ID 1d6b:0002 Linux Foundatio=
n 2.0
root hub
 control=3Don 0000:10:00.0 Bus 004 Device 001: ID 1d6b:0003 Linux Foundatio=
n 3.0
root hub
The 78:00.0 have xhci_pci_suspend -110 errors during boot:
[   17.918387] xhci_hcd 0000:78:00.0: WARN: xHC CMD_RUN timeout
[   17.918508] xhci_hcd 0000:78:00.0: PM: suspend_common(): xhci_pci_suspend
returns -110
[   17.918586] xhci_hcd 0000:78:00.0: can't suspend (hcd_pci_runtime_suspend
returned -110)
 control=3Dauto 0000:78:00.0 Bus 005 Device 001: ID 1d6b:0002 Linux Foundat=
ion
2.0 root hub
 control=3Dauto 0000:78:00.0 Bus 006 Device 001: ID 1d6b:0003 Linux Foundat=
ion
3.0 root hub
 control=3Dauto 0000:7a:00.3 Bus 007 Device 001: ID 1d6b:0002 Linux Foundat=
ion
2.0 root hub
 control=3Dauto 0000:7a:00.3 Bus 008 Device 001: ID 1d6b:0003 Linux Foundat=
ion
3.0 root hub
 control=3Dauto 0000:7a:00.4 Bus 009 Device 001: ID 1d6b:0002 Linux Foundat=
ion
2.0 root hub
This is the root hub that freeze during rapid polling, same PCI ID as the l=
ine
above that is unaffected:
 control=3Dauto 0000:7a:00.4 Bus 010 Device 001: ID 1d6b:0003 Linux Foundat=
ion
3.0 root hub
 control=3Dauto 0000:7b:00.0 Bus 011 Device 001: ID 1d6b:0002 Linux Foundat=
ion
2.0 root hub

I then enabled full dynamic debug + netconsole (printk=3D8):
 $ echo 'module xhci_hcd +p' | sudo tee /proc/dynamic_debug/control
 $ echo 'module usbcore +p' | sudo tee /proc/dynamic_debug/control
 $ echo 'module pci +p' | sudo tee /proc/dynamic_debug/control
 $ echo 8 | sudo tee /proc/sys/kernel/printk

Surprisingly, the system did not freeze for over 20 minutes with 3 instances
polling simultaneously and stress-ng --cpu 0. The moment I killed stress-ng
first by coincidence, the system froze immediately. Netconsole captured thi=
s up
until the lockup:
...
[ 1766.915244] xhci_hcd 0000:7a:00.4: PME# disabled
[ 1766.915262] xhci_hcd 0000:7a:00.4: enabling bus mastering
... (normal suspend/resume cycle) ...
[ 1767.170769] xhci_hcd 0000:7a:00.4: PME# disabled
[ 1767.170774] xhci_hcd 0000:7a:00.4: enabling bus mastering
[ 1767.181194] xhci_hcd 0000:7a:00.4: Controller not ready at resume -19
[ 1767.181209] xhci_hcd 0000:7a:00.4: PCI post-resume error -19!
[ 1767.181213] xhci_hcd 0000:7a:00.4: HC died; cleaning up
[ 1767.181222] xhci_hcd 0000:7a:00.4: hcd_pci_runtime_resume: -19
[ 1767.181232] hub 9-0:1.0: state 0 ports 2 chg 0000 evt 0000
[ 1767.181238] hub 10-0:1.0: state 0 ports 2 chg 0000 evt 0000

> There is another bug 221073 about some AMD HCs dying on resume from system
> sleep,
> may be related. So far nobody knows why it happens.
I don't know enough to say whether they are the same root cause, but both
involve an AMD xHC dying on resume, so they may be related.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

