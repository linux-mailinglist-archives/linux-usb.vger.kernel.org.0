Return-Path: <linux-usb+bounces-21160-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE3A485E0
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 17:57:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BB99173577
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 16:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6325F1BD007;
	Thu, 27 Feb 2025 16:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdQvO6b6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17471B4151
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 16:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740674898; cv=none; b=ukeM497z8WTFmaw82OfuUQCuIrWgQbdFkJHPs8leMlY7cf97yeH9uqwRiZpsuKQcn1/Fqa6hhXS591YsBHMqhUEAke7e8pv+y4CNfHy6ayStcfBbjgsXiMzBnAseCiOeIiClnfdj9HaiUyItywIjjQr9mNTvSBY6kM1vppqm8y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740674898; c=relaxed/simple;
	bh=CgGA4pgQtSRDwADCtXYeY358IvyEwfVle4UYWSHU/gk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=qmMhpMP/lntGAUSVjctL6aQ/I34hFsI5FPOQao0UDxxGw+RNPyhGbEbHcuRJT3pPOGHzRtCyqUwbxt3M+ppxXbNd2svONPhwOzAWAZ7wmucmLGLHL6sw9iDZCBJH08FTYlZi3Ot4ZE5uFnsQuauM4SkRGpg0a4To/IuL49ffj1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdQvO6b6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B663C4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 16:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740674897;
	bh=CgGA4pgQtSRDwADCtXYeY358IvyEwfVle4UYWSHU/gk=;
	h=From:To:Subject:Date:From;
	b=jdQvO6b6Zc9KacsfdJKuv0YgK4JXep4fNaGWXikqSa5xf6n9bZTgf/j4YXfW4Ej+N
	 WMRXyjdiBHGdSyyCllTHC5M3uvi4COq34hZ9w1Cu92RJ7d29zsoNT8YbwvCDVFOoxn
	 rhgMRBV5yluC/kCkH9Sb4tnsfj+Dxtm2nqFisUh3xhYOSGBISUEWe0YKCuyoWdewSw
	 BWqMni+fE43HVzaMnImyZLRWK6rSnw8+zYPH+HHfviiFd++/1Dcub1h0H3QLzJAqLp
	 +RSOMdTygdEobUW38eMNIKCl7rNUHIaIsJUva2TyjYM+S3wOggB9WFHb/wNQtnYWlc
	 Q7kamXOBR4YlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DE64EC433E1; Thu, 27 Feb 2025 16:48:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219826] New: Oops introduced after 6.1.51 between network / usb
Date: Thu, 27 Feb 2025 16:48:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick.hawkins@hpe.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219826-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219826

            Bug ID: 219826
           Summary: Oops introduced after 6.1.51 between network / usb
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: nick.hawkins@hpe.com
        Regression: No

We use linux/drivers/usb/dwc3 (There is one change we did in this driver to
enable the sysfs entry for the role switch control from userspace) for the
Synopsys designware host controller which operates in dual role mode.

When we connect a USB device (mass storage) to the port, host controller
operates as USB host and we mount the mass storage and transfer files,
unmounts.
Then we are connecting the laptop to the port, then the host controller is
working in the device mode and we are configuring the gadgetfs for NCM using
the UDC provided by the DWC3 driver,when we remote the laptop connection , =
we
are just writing "" to the UDC file in the gadgetfs (ie: Not removing the f=
iles
/directories from gadgetfs)
Again when we connect mass storage to the port, we switching the host
controller role to host mode (The gadgetfs directories and files are still
present  but the UDC is not connected)

Once we repeat the above steps multiple times we are getting the oops.

Note :

The issue not observed on kernel 6.1.51.=20
Issue not observed on 6.1.119 if we remove the gadgetfs directory completely
before the host controller role switch to host mode.

[  172.170751] Unable to handle kernel paging request at virtual address
00003130302f3130
[  172.179550] Mem abort info:
[  172.182618]   ESR =3D 0x0000000096000004
[  172.186741]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[  172.192590]   SET =3D 0, FnV =3D 0
[  172.195954]   EA =3D 0, S1PTW =3D 0
[  172.199406]   FSC =3D 0x04: level 0 translation fault
[  172.204772] Data abort info:
[  172.207938]   ISV =3D 0, ISS =3D 0x00000004
[  172.212152]   CM =3D 0, WnR =3D 0
[  172.215404] [00003130302f3130] address between user and kernel address
ranges
[  172.223248] Internal error: Oops: 0000000096000004 [#1] SMP
[  172.229369] CPU: 0 PID: 506 Comm: usb_srv_task Not tainted
6.1.119-yocto-standard #1
[  172.237875] Hardware name: GXP (DT)
[  172.241698] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[  172.249344] pc : __pi_strlen+0x14/0x150
[  172.253559] lr : rtnl_fill_ifinfo+0xee8/0x114c
[  172.258440] sp : ffffffc0094eb670
[  172.262072] x29: ffffffc0094eb700 x28: ffffff8006ce0000 x27:
0000000000002c68
[  172.269917] x26: ffffff8006ce0000 x25: 0000000000002f8c x24:
ffffff8006ce0000
[  172.277759] x23: ffffff8006ce2f8c x22: ffffff8006ce2a0c x21:
44003130302f3130
[  172.285601] x20: ffffff800642f000 x19: ffffff8009895d00 x18:
00000000000000d0
[  172.293443] x17: 0000000000000000 x16: 0000000000000000 x15:
0000000000000000
[  172.301284] x14: 0000000000000000 x13: 0000000000000000 x12:
0000000000000000
[  172.309126] x11: 0000000000000000 x10: 0000000000000001 x9 :
0000000000000000
[  172.316967] x8 : 0101010101010101 x7 : 0000000000000000 x6 :
0000000000003ec0
[  172.324809] x5 : ffffff8006ce2f90 x4 : 0000000000000130 x3 :
ffffff8006ce0000
[  172.332652] x2 : 0000000000001ec0 x1 : 0000000000002f8c x0 :
44003130302f3130
[  172.340493] Call trace:
[  172.343170]  __pi_strlen+0x14/0x150
[  172.346998]  rtnl_dump_ifinfo+0x2c4/0x6b0
[  172.351402]  netlink_dump+0x114/0x374
[  172.355423]  netlink_recvmsg+0x1dc/0x360
[  172.359730]  ____sys_recvmsg+0x94/0x1a0
[  172.363939]  ___sys_recvmsg+0x94/0xe0
[  172.367958]  __sys_recvmsg+0x74/0xcc
[  172.371881]  __arm64_sys_recvmsg+0x24/0x30
[  172.376379]  invoke_syscall.constprop.0+0x50/0xf0
[  172.381544]  do_el0_svc+0x50/0x150
[  172.385276]  el0_svc+0x28/0x9c
[  172.388626]  el0t_64_sync_handler+0x114/0x120
[  172.393409]  el0t_64_sync+0x18c/0x190
[  172.397431] Code: 92402c04 b200c3e8 f13fc09f 5400088c (a9400c02)
[  172.404121] ---[ end trace 0000000000000000 ]---

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

