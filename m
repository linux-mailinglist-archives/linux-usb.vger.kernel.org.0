Return-Path: <linux-usb+bounces-6334-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D0385310C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 13:59:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46E9C1C2650C
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 12:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8CC443ADC;
	Tue, 13 Feb 2024 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ehczrWhV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6264B50A8C
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 12:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829132; cv=none; b=uoca9wwuFZcZi5ayPo9AQvJzHzotqeUfwDd84xCINblk7N5HKEUnmSmeCoRBe1V6bzsIn6q7tD7UWcAX+cZUDgLPWKhNttxZPfJI1K99wSXw6B2IeAJdTXyiLL/WVeBJV/lIjnAInAURFG++tRn2G+sqgUK2PQ+HdZU5nkuRy0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829132; c=relaxed/simple;
	bh=b1qgrS7NnRElDhRfpo8ZIUEOeypgEyFh1VTrgz/z8II=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=gIwAez8KAfAJf79aDuSsXMPycI8d8hnpKIQM42gERaDhZsUR3j/31uIHOeXrSVknlCP2Ct/Hgl1U2ipStWvvFKCxCxbvMFY9dLK6wUHgcToaAaqcT7GfbsT8xslbVlOj9xfqcSDVERNbB6zCqlwga1Bzz/03zWFtiqi80nfNYuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ehczrWhV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9B60C433F1
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 12:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707829131;
	bh=b1qgrS7NnRElDhRfpo8ZIUEOeypgEyFh1VTrgz/z8II=;
	h=From:To:Subject:Date:From;
	b=ehczrWhVMWxE1D0VS3SwcjlfnulOe1K4p8yt0x8R7ATiyMYyfudIBfu0T936hG/7r
	 kY/IQlPGDSJXxA0dhABHuVkU+L8lEKAkzWeIg45bChC1B4ZQYs4uEhAIdxspJDlFcb
	 I+j0wu24x35e5QONLlPGo0K/XaxAKiTcccnRBx0JOBeBwvj+5EUexOyX7Nd3xrlaKS
	 27Ivm7FFaEd/agbse/v5OJ+I5HfJJ56PGXz0uFUVe17l1SwyJyMmXzPbss7cVXQ/dq
	 SsMkuOgpY7tzbyTSHknpeEe5xp0hJ/a6GPpQY+GLTnoG5iJ9B0fUOOFrLmZKsMzbSc
	 Qw2EeSKI+Knvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C7AE8C53BD0; Tue, 13 Feb 2024 12:58:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218486] New: Linux warning `usb: port power management may be
 unreliable` on Dell OptiPlex 3620
Date: Tue, 13 Feb 2024 12:58:51 +0000
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
Message-ID: <bug-218486-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218486

            Bug ID: 218486
           Summary: Linux warning `usb: port power management may be
                    unreliable` on Dell OptiPlex 3620
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

Created attachment 305859
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305859&action=3Dedit
Linux 6.6.12 messages (output of `dmesg`) with system firmware 1.28.0

On the Dell OptiPlex 3620 with at least system firmware version 1.25.0 and
1.28.0, Linux warns:

    $ dmesg | grep -e "DMI:" -e "Linux version" -e microcode
    [    0.000000] Linux version 6.6.12.mx64.461
(root@theinternet.molgen.mpg.de) (gcc (GCC) 12.3.0, GNU ld (GNU Binutils) 2=
.41)
#1 SMP PREEMPT_DYNAMIC Thu Jan 18 10:47:08 CET 2024
    [    0.000000] DMI: Dell Inc. Precision Tower 3620/0MWYPT, BIOS 2.28.0
12/13/2023
    $ grep microcode /proc/cpuinfo | uniq
    microcode   : 0xf4
    $ usb-devices

    T:  Bus=3D01 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480=
 MxCh=3D16
    D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D06.06
    S:  Manufacturer=3DLinux 6.6.12.mx64.461 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:00:14.0
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

    T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D05 Cnt=3D01 Dev#=3D  3 Spd=3D1.5=
 MxCh=3D 0
    D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 8 #Cfgs=3D  1
    P:  Vendor=3D413c ProdID=3D2113 Rev=3D33.08
    S:  Product=3DDell KB216 Wired Keyboard
    C:  #Ifs=3D 2 Cfg#=3D 1 Atr=3Da0 MxPwr=3D100mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D01 Prot=3D01 Dri=
ver=3Dusbhid
    I:  If#=3D0x1 Alt=3D 0 #EPs=3D 1 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dusbhid

    T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D08 Cnt=3D02 Dev#=3D  5 Spd=3D12 =
 MxCh=3D 0
    D:  Ver=3D 2.00 Cls=3D00(>ifc ) Sub=3D00 Prot=3D00 MxPS=3D 8 #Cfgs=3D  1
    P:  Vendor=3D27b8 ProdID=3D01ed Rev=3D00.02
    S:  Manufacturer=3DThingM
    S:  Product=3Dblink(1) mk2
    S:  SerialNumber=3D20010D87
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3D80 MxPwr=3D120mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 2 Cls=3D03(HID  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dusbfs

    T:  Bus=3D02 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D500=
0 MxCh=3D10
    D:  Ver=3D 3.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D03 MxPS=3D 9 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0003 Rev=3D06.06
    S:  Manufacturer=3DLinux 6.6.12.mx64.461 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:00:14.0
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

