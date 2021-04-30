Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9A88370123
	for <lists+linux-usb@lfdr.de>; Fri, 30 Apr 2021 21:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230475AbhD3T1Z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Apr 2021 15:27:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:50270 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230356AbhD3T1Z (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 30 Apr 2021 15:27:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id ABC0461107
        for <linux-usb@vger.kernel.org>; Fri, 30 Apr 2021 19:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619810796;
        bh=GfEIPmfQIKt/UKy8gv+wvTOAj3sZ6dQZMTN2tORcpig=;
        h=From:To:Subject:Date:From;
        b=lbwgKfnWX7wplgrt0yv/CAanGwBzzEBlldN7fT+v5OEWjA225LvlZPufpltDcHY93
         n4xOXJwUXR1QQs5eq0IIRWFlX6bbPNoR4s+91qwIGjmgV1G7T5jvRrzSTbXGDalHX3
         2l/qJ/9H3flX3eKpcQx+0gftfje6Ja/azOk20WMkfK06XJe5Pj/BbbZG4B/YEjSyV7
         Sd+R91jxO+JqDn3v2dnkQPk2roKMueVov7RtW2I2x6K5uauEblLXntPWPheqHnKlzR
         JgtggKfiTY/QPrLPw1jqJ8gWEWjC5WgapqdTakOlppngobgixC9pefvPiTJJtRgdq3
         sKKs6XVu5Rc3g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id A9865611CA; Fri, 30 Apr 2021 19:26:36 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212901] New: Inventra Highspeed Dual Role Controller (MUSB)
 kernfs_find_ns NULL pointer dereference during early boot
Date:   Fri, 30 Apr 2021 19:26:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cc cf_regression
Message-ID: <bug-212901-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212901

            Bug ID: 212901
           Summary: Inventra Highspeed Dual Role Controller (MUSB)
                    kernfs_find_ns NULL pointer dereference during early
                    boot
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.4.115
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jdoe35087@gmail.com
                CC: fs_other@kernel-bugs.osdl.org
        Regression: No

+++ This bug was initially created as a clone of Bug #212899 +++

NULL pointer dereference during early boot, for custom .config (attached) b=
uilt
for AM335x (Texas Instruments ARMv7). The kernel seems to experience a NULL
dereference in `kernfs_find_ns`


