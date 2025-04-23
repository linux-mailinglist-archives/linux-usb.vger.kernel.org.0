Return-Path: <linux-usb+bounces-23378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B0EA98A06
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 14:43:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5D757A6A73
	for <lists+linux-usb@lfdr.de>; Wed, 23 Apr 2025 12:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E927F26FA77;
	Wed, 23 Apr 2025 12:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fF/nb5rn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E8026F475
	for <linux-usb@vger.kernel.org>; Wed, 23 Apr 2025 12:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745412174; cv=none; b=YKUgx8Y0limBd4VZqtR8l5+Qjq9KkAM8hjL9JE6fstJR7MWCPkS36l5reiy+qQGxWQNO2RUugzBtHiEjfAkbqj4h9TtEs6NkylHh9NeVdAgS1mknCZaAQVQsEG+paswdI9OzWPe/B3gbWhi55Lyi44lcMvWsJEXiBIEOIQNOSVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745412174; c=relaxed/simple;
	bh=zZPwEZRSQjKGCvsSvBfYxBzin2AbsFTnuUxRRn+vMW8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=CU2iOJT5dojtjgBtyPXFWEHglTXFS+F1HvccekX5oKuzvmy0TAc2M0im6Np1o59eweW7i2AscQ+jsqo/3Db2tv8MRMZkmKbp200riWABeUoEJI9IugXplKp4xmtUZvlAf06qhEmxD8xbAJDhLl1lJj92gFsHgrJL++Qb1dS725s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fF/nb5rn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4729C4CEEB
	for <linux-usb@vger.kernel.org>; Wed, 23 Apr 2025 12:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745412173;
	bh=zZPwEZRSQjKGCvsSvBfYxBzin2AbsFTnuUxRRn+vMW8=;
	h=From:To:Subject:Date:From;
	b=fF/nb5rnypns8KfjlixX0jRrbbggdP19a8A+/2fTQcHSFoMLoS23n0w7gkjFB1NeH
	 PTD2fBX04ogk11odrgwDW4SMY1KdmQBqirRZxrB2vYqJnXQz/XKlqPvaAPSRWyKrv+
	 LObYv7elgrLFUwcUgGeTWVsm/W+Eo7XtOELTjDUkHNKgR1DWhzk0Pqaq1wbAB7xVz9
	 PLmjiTGY0H1vkTa5rDowaeKBU+6IpR/k3ezit6zB/JjQKByjRH508FG6iSjG1ZNHiD
	 9B9OJ0QJfpH6ClPj9LVOt1UzlVp25vPDSfD7zew3qzuPnJBmN76Km4N13epvI4txgj
	 xOxyYFz1ktYjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B106AC3279F; Wed, 23 Apr 2025 12:42:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220046] New: kmalloc Redzone overwritten in usbhid_parse and
 usb_get_status
Date: Wed, 23 Apr 2025 12:42:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m95d@psihoexpert.ro
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220046-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220046

            Bug ID: 220046
           Summary: kmalloc Redzone overwritten in usbhid_parse and
                    usb_get_status
           Product: Drivers
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: m95d@psihoexpert.ro
        Regression: No

Hi.

The system is Asus Tinkerboard S (RK3288, armv7).
I get this error a few seconds after boot if a USB keyboard is connected:

[  +0,007751] [  T265] [kmalloc Redzone overwritten] 0xc61ebec1-0xc61ebec3
@offset=3D7873. First byte 0x40 instead of 0xcc
[  +0,011900] [  T265]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[  +0,009952] [  T265] BUG kmalloc-128 (Tainted: G    B   W          ): Obj=
ect
corrupt
[  +0,008575] [  T265]
---------------------------------------------------------------------------=
--

[  +0,012348] [  T265] Allocated in usbhid_parse+0x4c0/0x940 age=3D1812 cpu=
=3D0
pid=3D63
[  +0,008183] [  T265]  usbhid_parse+0x4c0/0x940
[  +0,004880] [  T265]  hid_add_device+0x1ac/0xaf8
[  +0,005076] [  T265]  usbhid_probe+0xbdc/0x1208
[  +0,004973] [  T265]  usb_probe_interface+0x3f8/0xa40
[  +0,005559] [  T265]  really_probe+0x250/0x818
[  +0,004880] [  T265]  __driver_probe_device+0x1c4/0x404
[  +0,005754] [  T265]  driver_probe_device+0x58/0x154
[  +0,005459] [  T265]  __device_attach_driver+0x278/0x33c
[  +0,005848] [  T265]  bus_for_each_drv+0x14c/0x1b4
[  +0,005265] [  T265]  __device_attach+0x1d0/0x394
[  +0,005167] [  T265]  bus_probe_device+0x19c/0x1cc
[  +0,005264] [  T265]  device_add+0xb78/0x11ac
[  +0,004778] [  T265]  usb_set_configuration+0x11dc/0x1e54
[  +0,005946] [  T265]  usb_generic_driver_probe+0x8c/0xd0
[  +0,005847] [  T265]  usb_probe_device+0xc4/0x340
[  +0,005167] [  T265]  really_probe+0x250/0x818
[  +0,004878] [  T265] Slab 0xeeed44e8 objects=3D21 used=3D15 fp=3D0xc61eb4=
00
flags=3D0x240(workingset|head|zone=3D0)
[  +0,010611] [  T265] Object 0xc61ebe80 @offset=3D7808 fp=3D0x00000000

