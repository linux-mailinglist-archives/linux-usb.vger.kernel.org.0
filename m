Return-Path: <linux-usb+bounces-36019-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ONSLfoS1GmEqgcAu9opvQ
	(envelope-from <linux-usb+bounces-36019-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 22:09:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBA83A6E35
	for <lists+linux-usb@lfdr.de>; Mon, 06 Apr 2026 22:09:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 372C1303D337
	for <lists+linux-usb@lfdr.de>; Mon,  6 Apr 2026 20:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A895398903;
	Mon,  6 Apr 2026 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5sNEzrU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1955C1EF09B
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 20:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775506017; cv=none; b=a5h0Qh6Gz88JL2XEPpzVESaJ/1LkoDzM4DEgcUKd15uZeHGtuS4g0D5BOe5X2dxlTmtPm9EK/AN6ViMYz6wX46f5GQ0Ovu1Ny7vxWN05wjhHBIulagrKeuiN4A09rnEvZSUZYMn/OxA8e7JsQz0pNlVBTS3GeAnZLRF57ZNCIEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775506017; c=relaxed/simple;
	bh=cPo1ErjEtxV1wQkE84rK2GVSiB6N2+7lFQTY3pgDSPg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LU/dZb5sdQwB+fS2y/kvOSABs9konpI4KY8Qa4irAE9J6cS2JAkB58covMnITy/FXnCyFgX+E7KLR+PfNq6syjz3o8phsOJu6VPnQwT1PoqCbCF4O7BgGlhktJFW8+AkkxDMIZDEOZAuiCJar2WxLx5D77wsRJws5XDM4A5jmmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5sNEzrU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A637FC4CEF7
	for <linux-usb@vger.kernel.org>; Mon,  6 Apr 2026 20:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775506016;
	bh=cPo1ErjEtxV1wQkE84rK2GVSiB6N2+7lFQTY3pgDSPg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y5sNEzrUDA3sRFbQkoUCb525Mh2Whl3TDinUlp2sUSpwmPlCuvKwhL8ajS46sJ+kw
	 JYbfoqCp5LD7RE5xqY5UQyCVwrBmJq69xbHaiyKgej2crjNILRseVHJfSZQvVQpp2r
	 UChO7BaMcYusJsqF//AS6M3RhGrlTR789pPmzAR3CipNsAXWneNoLz95MK/kw/7m+r
	 lRIcM2Ih8Mf5kpbhN4/Bxm+InHHmm499Fbr/s/+JnaQl+ic9r/VDYsqsd20IfInp2O
	 9UGH2vXEgGpxWxa1bfc4Y4x+ytymQgRiSObf4N8CT8lWZLnRiKtQFe+mPemlrMLV/V
	 TUmNTNAnE6+7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9E5BEC41613; Mon,  6 Apr 2026 20:06:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Mon, 06 Apr 2026 20:06:56 +0000
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
Message-ID: <bug-221318-208809-sGO2McKK1V@https.bugzilla.kernel.org/>
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
	TAGGED_FROM(0.00)[bounces-36019-lists,linux-usb=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,debugfs.zip:url]
X-Rspamd-Queue-Id: 3DBA83A6E35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #17 from manauer.uel@gmail.com ---
> I could look at it out of curiosity, I think the simplest way is to
> zip -r debugfs.zip /sys/kernel/debug/usb/xhci/0000:0a:00.0
> shortly after it happens, should be enough if the bus isn't very busy.

I attached the zip file. It was captured by connecting the mouse without the
udev rule active and without the dongle, waiting about 10 seconds, then run=
ning
your suggested command.

    sudo zip -r debugfs.zip /sys/kernel/debug/usb/xhci/0000:0a:00.0

> Weird. I think the receiver has a different polling rate (1ms?). Do you h=
ave
> more mice to check if it's a consistent pattern that things only work if =
at
> least one 1ms device is connected, or something stupid like that?

This was a surprise. It turns out there are mice that work fine without any
workaround. I swear, the four mice I originally tested were all Logitech pl=
us
one no-name mouse from my partner, and none of them worked, which is why th=
is
did not come up earlier.

    Mouse                               Interfaces  bInterval   Works
    Lenovo USB Optical (17ef:608d)      1           10ms        yes
    Microsoft Comfort 3000 (045e:077b)  1           10ms        yes
    Holtek MGK-15BU (04d9:1135)         1           10ms        yes
    Logitech G5 (046d:c049)             2           1ms/10ms    no
    Logitech G Pro Wireless (046d:c088) 3           1ms/1ms/1ms no (tested =
via
cable)
    Logitech G403                       ?           ?           no (not at
hand)
    Another no-name mouse (partner's)   ?           ?           no (not at
hand)

The working mice all have a single interface. The failing mice all have
multiple interfaces and at least one endpoint polling at 1ms. The G Pro
Wireless was connected via cable for this test. Its wireless dongle (046d:c=
539)
was not plugged in during any of these tests. That dongle is the same one t=
hat
was observed earlier to make all other mice work when plugged in alongside
them.


> Are you able to run a patched kernel? Lacking better ideas, I suppose we
> could force 1ms polling and see what happens (don't bother with usbhid
> mousepoll option - it doesn't work on xhci-hcd).
Sure, I can try running a patched kernel if you think it is worth it, just =
for
testing. I would not want to maintain a custom kernel long term, but a one-=
off
build to confirm a fix is fine. Given the data above though, forcing 1ms mi=
ght
make things worse rather than better since 1ms seems to be what correlates =
with
failure. Would forcing 10ms on the failing mice be a more interesting test?


> Maybe, but you suggest to disable a power saving feature everywhere for t=
he
> sake of one old questionable xHCI controller. Maybe there is a better way.
That is a fair point. If there is a more targeted fix, either in the ASM104=
2A
handling or scoped to the controller rather than all mice, that would obvio=
usly
be preferable. I am happy to test whatever approach you think makes more se=
nse.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

