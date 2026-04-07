Return-Path: <linux-usb+bounces-36050-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODZUOGIE1WnOzQcAu9opvQ
	(envelope-from <linux-usb+bounces-36050-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 15:19:30 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3B93AEF03
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 15:19:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1FB93020866
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 13:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E1463B7752;
	Tue,  7 Apr 2026 13:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OYKmKGJ1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4743B6BF9
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 13:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567938; cv=none; b=AB0v6RwZfGq0+vwy8iaHr0i+TvE5/lHQzS0YSsQVxwldEO9uSyA1hbqF7Ouz5Y6EPmdueXhmZuxzrjVosA3OVMcaJ7ZgZSUty5Ltr7GR92YAsY5jnmjp4t6HieBMiCrR+UqtZLIf8paI9Ld1ZnmcHaN+40R4bvEWPG/5iNAa31k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567938; c=relaxed/simple;
	bh=/4DkTil4mGTnZH6ybTmJxsKtNcPFih1HDIzv88qeyWM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FHSS6cLglqitDed5PbGyVPwJm0Ld+cI/DaVKmDwGrxnK9TcDqWl+HKCp5q1y8pqBKXorvZ+t8VFFQ7ml/KBrjNDpxqrb1QdGhPxgVk6F5K2xDTfovEyaeR4fB+QsaFVuJHLNnFomdsvq/tndsd3e7vYV4GO4mCVIEur0wAY3egA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OYKmKGJ1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88135C2BCB0
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 13:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775567937;
	bh=/4DkTil4mGTnZH6ybTmJxsKtNcPFih1HDIzv88qeyWM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OYKmKGJ1muEpy8pvMQEYMa/xAbz0HlOw44XAiJPP0Gaxok9ZM629z/C392vkYZBL+
	 7QAOlQwYg/2R8EhvsJtI8DfbQKtk/YmV6M9mKqRODFXnI5tq2VNO4hnevAgS2X42go
	 xYdfmZLyA1wE6SubkJTckEBggl8D/cckRIfF2l901k81Sudi+O5BGy0k2QTCYK+6OU
	 SpIWf6soM9kzPFlcxoUgqf7IFKuMK1eUcjPKN2j7CaHDe4Dz3+mcDsE/hlNjZ+W8bc
	 qrEhB/qKPqhU9c2iNwoZkDlbv/fw3n0kgN5N3xhXpp5Q1xviSftR9QmETuBqtCQ6Li
	 g3FytHpipwduQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7BDFBC41613; Tue,  7 Apr 2026 13:18:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 221318] mice behind ASMedia ASM1042A via Thunderbolt 2 never
 produce input, most likely due to interrupt pipe idle window during
 enumeration
Date: Tue, 07 Apr 2026 13:18:57 +0000
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
Message-ID: <bug-221318-208809-HZZ1bPQ8x8@https.bugzilla.kernel.org/>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36050-lists,linux-usb=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7F3B93AEF03
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

https://bugzilla.kernel.org/show_bug.cgi?id=3D221318

--- Comment #20 from manauer.uel@gmail.com ---
> The "spurious event" noise is likely from SuperSpeed device 4-1.1.2 whose
> Bulk IN URBs may trigger it even on properly working hardware.
Good to know. I looked up 4-1.1.2, it turned out to be the Ethernet adapter
from the USB dongle.

> I see nothing obviously wrong here, it looks like some weird HW problem.
The sequence looks correct on paper, the cancellation goes through cleanly =
and
the endpoint is left in running state with the dequeue pointer advanced past
the old URB. Yet no new transfer ever arrives.

> BTW, I see that the endpoint of interest has 1ms interval too, longer
> interval is on the second endpoint of this mouse.
Yes, that matches the lsusb output.

> If you would like to play with intervals, see drivers/usb/host/xhci-mem.c
> function xhci_parse_frame_interval(). Replace ep->desc.bInterval with any
> number like 1 or 10, units are milliseconds.
I built and tested two patched kernels.

Forcing 10ms: the mouse works without any workaround at all.
Forcing 1ms: the mouse does not work. The udev workaround still fixes it.

So the interval does matter. With 10ms the problem does not occur in the fi=
rst
place, with 1ms it behaves the same as on the stock kernel.

One thing that does not fit this pattern: the Logitech Lightspeed Receiver
(046d:c539) has 3 interfaces all polling at 1ms, yet it works on its own
without any workaround. It also makes wired mice work alongside it on the s=
tock
kernel.

I looked into this a bit. The receiver is not handled by usbhid but by the
logitech-djreceiver driver (hid-logitech-dj). That driver has its own
hid_ll_driver with open and close callbacks that are essentially empty. When
udev opens and closes the hidraw device, nothing happens at the USB level, =
so
no URB is cancelled. This might be why the ASM1042A never gets into the bro=
ken
state.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

