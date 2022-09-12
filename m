Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA2295B5A7A
	for <lists+linux-usb@lfdr.de>; Mon, 12 Sep 2022 14:52:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbiILMwX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Sep 2022 08:52:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiILMwV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Sep 2022 08:52:21 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED6822F016
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 05:52:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 57D7BB80D31
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 12:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6C40C4347C
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 12:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662987136;
        bh=tDN6Lp99vzxDklGgjsfnm8lXsGOKVKBwyFMtxmKwy5I=;
        h=From:To:Subject:Date:From;
        b=oFY6Bk4MyUqvoY31fMiokyRiB4IW+u5WTfuzDI2+uu/kwAsz7sB4FDgacxUkcqNB/
         YIQPpq7qe9L7DTfJGnUDL7CtOI+TzD6p3N6BOwPKhjT3pAj0s02aaoiNF/GzdN5ifp
         mD3XtL5JXSETI5yPckENbQ2GTDLDS560RzkdFXou69e1XqPi0o5Wx7u9vP/GN4k2Iu
         osPZyjJWuuf/aygCdfNOfLm0gdRLB4Kp3RVUXIZf9SqGdKisJCwWchMPhINdHXlSKL
         VdUA0Y26aBfOjs7NJS2yqcTBq/CwzEYAUOD/bSWMs+0fJYHz/LD3jfKvH/3VNxYt2h
         lR3dNWKYd+t4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BDF71C433E7; Mon, 12 Sep 2022 12:52:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216474] New: Dell XPS 13 9360/Dell DA300: USB Type-C: PCIe Bus
 Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
Date:   Mon, 12 Sep 2022 12:52:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216474-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216474

            Bug ID: 216474
           Summary: Dell XPS 13 9360/Dell DA300: USB Type-C: PCIe Bus
                    Error: severity=3DCorrected, type=3DData Link Layer,
                    (Receiver ID)
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pmenzel+bugzilla.kernel.org@molgen.mpg.de
        Regression: No

Created attachment 301790
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301790&action=3Dedit
Linux 5.19.6 messages (output of `dmesg`)

On a Dell XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022, connect a Dell DA300 =
to
the only USB Type-C port on the left side (with a network cable connect), L=
inux
logs the warnings below:

```
$ cat /proc/version
Linux version 5.19.0-1-amd64 (debian-kernel@lists.debian.org) (gcc-11 (Debi=
an
11.3.0-5) 11.3.0, GNU ld (GNU Binutils for Debian) 2.38.90.20220713) #1 SMP
PREEMPT_DYNAMIC Debian 5.19.6-1 (2022-09-01)
$ sudo dmesg --level=3Dwarn
[    0.076624] MDS CPU bug present and SMT on, data leak possible. See
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more
details.
[    0.076624] MMIO Stale Data CPU bug present and SMT on, data leak possib=
le.
See
https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/processor_mmio_s=
tale_data.html
for more details.
[    0.076744]  #3
[    0.125605] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    5.710957] pci 0000:01:00.0: PCIe Bus Error: severity=3DCorrected, type=
=3DData
Link Layer, (Receiver ID)
[    5.710959] pci 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[    5.710962] pci 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20
[    5.715022] hpet_acpi_add: no address or irqs in _CRS
[    5.763210] i8042: Warning: Keylock active
[    6.243229] wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control me=
thod
not found
[    6.393940] usb: port power management may be unreliable
[    7.305075] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled.
Duplicate IMA measurements will not be recorded in the IMA log.
[   13.016666] psmouse serio1: Failed to enable mouse on isa0060/serio1
[   17.115254] Bluetooth: hci0: HCI Read Default Erroneous Data Reporting
command is advertised, but not supported.
[   17.115260] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection
command is advertised, but not supported.
[   18.895120] ucsi_acpi USBC000:00: UCSI_GET_PDOS returned 0 bytes
[   19.503002] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[   19.503010] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[   19.503020] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[   23.087157] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[   23.087159] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[   23.087161] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[   60.200702] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[   60.200711] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[   60.200721] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  132.975224] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  132.975229] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  132.975234] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  245.711497] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  245.711508] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  245.711522] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  374.063307] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  374.063313] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  374.063321] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  650.671988] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  650.672000] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  650.672013] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  663.568015] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  663.568027] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  663.568040] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  668.271928] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  668.271939] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  668.271953] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  709.072061] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  709.072073] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  709.072086] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  725.935914] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  725.935925] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  725.935938] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  804.624208] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  804.624219] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  804.624232] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  830.320252] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  830.320263] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  830.320277] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  843.152216] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  843.152227] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  843.152240] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  872.752311] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  872.752322] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  872.752335] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  883.098480] pcieport 0000:00:1c.4: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Transmitter ID)
[  883.098491] pcieport 0000:00:1c.4:   device [8086:9d14] error
status/mask=3D00001000/00002000
[  883.098504] pcieport 0000:00:1c.4:    [12] Timeout=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  936.656391] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  936.656402] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  936.656415] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  949.552431] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  949.552442] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  949.552455] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  970.768460] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  970.768471] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  970.768484] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[  981.568365] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[  981.568376] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[  981.568389] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[ 1044.112554] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[ 1044.112565] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[ 1044.112578] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[ 1147.920722] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[ 1147.920733] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[ 1147.920747] pcieport 0000:01:00.0:    [ 7] BadDLLP=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
[ 1169.168746] pcieport 0000:01:00.0: PCIe Bus Error: severity=3DCorrected,
type=3DData Link Layer, (Receiver ID)
[ 1169.168757] pcieport 0000:01:00.0:   device [8086:1576] error
status/mask=3D00000080/00002000
[ 1169.168770] pcieport 0000:01:00.0:    [ 7] BadDLLP
```

