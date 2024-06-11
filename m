Return-Path: <linux-usb+bounces-11143-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A5E903E69
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 16:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 126B11F21837
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 14:11:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E287117D37B;
	Tue, 11 Jun 2024 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TS/395nV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B281DDF4
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 14:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718115054; cv=none; b=OY4y0E+DUMkPLwuDZaXC0lZl/JxizaytD0gOIDCmV5V/C//rvsZrgTlvtc8F8M8t/xEOJXIoEL9orn6N+hnWaJd6EBq7cvhavWol+GHT45JqdK9478d8+S8DTm4XRHFlsjJczatHpO/DcNw5NUbVQejuJNrgbkYqLIFqQrLrk50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718115054; c=relaxed/simple;
	bh=1lYxTI4Ez4M8KDCd6qrvxWGztbUm6Z8bv5fxn9AxIB4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OUFtdcuIpjILN7bj3zFzGkWOvq4wSIj7CfPtDVQxSxAE8mxJecGy7bFYJ6AYJlqWEkTpezPT8RypuTxk4+op2odsdhqNK+gz2aNUIZwtokOvYQz8jMaKydzxvZF/Hl3QbwS3DhzxPXXptaqsx4mhN/ynUvYhJLkyaRf7wgC1RB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TS/395nV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2B15C2BD10
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 14:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718115053;
	bh=1lYxTI4Ez4M8KDCd6qrvxWGztbUm6Z8bv5fxn9AxIB4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TS/395nVO4/DKkNKkHlJvsZ7RnCIhjFyYBoC2EyUnVRhOe+CsTzITUr4gzSYJxBpa
	 bcRUt6HAquimKpcDHfa56YziWaI28FpUbv2Ri+yxGRQfoJKFdsgBsTEbFfsMltt1CA
	 0mvwSLcDfi/I0ye0vt11AS76afPYeYxDMg6L3EdXryoLvpfs514Ub5QUJRO4MHDNq3
	 +p3VB0LxwSOuB6TXOdF9rRttvpyodENI+UW3Ge5AVfgbYzoLE7d3jwGHQA8Ohe4P/k
	 TgyIemXldy47AarnAEYgXENdKYRX19igYAobS63fPPdYI+psC6OdzJyKpt+685csJx
	 brsE3c/BdFiMg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BCE08C53B50; Tue, 11 Jun 2024 14:10:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Tue, 11 Jun 2024 14:10:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-Enx7N0jQTU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #16 from Jarrard (jarrard@proton.me) ---
I(In reply to Jarrard from comment #15)
> [  668.628381] usb 3-4: new high-speed USB device number 4 using xhci_hcd
> [  668.755970] usb 3-4: New USB device found, idVendor=3D1a40, idProduct=
=3D0101,
> bcdDevice=3D 1.11
> [  668.755978] usb 3-4: New USB device strings: Mfr=3D0, Product=3D1,
> SerialNumber=3D0
> [  668.755983] usb 3-4: Product: USB 2.0 Hub
> [  668.818075] hub 3-4:1.0: USB hub found
> [  668.818344] hub 3-4:1.0: 4 ports detected
> [  669.113942] usb 4-4: new SuperSpeed USB device number 5 using xhci_hcd
> [  674.233892] usb 4-4: unable to get BOS descriptor or descriptor too sh=
ort
> [  674.258279] usb 4-4: unable to read config index 0 descriptor/start: -=
71
> [  674.258288] usb 4-4: can't read configurations, error -71
> [  674.409839] usb 3-4.3: new full-speed USB device number 5 using xhci_h=
cd
> [  674.628846] usb 3-4.3: New USB device found, idVendor=3D07ca,
> idProduct=3Dd553, bcdDevice=3D 1.01
> [  674.628853] usb 3-4.3: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D3
> [  674.628858] usb 3-4.3: Product: Live Gamer Ultra 2.1-RGB
> [  674.628862] usb 3-4.3: Manufacturer: AVerMedia Computer Inc.
> [  674.628866] usb 3-4.3: SerialNumber: 5204140800332
> [  674.683236] hid-generic 0003:07CA:D553.000B: hiddev5,hidraw10: USB HID
> v1.11 Device [AVerMedia Computer Inc. Live Gamer Ultra 2.1-RGB] on
> usb-0000:30:00.3-4.3/input1
> [  675.205949] usb 4-4: Device not responding to setup address.
> [  675.418073] usb 4-4: Device not responding to setup address.
> [  675.625936] usb 4-4: device not accepting address 6, error -71
> [  675.634016] usb usb4-port4: attempt power cycle
> [  676.742634] usb 4-4: new SuperSpeed USB device number 7 using xhci_hcd
> [  676.950771] usb 4-4: LPM exit latency is zeroed, disabling LPM.
> [  677.048948] usb 4-4: New USB device found, idVendor=3D07ca, idProduct=
=3D2553,
> bcdDevice=3D 1.00
> [  677.048957] usb 4-4: New USB device strings: Mfr=3D6, Product=3D7,
> SerialNumber=3D3
> [  677.048962] usb 4-4: Product: Live Gamer Ultra 2.1
> [  677.048966] usb 4-4: Manufacturer: AVerMedia
> [  677.048970] usb 4-4: SerialNumber: 5204140800332
> [  677.147762] uvcvideo 4-4:1.1: Unknown video format
> 30313050-0000-0010-8000-00aa00389b71
> [  677.147779] usb 4-4: Found UVC 1.00 device Live Gamer Ultra 2.1
> (07ca:2553)
> [  677.547565] usb 4-4: 3:2: failed to get current value for ch 0 (-22)
>=20
>=20
>=20
>=20
>=20
> Nothing about superspeedplus sorry to day.  I don't understand the
> descriptor and can't debug further as dynamic debug is not allowed under
> this distro atm.

Interesting enough dynamic debug is compiled in with this release of kernel=
 for
kubuntu but it spits a permission denied with any of those cat commands.  I
don't really understand the issue.=20

Pretty sure I was able to do them under Arch so maybe I should go back to t=
hat
instead of using kubuntu. For some reason I find Arch simpler, lol

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

