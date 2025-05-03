Return-Path: <linux-usb+bounces-23660-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC73EAA8094
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 14:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EC7C1B661A1
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 12:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6621F1518;
	Sat,  3 May 2025 12:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2e8w9gm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4671282F0
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 12:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746274158; cv=none; b=PSgKVjRa0pRkOE7lCEbl7f5vgXzp07Uzye+UDUz4un2xNTTt3YXHA7HZcKxGYHSPAMvCLGcAaiUQqUTIIKBNnrKe0L8Fmi0nGEFoKd72iFAO5a/vfj19Oe02QbujdMIajX48c81DxkPNajMzmMaKc/djZSHPr89qRK8r+ev40Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746274158; c=relaxed/simple;
	bh=aTvtDn9/A7VzZL5LDr8ykciMMti4s48VCSO/Jhre8sk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oYblqdTv4Soup72DtBE6Ix7TnpG3bwqTJvPCy8nhZ2XphW/Vsvep2G2Ttd0+IN93sia4k4zIJ1cLLwmykRz4n18oAj01t73TRPUHHtNIVomY6EXAN0RSWBFKSLep2SgenExcJJ66G+RZTqYRpDOXC1sCLQ9MfjxfVHlPe4zrffE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2e8w9gm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B145C4CEE3
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 12:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746274157;
	bh=aTvtDn9/A7VzZL5LDr8ykciMMti4s48VCSO/Jhre8sk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Q2e8w9gmjl586lBGZqv13X+tt31AQ2rWabsXXQOTzgqq4QOuZYjrX+cq+SXk41VFf
	 f3DBX5n/X2mgb+hUC/S5hkueG4/n0dxV5WfZbLNvUjd269dA4x9A4iFThmv76t+Rvl
	 IJhxinHz67PB8CsDOvMTWHqNFD+gKXcQHmiGzWLymDDOZYjVeXS5XMYtQVLYUOLMj2
	 PBcAT+h5oFfbtV2hVFooEUFFdcQy4EZb40nX0QmkOfnNkuxIYLlAqKphzSatW1j93d
	 E3/qd7YlDHUy9pORdNymbhTm6KZkLOBKNagCr+6GIJ73ixm3nv7Y1wVL15QhHxOUzU
	 x7fYVvHLte7KA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1AA0EC41614; Sat,  3 May 2025 12:09:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sat, 03 May 2025 12:09:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-8v8k92E7Hp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #25 from Claudio Wunder (cwunder@gnome.org) ---
Some extra info:

- This time the computer was on idle when it happened, like I wasn't even c=
lose
to the PC but noticed something odd happened, hence checked and saw it was =
dead
- Running usbreset of the controller and `yavta` on a loop for about one ho=
ur
did not occur on any USB crash; So I doubt it is something related to heavy
workloads on the controller.
- Afaik the ASM107x device is disabled on EFI;

Regarding the different slots, I'm not sure if the devices order/attachment=
 can
change on unbind/bind (I believe so) or just on a new boot, but here's the
output of lspci and lsusb from the current boot (same as the crash)

```
=E2=9D=AF lspci -nn | grep USB
03:00.2 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD/ATI] Navi =
31
USB [1002:7446]
0f:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 NHI [Maple R=
idge
4C 2020] [8086:1137]
3b:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 USB Controll=
er
[Maple Ridge 4C 2020] [8086:1138]
68:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset USB 3.2 Controller [1022:43f7] (rev 01)
6a:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset USB 3.2 Controller [1022:43f7] (rev 01)
6c:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI [1022:15b6]
6c:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI [1022:15b7]
6d:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
=E2=9D=AF lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 002: ID 19f7:0050 RODE Microphones RODECaster Duo
Bus 005 Device 003: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 005 Device 004: ID 0b05:1a53 ASUSTek Computer, Inc. USB Audio
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 004: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed=
 hub
Bus 007 Device 006: ID 1e71:300e NZXT NZXT Kraken Base
Bus 007 Device 009: ID 046d:c54d Logitech, Inc. USB Receiver
Bus 007 Device 011: ID 0b05:18f3 ASUSTek Computer, Inc. AURA LED Controller
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 008 Device 004: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed=
 hub
Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 010 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 011 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 012 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 013 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 014 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
```

Also one extra info, I have an `udev` rule to prevent USB devices to wake u=
p my
PC from sleep. I doubt it has anything to do with it, but worth sharing:

```
=E2=9D=AF bat /etc/udev/rules.d/99-usb-wakeup.rules
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80
       =E2=94=82 File: /etc/udev/rules.d/99-usb-wakeup.rules
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80
   1   =E2=94=82 ACTION=3D=3D"add", SUBSYSTEM=3D=3D"usb", RUN+=3D"/bin/sh -=
c 'echo di
       =E2=94=82 sabled > /sys/bus/usb/devices/%k/power/wakeup'"
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80
```

(Note the issue was happening even before this rule existed afaik)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

