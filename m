Return-Path: <linux-usb+bounces-23652-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC5FAA75DB
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 17:19:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D66A81734CD
	for <lists+linux-usb@lfdr.de>; Fri,  2 May 2025 15:19:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADDC7256C9C;
	Fri,  2 May 2025 15:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XegybdxE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356692DC77E
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 15:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746199191; cv=none; b=tIh5zWtdS7inXC8px11+li9E6EVuZa3W2nTL6bYju/IkdN7JQHipTr7Pz0EnYgAhGIJszJ7FX9lGMRMjvgVtfUl4k76P78yn2UxozUWt9pbFSZxxrpee0mVRQeAtU9EdleYon7tD0ZEL9JLhJX7531rQMqtDizfOsGre+XmmVz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746199191; c=relaxed/simple;
	bh=02ZRJmEGsozvKEN5WMCphlGUNESZYi5TAxij8nIFfqs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EOgWRydPZ0Decps65p2/IL7jcIzoTqnWNkU82mdje9hWA49B1EJGjD1udQds0Hl45tSCYmnyha889vSN3aeyP99TVwA6gxvas9DV9ftAOSWPS8bxkOvmvBVNhQey8B1ol2VDqT5os+cqKkU9WSf1JwgHc6XGYsoOBdWK7mLVcJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XegybdxE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADE41C4CEEE
	for <linux-usb@vger.kernel.org>; Fri,  2 May 2025 15:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746199190;
	bh=02ZRJmEGsozvKEN5WMCphlGUNESZYi5TAxij8nIFfqs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XegybdxE80Sh+ooNzjRiTA9fuJ5sGdoh2Nnag5Vot6/wfTUWJAD3iaDAUbQXVixcF
	 OmWcPYzY0loRoKk7/Pa42DMPFwYEqomHo2SM3+062mayKiWXIOUHJ/niGlF29upx/7
	 t0CNOsYLlHXnWqj2n21qlMyNrFlhyqBorzEGu6NMKdbJFg1vFe0Hr0nhKu1+FJ3kQG
	 UWLGiCm5hOyAKuW2juWrHe+6epHphqasvfQDaxVHpZwnXSeYHmSTLkRWKvUsDAXzY5
	 Qm4gusybiad5aRoVCliLxgEt56t6yVWF+LNQ205uZyC8+1pnfXCLDJkz3QR0Ui2+n7
	 ADOaVqGRdkQZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A14D7C433E1; Fri,  2 May 2025 15:19:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Fri, 02 May 2025 15:19:50 +0000
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
Message-ID: <bug-220027-208809-EfkGQ8lm56@https.bugzilla.kernel.org/>
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

--- Comment #8 from Niko (nrkowalski@gmail.com) ---
That fixed it!!=20

Though only when using the USB3.2 ports.

[  251.355286] usb 2-1.2: new SuperSpeed Plus Gen 2x1 USB device number 3 u=
sing
xhci_hcd
[  251.410801] usb 2-1.2: new device idVendor 0fd9 idProduct 009b ( I adjus=
ted
the format specifier for readability, to always be 2 bytes long ).
[  251.410817] usb 2-1.2: too lazy to get BOS descriptor or descriptor too
short
[  251.610011] usb 2-1.2: New USB device found, idVendor=3D0fd9, idProduct=
=3D009b,
bcdDevice=3D 0.02
[  251.610025] usb 2-1.2: New USB device strings: Mfr=3D6, Product=3D7,
SerialNumber=3D3
[  251.610032] usb 2-1.2: Product: Elgato 4K X
[  251.610037] usb 2-1.2: Manufacturer: Elgato
[  251.610042] usb 2-1.2: SerialNumber: A7SNB504228NRE
[  251.690762] uvcvideo 2-1.2:1.1: Unknown video format
30313050-0000-0010-8000-00aa00389b71
[  251.690788] usb 2-1.2: Found UVC 1.00 device Elgato 4K X (0fd9:009b)
[  251.901185] usb 2-1.2: 3:2: failed to get current value for ch 0 (-22)
[  260.424232] retire_capture_urb: 18 callbacks suppressed


/:  Bus 002.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/2p, 1000=
0M
    |__ Port 001: Dev 002, If 0, Class=3DHub, Driver=3Dhub/2p, 10000M
        |__ Port 002: Dev 003, If 0, Class=3DVideo, Driver=3Duvcvideo, 1000=
0M
        |__ Port 002: Dev 003, If 1, Class=3DVideo, Driver=3Duvcvideo, 1000=
0M
        |__ Port 002: Dev 003, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio,=
 10000M
        |__ Port 002: Dev 003, If 3, Class=3DAudio, Driver=3Dsnd-usb-audio,=
 10000M


When using the USB4 port, the capture card is still only detected as a
SuperSpeed" device. Which must be do to another issue.

[    3.404518] usb 8-1: new SuperSpeed USB device number 2 using xhci_hcd
[    3.461502] usb 8-1: new device idVendor fd9 idProduct 9c
[    3.461514] usb 8-1: too lazy to get BOS descriptor or descriptor too sh=
ort
[    3.537941] usb 8-1: New USB device found, idVendor=3D0fd9, idProduct=3D=
009c,
bcdDevice=3D 0.02
[    3.537948] usb 8-1: New USB device strings: Mfr=3D6, Product=3D7,
SerialNumber=3D3
[    3.537953] usb 8-1: Product: Elgato 4K X
[    3.537956] usb 8-1: Manufacturer: Elgato
[    3.537959] usb 8-1: SerialNumber: A7SNB504228NRE
[    6.175241] usb 8-1: Found UVC 1.00 device Elgato 4K X (0fd9:009c)
[    6.329905] usb 8-1: 3:2: failed to get current value for ch 0 (-22)

/:  Bus 008.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/1p, 1000=
0M
    |__ Port 001: Dev 002, If 0, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 001: Dev 002, If 1, Class=3DVideo, Driver=3Duvcvideo, 5000M
    |__ Port 001: Dev 002, If 2, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M
    |__ Port 001: Dev 002, If 3, Class=3DAudio, Driver=3Dsnd-usb-audio, 500=
0M

Thanks so much for your help!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