[  +0,009149] [  T265] Redzone  c61ebe00: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010605] [  T265] Redzone  c61ebe10: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010605] [  T265] Redzone  c61ebe20: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010603] [  T265] Redzone  c61ebe30: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010605] [  T265] Redzone  c61ebe40: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010604] [  T265] Redzone  c61ebe50: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010603] [  T265] Redzone  c61ebe60: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010604] [  T265] Redzone  c61ebe70: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010604] [  T265] Object   c61ebe80: 05 01 09 06 a1 01 05 07 19 e0 29 =
e7
15 00 25 01  ..........)...%.
[  +0,010604] [  T265] Object   c61ebe90: 75 01 95 08 81 02 95 01 75 08 81 =
01
95 03 75 01  u.......u.....u.
[  +0,010603] [  T265] Object   c61ebea0: 05 08 19 01 29 03 91 02 95 05 75 =
01
91 01 95 06  ....).....u.....
[  +0,010604] [  T265] Object   c61ebeb0: 75 08 05 07 19 00 2a ff 00 15 00 =
26
ff 00 81 00  u.....*....&....
[  +0,010603] [  T265] Object   c61ebec0: c0 40 ef 00 cc cc cc cc cc cc cc =
cc
cc cc cc cc  .@..............
[  +0,010604] [  T265] Object   c61ebed0: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010604] [  T265] Object   c61ebee0: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010604] [  T265] Object   c61ebef0: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010602] [  T265] Redzone  c61ebf00: cc cc cc cc=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
           ....
[  +0,009438] [  T265] Padding  c61ebf64: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a =
5a
5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[  +0,010604] [  T265] Padding  c61ebf74: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a =
5a=20=20
           ZZZZZZZZZZZZ
[  +0,010213] [  T265] ------------[ cut here ]------------
[  +0,005938] [  T265] WARNING: CPU: 1 PID: 265 at mm/slub.c:1110
check_bytes_and_report+0xf4/0x118
[  +0,009839] [  T265] CPU: 1 UID: 0 PID: 265 Comm: mdev Tainted: G    B   =
W=20=20=20
       6.15.0-rc3-M95D-00014-ge00e800e6d2a-dirty #1 NONE
