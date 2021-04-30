Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB41370124
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 21:27:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231259AbhD3T2C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 15:28:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:50542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230356AbhD3T2C (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 15:28:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id BB993610FB
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619810833;
        bh=WaeZcegYo6DSqa5wA7hFCTg4CHlH7Y7Xz5e75yI/IWE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=As0ldWvx9SPP2kTsE15wEA+70GfNszvEd61p3yrMDz2h/JbYgcOdrPf+vblcHRCmu
         UhQqoueUuICtam2nG1ZkXweG5l+IXllA5g5BZ/vtpfvjOO28LSyAz4KEZvinBNeJgG
         Gobguveuk4sgKdJwxPTQfbncShwhE9oSFK+UoDIF1Tmh6FKgvYs0Lb2jlUMyOqr6ew
         oXl5bKrxsBFuryFww8E6xNZCMznazjRM6pcSFxOQwPzD3hyDe05p3goe5kB/HuFt7T
         9ykE1+tzxfl/B1SBOJswQo4AZQ8WMYFrtVunRpLR5fsI8fM1t4CcrH5lXgRIZELn9k
         GWNRmi/CmiiPA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id B968961245; Fri, 30 Apr 2021 19:27:13 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212901] Inventra Highspeed Dual Role Controller (MUSB)
 kernfs_find_ns NULL pointer dereference during early boot
Date:   Fri, 30 Apr 2021 19:27:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jdoe35087@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212901-208809-6yibvvFszr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212901-208809@https.bugzilla.kernel.org/>
References: <bug-212901-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212901

--- Comment #1 from jdoe35087@gmail.com ---
Update by original bug reporter
This seems like a problem with the MUSB driver in dual role mode. I shouldn=
't
have submitted it here in the FS topic. The full stack trace is printed bel=
ow.

The panic occurs when the following item is set to 'Dual Role Mode'. The ke=
rnel
does not panic when it is set into 'host only mode'

Device Drivers >=20
    USB Support >=20
        Inventra Highspeed Dual Role Controller >=20
            MUSB Mode Selection

--------------

