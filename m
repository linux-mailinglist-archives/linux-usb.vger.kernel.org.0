Return-Path: <linux-usb+bounces-23101-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26452A8ACA6
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 02:25:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C2C617A414
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 00:25:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD5F219DF40;
	Wed, 16 Apr 2025 00:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oJDD8w4V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F4419F495
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 00:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744763107; cv=none; b=Mns4jaWF5yQGt9ljy4s30Yx0wVGePVcOtLPndkVpbIl1gyQnvmue4oGrSU/21HQ7Ck7HQZ53AvFjOQlhDSm9iZq25yIl1+uHTggNg9k39gLBhyS34yGs2XqDXexmyTy0FX+lY3F+mw/hADrcmuAAa3Hu5tt7fnQw5PfDnHaiHLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744763107; c=relaxed/simple;
	bh=j2VSJmdmUYA7eQZN6lFhgYxBCpOxD6/rxIfkmeP2DPM=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rdFk9lFpR21QikPf7DJfEsT/7knzK94Fjf7tb4l8l0yIurRQ14hiMOLjwOKrNDrHJbA4j6nTddSirQ2/gcNK2GHARnIep5ZgO71blBqPip+qDzIKdknpc59uEX1VbVvGlRkit7xQb80TntBEHLKU40f7TDbRIPfKh/6NMB1UsrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oJDD8w4V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB024C4CEE7
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 00:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744763105;
	bh=j2VSJmdmUYA7eQZN6lFhgYxBCpOxD6/rxIfkmeP2DPM=;
	h=From:To:Subject:Date:From;
	b=oJDD8w4VT9/VHncKO8lOmiE46UmCpCFQM3L3ksh25HEfgsTehhRS3ne8Rgqb3AhkY
	 DhQBVvBnxmxjJTl+PEleP9EFGpyRg7uAWASamfdB7gXBG9+hbvC85CkQFkZdvM+p+J
	 2SEaVz0ZpKnzsVyNUWNjFiixjZJqiPzUodM0W3kG9Vie8/L0s7bgYCFPRFBizZA7Qm
	 25aG8GGvRNS33zSPmxnkBFCPDUHt6uJcr06juYvH/srVtPBWbcoYhUzw0iRjlrBGX/
	 aQySn+SW0E/96+dAHyC8n79Ez3xiyIETC/rccHM0f4t2eqV25IQyXQEzXNzZIH4v0m
	 sqeXmdfJT/34Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B1F08C3279F; Wed, 16 Apr 2025 00:25:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] New: USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 00:25:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joe@solidadmin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

            Bug ID: 220016
           Summary: USB devices plugged into USB hubs on
                    6.14.2-300.fc42.x86_64 do not work
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: joe@solidadmin.com
        Regression: No

Created attachment 307967
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307967&action=3Dedit
6.14.2-300.fc42.x86_64 journalctl -k output

Upgrading to 6.14.2 results in any USB device plugged into a USB hub to not
work correctly. Downgrading to 6.13.7-200.fc41.x86_64 allows for all USB
devices to work as expected. This issue also seems to be present in 6.15.0 =
as
well.

Here is the downstream bug https://bugzilla.redhat.com/show_bug.cgi?id=3D23=
53984
with more details. Another user on the RH BZ with a very similar motherboar=
d is
reporting that none of their USB devices are working when upgrading to 6.14=
.2

I have attached the journalctl -k output for 6.13.7-200.fc41.x86_64 and one
thing that seems notable is:

