Return-Path: <linux-usb+bounces-14915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F03399743B7
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 21:52:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 75A571F25AAE
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 19:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534651A7056;
	Tue, 10 Sep 2024 19:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzCq4mgU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA3719B595
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 19:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725997958; cv=none; b=OaZbmQgih1hLraKStNp0rZdAAZ3zFEBxYNb5xsDjnl1rwsx4fipc8VaU9Jo5mFwxl1pi8xsUdyLiEQ9U6jUgyoB1tULZu9rezS5ezm3zgYtdy1vF1iArUeFCX06Aa7F2mQz2TNJPFQt57CbTi63PcjnqKyJIDCxQl1luvGBdfpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725997958; c=relaxed/simple;
	bh=dvRCvyXjkiyzPHaq7xHUPUIZicoGlpSfjy9S2atGBcg=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KLKlLP7YQGSRCXDMyaZQUlFhHw2CORELo2pfwMmOIL/rYWRS784REalRs61oPz/jVOiUCOhuxTf5CxWZ90enaADcf8NmdLz9pa3yqxLvAEDi/2FMPCvmmDXzIY0n/sWkj7YRYZcT9QvCr41idYxHWyJRjpeeT68sCvgMPK84uMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzCq4mgU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9D8A8C4CEC6
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 19:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725997958;
	bh=dvRCvyXjkiyzPHaq7xHUPUIZicoGlpSfjy9S2atGBcg=;
	h=From:To:Subject:Date:From;
	b=dzCq4mgUmIIL4+049QQWJzCG772WkaEWujIJMqtovS0DIgGZGqMDMnmE7bzPkUiXM
	 HvkHiV0IVPy3UONaFmeWFnFMruiOJ0oBQWaiMo2eany844Jz3rinm7N2bGeFfQxFWv
	 hyAzXqOTyMFOsCKz5bdsMjRqWbOEg/w+UrXnkU4wKDlYVQK1a53vgiGFrLVk8amlW/
	 UisTQFHr0HXwq7V3GESzIpyUGaIAdWbJiE8Szj/sok8LS929CQ9fErE6RlfMHYI7bV
	 ApqF78oXZPj+yYlrD6sPycdML8ieiiAbF5wn5p1pMc6HkGwqb2SkKsKwQMptt3gsM1
	 zrDmQUpWDOxQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8A483C53BBF; Tue, 10 Sep 2024 19:52:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219259] New: Attaching Ryzen 7 7840HS laptop to Lenovo
 Thunderbolt 4 Dock causes high CPU load
Date: Tue, 10 Sep 2024 19:52:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thilo@ginkel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-219259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219259

            Bug ID: 219259
           Summary: Attaching Ryzen 7 7840HS laptop to Lenovo Thunderbolt
                    4 Dock causes high CPU load
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.11.0-rc6
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: thilo@ginkel.com
        Regression: No

Created attachment 306854
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306854&action=3Dedit
lsoci -v

Hi there,

I recently got a Framework 16 laptop (based on AMD Ryzen 7 7840HS).
When the laptop is placed on my desk, I am docking it using a Lenovo
Thunderbolt 4 Dock (via Thunderbolt), to which an 8K monitor (via USB-C) and
various USB peripherals are connected.

Recently I noticed that my laptop's load is > 4 while docked although the
system is mostly idle.

This seems to be caused by a few kworker/0:x+pm tasks spending plenty of ti=
me
in "uninterruptible sleep" ("D"). A few random stack traces captured for th=
em
look like this:

[<0>] rpm_resume+0x25f/0x700
[<0>] rpm_resume+0x2d3/0x700
[<0>] rpm_resume+0x2d3/0x700
[<0>] pm_runtime_work+0x70/0xb0
[<0>] process_one_work+0x17b/0x330
[<0>] worker_thread+0x2e2/0x410
[<0>] kthread+0xcf/0x100
[<0>] ret_from_fork+0x31/0x50
[<0>] ret_from_fork_asm+0x1a/0x30

or