[    1.393586] 8<--- cut here ---
[    1.396657] Unable to handle kernel NULL pointer dereference at virtual
address 00000050
[    1.404922] pgd =3D e4f2b729
[    1.407708] [00000050] *pgd=3D00000000
[    1.411364] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    1.416702] Modules linked in:
[    1.419778] CPU: 0 PID: 52 Comm: kworker/0:1 Not tainted 5.4.115-dirty #3
[    1.426593] Hardware name: Generic AM33XX (Flattened Device Tree)
[    1.432738] Workqueue: events deferred_probe_work_func
[    1.437914] PC is at kernfs_find_ns+0x18/0x114
[    1.442378] LR is at kernfs_find_and_get_ns+0x40/0x58
[    1.447450] pc : [<c032a2bc>]    lr : [<c032ab00>]    psr: 60000013
[    1.453742] sp : df2a3960  ip : df2a3990  fp : df2a398c
[    1.458987] r10: 00000002  r9 : 00000000  r8 : df4f1040
[    1.464232] r7 : 00000000  r6 : c083a5e0  r5 : 00000000  r4 : c0b39024
[    1.470786] r3 : df276bc0  r2 : 00000000  r1 : c083a5e0  r0 : 00000000
[    1.477343] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment
none
[    1.484508] Control: 10c5387d  Table: 80004019  DAC: 00000051
[    1.490278] Process kworker/0:1 (pid: 52, stack limit =3D 0x3f5c7652)
[    1.496573] Stack: (0xdf2a3960 to 0xdf2a4000)
[    1.500953] 3960: 00000d44 df2a3964 df2a3964 8402c3db c0b39024 00000000
c083a5e0 00000000
[    1.509168] 3980: df2a39ac df2a3990 c032ab00 c032a2b0 c083a5a4 00000010
df4f11a8 df4f0040
[    1.517384] 39a0: df2a39c4 df2a39b0 c032f588 c032aacc df4f11a8 00000010
df2a39dc df2a39c8
[    1.525600] 39c0: c04b9b20 c032f56c df4f11ec 00000010 df2a3a2c df2a39e0
c04a96b4 c04b9b00
[    1.533817] 39e0: df4f1170 00000000 ffffffea df4f11a8 df2a3a0c df2a3a00
c04a8c90 8402c3db
[    1.542033] 3a00: df2a3a34 df4f11a8 00000010 00000010 df4f0040 df4f1040
00000000 00000002
[    1.550249] 3a20: df2a3a44 df2a3a30 c04a9a94 c04a963c ffffffea 00000010
df2a3a74 df2a3a48
[    1.558466] 3a40: c051d7a0 c04a9a84 00000000 df4f0040 df4f0040 df4f0040
df4f1040 c0b8e59c
[    1.566682] 3a60: df48ca00 df48e640 df2a3b34 df2a3a78 c0511348 c051d600
df48e680 df4f0040
[    1.574897] 3a80: 00000400 c040bbd8 df48ca00 df48e640 c0b8e59c c097f5d4
c0964638 00000036
[    1.583114] 3aa0: c0991af8 df48ca10 5455baf8 382d494d 7964202c 4946206e
2c734f46 6c756220
[    1.591331] 3ac0: 6f63206b 6e69626d 62202c65 206b6c75 696c7073 48202c74
53492d42 7852204f
[    1.599547] 3ae0: 4248202c 4f53492d 2c785420 666f5320 6e6f4374 c032006e
df2a3b2c df2a3b08
[    1.607763] 3b00: c032eac4 8402c3db df48ca10 00000000 df48ca10 c0b4a780
c0b8dd28 00000000
[    1.615980] 3b20: c0b4a780 00000007 df2a3b54 df2a3b38 c04b0ef4 c05109f8
df48ca10 c0b8dd24
[    1.624196] 3b40: 00000000 c0b8dd28 df2a3b8c df2a3b58 c04aeb48 c04b0ea8
c07541bc c016593c
[    1.632412] 3b60: df2a3b8c df48ca10 c0b4a780 df48ca10 c0b8dd00 00000000
00000000 c0b12db4
[    1.640628] 3b80: df2a3bbc df2a3b90 c04af1b0 c04aea50 df48ca10 c0b8dd00
df2a3bbc c0b4a780
[    1.648845] 3ba0: df2a3c14 df48ca10 c0b8dd00 00000000 df2a3bdc df2a3bc0
c04af490 c04af14c
[    1.657061] 3bc0: 00000000 df2a3c14 c04af3d8 c0b8dd00 df2a3c0c df2a3be0
c04ac84c c04af3e4
[    1.665277] 3be0: df2a3c0c df09fe6c df395c38 8402c3db df48ca10 df48ca10
00000001 df48ca54
[    1.673493] 3c00: df2a3c3c df2a3c10 c04ae720 c04ac7c8 c0732864 df48ca10
00000001 8402c3db
[    1.681709] 3c20: 00000000 df48ca10 c0b47368 df48ca10 df2a3c4c df2a3c40
c04af4e0 c04ae64c
[    1.689925] 3c40: df2a3c6c df2a3c50 c04adaf8 c04af4d0 df48ca10 00000000
df3a8810 c0b8dd00
[    1.698141] 3c60: df2a3cac df2a3c70 c04aa1f0 c04ada70 df2a3c94 df2a3c80
df2a3c94 df2a3c88
[    1.706357] 3c80: c0754218 8402c3db df48e620 df48ca00 00000002 00000000
df48ca10 c0b12d94
[    1.714573] 3ca0: df2a3cdc df2a3cb0 c04b0c94 c04a9f0c c0165f02 00000000
df3a8810 dfbf8080
[    1.722789] 3cc0: df48ca00 c0b4b738 df47cdc0 00000007 df2a3d74 df2a3ce0
c05209b8 c04b0b80
[    1.731006] 3ce0: 00000000 df2a3d74 00000001 c0165f02 c04bb468 8402c3db
df2a3dfa c01b16d4
[    1.739222] 3d00: df47cdc0 df2a3d10 c0b4b738 47401400 474017ff cfffb984
00000200 00000000
[    1.747438] 3d20: 00000000 00000000 00000000 00000036 00000036 cfffb9ac
00000400 00000000
[    1.755654] 3d40: 00000000 00000000 00000000 8402c3db df3a8800 df43fd00
00000000 df3a8810
[    1.763870] 3d60: c099205c c0b4b6dc df2a3dac df2a3d78 c0520b78 c052076c
00002000 c099205c
[    1.772086] 3d80: df43fd00 df3a8810 df3a8810 00000000 df3a8810 c0b4b6dc
c0b8dd28 00000000
[    1.780301] 3da0: df2a3dcc df2a3db0 c04b0ef4 c0520aa8 df3a8810 c0b8dd24
00000000 c0b8dd28
[    1.788517] 3dc0: df2a3e04 df2a3dd0 c04aeb48 c04b0ea8 c07541bc c016593c
df2a3e04 df3a8810
[    1.796734] 3de0: c0b4b6dc df3a8810 dfbcfd00 00000000 00000000 00000000
df2a3e34 df2a3e08
[    1.804950] 3e00: c04af1b0 c04aea50 df3a8810 dfbcfd00 df2a3e34 c0b4b6dc
df2a3e8c df3a8810
[    1.813166] 3e20: dfbcfd00 00000000 df2a3e54 df2a3e38 c04af490 c04af14c
00000000 df2a3e8c
[    1.821383] 3e40: c04af3d8 dfbcfd00 df2a3e84 df2a3e58 c04ac84c c04af3e4
df2a3e84 df09fe6c
[    1.829599] 3e60: df395cb8 8402c3db df3a8810 df3a8810 00000001 df3a8854
df2a3eb4 df2a3e88
[    1.837816] 3e80: c04ae720 c04ac7c8 c0b47120 df3a8810 00000001 8402c3db
df2a3ecc df3a8810
[    1.846032] 3ea0: c0b47368 df3a8810 df2a3ec4 df2a3eb8 c04af4e0 c04ae64c
df2a3ee4 df2a3ec8
[    1.854248] 3ec0: c04adaf8 c04af4d0 df3a8810 c0b4710c c0b47120 dfbcfd00
df2a3f04 df2a3ee8
[    1.862463] 3ee0: c04adf60 c04ada70 c0b47144 df285580 dfbccb40 dfbcfd00
df2a3f3c df2a3f08
[    1.870679] 3f00: c0157f54 c04adefc df2a3f24 dfbccb40 dfbccb40 df285580
dfbccb40 df285594
[    1.878896] 3f20: dfbccb58 c0b03d00 00000008 dfbccb40 df2a3f74 df2a3f40
c0158528 c0157d5c
[    1.887112] 3f40: df2a3f74 df2a2000 c015dffc df273700 df273600 df2a2000
00000000 df285580
[    1.895328] 3f60: c01582f0 df101e84 df2a3fac df2a3f78 c015e318 c01582fc
00000000 df27371c
[    1.903543] 3f80: df2a3fac df273600 c015e1ac 00000000 00000000 00000000
00000000 00000000
[    1.911758] 3fa0: 00000000 df2a3fb0 c01010e8 c015e1b8 00000000 00000000
00000000 00000000
[    1.919975] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[    1.928190] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
00000000 00000000
[    1.936399] Backtrace:
[    1.938865] [<c032a2a4>] (kernfs_find_ns) from [<c032ab00>]
(kernfs_find_and_get_ns+0x40/0x58)
[    1.947518]  r7:00000000 r6:c083a5e0 r5:00000000 r4:c0b39024
[    1.953211] [<c032aac0>] (kernfs_find_and_get_ns) from [<c032f588>]
(sysfs_unmerge_group+0x28/0x68)
[    1.962298]  r7:df4f0040 r6:df4f11a8 r5:00000010 r4:c083a5a4
[    1.967986] [<c032f560>] (sysfs_unmerge_group) from [<c04b9b20>]
(dpm_sysfs_remove+0x2c/0x6c)
[    1.976547]  r5:00000010 r4:df4f11a8
[    1.980140] [<c04b9af4>] (dpm_sysfs_remove) from [<c04a96b4>]
(device_del+0x84/0x448)
[    1.988003]  r5:00000010 r4:df4f11ec
[    1.991595] [<c04a9630>] (device_del) from [<c04a9a94>]
(device_unregister+0x1c/0x30)
[    1.999460]  r10:00000002 r9:00000000 r8:df4f1040 r7:df4f0040 r6:00000010
r5:00000010
[    2.007323]  r4:df4f11a8
[    2.009875] [<c04a9a78>] (device_unregister) from [<c051d7a0>]
(musb_gadget_setup+0x1ac/0x1bc)
[    2.018522]  r5:00000010 r4:ffffffea
[    2.022116] [<c051d5f4>] (musb_gadget_setup) from [<c0511348>]
(musb_probe+0x95c/0xc30)
[    2.030156]  r8:df48e640 r7:df48ca00 r6:c0b8e59c r5:df4f1040 r4:df4f0040
[    2.036894] [<c05109ec>] (musb_probe) from [<c04b0ef4>]
(platform_drv_probe+0x58/0xa8)
[    2.044848]  r10:00000007 r9:c0b4a780 r8:00000000 r7:c0b8dd28 r6:c0b4a780
r5:df48ca10
[    2.052709]  r4:00000000
[    2.055257] [<c04b0e9c>] (platform_drv_probe) from [<c04aeb48>]
(really_probe+0x104/0x45c)
[    2.063557]  r7:c0b8dd28 r6:00000000 r5:c0b8dd24 r4:df48ca10
[    2.069244] [<c04aea44>] (really_probe) from [<c04af1b0>]
(driver_probe_device+0x70/0x180)
[    2.077548]  r10:c0b12db4 r9:00000000 r8:00000000 r7:c0b8dd00 r6:df48ca10
r5:c0b4a780
[    2.085409]  r4:df48ca10
[    2.087957] [<c04af140>] (driver_probe_device) from [<c04af490>]
(__device_attach_driver+0xb8/0xec)
[    2.097044]  r8:00000000 r7:c0b8dd00 r6:df48ca10 r5:df2a3c14 r4:c0b4a780
[    2.103777] [<c04af3d8>] (__device_attach_driver) from [<c04ac84c>]
(bus_for_each_drv+0x90/0xe0)
[    2.112602]  r7:c0b8dd00 r6:c04af3d8 r5:df2a3c14 r4:00000000
[    2.118289] [<c04ac7bc>] (bus_for_each_drv) from [<c04ae720>]
(__device_attach+0xe0/0x19c)
[    2.126588]  r6:df48ca54 r5:00000001 r4:df48ca10
[    2.131229] [<c04ae640>] (__device_attach) from [<c04af4e0>]
(device_initial_probe+0x1c/0x20)
[    2.139790]  r6:df48ca10 r5:c0b47368 r4:df48ca10
[    2.144430] [<c04af4c4>] (device_initial_probe) from [<c04adaf8>]
(bus_probe_device+0x94/0x9c)
[    2.153082] [<c04ada64>] (bus_probe_device) from [<c04aa1f0>]
(device_add+0x2f0/0x64c)
[    2.161034]  r7:c0b8dd00 r6:df3a8810 r5:00000000 r4:df48ca10
[    2.166722] [<c04a9f00>] (device_add) from [<c04b0c94>]
(platform_device_add+0x120/0x218)
[    2.174937]  r9:c0b12d94 r8:df48ca10 r7:00000000 r6:00000002 r5:df48ca00
r4:df48e620
[    2.182721] [<c04b0b74>] (platform_device_add) from [<c05209b8>]
(dsps_create_musb_pdev+0x258/0x33c)
[    2.191897]  r10:00000007 r9:df47cdc0 r8:c0b4b738 r7:df48ca00 r6:dfbf8080
r5:df3a8810
[    2.199759]  r4:00000000 r3:c0165f02
[    2.203353] [<c0520760>] (dsps_create_musb_pdev) from [<c0520b78>]
(dsps_probe+0xdc/0x1c0)
[    2.211656]  r9:c0b4b6dc r8:c099205c r7:df3a8810 r6:00000000 r5:df43fd00
r4:df3a8800
[    2.219437] [<c0520a9c>] (dsps_probe) from [<c04b0ef4>]
(platform_drv_probe+0x58/0xa8)
[    2.227389]  r8:00000000 r7:c0b8dd28 r6:c0b4b6dc r5:df3a8810 r4:00000000
[    2.234123] [<c04b0e9c>] (platform_drv_probe) from [<c04aeb48>]
(really_probe+0x104/0x45c)
[    2.242423]  r7:c0b8dd28 r6:00000000 r5:c0b8dd24 r4:df3a8810
[    2.248111] [<c04aea44>] (really_probe) from [<c04af1b0>]
(driver_probe_device+0x70/0x180)
[    2.256413]  r10:00000000 r9:00000000 r8:00000000 r7:dfbcfd00 r6:df3a8810
r5:c0b4b6dc
[    2.264274]  r4:df3a8810
[    2.266822] [<c04af140>] (driver_probe_device) from [<c04af490>]
(__device_attach_driver+0xb8/0xec)
[    2.275909]  r8:00000000 r7:dfbcfd00 r6:df3a8810 r5:df2a3e8c r4:c0b4b6dc
[    2.282642] [<c04af3d8>] (__device_attach_driver) from [<c04ac84c>]
(bus_for_each_drv+0x90/0xe0)
[    2.291465]  r7:dfbcfd00 r6:c04af3d8 r5:df2a3e8c r4:00000000
[    2.297152] [<c04ac7bc>] (bus_for_each_drv) from [<c04ae720>]
(__device_attach+0xe0/0x19c)
[    2.305452]  r6:df3a8854 r5:00000001 r4:df3a8810
[    2.310092] [<c04ae640>] (__device_attach) from [<c04af4e0>]
(device_initial_probe+0x1c/0x20)
[    2.318654]  r6:df3a8810 r5:c0b47368 r4:df3a8810
[    2.323294] [<c04af4c4>] (device_initial_probe) from [<c04adaf8>]
(bus_probe_device+0x94/0x9c)
[    2.331946] [<c04ada64>] (bus_probe_device) from [<c04adf60>]
(deferred_probe_work_func+0x70/0x9c)
[    2.340945]  r7:dfbcfd00 r6:c0b47120 r5:c0b4710c r4:df3a8810
[    2.346638] [<c04adef0>] (deferred_probe_work_func) from [<c0157f54>]
(process_one_work+0x204/0x5a0)
[    2.355810]  r7:dfbcfd00 r6:dfbccb40 r5:df285580 r4:c0b47144
[    2.361496] [<c0157d50>] (process_one_work) from [<c0158528>]
(worker_thread+0x238/0x584)
[    2.369711]  r10:dfbccb40 r9:00000008 r8:c0b03d00 r7:dfbccb58 r6:df285594
r5:dfbccb40
[    2.377573]  r4:df285580
[    2.380126] [<c01582f0>] (worker_thread) from [<c015e318>]
(kthread+0x16c/0x184)
[    2.387556]  r10:df101e84 r9:c01582f0 r8:df285580 r7:00000000 r6:df2a2000
r5:df273600
[    2.395418]  r4:df273700
[    2.397966] [<c015e1ac>] (kthread) from [<c01010e8>]
(ret_from_fork+0x14/0x2c)
[    2.405218] Exception stack(0xdf2a3fb0 to 0xdf2a3ff8)
[    2.410292] 3fa0:                                     00000000 00000000
00000000 00000000
[    2.418508] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[    2.426722] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.433367]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000
r5:c015e1ac
[    2.441229]  r4:df273600
[    2.443776] Code: e24cb004 e24dd010 e52de004 e8bd4000 (e1d035b0)
[    2.450053] ---[ end trace 715d8f953e5915b6 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
