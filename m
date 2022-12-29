Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 245A0658D04
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 14:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229625AbiL2NKS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 08:10:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiL2NKR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 08:10:17 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55FDE11C0E
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 05:10:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 61C9FCE1412
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 13:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F0A7C433EF
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 13:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672319411;
        bh=kd57lOivF+VoGmTMdz7LVJXhs0naGPg8HkgroDz0Mbs=;
        h=From:To:Subject:Date:From;
        b=Pq3zLBM2SCemHbzTiioXSpk5uygTTEHYQSx1nO2MmlcG4USbIj4iDuqMvlZ8Mfg+C
         5N8pEzmnXc0+F+A4n0pLs9cexQDYtilE7MobpZmLTqaPGVXUvSU99KqUpTjY1GmG6H
         mKyqiEff8vc8OxAO3LN5qTfLFgZFCvsacD7WpZ06nd9IPxpv0hswlGq1Jg6eCQpJSs
         A3NLoI8Edtz8CfD+cKVyXqPb1HAoERfjlV0jHDvageetrPG1kID4Oq7C6NRRw27TSz
         g7XoGV931bfEeUah/o0awhYsx5m8sZm1q+V4r9uTVEqRiQgWlhUa3QnAGbOivT2P/v
         ICrriUwiqTUPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 44D15C43142; Thu, 29 Dec 2022 13:10:11 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216863] New: ThinkPad X1 Extreme Gen 5: PCIe Bus Error:
 severity=Corrected, type=Data Link Layer, (Transmitter ID) after resuming
 from sleep
Date:   Thu, 29 Dec 2022 13:10:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: frederick888@tsundere.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216863-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URI_DOTEDU autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216863

            Bug ID: 216863
           Summary: ThinkPad X1 Extreme Gen 5: PCIe Bus Error:
                    severity=3DCorrected, type=3DData Link Layer, (Transmit=
ter
                    ID) after resuming from sleep
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.1
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: frederick888@tsundere.moe
        Regression: No

Created attachment 303500
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303500&action=3Dedit
lspci -vv output without pcie_aspm=3Doff

I recently purchased a Thunderbolt 4 dock (CalDigit TS4) and started
having millions of these warnings in my logs after resuming from sleep.
I previously didn't have any Thunderbolt peripherals. The device is a
ThinkPad X1 Extreme Gen 5 (BIOS 1.12 N3JET28W, EC 1.08 N3JHT21W).

Dec 29 18:51:05 FredArch systemd[1]: Starting System Suspend...
Dec 29 18:51:05 FredArch systemd-sleep[31007]: Entering sleep state
'suspend'...
Dec 29 18:51:05 FredArch kernel: PM: suspend entry (s2idle)
Dec 29 18:51:07 FredArch kernel: Filesystems sync: 1.566 seconds
Dec 29 18:52:30 FredArch kernel: Freezing user space processes ... (elapsed
0.001 seconds) done.
Dec 29 18:52:30 FredArch kernel: OOM killer disabled.
Dec 29 18:52:30 FredArch kernel: Freezing remaining freezable tasks ...
(elapsed 0.001 seconds) done.
Dec 29 18:52:30 FredArch kernel: printk: Suspending console(s) (use
no_console_suspend to debug)
Dec 29 18:52:30 FredArch kernel: ACPI: EC: interrupt blocked
Dec 29 18:52:30 FredArch kernel: ACPI: EC: interrupt unblocked
Dec 29 18:52:30 FredArch kernel: pcieport 0000:00:1d.0: AER: Multiple Corre=
cted
error received: 0000:21:01.0
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0: PCIe Bus Error:
severity=3DCorrected, type=3DData Link Layer, (Transmitter ID)
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:   device [8086:1136]
error status/mask=3D00001100/00002000
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:    [ 8] Rollover
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:    [12] Timeout
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0: AER:   Error of this
Agent is reported first
Dec 29 18:52:30 FredArch kernel: pcieport 0000:23:00.0: PCIe Bus Error:
severity=3DCorrected, type=3DData Link Layer, (Transmitter ID)
Dec 29 18:52:30 FredArch kernel: pcieport 0000:23:00.0:   device [8086:0b26]
error status/mask=3D00001000/00002000
Dec 29 18:52:30 FredArch kernel: pcieport 0000:23:00.0:    [12] Timeout
Dec 29 18:52:30 FredArch kernel: pcieport 0000:00:1d.0: AER: Corrected error
received: 0000:21:01.0
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0: PCIe Bus Error:
severity=3DCorrected, type=3DData Link Layer, (Transmitter ID)
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:   device [8086:1136]
error status/mask=3D00001100/00002000
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:    [ 8] Rollover
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:    [12] Timeout