[  +0,000019] [  T265] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN
[  +0,000005] [  T265] Hardware name: Rockchip (Device Tree)
[  +0,000006] [  T265] Call trace:
[  +0,000005] [  T265] [<c0101c44>] (unwind_backtrace) from [<c01566c8>]
(show_stack+0x10/0x28)
[  +0,000024] [  T265] [<c01566c8>] (show_stack) from [<c0140ee8>]
(dump_stack_lvl+0x58/0x94)
[  +0,000023] [  T265] [<c0140ee8>] (dump_stack_lvl) from [<c0196828>]
(__warn+0x12c/0x1b0)
[  +0,000020] [  T265] [<c0196828>] (__warn) from [<c0196af0>]
(warn_slowpath_fmt+0x244/0x24c)
[  +0,000015] [  T265] [<c0196af0>] (warn_slowpath_fmt) from [<c0529ad8>]
(check_bytes_and_report+0xf4/0x118)
[  +0,000018] [  T265] [<c0529ad8>] (check_bytes_and_report) from [<c0529e9=
c>]
(check_object+0x3a0/0x408)
[  +0,000017] [  T265] [<c0529e9c>] (check_object) from [<c052aa18>]
(free_debug_processing+0x120/0x2e4)
[  +0,000017] [  T265] [<c052aa18>] (free_debug_processing) from [<c052e0b4=
>]
(free_to_partial_list+0x70/0x278)
[  +0,000018] [  T265] [<c052e0b4>] (free_to_partial_list) from [<c0530234>]
(___cache_free+0xcc/0x114)
[  +0,000019] [  T265] [<c0530234>] (___cache_free) from [<c055fd74>]
(qlist_free_all+0x6c/0x108)
[  +0,000022] [  T265] [<c055fd74>] (qlist_free_all) from [<c0560270>]
(kasan_quarantine_reduce+0x124/0x180)
[  +0,000021] [  T265] [<c0560270>] (kasan_quarantine_reduce) from [<c055d3=
58>]
(__kasan_slab_alloc+0x5c/0x8c)
[  +0,000020] [  T265] [<c055d358>] (__kasan_slab_alloc) from [<c052c91c>]
(kmem_cache_alloc_noprof+0x160/0x254)
[  +0,000019] [  T265] [<c052c91c>] (kmem_cache_alloc_noprof) from [<c05cf0=
6c>]
(getname_flags+0x94/0x720)
[  +0,000019] [  T265] [<c05cf06c>] (getname_flags) from [<c05a44bc>]
(sys_statx+0xb8/0xd4)
[  +0,000018] [  T265] [<c05a44bc>] (sys_statx) from [<c0100060>]
(ret_fast_syscall+0x0/0x54)
[  +0,000016] [  T265] Exception stack(0xc85cffa8 to 0xc85cfff0)
[  +0,000012] [  T265] ffa0:                   b6b2ab20 b6b2ac88 ffffff9c
00263048 00000800 000007ff
[  +0,000011] [  T265] ffc0: b6b2ab20 b6b2ac88 00263048 0000018d 002aa5d8
00263048 00000001 00000000
[  +0,000010] [  T265] ffe0: 00000000 b6b2ab00 ffffff9c 0017dc4c
[  +0,000006] [  T265] ---[ end trace 0000000000000000 ]---
[  +0,227892] [  T265] FIX kmalloc-128: Restoring kmalloc Redzone
0xc61ebec1-0xc61ebec3=3D0xcc
[  +0,009150] [  T265] FIX kmalloc-128: Object at 0xc61ebe80 not freed

There's also an almost identical error in usb_get_status:

[  +0,104795] [  T265] [kmalloc Redzone overwritten] 0xc3f0e342-0xc3f0e343
@offset=3D834. First byte 0xff instead of 0xcc
[  +0,011804] [  T265]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[  +0,009926] [  T265] BUG kmalloc-64 (Tainted: G    B   W          ): Obje=
ct
corrupt
[  +0,008467] [  T265]
---------------------------------------------------------------------------=
--

[  +0,012347] [  T265] Allocated in usb_get_status+0x84/0x33c age=3D1977 cp=
u=3D2
pid=3D50
[  +0,008288] [  T265]  usb_get_status+0x84/0x33c
[  +0,004972] [  T265]  hub_configure+0x1164/0x1d34
[  +0,005171] [  T265]  hub_probe+0xde4/0xe90
[  +0,004586] [  T265]  usb_probe_interface+0x3f8/0xa40
[  +0,005557] [  T265]  really_probe+0x250/0x818
[  +0,004880] [  T265]  __driver_probe_device+0x1c4/0x404
[  +0,005751] [  T265]  driver_probe_device+0x58/0x154
[  +0,005461] [  T265]  __device_attach_driver+0x278/0x33c
[  +0,005847] [  T265]  bus_for_each_drv+0x14c/0x1b4
[  +0,005265] [  T265]  __device_attach+0x1d0/0x394
[  +0,005168] [  T265]  bus_probe_device+0x19c/0x1cc
[  +0,005265] [  T265]  device_add+0xb78/0x11ac
[  +0,004778] [  T265]  usb_set_configuration+0x11dc/0x1e54
[  +0,005946] [  T265]  usb_generic_driver_probe+0x8c/0xd0
[  +0,005848] [  T265]  usb_probe_device+0xc4/0x340
[  +0,005168] [  T265]  really_probe+0x250/0x818
[  +0,004877] [  T265] Slab 0xeee85df8 objects=3D16 used=3D9 fp=3D0xc3f0e440
flags=3D0x200(workingset|zone=3D0)
[  +0,010019] [  T265] Object 0xc3f0e340 @offset=3D832 fp=3D0xc3f0e440

[  +0,009052] [  T265] Redzone  c3f0e300: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010605] [  T265] Redzone  c3f0e310: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010605] [  T265] Redzone  c3f0e320: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010603] [  T265] Redzone  c3f0e330: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010605] [  T265] Object   c3f0e340: 01 00 ff df cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010604] [  T265] Object   c3f0e350: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010603] [  T265] Object   c3f0e360: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010604] [  T265] Object   c3f0e370: cc cc cc cc cc cc cc cc cc cc cc =
cc
cc cc cc cc  ................
[  +0,010603] [  T265] Redzone  c3f0e380: cc cc cc cc=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
           ....
