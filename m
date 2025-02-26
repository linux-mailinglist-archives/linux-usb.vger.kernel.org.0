Return-Path: <linux-usb+bounces-21105-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92336A46E6B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 23:23:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9377B16C854
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 22:23:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21C1325CC7E;
	Wed, 26 Feb 2025 22:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MiFf7tMt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A040425CC77
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 22:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740608630; cv=none; b=N0BsBCFe/P2mYtKtJgYwmq3d16WLGNYwpk0lp0GgVjs4dvIGD+Lkqmf+BUxkFC4W74utXYActwXTiz9xThRBcdXNMfORHR29r/ezsYEDKrdrbTstXiV1p254moJKe5fsad+/xNzpanFMe1OV74ih08QcZwzgfGl3BpOqvwkCzPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740608630; c=relaxed/simple;
	bh=/rFxgOZ+V507AFW26lq1b6yvOshKc9+kyQ4oevWH5Kw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=JwztyHDJoVCK4ZdNK3Y7+A5hzXPGK/hxejgtBO9smt0k98ReTBe7n5OjOVlUALO2ZfQo4Tn2gZwmK1rnn+FKjr1ZjQsspMBldN6m/W8XSbBHCbMqbTBx/PnHoi2NSaYWfTCe/w26VwgZlyWBrhoNEdIWP6p2s5iOJ08rkbUwLMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MiFf7tMt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6B5D4C4CED6
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740608630;
	bh=/rFxgOZ+V507AFW26lq1b6yvOshKc9+kyQ4oevWH5Kw=;
	h=From:To:Subject:Date:From;
	b=MiFf7tMtPIC8vDHeYD2iM1E81x+kl6p1PauLHy8qdkpJp+X1eLVmNCphz3PVL+EHY
	 bzzl6rjTIcvru+NTk+RFTs7y+3DwkwF/x4o3Slb7jws25vY0Ha2oHvjHQQQD1v0I6m
	 3JBGOqDoeeslhGsVq33qMiC3w61KHrKMJ1RBoGvXnRRiBF55+jOe2D8gXdXdaZZRN9
	 e2A+JXRAckP9tPLTf8wLrib+u378PjSS5AaTT8i9N4sr27tzrofMulADuVzuK/hSps
	 cq8TiLmxRVh8ZYeacpp8B8OLqXi6qQkQE3fkpsaZ0GkGOnxvViuWgJgWTEVlcXbOwB
	 CF3VThQ75oLmA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4D543C3279F; Wed, 26 Feb 2025 22:23:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] New: [6.13 regression] USB controller just died
Date: Wed, 26 Feb 2025 22:23:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

            Bug ID: 219824
           Summary: [6.13 regression] USB controller just died
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: blocking
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: aros@gmx.com
        Regression: No

This is the first time it's happened to me.

My USB mouse just died.

The system was more or less idle, then I got these messages from the kernel:

[109773.985092] xhci_hcd 0000:c3:00.3: xHCI host not responding to stop
endpoint command
[109773.998577] xhci_hcd 0000:c3:00.3: xHCI host controller not responding,
assume dead
[109773.998622] xhci_hcd 0000:c3:00.3: HC died; cleaning up
[109773.998668] xhci_hcd 0000:c3:00.3: Timeout while waiting for stop endpo=
int
command
[109773.998740] usb 1-2: USB disconnect, device number 2
[109774.032612] usb 1-3: USB disconnect, device number 3
[109774.033087] usb 1-4: USB disconnect, device number 4

This has never happened before with any of previous kernels, 6.9, 6.10, 6.1=
1,
6.12.

Now on 6.13.4 this happened a few minutes after the system resumed.

That looks like a major regression.

The kernel didn't try anything.

Unbinding and binding the USB endpoint in /sys using this script has fixed =
the
mouse but I never had to do that before:

https://unix.stackexchange.com/a/704342

My lspci:

c3:00.1 Audio device: Advanced Micro Devices, Inc. [AMD/ATI] Rembrandt Rade=
on
High Definition Audio Controller
c3:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Family 17h/19h/1ah=
 HD
Audio Controller
c3:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Phoenix
CCP/PSP 3.0 Device
00:18.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Data Fabric;
Function 0
00:18.1 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Data Fabric;
Function 1
00:18.2 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Data Fabric;
Function 2
00:18.3 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Data Fabric;
Function 3
00:18.4 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Data Fabric;
Function 4
00:18.5 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Data Fabric;
Function 5
00:18.6 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Data Fabric;
Function 6
00:18.7 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Data Fabric;
Function 7
00:01.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Dummy Host
Bridge
00:02.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Dummy Host
Bridge
00:03.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Dummy Host
Bridge
00:04.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Dummy Host
Bridge
00:08.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Dummy Host
Bridge
00:00.0 Host bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Root Complex
00:00.2 IOMMU: Advanced Micro Devices, Inc. [AMD] Phoenix IOMMU
00:14.3 ISA bridge: Advanced Micro Devices, Inc. [AMD] FCH LPC Bridge (rev =
51)
c3:00.5 Multimedia controller: Advanced Micro Devices, Inc. [AMD]
ACP/ACP3X/ACP6x Audio Coprocessor (rev 63)
01:00.0 Network controller: MEDIATEK Corp. MT7922 802.11ax PCI Express Wire=
less
Network Adapter
c4:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Phoenix Dummy Function
c5:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Phoenix Dummy Function
02:00.0 Non-Volatile memory controller: Micron Technology Inc 3400 NVMe SSD
[Hendrix]
00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 19h
USB4/Thunderbolt PCIe tunnel
00:04.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 19h
USB4/Thunderbolt PCIe tunnel
00:02.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Phoenix GPP Bridge
00:02.4 PCI bridge: Advanced Micro Devices, Inc. [AMD] Phoenix GPP Bridge
00:08.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Internal GPP
Bridge to Bus [C:A]
00:08.2 PCI bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Internal GPP
Bridge to Bus [C:A]
00:08.3 PCI bridge: Advanced Micro Devices, Inc. [AMD] Phoenix Internal GPP
Bridge to Bus [C:A]
c4:00.1 Signal processing controller: Advanced Micro Devices, Inc. [AMD] AMD
IPU Device
c3:00.7 Signal processing controller: Advanced Micro Devices, Inc. [AMD] Se=
nsor
Fusion Hub
00:14.0 SMBus: Advanced Micro Devices, Inc. [AMD] FCH SMBus Controller (rev=
 71)
c3:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15b9
c3:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15ba
c5:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15c0
c5:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Device 15c1
c5:00.5 USB controller: Advanced Micro Devices, Inc. [AMD] Pink Sardine
USB4/Thunderbolt NHI controller #1
c5:00.6 USB controller: Advanced Micro Devices, Inc. [AMD] Pink Sardine
USB4/Thunderbolt NHI controller #2
c3:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Phoenix1 (rev d4)

My lsusb:

Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 0489:e0f2 Foxconn / Hon Hai Wireless_Device
Bus 001 Device 003: ID 06cb:00f0 Synaptics, Inc.=20
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 0408:545f Quanta Computer, Inc. HP 5MP Camera
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

I'm not bisecting this issue because so far it's happened just once and I'v=
e no
idea how to trigger it. Yet it has never happened before with previous kern=
els.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