Apr 14 20:06:49 kernel: ahci 0000:26:00.0: version 3.0
Apr 14 20:06:49 kernel: ahci 0000:26:00.0: probe with driver ahci failed wi=
th
error -12
Apr 14 20:06:49 kernel: ahci 0000:27:00.0: probe with driver ahci failed wi=
th
error -12
Apr 14 20:06:49 kernel: xhci_hcd 0000:23:00.0: init 0000:23:00.0 fail, -16
Apr 14 20:06:49 kernel: xhci_hcd 0000:23:00.0: probe with driver xhci_hcd
failed with error -16
Apr 14 20:06:49 kernel: xhci_hcd 0000:28:00.1: init 0000:28:00.1 fail, -16
Apr 14 20:06:49 kernel: xhci_hcd 0000:28:00.1: probe with driver xhci_hcd
failed with error -16
Apr 14 20:06:49 kernel: xhci_hcd 0000:28:00.3: init 0000:28:00.3 fail, -16
Apr 14 20:06:49 kernel: xhci_hcd 0000:28:00.3: probe with driver xhci_hcd
failed with error -16

and in the 6.13.7-200.fc41.x86_64 output, this is not present. I have attac=
hed
the 6.13.7-200.fc41.x86_64 journalctl -k output as well and the lspci -v ou=
tput
is below.

# lspci -v|rg -A 15 USB
06:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Starship USB 3.0
Host Controller (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device 8815
        Flags: bus master, fast devsel, latency 0, IRQ 94, IOMMU group 85
        Memory at f3600000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=3D1/8 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D8 Masked-
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [2a0] Access Control Services
        Capabilities: [370] Transaction Processing Hints
        Kernel driver in use: xhci_hcd
--
23:00.0 USB controller: ASMedia Technology Inc. ASM3242 USB 3.2 Host Contro=
ller
(prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device 87c1
        Flags: bus master, fast devsel, latency 0, IRQ 65, IOMMU group 51
        Memory at f0600000 (64-bit, non-prefetchable) [size=3D32K]
        Capabilities: [50] MSI: Enable- Count=3D1/8 Maskable- 64bit+
        Capabilities: [68] MSI-X: Enable+ Count=3D8 Masked-
        Capabilities: [78] Power Management version 3
        Capabilities: [80] Express Legacy Endpoint, IntMsgNum 0
        Capabilities: [c0] Subsystem: ASMedia Technology Inc. Device 0201
        Capabilities: [100] Advanced Error Reporting
        Capabilities: [200] Secondary PCI Express
        Capabilities: [300] Latency Tolerance Reporting
        Capabilities: [400] L1 PM Substates
        Kernel driver in use: xhci_hcd

--
28:00.1 USB controller: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 =
Host
Controller (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device 8815
        Flags: bus master, fast devsel, latency 0, IRQ 75, IOMMU group 50
        Memory at f0100000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable+ Count=3D1/1 Maskable- 64bit+
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Kernel driver in use: xhci_hcd

28:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Matisse USB 3.0 =
Host
Controller (prog-if 30 [XHCI])
        Subsystem: Advanced Micro Devices, Inc. [AMD] Device 148c
        Flags: bus master, fast devsel, latency 0, IRQ 76, IOMMU group 50
        Memory at f0000000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=3D1/8 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D8 Masked-
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Kernel driver in use: xhci_hcd
--
2c:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Starship USB 3.0
Host Controller (prog-if 30 [XHCI])
        Subsystem: ASUSTeK Computer Inc. Device 8815
        Flags: bus master, fast devsel, latency 0, IRQ 85, IOMMU group 62
        Memory at f0700000 (64-bit, non-prefetchable) [size=3D1M]
        Capabilities: [48] Vendor Specific Information: Len=3D08 <?>
        Capabilities: [50] Power Management version 3
        Capabilities: [64] Express Endpoint, IntMsgNum 0
        Capabilities: [a0] MSI: Enable- Count=3D1/8 Maskable- 64bit+
        Capabilities: [c0] MSI-X: Enable+ Count=3D8 Masked-
        Capabilities: [100] Vendor Specific Information: ID=3D0001 Rev=3D1 =
Len=3D010
<?>
        Capabilities: [150] Advanced Error Reporting
        Capabilities: [2a0] Access Control Services
        Capabilities: [370] Transaction Processing Hints
        Kernel driver in use: xhci_hcd

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

