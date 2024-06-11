Return-Path: <linux-usb+bounces-11127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B813F90364E
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 10:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD74F1C245E4
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 08:26:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE41A176AA7;
	Tue, 11 Jun 2024 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dsjkJCsr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C0F17334F
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 08:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718094347; cv=none; b=mclX9/K0/VtCmwaTvJ5RltHiJjz1smVTzvWUkjTDcj/M4SpIqUILZMsZWECaaHx4Lcr/ruWlXvnPDFz6dCU5HncsSlATG63Ld1dNPiahPWBjwxgi+vwQmvbVVWqCAhu8IHcpA69+bzaOe3p2oIzm72Jj1Spl3A72kbHsoMWRb1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718094347; c=relaxed/simple;
	bh=y6TJtzmqpga+xps6gJJWn7uUWzGcaB0/2rCu9gbF4y0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=niuDSKvi15Sz2OpUnVu5xWEcR5qcWYhNlDUH92gFuzmUWb2V7Ppb1vtWvREdW8yupSZ3UncGES9eNyQIQRvmFvyflbCbrpYrOrpI2gfn+yevqiCCVPIhmj4dNZT6ddjukNlTxD2PEJsOhu5ssqBIbjXn35NPG9bSrtp10MEs4+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dsjkJCsr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01DFCC32789
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718094347;
	bh=y6TJtzmqpga+xps6gJJWn7uUWzGcaB0/2rCu9gbF4y0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dsjkJCsronzsigPte66FTJ7Xd7RZ4fGf0rVHEr2SISpFetmfOZKiy07OygZkKP6IQ
	 cRTk7SK2fEXxsjCeMD6wIPbyGsEoRk2fqIu4bGCR1ATZdPx3z7K7bMlYyI0ZYPJlxt
	 6yp7NlcWmBEtHj4CIkWVYiRmBOjwe6UpzTlRHReqgXER/CERQL8mhIEc5QFAx1qrYu
	 OZoPGNEAsLfXZYf43RNIGQWEVEWJbG6dm/8cxyNmUl7JpdOZNiZpl1UNhzixtO0hx8
	 4Znde9tYi3WPqWuGTqqMFCM9k3gqN2UfbuzQ0Q5RCgjjGNSAzDDxQ1t0B0hIVAPGkm
	 GUvni6cc8Uqzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7879C53B50; Tue, 11 Jun 2024 08:25:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Tue, 11 Jun 2024 08:25:46 +0000
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
Message-ID: <bug-218943-208809-6xgs672C03@https.bugzilla.kernel.org/>
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

--- Comment #12 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Your device was initially detected and trainer as a 10Gpps SSP device in Li=
nux

There were some issues reading descriptors from the device, and giving it an
address, so port was power cycled.
After this the device was enumerated as a SS 5Gbps device.

There are probably some small differences in how Windows and Linux do device
enumeration that cause this.

[  363.960026] usb 4-4: new SuperSpeed Plus Gen 2x1 USB device number 4 usi=
ng
xhci_hcd
[  369.344592] usb 4-4: unable to get BOS descriptor or descriptor too short
[  369.370574] usb 4-4: unable to read config index 0 descriptor/start: -71
[  369.370586] usb 4-4: can't read configurations, error -71
...
[  370.325161] usb 4-4: Device not responding to setup address.
[  370.537171] usb 4-4: Device not responding to setup address.
[  370.744627] usb 4-4: device not accepting address 5, error -71
[  370.753259] usb usb4-port4: attempt power cycle
[  371.861790] usb 4-4: new SuperSpeed USB device number 6 using xhci_hcd
[  372.067721] usb 4-4: LPM exit latency is zeroed, disabling LPM.
[  372.157551] usb 4-4: New USB device found, idVendor=3D07ca, idProduct=3D=
2553,
bcdDevice=3D 1.00
[  372.157560] usb 4-4: New USB device strings: Mfr=3D6, Product=3D7,
SerialNumber=3D3
[  372.157564] usb 4-4: Product: Live Gamer Ultra 2.1


Logs with dynamic debug enabled for usb core and xhci host could possibly s=
how
more info

<boot>
mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
<connect device>
<send dmesg>

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

