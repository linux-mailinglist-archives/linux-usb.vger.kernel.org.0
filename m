Return-Path: <linux-usb+bounces-34326-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLnwKUASr2nJNQIAu9opvQ
	(envelope-from <linux-usb+bounces-34326-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 19:32:32 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC1C23E9E4
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 19:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F02F1300D4F5
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 18:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD64B340A59;
	Mon,  9 Mar 2026 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VXSR9sfH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5CE32BF42
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773081145; cv=none; b=IlnF22u6HOA60uUuiLK5VFr0ZJqi+K66pItPF6rU/w2auN/9DfHknHHXFsfvTDhP87wK9BX11mG29LauPzahIj/aorJkPiKSGFkOBFF1TRCV0yY6P5d7F/xcxWxvFn45Sx/2w4hMQssmMymEq4eAQZuN2+XUrzEUvmH4oykhIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773081145; c=relaxed/simple;
	bh=GaA3K4X/8E3dP637BN+4MX5zIKrzMg48ybtS3g5ZmDE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nLHVP97cdK1IeS8WoXh+RZcjSN45WGQH1estDD04qi9TZvSYJAGn+CNDcNpl/+rV1UI9/P/NAB7KR2ALisi/OixikWfpJ1CmZ4wuYkQw08RbYv+3dULXj2nOn50i8lQhhmlH+QbJXmcj2y1WGi0vmUdIQdDcgJVv2AKuEUbH4hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VXSR9sfH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7610C2BC87
	for <linux-usb@vger.kernel.org>; Mon,  9 Mar 2026 18:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773081144;
	bh=GaA3K4X/8E3dP637BN+4MX5zIKrzMg48ybtS3g5ZmDE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VXSR9sfHkinJfbcIdNSqW4TmW5lL3YdqvGnUigoxtywXepVjbDnGIpFCyhyuXhnRq
	 qS7Owa/fjMmTXi9DfrZWj01L3dcZut/MV3DWQMjIHZ2zy9FHWHb+4LXg93P44g+Ige
	 YidiQLtQ0Y419h6wl3fpAE4s2uRtN2TVbwNF+COVsy7L448z9MJHiKFKsBIJXNWp7+
	 13LojNpnvd0fEfRkOvIE8DMhaAuCD1gYofi6irDndYZGTnPf+l6AzLRakNWuT6o1V3
	 ZJ8MI/SMWtEFW9eejxboHRU3+1R5Bn8LzxhuYBVXIz4q13pNU1uIbEBJMtVvJLSuup
	 QX+d4vZPmbrDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C816AC3279F; Mon,  9 Mar 2026 18:32:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] ASMedia ASM4242 USB 3.2 xHCI Controller gives command
 timeout
Date: Mon, 09 Mar 2026 18:32:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stuart.a.hayhurst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220936-208809-EV0e5nslLB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220936-208809@https.bugzilla.kernel.org/>
References: <bug-220936-208809@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: BEC1C23E9E4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34326-lists,linux-usb=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FROM_NO_DN(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_ONE(0.00)[1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D220936

--- Comment #4 from Stuart Hayhurst (stuart.a.hayhurst@gmail.com) ---
Thanks, disabling autosuspend seems to solve the CMD_RUN timeout, I can at
least connect and disconnect devices now (I only tested, maybe 10 unplugs a=
nd
replugs, but that far beats any previous attempt).

The device is still unbearably slow though, it still takes 10+ seconds to g=
et
my mouse to finish connecting:
```
[ 8344.769964] usb 5-1.1: new full-speed USB device number 4 using xhci_hcd
[ 8345.029328] usb 5-1.1: New USB device found, idVendor=3D046d, idProduct=
=3Dc539,
bcdDevice=3D39.06
[ 8345.029333] usb 5-1.1: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[ 8345.029334] usb 5-1.1: Product: USB Receiver
[ 8345.029335] usb 5-1.1: Manufacturer: Logitech
[ 8345.049306] logitech-djreceiver 0003:046D:C539.000C: hidraw0: USB HID v1=
.11
Keyboard [Logitech USB Receiver] on usb-0000:77:00.0-1.1/input0
[ 8345.104692] logitech-djreceiver 0003:046D:C539.000D: hiddev0,hidraw1: USB
HID v1.11 Mouse [Logitech USB Receiver] on usb-0000:77:00.0-1.1/input1
[ 8345.160297] logitech-djreceiver 0003:046D:C539.000E: hiddev1,hidraw2: USB
HID v1.11 Device [Logitech USB Receiver] on usb-0000:77:00.0-1.1/input2
[ 8347.111395] logitech-djreceiver 0003:046D:C539.000E: device of type eQUAD
Lightspeed 1 (0x0c) connected on slot 1
[ 8347.127481] input: Logitech G502 as
/devices/pci0000:00/0000:00:02.2/0000:15:00.0/0000:16:02.0/0000:77:00.0/usb=
5/5-1/5-1.1/5-1.1:1.2/0003:046D:C539.000E/0003:046D:407F.000F/input/input31
[ 8347.205902] logitech-hidpp-device 0003:046D:407F.000F: input,hidraw4: USB
HID v1.11 Keyboard [Logitech G502] on usb-0000:77:00.0-1.1/input2:1
[ 8357.290785] logitech-hidpp-device 0003:046D:407F.000F: HID++ 4.2 device
connected.
```

Unbind and rebind didn't improve anything.

I believe I've had this problem with 2 different CPUs (both R7 7700Xs, but =
the
first one had a useless memory controller). It's undervolted, so I'll give =
it a
try without that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

