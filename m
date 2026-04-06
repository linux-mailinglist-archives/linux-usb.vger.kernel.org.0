Return-Path: <linux-usb+bounces-36013-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2F5TNBCf02lJjwcAu9opvQ
	(envelope-from <linux-usb+bounces-36013-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 13:54:56 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30F3A3290
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 13:54:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14D5D3011060
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 11:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977BB33291F;
	Mon,  6 Apr 2026 11:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYiI4WLV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27653221F1F
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 11:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775476493; cv=none; b=DCxSaY2zCs1W5SIvoLCpfVJKWOZwn0r3HFbvpBx6S07TYaydi93DrL6LwZuok4ttDyoAdAvzTcNBenQigMYjVO2UoTqtxsrJqbytuWA2r4xUhNHGAceSNyf8txC0HxlIAW9O3pe0ys82jvlxxVl9F792v7DSE3cG55TezE03A5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775476493; c=relaxed/simple;
	bh=tPPt0yOtJF2oseeiWGWkphdxYxy2bA+MR4iSQa3yvMk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Km88fp+1yv+cdO8aulxCuuURd8n1esrgIpaGzgvuArQCefd00e/3t/pHo7vId4ebrr+xlg69XqySEnTRXHFLUr9cEOE0DdYXcgKJYwQ6wC9s3yQxKtxr22IQ/BjyNDXDoGZUYrYpjr/kYbSrdrSJqlhLwbexawEBfYMu6YALSa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYiI4WLV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B208AC19425
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 11:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775476492;
	bh=tPPt0yOtJF2oseeiWGWkphdxYxy2bA+MR4iSQa3yvMk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IYiI4WLVXdINRMC5PdlGf4MDKhQsoGvAq/4Eg/zVz+02RSnmcbZv2BY5mDWirgh9J
	 AntUVsod3nDAbgLDD3g6VL+cOWCAeFqdkmHWFmE+yya4Tg6Bnc3O3jgtABCRPhqlUO
	 RWFOS7NUI8VPXT2vMIkGSwegdHJNNTcS9choWjK5DYwgvOFkeJ39857koLthoRuJZs
	 nfMkwNVueYIPwwvth2YxI5AdR//BiQYZL/429weD5byd8e3wNhN80Evqgcyxmw0sEY
	 PKDPo23h82km0FoelA3WCmEP15QnWjMhib6M1oo0eEEg0kQmstUs5YeFDCrZXeKjxO
	 VIys+v+ph0pSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A3FD2C3279F; Mon,  6 Apr 2026 11:54:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Mon, 06 Apr 2026 11:54:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: manauer.uel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-221318-208809-ojoHSVXDZ8@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36013-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_ONE(0.00)[1];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-0.999];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4B30F3A3290
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #14 from manauer.uel@gmail.com ---
> One observation that might or might not be related I already mentioned in=
 my
> initial report is that plugging in an unrelated wireless Logitech USB don=
gle
> into the monitor makes the wired mouse start working after replugging.
> Bizarre. Does it prevent the cancellation, or does it work despite it?

It works despite the cancellation. The Cancel URB on ep 0x81 still happens =
with
the dongle present, same as without it.

Note: I had to add a USB hub between the monitor and the mouse to have enou=
gh
ports for the dongle, so the mouse now shows up as 3-1.1.4 instead of 3-1.1.
The issue persists the same way through the hub. Current topology on the
ASMedia controller:

    /:  Bus 003.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, =
480M
        ID 1d6b:0002 Linux Foundation 2.0 root hub
        |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/4p, 480M
            ID 043e:9a10 LG Electronics USA, Inc. 34UC88-B
            |__ Port 001: Dev 005, If 0, Class=3DHub, Driver=3Dhub/5p, 480M
                ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
                |__ Port 001: Dev 006, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
                    ID fffe:0005
                |__ Port 001: Dev 006, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
                    ID fffe:0005
                |__ Port 001: Dev 006, If 2, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
                    ID fffe:0005
                |__ Port 004: Dev 011, If 0, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
                    ID 046d:c049 Logitech, Inc. G5 Laser Mouse
                |__ Port 004: Dev 011, If 1, Class=3DHuman Interface Device,
Driver=3Dusbhid, 12M
                    ID 046d:c049 Logitech, Inc. G5 Laser Mouse

Something I did not notice before appears in both new logs: after the Cancel
URB and Set TR Deq sequence completes, the ASMedia controller generates the=
se:

    xhci_hcd 0000:0a:00.0: Spurious event dma 0x00000000012c50b0, comp_code=
 13
after 13
    xhci_hcd 0000:0a:00.0: Spurious event dma 0x00000000012c50e0, comp_code=
 13
after 13

This appears both when the mouse does not work (no rule, no dongle) and whe=
n it
does work (dongle present). I do not know what to make of it, but it shows =
up
in both cases and not in the log with the udev rule active.

The wireless dongle itself also has Cancel URBs on ep 0x81 and ep 0x82 duri=
ng
its own enumeration, but it recovers fine and no spurious events follow its
cancellations. The wired mouse does not recover the same way.

> Yes, I asked to try with and without workarounds, but the log shows multi=
ple
> disconnections so I wasn't sure what's going on.
I think I replugged it multiple times per test, which made the logs harder =
to
read. I captured a cleaner second log without the udev rule and without the
dongle to have a baseline. Both logs are attached if useful.

> Yep. I tried the quirk here and it eliminates the cancellation. Without t=
he
> quirk it happens when udev briefly opens and closes the mouse before the =
GUI
> does. The kernel can't do much about it, besides the quirk.
Would it be possible to have a quirk that applies to a whole subset of devi=
ces
(in this case mice), instead of one specific device only?


I am currently away for Easter break, but next weekend I will have access t=
o a
second LG monitor from the same era that shows the same issue. I will check
whether it runs on the same controller.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

