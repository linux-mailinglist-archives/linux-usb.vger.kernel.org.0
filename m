Return-Path: <linux-usb+bounces-11148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF25903F40
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 16:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9FB011C23441
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 14:53:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEFE51171D;
	Tue, 11 Jun 2024 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MyVZL3ei"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643621CFA0
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718117590; cv=none; b=Wcz5u3sRg1dnNtWXT21byT2+cXKkdbAmGunCSCLR75eWCFD1RcDDnetOYfHEyY7c97LFLgkTeVVvKl0Cb7Iv30OqAaOxnOlJ7LnMtqOND3D5scU7f25a3jE0ejc/JsOW1ZJms/BmanMPobSBTy9IAEnKkppA3ex4Be1dPp6Z/jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718117590; c=relaxed/simple;
	bh=BeLbx54XpSz1Li4UWtS/i+HtgZfy3144st8Kb+4qGDM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bNyNrhbI2f/kKkVzneYLEP6zgCN8uOfaOoDGLP4s85gfnjdddrVZIAii3uMTChaxXyBESLeaZ2q5gWAJxdSAGhG7Yc+4b16v7fox0sFzL5O4KY9GZM7AUBplidDN3xZXNzD0gMCdnViFR9tbjMmoKge4DLlUn5J941ohUtIsPdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MyVZL3ei; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EE5FCC2BD10
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 14:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718117590;
	bh=BeLbx54XpSz1Li4UWtS/i+HtgZfy3144st8Kb+4qGDM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MyVZL3eiGjpBAQvXZbYlw9PFj6eMxH3UE/hS6x3qN6KQDt7n1YVZuG3FNLm1itKv0
	 nBENwpfbxM81iL9dttERH+kDfE7UirJWphyb29+eVkWGhresRcEwDwbx10OnOPJpPu
	 mykPbHC2CwB1Sk2XfljzqjQ9n2DJDQfr9OemqAuXF2soZcqVCtXXEtOlOUpQ2Bj0la
	 t0LDz9DuySVBbbihzEIbkwduPM9I4iIreBn6pAwBodFiPfN831NBslzudRs65WbeCE
	 qnFoXCczP3Ac5Kjjz5258wqaXZg7EpVUEbWnwhp6qiG5fPMsrHqhCU/hSwGtrOHdfz
	 Fm3EBe6RCaSIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DBC7FC53B73; Tue, 11 Jun 2024 14:53:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Tue, 11 Jun 2024 14:53:09 +0000
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
Message-ID: <bug-218943-208809-OGGBcCgXuT@https.bugzilla.kernel.org/>
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

--- Comment #18 from Jarrard (jarrard@proton.me) ---
Here is a more truncated dmesg log, ran it a few times and this seems to be=
 the
sum of the log when plugging the device in.

Removed most the xhci_get_isoc_frame_id: index 0........ stuff

Keep in mind this USB capture card has around 3 devices on it from what I c=
an
see. Video, Audio, RGB Lighting.

