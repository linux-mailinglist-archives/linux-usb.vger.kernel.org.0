Return-Path: <linux-usb+bounces-11130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E1C903779
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 11:09:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 809C8B216D3
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 09:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC8AC176228;
	Tue, 11 Jun 2024 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrlFIach"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 662B079C8
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 09:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718096571; cv=none; b=UbmOHounyIOdJbbDQjop8RY6rBge9b6bmOBghWO7alfHomLFsJM+aAyDzwmmMb9Hl9YHxirqheBxpcV5n3pBYxkjTaNTt8FSSAnwa2MVBgP0g855yd5xw+693cx90vYUhzMPJLcsMKuU44JcRMfuXS5abjsQtV2GrsMyjdxElZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718096571; c=relaxed/simple;
	bh=BZay0EVsEKUz9BqbYRVxh6GC3HFo+QuVfXiWmbyve3k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hTY8nZpuTjQt12l9GP1fJPpkQfCI1ENr/XGG/KUN2/4eeuvW+d+xL+DALt/6MEtAGuksZ9wUX4LqaY0bgibogky1UFHEbNkBp3x5Bi136GvJwHSAo3DWYluarWuS9eh0IE4ea8A9BjGP6vtKALDatV4u59TVNx9BTEfE9ujgPDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrlFIach; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DB2A8C2BD10
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 09:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718096570;
	bh=BZay0EVsEKUz9BqbYRVxh6GC3HFo+QuVfXiWmbyve3k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mrlFIachKSs75ISy0rca3RZk4wD3Eh5gYWZlucEL5gi9Od5XeSBswoIfI6kbuXC5s
	 8HvzyQgLpX8enHot4BozWx0/IzB8g06p4cHDyFzC0Zq/8h6BOJeaJCb7gyVlJbbwET
	 8337GuF1HENu52bbJfUlz98MN853deuQSi3XPNgl2OvdxJ7I1CwfeiJUy8pyPb6rfB
	 aZ8v0tNbQYeH28RxkXrUWp0vEt14Np7HIKx5Fy6ZDfMBt6XOWCAxHuRjskaVH6n+jE
	 wSigVKSu3z3Zx3KpT1m0I2WxxrgzaveYqt72rdBsD+7q1/EsnM/prlnsamKBXI+dl+
	 fpfoCNi4sQnTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D48E0C53B73; Tue, 11 Jun 2024 09:02:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Tue, 11 Jun 2024 09:02:50 +0000
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
Message-ID: <bug-218943-208809-ALP54t4y9q@https.bugzilla.kernel.org/>
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

--- Comment #15 from Jarrard (jarrard@proton.me) ---
[  668.628381] usb 3-4: new high-speed USB device number 4 using xhci_hcd
[  668.755970] usb 3-4: New USB device found, idVendor=3D1a40, idProduct=3D=
0101,
bcdDevice=3D 1.11
[  668.755978] usb 3-4: New USB device strings: Mfr=3D0, Product=3D1,
SerialNumber=3D0
[  668.755983] usb 3-4: Product: USB 2.0 Hub
[  668.818075] hub 3-4:1.0: USB hub found
[  668.818344] hub 3-4:1.0: 4 ports detected
[  669.113942] usb 4-4: new SuperSpeed USB device number 5 using xhci_hcd
[  674.233892] usb 4-4: unable to get BOS descriptor or descriptor too short
[  674.258279] usb 4-4: unable to read config index 0 descriptor/start: -71
[  674.258288] usb 4-4: can't read configurations, error -71
[  674.409839] usb 3-4.3: new full-speed USB device number 5 using xhci_hcd
[  674.628846] usb 3-4.3: New USB device found, idVendor=3D07ca, idProduct=
=3Dd553,
bcdDevice=3D 1.01
[  674.628853] usb 3-4.3: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[  674.628858] usb 3-4.3: Product: Live Gamer Ultra 2.1-RGB
[  674.628862] usb 3-4.3: Manufacturer: AVerMedia Computer Inc.
[  674.628866] usb 3-4.3: SerialNumber: 5204140800332
[  674.683236] hid-generic 0003:07CA:D553.000B: hiddev5,hidraw10: USB HID v=
1.11
Device [AVerMedia Computer Inc. Live Gamer Ultra 2.1-RGB] on
usb-0000:30:00.3-4.3/input1
[  675.205949] usb 4-4: Device not responding to setup address.
[  675.418073] usb 4-4: Device not responding to setup address.
[  675.625936] usb 4-4: device not accepting address 6, error -71
[  675.634016] usb usb4-port4: attempt power cycle
[  676.742634] usb 4-4: new SuperSpeed USB device number 7 using xhci_hcd
[  676.950771] usb 4-4: LPM exit latency is zeroed, disabling LPM.
[  677.048948] usb 4-4: New USB device found, idVendor=3D07ca, idProduct=3D=
2553,
bcdDevice=3D 1.00
[  677.048957] usb 4-4: New USB device strings: Mfr=3D6, Product=3D7,
SerialNumber=3D3
[  677.048962] usb 4-4: Product: Live Gamer Ultra 2.1
[  677.048966] usb 4-4: Manufacturer: AVerMedia
[  677.048970] usb 4-4: SerialNumber: 5204140800332
[  677.147762] uvcvideo 4-4:1.1: Unknown video format
30313050-0000-0010-8000-00aa00389b71
[  677.147779] usb 4-4: Found UVC 1.00 device Live Gamer Ultra 2.1 (07ca:25=
53)
[  677.547565] usb 4-4: 3:2: failed to get current value for ch 0 (-22)





Nothing about superspeedplus sorry to day.  I don't understand the descript=
or
and can't debug further as dynamic debug is not allowed under this distro a=
tm.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

