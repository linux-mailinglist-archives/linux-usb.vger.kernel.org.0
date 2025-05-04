Return-Path: <linux-usb+bounces-23679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BACF7AA86A5
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 16:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13CD93BA2FB
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 14:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAE7189BB5;
	Sun,  4 May 2025 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+LOBeYm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CCC5BAF0
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 14:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746368273; cv=none; b=EBoIEbQNnYNcDAJ0XotPxg5VkjB1uHeWjNEI9lEBnDUzEIqyWBossf36kPO4fPI3reqqP1dufER+CZppm9VYrIfKiFgLFrR/JFfCglR4L7q3gCttXvaYBeC3bcRBUArDfGTTgxKDCq1PkaiSQHZH6U7tr1p5dsQq6mHouDkg7o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746368273; c=relaxed/simple;
	bh=cFlHX8D5fko1yj0El2FrDQnQIranVdcTARft3JNTXNU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cAGadaaSFMxCIeXc3wJeBE6WKW8n7wm9LYrU8nDRT7SUVI821F0OfxRb3jYprBPdXdjX0bdXHAfMnCeJ0k1qedMIIe8ERI7QgTYWCdYuhXdh2Zou26+h7IkYUSj3yrFrExsXa1BzYU6YwsKhUij5BRVweOaClr0jCb1XeYmTDIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+LOBeYm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A928DC4CEE7
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 14:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746368272;
	bh=cFlHX8D5fko1yj0El2FrDQnQIranVdcTARft3JNTXNU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W+LOBeYmxjWCE1VDN7f3InoNf95KrxPSanHbgyQd01Rt2aZCCabTQ3mRNmR7ZIKD3
	 cMfxZDvE6s3bpOl9jQAJlDs4zrmGSlwRXfAcO6dlaIplIz+PzC5bdkKR3wXZ/c/GJR
	 mV2nxlAIW7+lvAMKYd5fLXn+Gx1Cj6ef1v1Vla8TUspwvLbJLo0ibTD+Lp0FGBHj3g
	 QNCaqKeO6Y5D1NoUfanuhrfSFBcPr7WazgRk0CWBboA5NndasRfsL4nKEMlniCHTL/
	 7MWClDK4zla8RaJOUfPTHikzwa9D37Ih+ybeU+VHP1E2SKskhgJPdnSV18vkQrWAyO
	 2034D96jejNRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C356C41614; Sun,  4 May 2025 14:17:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 04 May 2025 14:17:52 +0000
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
Message-ID: <bug-220069-208809-fqYJXUbrJa@https.bugzilla.kernel.org/>
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

--- Comment #34 from Claudio Wunder (cwunder@gnome.org) ---
Looks like a 3rd crash happened, interestingly enough, the script did not
detect a 3rd crash and did not send an unbind/bind command; But the Bus (5)=
 got
completely disconnected, Bus (7) which previously had the webcam, now is st=
ill
working. I did not have the autopsy command running for Bus (5) so no logs;=
 But
Ill start it now and keep an eye on it.

