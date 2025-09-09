Return-Path: <linux-usb+bounces-27833-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72EC5B508DD
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 00:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E2DE4E7E9E
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 22:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98FC726D4C3;
	Tue,  9 Sep 2025 22:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFY0rBtt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219792571A5
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 22:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757456759; cv=none; b=NPsVmDfctJImEX2jnGR2RKwNY1RTEoL9BInmse1k6A4p8Ab08syDuEoGVe6itJePBi5qriQkJEyt6qDNT1eujKLWOGNKR0vAmLPMnvl6ucPbzOi3mW5kBOYV8sfsKDjqdp+SQjYCHayAAI1Oqqm/Q8W07ROVhoFlixttDJAoW2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757456759; c=relaxed/simple;
	bh=MBONf201380PGhlpdSePFnk21F67tkR/cvdY2Cx4IDg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=urNbQkS+xhNsS/1u0cc3pS6V7WGlmW4+PDFgvbPcp5B3SKZ9Eqpns6LR7W2tU27F5AVqzFnJ7tHUUb02xco0lEwKkR92BNgYADrBFDjVKSKNEOJv76pbjmo+C2iifVJ8ACwQ9Ud7zqdCLC+vnF5U/UA2c/OzMRhHOdFNKEVpIio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFY0rBtt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC591C4CEF4
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 22:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757456758;
	bh=MBONf201380PGhlpdSePFnk21F67tkR/cvdY2Cx4IDg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YFY0rBttXlkIvsYJCyuTKzZcEfH18P3IadUlXJiGokpwj573GudNnR3kqkTLQmoSz
	 3+bWoH9IdfzEoJkpfcjN2FY7NGlg3TBd7YMC6zrmpfB67DxoedgbXYJJw7F0XRkHdA
	 DWhbhSZxnZYKSaLbCVz+vRBswu9yyVAi4iIM2fJcaCjXobgRZJR8AfEXyZhEYDw3E3
	 uaLpsy//fUYGp2XhSUYx0xfWQrUQy7Jea2xYTJsML7AQhFBrt6fVRXBUzDAwjsDW/j
	 vpwIzyL+jNRppma5Vz7KreVYMZoSREaJbhi4sajUHUiW6OJaShFBfFtAjMo8Q4VFEF
	 db70QH8qrA0rg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2DBFC4160E; Tue,  9 Sep 2025 22:25:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 09 Sep 2025 22:25:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-tqtW83BEoO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #54 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
I'm not sure if the kdb stall is helpful, or if it just adds one more moving
part to this whole issue, possibly even causing usb link issues.
The USB SD device, and xHCI controller are probably still running, expecting
cpu/device drivers to handle certain things in time.

Anyways, your dmesg does reveal another issue in recovering links in
ss.inactive error state. port_event() in hub.c ends up resetting just the p=
ort,
even if a usb device is present and the whole device should be reset. After=
 a
successful reset port_event() calls  hub_port_connect_change(..., portstatu=
s,
portchange) with old, stale, pre-reset portstatus value.=20=20=20

Details:
Link goes to ss.Inactive error state "0x2c0", this is common on disconnect
before link goes to rx.detect. Driver gives it some time before reset:

[62691.183508] xhci_hcd 0000:00:14.0: Transfer error for slot 6 ep 3 on
endpoint
[62691.204674] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2c0, retu=
rn
0x2c0
[62691.204720] usb usb3-port4: Wait for inactive link disconnect detect
[62691.228672] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2c0, retu=
rn
0x2c0
[62691.228722] usb usb3-port4: Wait for inactive link disconnect detect
[62691.252648] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2c0, retu=
rn
0x2c0
[62691.252692] usb usb3-port4: Wait for inactive link disconnect detect
[62691.276646] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2c0, retu=
rn
0x2c0
[62691.276695] usb usb3-port4: Wait for inactive link disconnect detect
[62691.300652] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2c0, retu=
rn
0x2c0
[62691.300697] usb usb3-port4: Wait for inactive link disconnect detect

Here we only reset the port when we should reset the whole device.
Looks like this is because USB3 portstatus doesn't show "connected" when li=
nk
is in ss.Inactive error, and the following check in hub.c port_event() is t=
rue:

else if (!udev || !(portstatus & USB_PORT_STAT_CONNECTION)
                                || udev->state =3D=3D USB_STATE_NOTATTACHED=
) {


[62691.300704] usb usb3-port4: do warm reset, port only
[62691.316596] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 p=
ort
polling
[62691.356676] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2d0, retu=
rn
0x2d0
[62691.356722] usb usb3-port4: not warm reset yet, waiting 50ms
[62691.408710] xhci_hcd 0000:00:14.0: Port change event, 3-4, id 15, portsc:
0x2a1203
[62691.408729] xhci_hcd 0000:00:14.0: handle_port_status: starting usb3 port
polling.
[62691.412657] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x2a1203,
return 0x310203
[62691.412787] usb usb3-port4: Connection change during reset, retrying
[62691.412812] xhci_hcd 0000:00:14.0: clear port4 connect change, portsc:
0x281203
[62691.412832] hub 3-0:1.0: port_wait_reset: err =3D -11
[62691.412837] usb usb3-port4: not enabled, trying warm reset again...
[62691.616651] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x281203,
return 0x300203
[62691.616709] xhci_hcd 0000:00:14.0: clear port4 reset change, portsc: 0x8=
1203
[62691.616732] xhci_hcd 0000:00:14.0: clear port4 warm(BH) reset change,
portsc: 0x1203
[62691.616752] xhci_hcd 0000:00:14.0: clear port4 link state change, portsc:
0x1203
[62691.616768] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x1203, ret=
urn
0x203

port is now properly reset and ready in enabled u0 "0x1203" state. hub driv=
er
does however call  hub_port_connect_change() with stale portstatus value st=
ill
showing link in ss.Inactive "0x2c0":

[62691.672631] usb usb3-port4: status 02c0, change 0041, 5.0 Gb/s
[62741.591943] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 p=
ort
polling
[62741.593180] usb 3-4: USB disconnect, device number 3

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

