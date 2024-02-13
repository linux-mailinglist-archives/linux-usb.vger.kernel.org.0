Return-Path: <linux-usb+bounces-6351-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28521853489
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 16:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BB5EF1F24A0F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 15:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB985DF1F;
	Tue, 13 Feb 2024 15:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESFbk//2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23BE75D902
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707837909; cv=none; b=k/k9i1jMVc3OvgqPdPO1QrATGWVy4jnHY+t1WnDpCGoaftKFC5AhsnTkHga3CGLySipqDTMwpTVhfPup3YktIMcZhKlZ+OnLuHJJCWaU7jHZRBrDbSFdqKIsRIZG8Ew8Qc75d0gPRjbP6yqqBoN00wA6CHoE+y/SnFQ7h0YQ7yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707837909; c=relaxed/simple;
	bh=xVGqlCJKSxk+mMve3cBigbslZqvXscC9Ts9TdlcIzvk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VOND3+qpceY5nrX0Tbi46Hl5mgukje2pe1GUXPdUb3YwcJvjxytK7I9QRrqvEK+j9adLq2hqoRi3CYzuEZTiWsjdwXlOyfLWPfXbmvEZuu81edE06gQUK8Yluv2gj2hBIjMOiz5543L7B9eznFUO+Islbyw1Rh2ScTXObHmDW6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESFbk//2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 991C1C433C7
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707837908;
	bh=xVGqlCJKSxk+mMve3cBigbslZqvXscC9Ts9TdlcIzvk=;
	h=From:To:Subject:Date:From;
	b=ESFbk//29FXW4W/185VUJNPTmJl/RG3RSx1KY++A1H65TaJgX7t1TkQSmEvwHQy2D
	 MhbEIAkXNMlRAp4qX565PtxfX44zjFXVfN/nqjSWXsHfJUKAP2Sgpg0SXWDlI6Fcc1
	 wONjE5nRlsTkyXbvg3MFYXWlD3nXDD+EUc6AVmZlBC/pnJllda4vzM8jNB+WMa676J
	 J9GpEGOUdG46QXfq3R3k4SV+4oMLf9sBjtKGzy0T+IQdHG4nXwhp3+vcKznxrVTt+2
	 jO130FV+mi8OH5Anlv7CHT7WY6Ft3JhAL6c9Sk3Ml3XZD0F7mkyjubR53BDQSDXHF+
	 VxYAPev5q1mrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7EE29C53BCD; Tue, 13 Feb 2024 15:25:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218488] New: Linux warning `usb: port power management may be
 unreliable` on OptiPlex Small Form Factor Plus 7010
Date: Tue, 13 Feb 2024 15:25:08 +0000
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
Message-ID: <bug-218488-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218488

            Bug ID: 218488
           Summary: Linux warning `usb: port power management may be
                    unreliable` on OptiPlex Small Form Factor Plus 7010
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

Created attachment 305863
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305863&action=3Dedit
Linux 6.1.53 messages (output of `dmesg`) with system firmware 1.7.1

On the Dell OptiPlex Small Form Factor Plus 7010 with at least system firmw=
are
version 1.7.1, Linux warns:

    $ dmesg | grep "may be unreliable"
    [    3.755446] usb: port power management may be unreliable
    $ dmesg | grep -e "DMI:" -e "Linux version" -e microcode
    [    0.000000] Linux version 6.1.53.mx64.458 (root@claptrap.molgen.mpg.=
de)
(gcc (GCC) 10.4.0, GNU ld (GNU Binutils) 2.41) #1 SMP PREEMPT_DYNAMIC Thu S=
ep
14 09:08:44 CEST 2023
    [    0.000000] DMI: Dell Inc. OptiPlex SFF Plus 7010/0YGWFV, BIOS 1.7.1
08/11/2023
    [    3.882879] microcode: sig=3D0xb06f2, pf=3D0x2, revision=3D0x2c
    [    3.889116] microcode: Microcode Update Driver: v2.2.
    $ usb-devices

    T:  Bus=3D01 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480=
 MxCh=3D16
    D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D06.01
    S:  Manufacturer=3DLinux 6.1.53.mx64.458 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:00:14.0
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

    T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D07 Cnt=3D01 Dev#=3D  2 Spd=3D1.5=
 MxCh=3D 0
    D:  Ver=3D 1.10 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 8 #Cfgs=3D  1
    P:  Vendor=3D413c ProdID=3D2113 Rev=3D01.10
    S:  Product=3DDell KB216 Wired Keyboard
    C:  #Ifs=3D 2 Cfg#=3D 1 Atr=3Da0 MxPwr=3D100mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D01 Prot=3D01 Dri=
ver=3Dusbhid
    I:  If#=3D0x1 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dusbhid

    T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D08 Cnt=3D02 Dev#=3D  3 Spd=3D1.5=
 MxCh=3D 0
    D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 8 #Cfgs=3D  1
    P:  Vendor=3D413c ProdID=3D301a Rev=3D01.00
    S:  Manufacturer=3DPixArt
    S:  Product=3DDell MS116 USB Optical Mouse
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3Da0 MxPwr=3D100mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D01 Prot=3D02 Dri=
ver=3Dusbhid

    T:  Bus=3D02 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D200=
00 MxCh=3D 9
    D:  Ver=3D 3.10 Cls=3D09(hub  ) Sub=3D00 Prot=3D03 MxPS=3D 9 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0003 Rev=3D06.01
    S:  Manufacturer=3DLinux 6.1.53.mx64.458 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:00:14.0
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

