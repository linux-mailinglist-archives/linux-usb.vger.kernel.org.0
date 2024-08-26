Return-Path: <linux-usb+bounces-14131-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C2795F965
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 21:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D8D761F22C98
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 19:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1A441991A9;
	Mon, 26 Aug 2024 19:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLJdiifS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4EC135A79
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 19:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724699182; cv=none; b=pwcBqdrYwWXYkrMHjqrfl99pAEXf6Y3Im9dv24ovirJEGPAPbThOQJf/g3RHSChuxvZ1K4Jt9kqHE1waT7Qi42tvrqew2HR30LIav6WCt/UXVWoGcUSNa//3FAe679as25zmJmJcuwMQ8D7S7YDGGOkI8O7JEiSeraVSaqdEMeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724699182; c=relaxed/simple;
	bh=SLiyfUo+Nhd+WEFclt+EMcaybeXDLMIEnsc9Hq+m8nA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SCVPd6h7AJebs5GLmssTfkEiTsAtD4/XV1RHKj/vnhP1ua/ikej+YDudEPcoLQiqdKjcRB3MIo4ofEWmaAX1uCBkxYb3dSmYzF2lyI4/fiiJ8okCIc/30aOeuP8DIu496feAQ2dB9fkTOKImXIP6+j0tYG05s5cBzqpDJzNejgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLJdiifS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6A43C8B7B6
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 19:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724699181;
	bh=SLiyfUo+Nhd+WEFclt+EMcaybeXDLMIEnsc9Hq+m8nA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=PLJdiifS71GhQkNtC0PlP2YrIUje1cXuy0AcZCrXSqoJOUWQ+orMEcDbFg+joL6db
	 0+QXETasMLaCSnBTw0A7tWFn4EBl+z8DqIc2d8TN43Nf1Aa0rjOKKCRRDhAfU1JdPQ
	 dt9MgQEdBZbhrGljnu68Rh81LX178VwVfQTBIg3iO0BHYmLh8QQcVfrGDv/bCcrine
	 UPa0cUEmE9lm5qX6W8VLmkYp7pjduMQJbCUBAFwv/rIi+pmyJhlRucgnuNW718UwMn
	 yseALw9NgBlfQaO4KSBw1khVJaALtts0x9RIuOnBY2A7BE6HMcmFzq+T7R1HB92vRK
	 mRNYIzaf3RmmA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9FBD9C53B73; Mon, 26 Aug 2024 19:06:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Mon, 26 Aug 2024 19:06:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adamw@happyassassin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219198-208809-Xqt7T0vzMZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

Adam Williamson (adamw@happyassassin.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |adamw@happyassassin.net

--- Comment #5 from Adam Williamson (adamw@happyassassin.net) ---
I'm seeing something similar, and powertop doesn't seem to be involved.

I also have a Dell laptop - an XPS 13 9315. It's connected to a CalDigit TS=
3+
Thunderbolt docking station. Connected to the CalDigit are a 4K monitor
(connected by USB-C), Ethernet, a USB webcam, USB headset, and a USB keyboa=
rd.
The laptop has an internal keyboard and trackpad, of course. And I have a
Bluetooth external mouse.

When I boot kernel 6.9.12 or 6.10.6, all of these work fine more or less
immediately after boot, every time.

When I boot kernel 6.11 (tried rc3, rc4 and rc5) this is what happens:

* At the point where I have to enter the passphrase to decrypt my storage, =
the
USB keyboard always works.
* When I reach the login screen - whether GDM or just a tty, I tested boot =
to
multi-user.target and it's the same - nothing works for quite some time. Af=
ter
about 20 seconds, the laptop's internal keyboard and trackpad, and the
Bluetooth mouse, start working. But the USB external keyboard never starts
working. (I'm not sure of the status of the webcam and headset, I didn't
check).

I have powertop and power-profiles-daemon installed, but I tried removing b=
oth
and doing a test boot of 6.11rc5, and the symptoms were exactly the same,
nothing changed.

I'll attach the journal from an affected 6.11rc5 boot and from a working 6.=
10
boot. Something I notice is that early in boot we see:

Aug 26 11:47:03 xps13a.happyassassin.net kernel: hid-generic
0003:154A:0002.0002: input,hidraw1: USB HID v1.00 Keyboard [ID Innovations =
Inc.
Input Device] on usb-0000:56:00.0-2/input0

but then later, we see:

Aug 26 11:47:44 xps13a.happyassassin.net kernel: xhci_hcd 0000:57:00.0: Abo=
rt
failed to stop command ring: -110
Aug 26 11:47:44 xps13a.happyassassin.net kernel: xhci_hcd 0000:57:00.0: xHCI
host controller not responding, assume dead
Aug 26 11:47:44 xps13a.happyassassin.net kernel: xhci_hcd 0000:57:00.0: HC
died; cleaning up
Aug 26 11:47:44 xps13a.happyassassin.net kernel: xhci_hcd 0000:57:00.0: Err=
or
while assigning device slot ID: Command Aborted
Aug 26 11:47:44 xps13a.happyassassin.net kernel: xhci_hcd 0000:57:00.0: Max
number of devices this xHCI host supports is 64.
Aug 26 11:47:44 xps13a.happyassassin.net kernel: usb usb9-port1: couldn't
allocate usb_device
Aug 26 11:47:44 xps13a.happyassassin.net systemd[1]:
NetworkManager-dispatcher.service: Deactivated successfully.
Aug 26 11:47:44 xps13a.happyassassin.net audit[1]: SERVICE_STOP pid=3D1 uid=
=3D0
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3DNetworkManager-dispatcher comm=3D"systemd"
exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? terminal=3D? res=3Ds=
uccess'
Aug 26 11:47:50 xps13a.happyassassin.net kernel: Bluetooth: hci0: Opcode 0x=
200e
failed: -110
Aug 26 11:48:00 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: Abo=
rt
failed to stop command ring: -110
Aug 26 11:48:00 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: xHCI
host controller not responding, assume dead
Aug 26 11:48:00 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: HC
died; cleaning up
Aug 26 11:48:00 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: Err=
or
while assigning device slot ID: Command Aborted
Aug 26 11:48:00 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: Max
number of devices this xHCI host supports is 32.
Aug 26 11:48:00 xps13a.happyassassin.net kernel: usb usb7-port2: couldn't
allocate usb_device
Aug 26 11:48:00 xps13a.happyassassin.net kernel: usb usb8-port4: couldn't
allocate usb_device

and after that, we never see "USB HID v1.00 Keyboard" appear again. In
contrast, in the 6.10 logs, we see "USB HID v1.00 Keyboard" appear twice, a=
nd
we never see any "couldn't allocate usb_device" or "Abort failed to stop
command ring" errors.

I *think* the 're-enumeration' that seems to be happening here (which seems=
 to
work fine on 6.10, but lead to problems on 6.11) is a result of
thunderbolt.service starting up.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