```
00:00.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Root Complex [1022:14d8]
00:00.2 IOMMU [0806]: Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ri=
dge
IOMMU [1022:14d9]
00:01.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Dummy Host Bridge [1022:14da]
00:01.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Raphael/Grani=
te
Ridge GPP Bridge [1022:14db]
00:01.2 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Raphael/Grani=
te
Ridge GPP Bridge [1022:14db]
00:02.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Dummy Host Bridge [1022:14da]
00:02.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Raphael/Grani=
te
Ridge GPP Bridge [1022:14db]
00:03.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Dummy Host Bridge [1022:14da]
00:04.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Dummy Host Bridge [1022:14da]
00:08.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Dummy Host Bridge [1022:14da]
00:08.1 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Raphael/Grani=
te
Ridge Internal GPP Bridge to Bus [C:A] [1022:14dd]
00:08.3 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] Raphael/Grani=
te
Ridge Internal GPP Bridge to Bus [C:A] [1022:14dd]
00:14.0 SMBus [0c05]: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controll=
er
[1022:790b] (rev 71)
00:14.3 ISA bridge [0601]: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge
[1022:790e] (rev 51)
00:18.0 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Data Fabric; Function 0 [1022:14e0]
00:18.1 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Data Fabric; Function 1 [1022:14e1]
00:18.2 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Data Fabric; Function 2 [1022:14e2]
00:18.3 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Data Fabric; Function 3 [1022:14e3]
00:18.4 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Data Fabric; Function 4 [1022:14e4]
00:18.5 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Data Fabric; Function 5 [1022:14e5]
00:18.6 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Data Fabric; Function 6 [1022:14e6]
00:18.7 Host bridge [0600]: Advanced Micro Devices, Inc. [AMD] Raphael/Gran=
ite
Ridge Data Fabric; Function 7 [1022:14e7]
01:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Upstream Port of PCI Express Switch [1002:1478] (rev 10)
02:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 10 XL
Downstream Port of PCI Express Switch [1002:1479] (rev 10)
03:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Navi 31 [Radeon RX 7900 XT/7900 XTX/7900 GRE/7900M] [1002:744c] (=
rev
c8)
03:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Navi 31
HDMI/DP Audio [1002:ab30]
03:00.2 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD/ATI] Navi =
31
USB [1002:7446]
03:00.3 Serial bus controller [0c80]: Advanced Micro Devices, Inc. [AMD/ATI]
Device [1002:7444]
04:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd N=
VMe
SSD Controller S4LV008[Pascal] [144d:a80c]
05:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Upstream Port [1022:43f4] (rev 01)
06:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
06:08.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
06:0c.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
06:0d.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
08:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Upstream Port [1022:43f4] (rev 01)
09:00.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
09:01.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
09:02.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
09:04.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
09:08.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
09:0c.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
09:0d.0 PCI bridge [0604]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset PCIe Switch Downstream Port [1022:43f5] (rev 01)
0a:00.0 Network controller [0280]: Intel Corporation Wi-Fi 6E(802.11ax)
AX210/AX1675* 2x2 [Typhoon Peak] [8086:2725] (rev 1a)
0b:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller
I225-V [8086:15f3] (rev 03)
0d:00.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
0e:00.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
0e:01.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
0e:02.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
0e:03.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
0f:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 NHI [Maple R=
idge
4C 2020] [8086:1137]
3b:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 USB Controll=
er
[Maple Ridge 4C 2020] [8086:1138]
68:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset USB 3.2 Controller [1022:43f7] (rev 01)
69:00.0 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] 600 Seri=
es
Chipset SATA Controller [1022:43f6] (rev 01)
6a:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset USB 3.2 Controller [1022:43f7] (rev 01)
6b:00.0 SATA controller [0106]: Advanced Micro Devices, Inc. [AMD] 600 Seri=
es
Chipset SATA Controller [1022:43f6] (rev 01)
6c:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Granite Ridge [Radeon Graphics] [1002:13c0] (rev cb)
6c:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Rembran=
dt
Radeon High Definition Audio Controller [1002:1640]
6c:00.2 Encryption controller [1080]: Advanced Micro Devices, Inc. [AMD] Fa=
mily
19h PSP/CCP [1022:1649]
6c:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI [1022:15b6]
6c:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI [1022:15b7]
6d:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
```

```
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 002: ID 19f7:0050 RODE Microphones RODECaster Duo
Bus 005 Device 003: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 005 Device 004: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 005 Device 005: ID 046d:c548 Logitech, Inc. Logi Bolt Receiver
Bus 005 Device 006: ID 0b05:1a53 ASUSTek Computer, Inc. USB Audio
Bus 005 Device 009: ID 2109:2211 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 005 Device 010: ID 2109:8884 VIA Labs, Inc. USB Billboard Device=20=20=
=20
Bus 005 Device 011: ID 0cf2:a201 ENE Technology, Inc. 6K7732
Bus 005 Device 012: ID 2e1a:4c03 Insta360 Insta360 Link 2C
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 006 Device 002: ID 2109:0817 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 006 Device 003: ID 2109:0211 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 004: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed=
 hub
Bus 007 Device 006: ID 1e71:300e NZXT NZXT Kraken Base
Bus 007 Device 009: ID 046d:c54d Logitech, Inc. USB Receiver
Bus 007 Device 011: ID 0b05:18f3 ASUSTek Computer, Inc. AURA LED Controller
Bus 007 Device 027: ID 2109:4817 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 007 Device 028: ID 1a40:0801 Terminus Technology Inc. USB 2.0 Hub
Bus 007 Device 029: ID 2109:8817 VIA Labs, Inc. USB Billboard Device=20=20=
=20
Bus 007 Device 030: ID 19f7:004e RODE Microphones R=C3=98DECaster Duo
Bus 007 Device 031: ID 31e3:1322 Wooting Wooting 60HE+
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 008 Device 004: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed=
 hub
Bus 008 Device 008: ID 2109:3817 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 010 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 011 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 012 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 013 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 014 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
```

OOC -

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

