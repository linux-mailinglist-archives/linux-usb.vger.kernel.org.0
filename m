Return-Path: <linux-usb+bounces-23216-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84373A92F05
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 03:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FE5D1B61605
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 01:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF63224F6;
	Fri, 18 Apr 2025 01:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vv3FJ3k/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591818C0E
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 01:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744938444; cv=none; b=DzFX9kHGX4HphfD8vkQ/qZ4a5upEZ36uqgp7Xz09GUemOGRwaC0Pp912OdfEdeofFvH944tX658It5AVKWi8fwLYnfNZTfqlDWHT63tQRR3leOxay+EhWQCPIOuOB9/HXyEHE8Cv/oC3g/OpMEW3990w3gy0mMjaWyhlwtYyeSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744938444; c=relaxed/simple;
	bh=Ib5POp7b8Cxa16HTIuDS9LOBKnbSEObsF/7+cWllJbM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lq6N6bkYOjsZh/IsKsOnSsyjIU/imry2KgPxdnhknpTcuEui1D1Ajp4Qg/MTNngwji50NpalgRXpQHPA4D9LMHjk79nJY4akuL3FruFbwMFVRvfE4H25Z9nuVFavVOQxqFL/rGb9DpDAKyYC4RwJzCb7U0Hz4HKOVnfQQ7rSpTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vv3FJ3k/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3F57C4CEE4
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744938443;
	bh=Ib5POp7b8Cxa16HTIuDS9LOBKnbSEObsF/7+cWllJbM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Vv3FJ3k/x4p3/pmdYYUdySLXBa9ZaegOhFB2ZDYwk/83VpD/8c9Qk9/Gl/tKxE0r8
	 Yr0xa1L0qNZRQbEVY+Fshkat4AnOPkcRq3k8qGfTaGIXvXPEsVITrUTbb8b/jMJ0y0
	 E/aKU9gBByngWoQXUTXuvdbhoyWdN7dILiezXL30MdcorwQ/PG6Y2i2LIY9rSkr/IJ
	 ljwAgt0kuYDk0QKDd4nZhnZpuuf51NfFgTveMBkIQMsICQ9g7c2NIKUYVhrj2+zUY1
	 dlVHYawpNwMc9BpF5lKa/nnJIv0HHv0sbSJglxK8qPe6TBsLZE98rjB1OzLrs7mCag
	 8/CF+zyLT2Zow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC3CCC3279F; Fri, 18 Apr 2025 01:07:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Fri, 18 Apr 2025 01:07:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nrkowalski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220027-208809-kP096dZLj4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #1 from Niko (nrkowalski@gmail.com) ---
I decided to try the 6.14.0-15 Kernel and I'm still having the same issue, =
but
getting some more information from dmesg.

[  847.836967] usb 8-1: new SuperSpeed Plus Gen 2x1 USB device number 3 usi=
ng
xhci_hcd
[  853.084344] usb 8-1: unable to get BOS descriptor or descriptor too short
[  853.110389] usb 8-1: unable to read config index 0 descriptor/start: -71
[  853.110406] usb 8-1: can't read configurations, error -71
[  853.293248] usb 8-1: new SuperSpeed USB device number 4 using xhci_hcd
[  853.372723] usb 8-1: LPM exit latency is zeroed, disabling LPM.
[  853.624234] usb 8-1: New USB device found, idVendor=3D0fd9, idProduct=3D=
009c,
bcdDevice=3D 0.02
[  853.624252] usb 8-1: New USB device strings: Mfr=3D6, Product=3D7,
SerialNumber=3D3
[  853.624259] usb 8-1: Product: Elgato 4K X
[  853.624265] usb 8-1: Manufacturer: Elgato
[  853.624271] usb 8-1: SerialNumber: A7SNB504228NRE
[  853.690719] uvcvideo 8-1:1.1: Unknown video format
30313050-0000-0010-8000-00aa00389b71
[  853.690749] usb 8-1: Found UVC 1.00 device Elgato 4K X (0fd9:009c)
[  853.856379] usb 8-1: 3:2: failed to get current value for ch 0 (-22)
[  854.820221] retire_capture_urb: 15 callbacks suppressed
[  854.836455] usb 8-1: cannot submit urb (err =3D -19)
[  854.837512] usb 8-1: cannot submit urb 0, error -19: no device
[  855.165030] usb 8-1: reset SuperSpeed USB device number 4 using xhci_hcd
[  855.236908] usb 8-1: LPM exit latency is zeroed, disabling LPM.
[  855.322103] uvcvideo 8-1:1.1: Unknown video format
30313050-0000-0010-8000-00aa00389b71
[  855.322126] usb 8-1: Found UVC 1.00 device Elgato 4K X (0fd9:009c)
[  855.407009] usb 8-1: 3:2: failed to get current value for ch 0 (-22)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

