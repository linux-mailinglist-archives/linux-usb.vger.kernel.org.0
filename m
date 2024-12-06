Return-Path: <linux-usb+bounces-18208-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 844029E7BF6
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 23:52:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F157188597A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 22:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F6D81FBE80;
	Fri,  6 Dec 2024 22:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jIPmhKbn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEBF22C6D9
	for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2024 22:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733525525; cv=none; b=gaO3FcYpgNx1fYhrfJ/xEYpjaT/ETzmdfQueIH1m/RZwGBeHDgQFiNH1YSmPC94Rfgo/YQtAcW66mLwzFHXRjSa56oTgmUqZ8OpT974rsV6+XfGn04AR/OLibsEEOOovqCMrqAQ+0N2sozaOEnInj/3XR419HP9MB5RLjucD22A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733525525; c=relaxed/simple;
	bh=OC4AnMEOrFD4sYfJxlrIEq2oAzdLxoVoB/V+kuEhhsA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=umG/QMqmk2XyKFN5c1yQ50Vln5QHbFz4nMopTVdVc6Z3seAPFGHahk2wRTw0ta09b1LTgpxzCM5l9ImEPCuOcFaPZyOXxhROUKD4XB0anzA8wkRsZZNb8lrj2gByhYI+L6BpxQycqaVYI3vXDEMZbfYzPFXQQcfedkE9EhcyMQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jIPmhKbn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 385E7C4CED1
	for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2024 22:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733525525;
	bh=OC4AnMEOrFD4sYfJxlrIEq2oAzdLxoVoB/V+kuEhhsA=;
	h=From:To:Subject:Date:From;
	b=jIPmhKbnO5FHVK/KurA4sTJ48Ql0afNRo1r7clzuXb87SLvMoeZ8l1PoRKLMiLBTe
	 D4d4Pn8TdJr0YQ0A2kRm6rOQ+F6fofl12TWYy/hzo+IpMhhxMB7iYEB+ZqmuoodynS
	 MXwxVbp1IGepEMbRYRCdna6dv13ke7tWT0b7s1UrTivzosyGyVs80TV5fypevl9Mrz
	 9GXn6poQaRWQia5OwiMX9ISZwjv+sk47WT/THVu4KpD36rDfg37xnZQQ+kZrH5Uq+a
	 8OlK5Xd05+6wZdJKtOpEm+ijczGH4byjZPcVFI4EAPHYCSihg0idF8weIKmRD5vDL3
	 61IwW7JQ8aK7A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2182DC3279F; Fri,  6 Dec 2024 22:52:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219569] New: The 0c45:671d camera fails to initialize despite
 being visible in USB.
Date: Fri, 06 Dec 2024 22:52:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mzagozdzonster@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-219569-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219569

            Bug ID: 219569
           Summary: The 0c45:671d camera fails to initialize despite being
                    visible in USB.
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mzagozdzonster@gmail.com
        Regression: No

Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 002: ID 8087:0025 Intel Corp. Wireless-AC 9260 Bluetooth Ada=
pter
Bus 001 Device 005: ID 0d8c:0014 C-Media Electronics, Inc. Audio Adapter
(Unitek Y-247A)
Bus 001 Device 003: ID 0c45:671d Microdia Integrated_Webcam_HD
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

T:  Bus=3D01 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480 MxC=
h=3D16
D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D06.08
S:  Manufacturer=3DLinux 6.8.0-49-generic xhci-hcd
S:  Product=3DxHCI Host Controller
S:  SerialNumber=3D0000:00:14.0
C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Driver=
=3Dhub
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D   4 Ivl=3D256ms

T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D11 Cnt=3D01 Dev#=3D  3 Spd=3D480 MxC=
h=3D 0
D:  Ver=3D 2.00 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D0c45 ProdID=3D671d Rev=3D81.31
S:  Manufacturer=3DCN0VGCNHLOG00917A8A8A00
S:  Product=3DIntegrated_Webcam_HD
C:  #Ifs=3D 2 Cfg#=3D 1 Atr=3D80 MxPwr=3D500mA
I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D0e(video) Sub=3D01 Prot=3D00 Driver=
=3D(none)
E:  Ad=3D83(I) Atr=3D03(Int.) MxPS=3D  16 Ivl=3D4ms
I:  If#=3D 1 Alt=3D 0 #EPs=3D 0 Cls=3D0e(video) Sub=3D02 Prot=3D00 Driver=
=3D(none)

T:  Bus=3D02 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D10000 M=
xCh=3D10
D:  Ver=3D 3.10 Cls=3D09(hub  ) Sub=3D00 Prot=3D03 MxPS=3D 9 #Cfgs=3D  1
P:  Vendor=3D1d6b ProdID=3D0003 Rev=3D06.08
S:  Manufacturer=3DLinux 6.8.0-49-generic xhci-hcd
S:  Product=3DxHCI Host Controller
S:  SerialNumber=3D0000:00:14.0
C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Driver=
=3Dhub
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D   4 Ivl=3D256ms

T:  Bus=3D03 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D480 MxC=
h=3D 2
D:  Ver=3D 2.00 Cls=3D09(hub  ) Sub=3D00 Prot=3D01 MxPS=3D64 #Cfgs=3D  1
P:  Vendor=3D1d6b ProdID=3D0002 Rev=3D06.08
S:  Manufacturer=3DLinux 6.8.0-49-generic xhci-hcd
S:  Product=3DxHCI Host Controller
S:  SerialNumber=3D0000:3a:00.0
C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Driver=
=3Dhub
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D   4 Ivl=3D256ms

T:  Bus=3D04 Lev=3D00 Prnt=3D00 Port=3D00 Cnt=3D00 Dev#=3D  1 Spd=3D10000 M=
xCh=3D 2
D:  Ver=3D 3.10 Cls=3D09(hub  ) Sub=3D00 Prot=3D03 MxPS=3D 9 #Cfgs=3D  1
P:  Vendor=3D1d6b ProdID=3D0003 Rev=3D06.08
S:  Manufacturer=3DLinux 6.8.0-49-generic xhci-hcd
S:  Product=3DxHCI Host Controller
S:  SerialNumber=3D0000:3a:00.0
C:  #Ifs=3D 1 Cfg#=3D 1 Atr=3De0 MxPwr=3D0mA
I:  If#=3D 0 Alt=3D 0 #EPs=3D 1 Cls=3D09(hub  ) Sub=3D00 Prot=3D00 Driver=
=3Dhub
E:  Ad=3D81(I) Atr=3D03(Int.) MxPS=3D   4 Ivl=3D256ms
6.8.0-49-generic

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

