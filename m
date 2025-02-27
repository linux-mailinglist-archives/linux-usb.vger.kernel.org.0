Return-Path: <linux-usb+bounces-21175-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC34A48ABB
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 22:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15B1C16B184
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 21:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A81F27128C;
	Thu, 27 Feb 2025 21:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cBdxJtgH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46C427127A
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 21:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740692661; cv=none; b=tu9vj3Z2eYwiz/udj7LGYU9qRko3aoYqzILcPqqtmLQq5gwCCOA2dn1VV2iltjaHAwrQNPyvCd17AnB7vINp5pSdVgPiiV2PcOt3LgBJMU6SnQCQXuAj4FpcWPnu6oRzAaqLwP2W66PocU5L4XpwOWNYz6tQqd+ixSGAwBxMGEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740692661; c=relaxed/simple;
	bh=zhary5ZcaWw3wa6GpcmY+2q6nb98UXLVXCIn9OpXRU8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NyDVbLMr8We5BhV4+UzmfeTrAF4Z2U2a8acdqDFrs6dSJ/xUKOMkhoTK8zGL0FKIwuepKr/uUY6/Ni/fLa2KHYk+QnBu7ImckA5tXIaZNBUVhyZ/PSJU515x1Ts2oG0912oC8/UZrKwQpEfFUXneBLlcL/UGtwFXxG3Hlvs8nrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cBdxJtgH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F3C3C4CEE7
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 21:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740692660;
	bh=zhary5ZcaWw3wa6GpcmY+2q6nb98UXLVXCIn9OpXRU8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cBdxJtgHVAZOjndkOR+q9RBF75qGmqY5g9pcW/GQsQfdcw6mHlf2KGPzAKYAMJQpB
	 agzxBUZGLZ05/Qa5SfgO9qLkTSKIjUochtQrcjv4E2oDhoGMOKofzqe2nMDU5rqB97
	 E63NLUkE3K/jqAT/6iWn3dkHU8GjkIbB8qNJpZPOMFR9akyiSCA3Q5p81zhtzlDEvt
	 q+to0p25/DGkyb10lyFt9vBr8qFpt1RUkr+qJQ0HnIInjv4hTrEyMfTHkrrSGRsnJ5
	 jrs91h11B7xeNMz7q8u6dTDv0JILwJPt8ZmqcHE3ZP5xgl5LR22H/LCmgJ3RTuuDFv
	 6x88LQmqgP0zw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 230F1C53BC5; Thu, 27 Feb 2025 21:44:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218695] Datadump for error `ERROR Transfer event TRB DMA ptr
 not part of current TD ep_index 1 comp_code 1`
Date: Thu, 27 Feb 2025 21:44:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218695-208809-5u31g9WhDl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218695-208809@https.bugzilla.kernel.org/>
References: <bug-218695-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218695

--- Comment #4 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Today, this also happened disconnecting a Logitech Logitech G430 Gaming
Headset.

```
Feb 27 09:08:49 abreu kernel: Linux version 6.14.0-rc4-00052-gac9c34d1e45a
(build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-17) 14.2.0, GNU =
ld
(GNU Binutils for Debian) 2.44) #93 SMP PREEMPT_DYNAMIC Wed Feb 26 08:31:56=
 CET
2025
Feb 27 09:08:49 abreu kernel: Command line:
BOOT_IMAGE=3D/vmlinuz-6.14.0-rc4-00052-gac9c34d1e45a
root=3DUUID=3D32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=3Dnoaer
mem_sleep_default=3Ddeep log_buf_len=3D8M cryptomgr.notests
[=E2=80=A6]
Feb 27 09:08:49 abreu kernel: DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0
06/02/2022
[=E2=80=A6]
Feb 27 11:40:59 abreu kernel: usb 1-2: USB disconnect, device number 6
Feb 27 11:41:15 abreu kernel: usb 1-2: new full-speed USB device number 7 u=
sing
xhci_hcd
Feb 27 11:41:15 abreu kernel: usb 1-2: New USB device found, idVendor=3D046=
d,
idProduct=3D0a4d, bcdDevice=3D 1.19
Feb 27 11:41:16 abreu kernel: usb 1-2: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D0
Feb 27 11:41:16 abreu kernel: usb 1-2: Product: Logitech G430 Gaming Headset
Feb 27 11:41:16 abreu kernel: usb 1-2: Manufacturer: Logitech
Feb 27 11:41:16 abreu kernel: input: Logitech Logitech G430 Gaming Headset =
as
/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.3/0003:046D:0A4D.0005/input=
/input45
Feb 27 11:41:16 abreu kernel: hid-generic 0003:046D:0A4D.0005: input,hidraw=
2:
USB HID v1.00 Device [Logitech Logitech G430 Gaming Headset] on
usb-0000:00:14.0-2/input3
Feb 27 12:11:13 abreu kernel: uvcvideo 1-5:1.1: Failed to resubmit video URB
(-1).
Feb 27 12:18:07 abreu kernel: usb 1-2: USB disconnect, device number 7
Feb 27 12:18:07 abreu kernel: xhci_hcd 0000:00:14.0: ERROR Transfer event T=
RB
DMA ptr not part of current TD ep_index 1 comp_code 1
Feb 27 12:18:07 abreu kernel: xhci_hcd 0000:00:14.0: Looking for event-dma
00000003fd5a5710 trb-start 00000003fd5a5720 trb-end 00000003fd5a5720 seg-st=
art
00000003fd5a5000 seg-end 00000003fd5a5ff0
Feb 27 12:18:13 abreu kernel: usb 1-2: new full-speed USB device number 8 u=
sing
xhci_hcd
Feb 27 12:18:13 abreu kernel: usb 1-2: New USB device found, idVendor=3D046=
d,
idProduct=3D0a4d, bcdDevice=3D 1.19
Feb 27 12:18:13 abreu kernel: usb 1-2: New USB device strings: Mfr=3D1,
Product=3D2, SerialNumber=3D0
Feb 27 12:18:13 abreu kernel: usb 1-2: Product: Logitech G430 Gaming Headset
Feb 27 12:18:13 abreu kernel: usb 1-2: Manufacturer: Logitech
Feb 27 12:18:13 abreu kernel: input: Logitech Logitech G430 Gaming Headset =
as
/devices/pci0000:00/0000:00:14.0/usb1/1-2/1-2:1.3/0003:046D:0A4D.0006/input=
/input46
Feb 27 12:18:13 abreu kernel: hid-generic 0003:046D:0A4D.0006: input,hidraw=
2:
USB HID v1.00 Device [Logitech Logitech G430 Gaming Headset] on
usb-0000:00:14.0-2/input3
Feb 27 12:42:09 abreu kernel: usb 1-2: USB disconnect, device number 8
Feb 27 12:48:29 abreu kernel: r8152 4-1.1.3:1.0 enx00e04cf4ead4: carrier off
Feb 27 12:48:29 abreu kernel: PM: suspend entry (deep)
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