$ cat /proc/version
Linux version 6.1.1-arch1-1 (linux@archlinux) (gcc (GCC) 12.2.0, GNU ld (GNU
Binutils) 2.39.0) #1 SMP PREEMPT_DYNAMIC Wed, 21 Dec 2022 22:27:55 +0000

$ lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation 12th Gen Core Processor Host
Bridge/DRAM Registers [8086:4641] (rev 02)
00:01.0 PCI bridge [0604]: Intel Corporation 12th Gen Core Processor PCI
Express x16 Controller #1 [8086:460d] (rev 02)
00:04.0 Signal processing controller [1180]: Intel Corporation Alder Lake
Innovation Platform Framework Processor Participant [8086:461d] (rev 02)
00:06.0 PCI bridge [0604]: Intel Corporation 12th Gen Core Processor PCI
Express x4 Controller #0 [8086:464d] (rev 02)
00:08.0 System peripheral [0880]: Intel Corporation 12th Gen Core Processor
Gaussian & Neural Accelerator [8086:464f] (rev 02)
00:0a.0 Signal processing controller [1180]: Intel Corporation Platform
Monitoring Technology [8086:467d] (rev 01)
00:14.0 USB controller [0c03]: Intel Corporation Alder Lake PCH USB 3.2 xHCI
Host Controller [8086:51ed] (rev 01)
00:14.2 RAM memory [0500]: Intel Corporation Alder Lake PCH Shared SRAM
[8086:51ef] (rev 01)
00:14.3 Network controller [0280]: Intel Corporation Alder Lake-P PCH CNVi =
WiFi
[8086:51f0] (rev 01)
00:15.0 Serial bus controller [0c80]: Intel Corporation Alder Lake PCH Seri=
al
IO I2C Controller #0 [8086:51e8] (rev 01)
00:16.0 Communication controller [0780]: Intel Corporation Alder Lake PCH H=
ECI
Controller [8086:51e0] (rev 01)
00:1c.0 PCI bridge [0604]: Intel Corporation Device [8086:51b8] (rev 01)
00:1c.7 PCI bridge [0604]: Intel Corporation Alder Lake PCH-P PCI Express R=
oot
Port #9 [8086:51bf] (rev 01)
00:1d.0 PCI bridge [0604]: Intel Corporation Device [8086:51b0] (rev 01)
00:1f.0 ISA bridge [0601]: Intel Corporation Alder Lake PCH eSPI Controller
[8086:5182] (rev 01)
00:1f.3 Multimedia audio controller [0401]: Intel Corporation Alder Lake PC=
H-P
High Definition Audio Controller [8086:51c8] (rev 01)
00:1f.4 SMBus [0c05]: Intel Corporation Alder Lake PCH-P SMBus Host Control=
ler
[8086:51a3] (rev 01)
00:1f.5 Serial bus controller [0c80]: Intel Corporation Alder Lake-P PCH SPI
Controller [8086:51a4] (rev 01)
01:00.0 VGA compatible controller [0300]: NVIDIA Corporation GA103M [GeForce
RTX 3080 Ti Mobile] [10de:2420] (rev a1)
01:00.1 Audio device [0403]: NVIDIA Corporation Device [10de:2288] (rev a1)
04:00.0 Non-Volatile memory controller [0108]: Samsung Electronics Co Ltd
Device [144d:a80c]
0a:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS5261 PCI
Express Card Reader [10ec:5261] (rev 01)
20:00.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
21:00.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
21:01.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
21:02.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
21:03.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Maple Ri=
dge
4C 2020] [8086:1136] (rev 02)
22:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 NHI [Maple R=
idge
4C 2020] [8086:1137]
23:00.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Goshen R=
idge
2020] [8086:0b26] (rev 03)
24:00.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Goshen R=
idge
2020] [8086:0b26] (rev 03)
24:01.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Goshen R=
idge
2020] [8086:0b26] (rev 03)
24:02.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Goshen R=
idge
2020] [8086:0b26] (rev 03)
24:03.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Goshen R=
idge
2020] [8086:0b26] (rev 03)
24:04.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Goshen R=
idge
2020] [8086:0b26] (rev 03)
55:00.0 Ethernet controller [0200]: Intel Corporation Ethernet Controller (=
2)
I225-LMvP [8086:5502] (rev 03)
56:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 USB Controll=
er
[Maple Ridge 4C 2020] [8086:1138]


It happened every time after resuming from sleep. pcie_aspm=3Doff solved
the issue for me. Some related posts I found: [1][2].

Maybe we need some quirk patches like [3]?

[1] https://bbs.archlinux.org/viewtopic.php?id=3D274935
[2]
https://askubuntu.com/questions/1394924/35-gb-day-of-pcie-bus-error-severit=
y-corrected-type-data-link-layer-in-sy
[3] https://lkml.iu.edu/hypermail/linux/kernel/2008.0/01418.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
