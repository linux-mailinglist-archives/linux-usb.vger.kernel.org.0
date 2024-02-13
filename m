Return-Path: <linux-usb+bounces-6357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08F853551
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 16:54:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 924C91F22555
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 15:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA35F5F47E;
	Tue, 13 Feb 2024 15:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0L/7yqC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4390E5EE76
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707839679; cv=none; b=ucUU2+WWAD/Sf3nKeAlHgQQzw6HW1iRFR7kmq6eiK5BoYSdl+Fld1VaBm9UxUgUvG6cqubXerFh8nyukUgO1H7mIeFIpJnEAHN3+1i6R5gJZUoapwrZGMk86nhzDsitCDLzSQyIrwYLDdUZm2CR28HtbwdWWEeoT4Idf8IiY1Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707839679; c=relaxed/simple;
	bh=2fXKxpDg6vRbjEFf1oUx9Dj91fMWHcCU53dQaWQ/hBU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rg4Zil70E4P5AwJao1YMdKQrSvCQX965bZe1Aopuac6XbYIZnxgfdAzc3LWDziJOh9oNlpqTqFiIK0YXR3/4zvDJjFX4v7JMXnExavCEb8ong3QgpDseZ57zhqcLWaYMP4rdSsp6nZK1dsrwccpVk38Ly3IuZ1iUX81qTpPzbns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0L/7yqC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFCBFC433C7
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707839678;
	bh=2fXKxpDg6vRbjEFf1oUx9Dj91fMWHcCU53dQaWQ/hBU=;
	h=From:To:Subject:Date:From;
	b=d0L/7yqCB58sM30xxvDng5mL54yNC5iukN3D+H7Oum6LxbRnHaobIrgweqXQAOkWj
	 eLFAN4CLO/4d7ht40P87sBElnf1yJmo8xx/Z6sgO1NghkYSGY6obTSnVI/ReWB3pI2
	 ZR2GmGba5CQrEg5r0bZiBEwhXZDX5U9UEIJPyZbQ2xV2ApU8Ceil2uLjpZn+nLk4Y2
	 gokGYYkz3TwjZKOIWdsDEUpbRSZaaViztpfLRG/i2IlhJDFQ4QXIxI1yvS//2JHib1
	 k1OCKEMjW7CgjQGOwBAimW/ekVEva2UoBPheRcXS7Abf+PsSVIYbu6QlAaA38yjyzu
	 ivawfgoc7iiYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A8823C53BD0; Tue, 13 Feb 2024 15:54:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218490] New: Linux warning `usb: port power management may be
 unreliable` on Dell PowerEdge T440
Date: Tue, 13 Feb 2024 15:54:38 +0000
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
Message-ID: <bug-218490-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218490

            Bug ID: 218490
           Summary: Linux warning `usb: port power management may be
                    unreliable` on Dell PowerEdge T440
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

Created attachment 305865
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305865&action=3Dedit
Linux 5.15.112 messages (output of `dmesg`) with system firmware 2.12.1

On the Dell PowerEdge T440 with at least system firmware version , Linux wa=
rns:

    $ dmesg | grep "may be unreliable"
    [   12.130289] usb: port power management may be unreliable
    $ dmesg | grep -e "DMI:" -e "Linux version" -e microcode
    [    0.000000] Linux version 5.15.112.mx64.449
(root@theinternet.molgen.mpg.de) (gcc (GCC) 10.4.0, GNU ld (GNU Binutils) 2=
.40)
#1 SMP Tue May 23 12:51:43 CEST 2023
    [    0.000000] DMI: Dell Inc. PowerEdge T440/021KCD, BIOS 2.12.2 07/09/=
2021
    [    2.185611] MMIO Stale Data: Vulnerable: Clear CPU buffers attempted=
, no
microcode
    [   12.269955] microcode: sig=3D0x50657, pf=3D0x80, revision=3D0x5003103
    [   12.276243] microcode: Microcode Update Driver: v2.2.
    $ usb-devices

    T:  Bus=3D01 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480=
 MxCh=3D16
    D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D05.15
    S:  Manufacturer=3DLinux 5.15.112.mx64.449 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:00:14.0
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

    T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D13 Cnt=3D01 Dev#=3D  2 Spd=3D480=
 MxCh=3D 4
    D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
    P:  Vendor=3D1604 ProdID=3D10c0 Rev=3D00.00
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D100mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

    T:  Bus=3D01 Lev=3D02 Prnt=3D02 Port=3D00 Cnt=3D01 Dev#=3D  3 Spd=3D480=
 MxCh=3D 4
    D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
    P:  Vendor=3D1604 ProdID=3D10c0 Rev=3D00.00
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D100mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

    T:  Bus=3D01 Lev=3D02 Prnt=3D02 Port=3D03 Cnt=3D02 Dev#=3D  4 Spd=3D480=
 MxCh=3D 4
    D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
    P:  Vendor=3D1604 ProdID=3D10c0 Rev=3D00.00
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3Dc0 MxPwr=3D100mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

    T:  Bus=3D02 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D500=
0 MxCh=3D10
    D:  Ver=3D 3.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D03 MxPS=3D 9 #Cfgs=3D  1
    P:  Vendor=3D1d6b ProdID=3D0003 Rev=3D05.15
    S:  Manufacturer=3DLinux 5.15.112.mx64.449 xhci-hcd
    S:  Product=3DxHCI Host Controller
    S:  SerialNumber=3D0000:00:14.0
    C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
    I:  If#=3D0x0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Dri=
ver=3Dhub

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

