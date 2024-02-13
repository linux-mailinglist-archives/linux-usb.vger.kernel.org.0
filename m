Return-Path: <linux-usb+bounces-6344-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AB98531A7
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 14:21:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B299C28381B
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 13:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F66855C0B;
	Tue, 13 Feb 2024 13:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="teTA7niE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261CB55C01
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 13:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707830486; cv=none; b=eJVQUap1TmRc5GY58zOh6DQfLFmpGHIsy094HBmMJQZL6IVK8dqp6rUhJ6qIx34jd3qwGioVRfoNpR57qVdMtXRdAcODTqbCkX98YCtOwU0/RQtQDw9vy/lcko3twVXRaTjLaGZIFYn6iHof72ICkoHlVM7TouAL6HE51/1D+uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707830486; c=relaxed/simple;
	bh=X5oVG7dtDlhCgADnl5FLp29iB34kd6hhrxLRhLOzyF0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KOnJVRZuT+lhPIA6//va3GWPVDqKmzpaAQEbYSvEJUDYoLi+YI4iCHlic+MUYLADMbs4xGLBA59WQ8MZzP/Hq1VMjaiBpqCsLIQZ/T4ClPqZ70+b8sp7T7x2wuPyVTLhN1zd8Qxxw18YaBEMJZPZNCcuU4gIfWL8c8dUWnzmGbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=teTA7niE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA6A7C43390
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 13:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707830485;
	bh=X5oVG7dtDlhCgADnl5FLp29iB34kd6hhrxLRhLOzyF0=;
	h=From:To:Subject:Date:From;
	b=teTA7niELTE65HtGGpvYbIqH8PyIkUBFlOs75+Ae8f0D2tIYcFzRpdTusAZUY+rxO
	 FDc4ui0hUCXiMTR8hMqWzyPRArCGODOVlRTtIGf4H3XWxBxctjF4fYap7C2KL5IDlF
	 8o0f6Rxqn0Amdpe9i9wqayQ4OaHauJ3/vZ9Qqrg19VsDmCPj2TFRqAMU81ZT4JgTLI
	 UjTg/MV9BGVQxyi9uRI4IogvZecZkYElzSZu6WYTc7sNa06PDOVBKnN8fQdc+Kqe6M
	 eJF/tTtzJKgCK//0HvqHY77Kvpr0pUwIKlaJRifpRJ1WQiJoZmceJhXm/xDpXKCEto
	 UeWmQUg4GgXoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C55CDC53BCD; Tue, 13 Feb 2024 13:21:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218487] New: Linux warning `usb: port power management may be
 unreliable` on Dell OptiPlex 5055
Date: Tue, 13 Feb 2024 13:21:25 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-218487-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218487

            Bug ID: 218487
           Summary: Linux warning `usb: port power management may be
                    unreliable` on Dell OptiPlex 5055
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pmenzel+bugzilla.kernel.org@molgen.mpg.de
        Regression: No

Created attachment 305861
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305861&action=3Dedit
Linux 6.6.12 messages (output of `dmesg`) with system firmware 1.1.50

On the Dell OptiPlex 5055 with at least system firmware version 1.1.50, Lin=
ux
6.6.12 warns:

    $ dmesg | grep "be unreliable"
    [    3.289270] usb: port power management may be unreliable
    $ dmesg | grep -e "DMI:" -e "Linux version" -e microcode
    [    0.000000] Linux version 6.6.12.mx64.461
(root@theinternet.molgen.mpg.de) (gcc (GCC) 12.3.0, GNU ld (GNU Binutils) 2=
.41)
#1 SMP PREEMPT_DYNAMIC Thu Jan 18 10:47:08 CET 2024
    [    0.000000] DMI: Dell Inc. OptiPlex 5055 Ryzen CPU/0P03DX, BIOS 1.1.=
50
07/28/2021
    [    3.488086] microcode: CPU0: patch_level=3D0x08001137
    [    3.488088] microcode: CPU2: patch_level=3D0x08001137
    [    3.488088] microcode: CPU3: patch_level=3D0x08001137
    [    3.488091] microcode: CPU1: patch_level=3D0x08001137
    [    3.488094] microcode: CPU6: patch_level=3D0x08001137
    [    3.488094] microcode: CPU5: patch_level=3D0x08001137
    [    3.488095] microcode: CPU7: patch_level=3D0x08001137
    [    3.530149] microcode: CPU4: patch_level=3D0x08001137
    [    3.530171] microcode: Microcode Update Driver: v2.2.
    $ usb-devices

    T:  Bus=3D01 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480=
 MxCh=3D10
    D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D06.06
    S:  Manufacturer=3DLinux 6.6.12.mx64.461 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:01:00.0
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

    T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D09 Cnt=3D01 Dev#=3D  3 Spd=3D1.5=
 MxCh=3D 0
    D:  Ver=3D 1.10 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 8 #Cfgs=3D  1
    P:  Vendor=3D413c ProdID=3D2113 Rev=3D01.08
    S:  Product=3DDell KB216 Wired Keyboard
    C:  #Ifs=3D 2 Cfg#=3D 1 Atr=3Da0 MxPwr=3D100mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D01 Prot=3D01 Dri=
ver=3Dusbhid
    I:  If#=3D0x1 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dusbhid

    T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D06 Cnt=3D02 Dev#=3D  2 Spd=3D1.5=
 MxCh=3D 0
    D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 8 #Cfgs=3D  1
    P:  Vendor=3D046d ProdID=3Dc077 Rev=3D72.00
    S:  Manufacturer=3DLogitech
    S:  Product=3DUSB Optical Mouse
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3Da0 MxPwr=3D100mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D01 Prot=3D02 Dri=
ver=3Dusbhid

    T:  Bus=3D02 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D100=
00 MxCh=3D 4
    D:  Ver=3D 3.10 Cls=3D09(hub  ) Sub=3D00 Prot=3D03 MxPS=3D 9 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0003 Rev=3D06.06
    S:  Manufacturer=3DLinux 6.6.12.mx64.461 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:01:00.0
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

    T:  Bus=3D03 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480=
 MxCh=3D 4
    D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D06.06
    S:  Manufacturer=3DLinux 6.6.12.mx64.461 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:05:00.3
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

    T:  Bus=3D04 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D500=
0 MxCh=3D 4
    D:  Ver=3D 3.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D03 MxPS=3D 9 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0003 Rev=3D06.06
    S:  Manufacturer=3DLinux 6.6.12.mx64.461 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:05:00.3
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

