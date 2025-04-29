Return-Path: <linux-usb+bounces-23559-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE34AA1C57
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 22:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6C49982EE5
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 20:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB85C266EF8;
	Tue, 29 Apr 2025 20:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rVc2crLR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424D3214A8A
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 20:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959402; cv=none; b=Iba58LIaavfvM+GAGwS8yhOXP5SgkNSkZ+gdVfoOYaBvmzWZx+5RMBcscc3l/kEEYA8zhyj8FyVk9A0Ml/Xnu+Vx+DVrJs8I24U7R82EX/KD1RTgHqHtEGRO+/to86zVJKIMnpQ6X+Dns8mJtzuJffag//XPyb6RMnaY7kHVkQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959402; c=relaxed/simple;
	bh=V5oLVoKSuyKQlyYYXujgozE8o1VuFehKQWDRTvDtnuw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PYduFNfxr2LOlwx9B18d8GgEMUFTBLvScyvnTWLAO2DWwWXLVCsKu/iEBp4g/P3jTgkhkasrn2akHtLQ4V9bbNQWEgeYTRJVIqqkiqNiQUauJehIsHn73KqDFmCVz2fcVCLTXOaOiGZzGSiZ7ZA0aPDDerwKlqUAIrQzjq6WCbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rVc2crLR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC01CC4CEEA
	for <linux-usb@vger.kernel.org>; Tue, 29 Apr 2025 20:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745959401;
	bh=V5oLVoKSuyKQlyYYXujgozE8o1VuFehKQWDRTvDtnuw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rVc2crLRK/E9qUjkBMylrUmjKGtxGhmbHB964TZZiMCOyPtLu8quN9ecvh+IO/Ftk
	 kCTe2xdBFcaUtdNgkf16bUHuCZAiH21H1xc0e4PJWu0ndvbuU/zBOTzuk4SwKnC+uq
	 5XGJGNkdtakmFb5xC2vE9fMmf7rJ40VRgvyxyqSGeyHJVF1Vm6sDKrYZy3hyGbt4yC
	 6x5HI98Qj2DXUZkUtOnO6MQjP4pjfjHeZyjlfSRYFpHJpprjagmUjoRw0PteciSCHf
	 SYB4M2oRyRGNeZ7rRO0rZss3T8LAgMbrM3IG5xyKo6OkSLhlQdR7HhCJwyPGipFDp2
	 nc5Y93BBEmpLg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9F04DC3279F; Tue, 29 Apr 2025 20:43:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Tue, 29 Apr 2025 20:43:21 +0000
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
Message-ID: <bug-220069-208809-hLjkebBUBh@https.bugzilla.kernel.org/>
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

--- Comment #2 from Claudio Wunder (cwunder@gnome.org) ---
> Are you really sure that 6.13.7 was OK?

I could confirm, at least to my extent of testing, that on 6.13.7 this issue
was not there.

> Can you reproduce this on upstream kernels built from source?

It might be a bit tricky (not to mention unstable) attempting to use upstre=
am
kernel on a ostree-locked OS; I could try to reach out to the maintainers of
the distro (Silver Blue/Bazzite) and check if there are any guides on that.

> I presume you are seeing the "HC died" message too, could you post full
> dmesg?

That's correct, the exact symptoms are present. Here's some sample messages
from `journald`

```
xhci_hcd 0000:6a:00.0: HC died; cleaning up
xhci_hcd 0000:6a:00.0: xHCI host controller not responding, assume dead
xhci_hcd 0000:6a:00.0: Abort failed to stop command ring: -110
```

On this current Boot, `6a` is not present on `lspci -nn`, but I assume that=
's
because of the virtual re-maping (order the kernel is binding the controlle=
rs
at boot time), here's the output anyways:

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

Regarding `dmesg` would you like a full output? The logs are... long.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