```
[    1.153488] 8<--- cut here ---
[    1.156579] Unable to handle kernel NULL pointer dereference at virtual
address 00000050
[    1.164802] pgd =3D fe4dc533
[    1.167520] [00000050] *pgd=3D00000000
[    1.171198] Internal error: Oops: 5 [#1] PREEMPT ARM
[    1.176184] Modules linked in:
[    1.179257] CPU: 0 PID: 52 Comm: kworker/0:1 Not tainted 5.4.115 #4
[    1.185547] Hardware name: Generic AM33XX (Flattened Device Tree)
[    1.191688] Workqueue: events deferred_probe_work_func
[    1.196863] PC is at kernfs_find_ns+0xc/0x104
[    1.201238] LR is at kernfs_find_and_get_ns+0x30/0x48
[    1.206307] pc : [<c02c4954>]    lr : [<c02c4a7c>]    psr: 60000013
[    1.212597] sp : df247b7c  ip : df204fc0  fp : 00000000
[    1.217841] r10: c084d8ac  r9 : 00000000  r8 : df3c9040
[    1.223084] r7 : 00000000  r6 : 00000000  r5 : 00000000  r4 : c0a1d5dc
[    1.229636] r3 : df204fc0  r2 : 00000000  r1 : c0731c98  r0 : 00000000
[    1.236191] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment
none
[    1.243354] Control: 10c5387d  Table: 80004019  DAC: 00000051
[    1.249123] Process kworker/0:1 (pid: 52, stack limit =3D 0xd9398f29)
[    1.255415] Stack: (0xdf247b7c to 0xdf248000)
[    1.259788] 7b60:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
    c0a1d5dc
[    1.268001] 7b80: 00000000 c0731c98 00000000 c02c4a7c c0731c5c df3c91a0
00000010 df3c8040
[    1.276215] 7ba0: df3c9040 c02c9820 df3c91a0 df3c91a0 00000010 c0431e88
df3c91e4 c04231e8
[    1.284428] 7bc0: c0a2bc90 df3c9168 df34e000 df3c9168 df34e000 de614d2e
df3c91a0 df3c91a0
[    1.292642] 7be0: 00000010 00000010 df3c8040 df3c9040 e08b6400 c084d8ac
00000000 c04235d4
[    1.300855] 7c00: ffffffea c048c904 00000000 c0a5f57c df3c8040 df3c9040
c0a5f57c 00000002
[    1.309069] 7c20: df34c240 c04829bc df34c280 df3c8040 00000400 dfb78080
df348a10 00000036
[    1.317283] 7c40: c08257fc df34c240 df348a00 c0a5f57c 54550000 382d494d
7964202c 4946206e
[    1.325496] 7c60: 2c734f46 6c756220 6f63206b 6e69626d 62202c65 206b6c75
696c7073 48202c74
[    1.333710] 7c80: 53492d42 7852204f 4248202c 4f53492d 2c785420 666f5320
6e6f4374 df34006e
[    1.341923] 7ca0: 00000001 c02c7f14 00000000 de614d2e df2e1580 00000000
df348a10 c0a2b1f4
[    1.350137] 7cc0: 00000000 c0a2b1f4 00000006 c0a108ac df1c40d8 c042a0c4
c0a5ecf0 df348a10
[    1.358350] 7ce0: 00000000 c0428044 df348a10 c0a2b1f4 c04286e8 c0a5eccc
00000000 00000000
[    1.366564] 7d00: c0a108ac c04284dc c0a2b1f4 c0428760 00000000 df247d4c
c04286e8 c0a5eccc
[    1.374778] 7d20: 00000000 c0425ebc c0a5eccc df03729c df2e15b4 de614d2e
df348a10 00000001
[    1.382991] 7d40: df348a54 c0427d6c df34c340 df348a10 00000001 de614d2e
df348a10 c0a28908
[    1.391205] 7d60: df348a10 c04270e8 df348a10 00000000 df2f0610 c0423e04
dfb78080 df348a00
[    1.399419] 7d80: df348a10 c0a108cc c0a108cc de614d2e df1c40d8 df34c220
df348a00 00000002
[    1.407632] 7da0: 00000000 df348a10 c0a108cc c0429e98 00000000 df2f0610
dfb78080 df348a00
[    1.415846] 7dc0: df34a6c0 c0a2b4b8 00000000 c048e978 00000000 00000000
00000001 00000002
[    1.424059] 7de0: df3ae0b8 c0177324 df247efa dfb62384 df34a6c0 de614d2e
c0a2b4b8 47401400
[    1.432273] 7e00: 474017ff cfffb984 00000200 00000000 00000000 00000000
00000000 00000036
[    1.440486] 7e20: 00000036 cfffb9ac 00000400 00000000 00000000 00000000
00000000 de614d2e
[    1.448700] 7e40: df1c40d8 df2f0600 df38e4c0 00000000 df2f0610 c084de10
00000006 c048eb24
[    1.456914] 7e60: 00002000 c084de10 df38e4c0 c0a2b45c 00000000 df2f0610
c0a2b45c 00000000
[    1.465127] 7e80: c0a2b45c c042a0c4 c0a5ecf0 df2f0610 00000000 c0428044
df2f0610 c0a2b45c
[    1.473341] 7ea0: c04286e8 dfb4e200 00000000 c0a286e8 00000000 c04284dc
c0a2b45c c0428760
[    1.481554] 7ec0: 00000000 df247efc c04286e8 dfb4e200 00000000 c0425ebc
dfb4e200 df03729c
[    1.489768] 7ee0: df2e1634 de614d2e df2f0610 00000001 df2f0654 c0427d6c
df2c1210 df2f0610
[    1.497982] 7f00: 00000001 de614d2e df2f0610 c0a28908 df2f0610 c04270e8
df2f0610 c0a286bc
[    1.506195] 7f20: c0a286c8 c0427500 c0a286e4 df1f3580 00000000 c014b600
c0a15ee0 c0a11d18
[    1.514409] 7f40: df1f3580 c0a11d04 df1f3594 c0a15ee0 c0a11d18 df246000
c0a11d04 c014bae0
[    1.522622] 7f60: 00000000 df1c40c0 df1f4ac0 df246000 00000000 df06fed0
df1f3580 c014b884
[    1.530836] 7f80: df1c40d8 c01514b8 00000000 df1f4ac0 c015135c 00000000
00000000 00000000
[    1.539049] 7fa0: 00000000 00000000 00000000 c01010e8 00000000 00000000
00000000 00000000
[    1.547262] 7fc0: 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000
[    1.555475] 7fe0: 00000000 00000000 00000000 00000000 00000013 00000000
00000000 00000000
[    1.563702] [<c02c4954>] (kernfs_find_ns) from [<df3c9040>] (0xdf3c9040)
[    1.570436] Code: e12fff1e e92d40f0 e1a06002 e2522000 (e1d035b0)
[    1.576637] ---[ end trace f6c0fff5959bcdf2 ]---
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