[  +0,009438] [  T265] Padding  c3f0e3e4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a =
5a
5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
[  +0,010603] [  T265] Padding  c3f0e3f4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a =
5a=20=20
           ZZZZZZZZZZZZ
[  +0,010214] [  T265] ------------[ cut here ]------------
[  +0,005938] [  T265] WARNING: CPU: 1 PID: 265 at mm/slub.c:1110
check_bytes_and_report+0xf4/0x118
[  +0,009839] [  T265] CPU: 1 UID: 0 PID: 265 Comm: mdev Tainted: G    B   =
W=20=20=20
       6.15.0-rc3-M95D-00014-ge00e800e6d2a-dirty #1 NONE
[  +0,000018] [  T265] Tainted: [B]=3DBAD_PAGE, [W]=3DWARN
[  +0,000005] [  T265] Hardware name: Rockchip (Device Tree)
[  +0,000007] [  T265] Call trace:
[  +0,000004] [  T265] [<c0101c44>] (unwind_backtrace) from [<c01566c8>]
(show_stack+0x10/0x28)
[  +0,000025] [  T265] [<c01566c8>] (show_stack) from [<c0140ee8>]
(dump_stack_lvl+0x58/0x94)
[  +0,000022] [  T265] [<c0140ee8>] (dump_stack_lvl) from [<c0196828>]
(__warn+0x12c/0x1b0)
[  +0,000021] [  T265] [<c0196828>] (__warn) from [<c0196af0>]
(warn_slowpath_fmt+0x244/0x24c)
[  +0,000015] [  T265] [<c0196af0>] (warn_slowpath_fmt) from [<c0529ad8>]
(check_bytes_and_report+0xf4/0x118)
[  +0,000018] [  T265] [<c0529ad8>] (check_bytes_and_report) from [<c0529e9=
c>]
(check_object+0x3a0/0x408)
[  +0,000017] [  T265] [<c0529e9c>] (check_object) from [<c052aa18>]
(free_debug_processing+0x120/0x2e4)
[  +0,000017] [  T265] [<c052aa18>] (free_debug_processing) from [<c052e0b4=
>]
(free_to_partial_list+0x70/0x278)
[  +0,000018] [  T265] [<c052e0b4>] (free_to_partial_list) from [<c0530234>]
(___cache_free+0xcc/0x114)
[  +0,000019] [  T265] [<c0530234>] (___cache_free) from [<c055fd74>]
(qlist_free_all+0x6c/0x108)
[  +0,000020] [  T265] [<c055fd74>] (qlist_free_all) from [<c0560270>]
(kasan_quarantine_reduce+0x124/0x180)
[  +0,000022] [  T265] [<c0560270>] (kasan_quarantine_reduce) from [<c055d3=
58>]
(__kasan_slab_alloc+0x5c/0x8c)
[  +0,000020] [  T265] [<c055d358>] (__kasan_slab_alloc) from [<c052d5e0>]
(__kvmalloc_node_noprof+0x1c4/0x3c4)
[  +0,000018] [  T265] [<c052d5e0>] (__kvmalloc_node_noprof) from [<c06307c=
8>]
(seq_buf_alloc+0x68/0x14c)
[  +0,000020] [  T265] [<c06307c8>] (seq_buf_alloc) from [<c0631cc4>]
(seq_read_iter+0x8c4/0x14a8)
[  +0,000018] [  T265] [<c0631cc4>] (seq_read_iter) from [<c058cc08>]
(vfs_read+0x760/0xae0)
[  +0,000021] [  T265] [<c058cc08>] (vfs_read) from [<c058f070>]
(ksys_read+0xf4/0x1bc)
[  +0,000020] [  T265] [<c058f070>] (ksys_read) from [<c0100060>]
(ret_fast_syscall+0x0/0x54)
[  +0,000018] [  T265] Exception stack(0xc85cffa8 to 0xc85cfff0)
[  +0,000011] [  T265] ffa0:                   0000007f b6b2bc62 00000006
b6b2bc62 0000007f 00000001
[  +0,000012] [  T265] ffc0: 0000007f b6b2bc62 00000006 00000003 0023f53c
00000011 ffffffff b6b2bc62
[  +0,000009] [  T265] ffe0: 000001cc b6b29bd8 0006bcc8 0017f20c
[  +0,000006] [  T265] ---[ end trace 0000000000000000 ]---
[  +0,246152] [  T265] FIX kmalloc-64: Restoring kmalloc Redzone
0xc3f0e342-0xc3f0e343=3D0xcc
[  +0,009054] [  T265] FIX kmalloc-64: Object at 0xc3f0e340 not freed

I tried to do a git bisect, but I couldn't go back more than v6.8 because t=
he
board won't boot.

Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

