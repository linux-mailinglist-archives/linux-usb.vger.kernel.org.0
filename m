Return-Path: <linux-usb+bounces-31889-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CE63CCF07BC
	for <lists+linux-usb@lfdr.de>; Sun, 04 Jan 2026 02:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA94D3011EE1
	for <lists+linux-usb@lfdr.de>; Sun,  4 Jan 2026 01:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 174D41F471F;
	Sun,  4 Jan 2026 01:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTDtgB65"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA691F03C5
	for <linux-usb@vger.kernel.org>; Sun,  4 Jan 2026 01:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767490939; cv=none; b=s1a36I0w6ClnWdoDj/nSomsxwuz18tMUMOurz+Ogv/zd6Wi9XluBsrHQPLpnqr5XEwAWyMSYPqlRc4gS9UBB1y7bj3cd+TPjP+MTTcp351zZPYVqBow4plE7TzQp71U4J9h0ziQ2rzYAP1sejDF2W6hZJlHHv/+G6U/2wzyRDYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767490939; c=relaxed/simple;
	bh=uo7jRJUYl8n7kI4BS57pyrn8ttsy5cSp40iRdvkyW5E=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=i1tW2sfSyyDIWdzyfXrL6WPfrQ7ne8MfReaZ8Bzlqd90hq9T0PSE33W/CMrfc8QTo7k2lxKSR1r17gqWZ51pQnR17mvzkJq6TGvVB/YwC3FyheDCOQuuiSamQYMjiW3lsFk5Qb3+3Pqr85uXLDz/3NT0gAUY0q51D3MdvkkeNuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTDtgB65; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2A80C113D0
	for <linux-usb@vger.kernel.org>; Sun,  4 Jan 2026 01:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767490939;
	bh=uo7jRJUYl8n7kI4BS57pyrn8ttsy5cSp40iRdvkyW5E=;
	h=From:To:Subject:Date:From;
	b=fTDtgB65pZWbiiaofaFamsvGynvt1x22iBIIGMwdb8X0dHa2bwCgjuYq/hIYU36yY
	 C7e1y/6Th6eWbr0UwSlNK8toDF2lSg3u+l/UwT+cnw5kRlbMRHTD5zYJCteMz61r96
	 GtlBaO4TNyExiT05Pw1L9t0U3tnlM3WDQmPUGPrG04Dc4Yd6/8urm6FPhRUt3KoYQZ
	 DwHeZJljsXMJK4vxCHQc49R+nOpfkm8djyhhJh91EUzazgsGm+ut3sNlM7EmE0sYZ4
	 O92mFQrZP9Wwk7xG0oo4mq/mX1yx3tXBAJ/RWa5NrUrDzlJfxKLDYaya46Hyts2tuc
	 fq6Kgs8tgLqTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DF3A2C3279F; Sun,  4 Jan 2026 01:42:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220936] New: ASMedia ASM4242 USB 3.2 xHCI Controller gives
 command timeout
Date: Sun, 04 Jan 2026 01:42:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stuart.a.hayhurst@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220936-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220936

            Bug ID: 220936
           Summary: ASMedia ASM4242 USB 3.2 xHCI Controller gives command
                    timeout
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: stuart.a.hayhurst@gmail.com
        Regression: No

Created attachment 309123
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309123&action=3Dedit
dmesg log with the warning

After enabling the USB 4 controller on my motherboard (previously disabled =
to
use the lanes for an NVMe), I've started seeing a warning about a command /
suspend timeout for that controller.

I'm running mainline 6.18.3 on top of Debian Sid, the motherboard is an MSI
X870E Tomahawk WiFi. This also happens on 6.17 kernels, I didn't test any
further back.

I've attached a full log, but the warning I get:
```
[  160.064098] xhci_hcd 0000:77:00.0: WARN: xHC CMD_RUN timeout
[  160.064117] xhci_hcd 0000:77:00.0: PM: suspend_common(): xhci_pci_suspend
[xhci_pci] returns -110
[  160.064124] xhci_hcd 0000:77:00.0: can't suspend (hcd_pci_runtime_suspend
[usbcore] returned -110)
```

Corresponding part of `lspci`:
```
77:00.0 USB controller: ASMedia Technology Inc. ASM4242 USB 3.2 xHCI Contro=
ller
(rev 01)
78:00.0 USB controller: ASMedia Technology Inc. ASM4242 USB 4 / Thunderbolt=
 3
Host Router (rev 01)
79:00.0 Non-Essential Instrumentation [1300]: Advanced Micro Devices, Inc.
[AMD] Raphael/Granite Ridge PCIe Dummy Function (rev c3)
79:00.2 Encryption controller: Advanced Micro Devices, Inc. [AMD] Family 19h
PSP/CCP
79:00.3 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
Ridge USB 3.1 xHCI
79:00.4 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
Ridge USB 3.1 xHCI
79:00.6 Audio device: Advanced Micro Devices, Inc. [AMD] Ryzen HD Audio
Controller
7a:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granite
Ridge USB 2.0 xHCI
```

Sorry if this is the wrong category, I wasn't sure exactly where to put it

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