```
$ lspci -nn
00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen Core
Processor Host Bridge/DRAM Registers [8086:5904] (rev 02)
00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 620
[8086:5916] (rev 02)
00:04.0 Signal processing controller [1180]: Intel Corporation Xeon E3-1200
v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem [8086:1903] (rev 02)
00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 3.0 x=
HCI
Controller [8086:9d2f] (rev 21)
00:14.2 Signal processing controller [1180]: Intel Corporation Sunrise Poin=
t-LP
Thermal subsystem [8086:9d31] (rev 21)
00:15.0 Signal processing controller [1180]: Intel Corporation Sunrise Poin=
t-LP
Serial IO I2C Controller #0 [8086:9d60] (rev 21)
00:15.1 Signal processing controller [1180]: Intel Corporation Sunrise Poin=
t-LP
Serial IO I2C Controller #1 [8086:9d61] (rev 21)
00:16.0 Communication controller [0780]: Intel Corporation Sunrise Point-LP
CSME HECI #1 [8086:9d3a] (rev 21)
00:1c.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI Express R=
oot
Port #1 [8086:9d10] (rev f1)
00:1c.4 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI Express R=
oot
Port #5 [8086:9d14] (rev f1)
00:1c.5 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI Express R=
oot
Port #6 [8086:9d15] (rev f1)
00:1d.0 PCI bridge [0604]: Intel Corporation Sunrise Point-LP PCI Express R=
oot
Port #9 [8086:9d18] (rev f1)
00:1f.0 ISA bridge [0601]: Intel Corporation Sunrise Point-LP LPC Controller
[8086:9d58] (rev 21)
00:1f.2 Memory controller [0580]: Intel Corporation Sunrise Point-LP PMC
[8086:9d21] (rev 21)
00:1f.3 Audio device [0403]: Intel Corporation Sunrise Point-LP HD Audio
[8086:9d71] (rev 21)
00:1f.4 SMBus [0c05]: Intel Corporation Sunrise Point-LP SMBus [8086:9d23] =
(rev
21)
01:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 Bridge
[Alpine Ridge 2C 2015] [8086:1576]
02:00.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 Bridge
[Alpine Ridge 2C 2015] [8086:1576]
02:01.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 Bridge
[Alpine Ridge 2C 2015] [8086:1576]
02:02.0 PCI bridge [0604]: Intel Corporation DSL6340 Thunderbolt 3 Bridge
[Alpine Ridge 2C 2015] [8086:1576]
39:00.0 USB controller [0c03]: Intel Corporation DSL6340 USB 3.1 Controller
[Alpine Ridge] [8086:15b5]
3a:00.0 Network controller [0280]: Qualcomm Atheros QCA6174 802.11ac Wirele=
ss
Network Adapter [168c:003e] (rev 32)
3b:00.0 Unassigned class [ff00]: Realtek Semiconductor Co., Ltd. RTS525A PCI
Express Card Reader [10ec:525a] (rev 01)
3c:00.0 Non-Volatile memory controller [0108]: SK hynix PC300 NVMe Solid St=
ate
Drive 512GB [1c5c:1284]
$ lsusb
Bus 004 Device 003: ID 0bda:8153 Realtek Semiconductor Corp. RTL8153 Gigabit
Ethernet Adapter
Bus 004 Device 002: ID 2109:0820 VIA Labs, Inc. VL820 Hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID 06c4:c412 Bizlink International Corp. DELL DA300
Bus 003 Device 002: ID 2109:2820 VIA Labs, Inc. VL820 Hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 004: ID 0c45:670c Microdia Integrated Webcam HD
Bus 001 Device 003: ID 04f3:2234 Elan Microelectronics Corp. Touchscreen
Bus 001 Device 002: ID 0cf3:e300 Qualcomm Atheros Communications QCA61x4
Bluetooth 4.0
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