[<0>] pci_power_up+0x144/0x190
[<0>] pci_pm_runtime_resume+0x33/0xf0
[<0>] __rpm_callback+0x41/0x170
[<0>] rpm_callback+0x55/0x60
[<0>] rpm_resume+0x4d3/0x700
[<0>] rpm_suspend+0x5db/0x5f0
[<0>] pm_runtime_work+0x84/0xb0
[<0>] process_one_work+0x17b/0x330
[<0>] worker_thread+0x2e2/0x410
[<0>] kthread+0xcf/0x100
[<0>] ret_from_fork+0x31/0x50
[<0>] ret_from_fork_asm+0x1a/0x30

Fast-forward, I isolated the cause of this to be related to the power
management of the following AMD Thunderbolt PCI devices:

00:03.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 19h
USB4/Thunderbolt PCIe tunnel (prog-if 00 [Normal decode])
        Subsystem: Advanced Micro Devices, Inc. [AMD] Device 1453
        Flags: bus master, fast devsel, latency 0, IRQ 40, IOMMU group 4
        Bus: primary=3D00, secondary=3D03, subordinate=3D61, sec-latency=3D0
        I/O behind bridge: 6000-9fff [size=3D16K] [16-bit]
        Memory behind bridge: 78000000-8fffffff [size=3D384M] [32-bit]
        Prefetchable memory behind bridge: 7800000000-87ffffffff [size=3D64=
G]
[32-bit]
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Root Port (Slot+), IntMsgNum 0
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [c0] Subsystem: Advanced Micro Devices, Inc. [AMD] De=
vice
1453
        Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [270] Secondary PCI Express
        Capabilities: [400] Data Link Feature <?>
        Kernel driver in use: pcieport

00:04.1 PCI bridge: Advanced Micro Devices, Inc. [AMD] Family 19h
USB4/Thunderbolt PCIe tunnel (prog-if 00 [Normal decode])
        Subsystem: Advanced Micro Devices, Inc. [AMD] Device 1453
        Flags: bus master, fast devsel, latency 0, IRQ 41, IOMMU group 5
        Bus: primary=3D00, secondary=3D62, subordinate=3Dc0, sec-latency=3D0
        I/O behind bridge: a000-efff [size=3D20K] [16-bit]
        Memory behind bridge: 60000000-77ffffff [size=3D384M] [32-bit]
        Prefetchable memory behind bridge: 6800000000-77ffffffff [size=3D64=
G]
[32-bit]
        Capabilities: [50] Power Management version 3
        Capabilities: [58] Express Root Port (Slot+), IntMsgNum 0
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [c0] Subsystem: Advanced Micro Devices, Inc. [AMD] De=
vice
1453
        Capabilities: [c8] HyperTransport: MSI Mapping Enable+ Fixed+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [270] Secondary PCI Express
        Capabilities: [400] Data Link Feature <?>
        Kernel driver in use: pcieport

c3:00.5 USB controller: Advanced Micro Devices, Inc. [AMD] Pink Sardine
USB4/Thunderbolt NHI controller #1 (prog-if 40 [USB4 Host Interface])
        Subsystem: Framework Computer Inc. Device 0005
        Flags: bus master, fast devsel, latency 0, IRQ 86, IOMMU group 26
        Memory at 90800000 (64-bit, non-prefetchable) [size=3D512K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=3D1/16 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D16 Masked-
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [2a0] Access Control Services
        Kernel driver in use: thunderbolt
        Kernel modules: thunderbolt

c3:00.6 USB controller: Advanced Micro Devices, Inc. [AMD] Pink
Sardine USB4/Thunderbolt NHI controller #2 (prog-if 40 [USB4 Host
Interface])
        Subsystem: Framework Computer Inc. Device 0005
        Flags: bus master, fast devsel, latency 0, IRQ 107, IOMMU group 27
        Memory at 90880000 (64-bit, non-prefetchable) [size=3D512K]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=3D1/16 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D16 Masked-
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [2a0] Access Control Services
        Kernel driver in use: thunderbolt
        Kernel modules: thunderbolt

As soon as I disable power management for those in powertop (internally doi=
ng
echo 'on' > '/sys/bus/pci/devices/0000:c3:00.5/power/control') the load fal=
ls
below 1 back to normal levels.

I originally spotted this behavior in 6.10.8-arch1-1 (using the LTS kernel
based on 6.6.49 makes no difference), but have since also been able to
reproduce it using the 6.11.0-rc6 mainline kernel.

I'd appreciate any hints on how to further isolate the root cause of this
issue.

Thanks,
Thilo

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

