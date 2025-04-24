Return-Path: <linux-usb+bounces-23414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A5A9B106
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 16:34:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3363F4A6CAC
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 14:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22B5F54F81;
	Thu, 24 Apr 2025 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poS6cDPb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3A3D528
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745505081; cv=none; b=L/S15BrinJLT2wV2kuFdfoEap6NnzgBDk/LjeJpYoObxu/S6c7SDJXwNHQu60VpVknfFJptzH3QQ0DXvPnAZOLbYWQ6f8U7W7rQEa5TviXHCqqPuwwZoyi7bdxYJ3wPj9K4DICArYrUrxkjwOi8OpSksFu0sI5TxXB2kKicyEQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745505081; c=relaxed/simple;
	bh=r8szc3lTbkG3hW8ewzn9Dic1Z2/s9G1/jvcAaWr8nVw=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=ZXY9NsLoIjOq09lt3hhKJAoObqn1WwNo8H9JHmECKyZuhW1/utgNTA6FD/zk0hStdtd+r2A5oY9Krwsb0EILS83qV3I4vMGrSo7tkysM4Ge/BaG+Eae8j412dvQUFuPPKk6DooIkGS6uKxtfk5tTCrf5bs+K3XHiIVhk3m4Vrhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poS6cDPb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07A60C4CEE3
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 14:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745505081;
	bh=r8szc3lTbkG3hW8ewzn9Dic1Z2/s9G1/jvcAaWr8nVw=;
	h=From:To:Subject:Date:From;
	b=poS6cDPbbAsys3JEOuseE9BsSDX/wfzC1QSPx41RHjA1jJf9Wzagvvl7WgYBWKsnf
	 y/MiPc+L0fUqLKVFHmCvjDCc9Hrl5TUObS9IMpI2hwPAFtDj93PokDTw8S9cTA3tAM
	 WsqZWXGhTmqkE7flqDp0MJiTe1RR+Pe9exWDFal1IvEUGiBghwzStT9JE6zqGfBOn6
	 sw/GXc0WOmfQX2lWlvkyVC6K9Xq0AJrvE/g7qdxCW1W6RfoWj0Yoa1qry7Sz1xD2Hx
	 t5laNf79WvAVFbrjw0jx3vPUfF0DfXRUj18UB76rrU7CEygQ1BSF9YTOc+2FyGS9uQ
	 l/5tjBvXPj/7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E82AAC41612; Thu, 24 Apr 2025 14:31:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220052] New: The usb/cdc-acm driver uses memory after it is
 freed
Date: Thu, 24 Apr 2025 14:31:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ben.maan@aimvalley.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220052-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220052

            Bug ID: 220052
           Summary: The usb/cdc-acm driver uses memory after it is freed
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: ben.maan@aimvalley.com
        Regression: No

Created attachment 308013
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308013&action=3Dedit
A patch file that solves the kernel panic.

In the cdc-acm driver, memory is used after it is freed. The code is in
drivers/usb/class/cdc-acm.c, in the acm_softint function. The problem manif=
ests
when a usb connection is disconnected by unplugging a cable and can result =
in a
kernel panic. The panic is not always seen but only when the freed memory is
claimed and used by an other process, somewhere between the for loop and the
acm_submit_read_urbs.

A solution is attached in the form of a patch where 2 lines of code are
exchanged with 2 other lines. The patch is based on kernel version
linux-6.15-rc3.

The kernel panic is shown below.

cdc_acm 1-1.3:1.2: urb 0 failed submission with -2
Unable to handle kernel NULL pointer dereference at virtual address 00000030
Mem abort info:
  Exception class =3D DABT (current EL), IL =3D 32 bits
  SET =3D 0, FnV =3D 0
  EA =3D 0, S1PTW =3D 0
Data abort info:
  ISV =3D 0, ISS =3D 0x00000004
  CM =3D 0, WnR =3D 0
user pgtable: 4k pages, 48-bit VAs, pgd =3D ffff8000bbab6000
[0000000000000030] *pgd=3D0000000000000000
Internal error: Oops: 96000004 [#1] PREEMPT SMP
Modules linked in: 8021q garp stp mrp ax88179_178a usbnet crc32_ce crct10di=
f_ce
galcore(O)
CPU: 0 PID: 1740 Comm: kworker/0:3 Tainted: G           O=20=20=20
4.14.98-imx_4.14.98_2.0.0_ga+g5d6cbeafb80c #1
Hardware name: Freescale i.MX8MQ EVK (DT)
Workqueue: events acm_softint
task: ffff8000baa12880 task.stack: ffff00000d448000
PC is at usb_autopm_put_interface+0x14/0x48
LR is at acm_softint+0xb8/0xd8
pc : [<ffff0000088e3abc>] lr : [<ffff0000089480b8>] pstate: 40000145
sp : ffff00000d44bda0
x29: ffff00000d44bda0 x28: 0000000000000000=20
x27: 0000000000000000 x26: ffff000009222ec0=20
x25: ffff0000080e7760 x24: ffff8000b6386788=20
x23: 0000000000000000 x22: ffff8000bff60580=20
x21: ffff8000b6385f88 x20: ffff8000b6386000=20
x19: ffff8000b6386788 x18: 0000000000000001=20
x17: 0000ffffb6667098 x16: ffff000008261920=20
x15: ffff000009752000 x14: 00000000fffffff0=20
x13: ffff0000098e5150 x12: ffff000009738df8=20
x11: ffff000008663128 x10: ffff0000098e4000=20
x9 : 0000000000000006 x8 : 6d6275732064656c=20
x7 : 6961662030206272 x6 : 0000000000000514=20
x5 : 0000000000000000 x4 : 0000000000000000=20
x3 : 0000000000000330 x2 : 00000000fffefa67=20
x1 : ffff000009736000 x0 : 0000000000000000=20
Process kworker/0:3 (pid: 1740, stack limit =3D 0xffff00000d448000)
Call trace:
Exception stack(0xffff00000d44bc60 to 0xffff00000d44bda0)
bc60: 0000000000000000 ffff000009736000 00000000fffefa67 0000000000000330
bc80: 0000000000000000 0000000000000000 0000000000000514 6961662030206272
bca0: 6d6275732064656c 0000000000000006 ffff0000098e4000 ffff000008663128
bcc0: ffff000009738df8 ffff0000098e5150 00000000fffffff0 ffff000009752000
bce0: ffff000008261920 0000ffffb6667098 0000000000000001 ffff8000b6386788
bd00: ffff8000b6386000 ffff8000b6385f88 ffff8000bff60580 0000000000000000
bd20: ffff8000b6386788 ffff0000080e7760 ffff000009222ec0 0000000000000000
bd40: 0000000000000000 ffff00000d44bda0 ffff0000089480b8 ffff00000d44bda0
bd60: ffff0000088e3abc 0000000040000145 00000000014000c0 ffff8000bff60580
bd80: ffffffffffffffff ffff0000089480b0 ffff00000d44bda0 ffff0000088e3abc
[<ffff0000088e3abc>] usb_autopm_put_interface+0x14/0x48
[<ffff0000089480b8>] acm_softint+0xb8/0xd8
[<ffff0000080e75ec>] process_one_work+0x1d4/0x348
[<ffff0000080e77a8>] worker_thread+0x48/0x470
[<ffff0000080edaac>] kthread+0x12c/0x130
[<ffff000008084ed8>] ret_from_fork+0x10/0x18
Code: f0007281 910cc003 910003fd f9454022 (f9401801)=20
---[ end trace 1b12fec59341c199 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