[ 1560.044886] xhci_hcd 0000:30:00.3: udev->tt =3D 0000000000000000
[ 1560.044890] xhci_hcd 0000:30:00.3: udev->ttport =3D 0x0
[ 1560.044895] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1560.052981] usb 4-4: Device not responding to setup address.
[ 1560.053033] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1560.053055] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1560.053092] xhci_hcd 0000:30:00.3: Slot 7 output ctx =3D 0x0x00000000fff=
26000
(dma)
[ 1560.053098] xhci_hcd 0000:30:00.3: Slot 7 input ctx =3D 0x0x00000000fff1=
7000
(dma)
[ 1560.053105] xhci_hcd 0000:30:00.3: Set slot id 7 dcbaa entry
00000000dcd62c49 to 0xfff26000
[ 1560.053130] xhci_hcd 0000:30:00.3: xhci_get_isoc_frame_id: index 0, reg
0xac3 start_frame_id 0x159, end_frame_id 0x4d7, start_frame 0x164
[ 1560.054017] xhci_hcd 0000:30:00.3: Port change event, 4-4, id 8, portsc:
0xe0202a0
[ 1560.054025] xhci_hcd 0000:30:00.3: handle_port_status: starting usb4 port
polling.
[ 1560.256853] xhci_hcd 0000:30:00.3: Set root hub portnum to 8
[ 1560.256857] xhci_hcd 0000:30:00.3: Set fake root hub portnum to 4
[ 1560.256861] xhci_hcd 0000:30:00.3: udev->tt =3D 0000000000000000
[ 1560.256865] xhci_hcd 0000:30:00.3: udev->ttport =3D 0x0
[ 1560.256871] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1560.264980] usb 4-4: Device not responding to setup address.
[ 1560.265022] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1560.265045] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1560.265079] xhci_hcd 0000:30:00.3: Slot 7 output ctx =3D 0x0x00000000fff=
26000
(dma)
[ 1560.265085] xhci_hcd 0000:30:00.3: Slot 7 input ctx =3D 0x0x00000000fff1=
7000
(dma)
[ 1560.265091] xhci_hcd 0000:30:00.3: Set slot id 7 dcbaa entry
00000000dcd62c49 to 0xfff26000
[ 1560.473834] usb 4-4: device not accepting address 25, error -71
[ 1560.473846] xhci_hcd 0000:30:00.3: Set port 4-4 link state, portsc:
0xe021203, write 0xe011261
[ 1560.481893] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1560.481911] xhci_hcd 0000:30:00.3: Bad real port.
[ 1560.481918] usb usb4-port4: attempt power cycle
[ 1560.481924] xhci_hcd 0000:30:00.3: set port power 4-4 OFF, portsc: 0xe02=
1263
[ 1560.688829] xhci_hcd 0000:30:00.3: set port power 4-4 ON, portsc: 0xe020=
080
[ 1560.792813] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1560.792835] xhci_hcd 0000:30:00.3: Slot 7 output ctx =3D 0x0x00000000fff=
26000
(dma)
[ 1560.792841] xhci_hcd 0000:30:00.3: Slot 7 input ctx =3D 0x0x00000000fff1=
7000
(dma)
[ 1560.792849] xhci_hcd 0000:30:00.3: Set slot id 7 dcbaa entry
00000000dcd62c49 to 0xfff26000
[ 1560.792888] xhci_hcd 0000:30:00.3: Get port status 4-4 read: 0xe0202a0,
return 0x102a0
[ 1560.792912] xhci_hcd 0000:30:00.3: set port reset, actual port 4-4 statu=
s  =3D
0xe0202b0
[ 1560.854820] xhci_hcd 0000:30:00.3: Get port status 4-4 read: 0xe2a02a0,
return 0x3102a0
[ 1560.854839] usb usb4-port4: not reset yet, waiting 60ms
[ 1560.916802] xhci_hcd 0000:30:00.3: Get port status 4-4 read: 0xe2a02a0,
return 0x3102a0
[ 1560.916831] usb usb4-port4: not reset yet, waiting 200ms
[ 1561.120792] xhci_hcd 0000:30:00.3: Get port status 4-4 read: 0xe2a02a0,
return 0x3102a0
[ 1561.120840] usb usb4-port4: not reset yet, waiting 200ms
[ 1561.328770] xhci_hcd 0000:30:00.3: Get port status 4-4 read: 0xe2a02a0,
return 0x3102a0
[ 1561.328790] usb usb4-port4: not reset yet, waiting 200ms
[ 1561.536760] xhci_hcd 0000:30:00.3: Get port status 4-4 read: 0xe2a1203,
return 0x310203
[ 1561.536780] xhci_hcd 0000:30:00.3: clear port4 reset change, portsc:
0xe0a1203
[ 1561.536794] xhci_hcd 0000:30:00.3: clear port4 warm(BH) reset change,
portsc: 0xe021203
[ 1561.536810] xhci_hcd 0000:30:00.3: clear port4 link state change, portsc:
0xe021203
[ 1561.536824] xhci_hcd 0000:30:00.3: clear port4 connect change, portsc:
0xe001203
[ 1561.536837] xhci_hcd 0000:30:00.3: Get port status 4-4 read: 0xe001203,
return 0x203
[ 1561.588756] xhci_hcd 0000:30:00.3: Set root hub portnum to 8
[ 1561.588762] xhci_hcd 0000:30:00.3: Set fake root hub portnum to 4
[ 1561.588766] xhci_hcd 0000:30:00.3: udev->tt =3D 0000000000000000
[ 1561.588770] xhci_hcd 0000:30:00.3: udev->ttport =3D 0x0
[ 1561.588776] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1561.589112] xhci_hcd 0000:30:00.3: xhci_get_isoc_frame_id: index 0, reg
0x3ac3 start_frame_id 0x759, end_frame_id 0x2d7, start_frame 0x764
[ 1561.589376] xhci_hcd 0000:30:00.3: Successful setup address command
[ 1561.589383] xhci_hcd 0000:30:00.3: Op regs DCBAA ptr =3D 0x000000fffff000
[ 1561.589387] xhci_hcd 0000:30:00.3: Slot ID 7 dcbaa entry @00000000dcd62c=
49 =3D
0x000000fff26000
[ 1561.589393] xhci_hcd 0000:30:00.3: Output Context DMA address =3D 0xfff2=
6000
[ 1561.589397] xhci_hcd 0000:30:00.3: Internal device address =3D 7
[ 1561.589404] usb 4-4: new SuperSpeed USB device number 26 using xhci_hcd
[ 1561.784721] xhci_hcd 0000:30:00.3: xhci_hub_status_data: stopping usb4 p=
ort
polling
[ 1561.811955] usb 4-4: LPM exit latency is zeroed, disabling LPM.
[ 1561.857239] usb 4-4: skipped 1 descriptor after configuration
[ 1561.857246] usb 4-4: skipped 5 descriptors after interface
[ 1561.857253] usb 4-4: skipped 2 descriptors after endpoint
[ 1561.857259] usb 4-4: skipped 42 descriptors after interface
[ 1561.857265] usb 4-4: skipped 2 descriptors after endpoint
[ 1561.857270] usb 4-4: skipped 5 descriptors after interface
[ 1561.857275] usb 4-4: skipped 2 descriptors after interface
[ 1561.857281] usb 4-4: skipped 2 descriptors after endpoint
[ 1561.870967] xhci_hcd 0000:30:00.3: Waiting for status stage event
[ 1561.871029] usb 4-4: default language 0x0409
[ 1561.910158] usb 4-4: udev 26, busnum 4, minor =3D 409
[ 1561.910165] usb 4-4: New USB device found, idVendor=3D07ca, idProduct=3D=
2553,
bcdDevice=3D 1.00
[ 1561.910172] usb 4-4: New USB device strings: Mfr=3D6, Product=3D7,
SerialNumber=3D3
[ 1561.910177] usb 4-4: Product: Live Gamer Ultra 2.1
[ 1561.910183] usb 4-4: Manufacturer: AVerMedia
[ 1561.910188] usb 4-4: SerialNumber: 5204140800332
[ 1561.910426] usb 4-4: usb_probe_device
[ 1561.910432] usb 4-4: configuration #1 chosen from 1 choice
[ 1561.910446] xhci_hcd 0000:30:00.3: add ep 0x85, slot id 7, new drop flag=
s =3D
0x0, new add flags =3D 0x800
[ 1561.910456] xhci_hcd 0000:30:00.3: add ep 0x82, slot id 7, new drop flag=
s =3D
0x0, new add flags =3D 0x820
[ 1561.910463] xhci_hcd 0000:30:00.3: xhci_check_bandwidth called for udev
0000000005f01f8b
[ 1561.910472] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1561.911116] xhci_hcd 0000:30:00.3: xhci_get_isoc_frame_id: index 0, reg
0x4d3=20
[ 1561.916735] xhci_hcd 0000:30:00.3: Successful Endpoint Configure command
[ 1561.916772] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1561.916784] xhci_hcd 0000:30:00.3: Stopped on No-op or Link TRB for slot=
 7
ep 10
[ 1561.916795] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1561.932735] xhci_hcd 0000:30:00.3: // Ding dong!
[ 1561.932764] xhci_hcd 0000:30:00.3: Stopped on No-op or Link TRB for slot=
 7
ep 4
[ 1561.932772] xhci_hcd 0000:30:00.3: // Ding dong!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

