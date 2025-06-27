Return-Path: <linux-usb+bounces-25198-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9371AAEC075
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 21:55:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4E016465B4
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 19:54:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCD52E88A9;
	Fri, 27 Jun 2025 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bonn9r/N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6232819D8A8
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 19:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751054101; cv=none; b=UZ9WkosAPP1uvESbmymPK+KGF+2WJl9ulpBuWD1IDsWyWzfy2Ex/TUGW40OYfMKo8eYDyDIX27SWk9WDDquAd1ic3NYXgbY/AwyF7CquPJguFcZ5XneXvY9qFWZt0UAgjGZwGmHTbqH4VlLSa6w6B8wIOn8hVUr55XaS9t2TeCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751054101; c=relaxed/simple;
	bh=2yOda0it0aA+JJX20kRwnCvFKV8cPeFVBHRkj5y5gc8=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dDqIo8OPydvUYfJ1oHKEKzyoL+cx7rJ+roaPCnGfYvn6T6xvpXndLynUYN3mx4UyRl1+PxbqmR2LVxog/iLP3o1BC5Q0ZGk8hTT4JRBEu0H02/ijWAFOEhFFZNo9wRYEt1FlXKtYuyswsel6V9xyIS3eylvMlt+zudPKTEfdTDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bonn9r/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5ECDC4CEE3
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 19:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751054100;
	bh=2yOda0it0aA+JJX20kRwnCvFKV8cPeFVBHRkj5y5gc8=;
	h=From:To:Subject:Date:From;
	b=bonn9r/NZEuaoMBSIF9pcLxs2e9R91InW83BqSfDUjh2gpcF8/vNWoY02gEVUSa1Z
	 SrK6NwvyCezKIAYRTtm9NAQVS1mqdSxsR44dB3+VQ9AjgA15UEVRYba/poxPyjVCCA
	 XlfR0R4ceSiobSH46KIUels+Kv6P2R8QM4iA9N0KKSHJLhmlvx3ZcSw8VMtbYEM1m+
	 Z6O3v1TRWXope+cEo4IGXn/uzTdEpi7otSamDEOYOKW4GgI+5+P//ACEdkSjmwqrjG
	 JAiXM2hzxE8XTMKw1JMcFt9U21O/jmGZd4dlFhnpFlaS32CYLd/0omQ2vmGfqAiPBi
	 Zg260K3Lru9Tw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C2D0FC433E1; Fri, 27 Jun 2025 19:55:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220286] New: asix 88772c does not work when chip is in RMII
 mode
Date: Fri, 27 Jun 2025 19:55:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dtyree@newagemicro.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220286-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220286

            Bug ID: 220286
           Summary: asix 88772c does not work when chip is in RMII mode
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: dtyree@newagemicro.com
        Regression: No

I have two asix 88772c boards, with the standard module the board with (MAC=
 ->
PHY ) presents the proper ethernet interface. With the second board confiur=
ed
for RMII (MAC->MAC) the following dmesg occurs:
[442357.683804] usb 1-1.3: new high-speed USB device number 4 using xhci_hcd
[442357.796351] usb 1-1.3: New USB device found, idVendor=3D0b95, idProduct=
=3D772b,
bcdDevice=3D 0.02
[442357.796380] usb 1-1.3: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[442357.796393] usb 1-1.3: Product: AX88772C
[442357.796403] usb 1-1.3: Manufacturer: ASIX Elec. Corp.
[442357.796412] usb 1-1.3: SerialNumber: 0037BC
[442358.469226] asix 1-1.3:1.0 (unnamed net_device) (uninitialized): PHY
[usb-001:004:10] driver [Asix Electronics AX88772C] (irq=3DPOLL)
[442358.472403] Asix Electronics AX88772C usb-001:004:10: attached PHY driv=
er
(mii_bus:phy_addr=3Dusb-001:004:10, irq=3DPOLL)
[442358.472895] asix 1-1.3:1.0 eth1: register 'asix' at usb-0000:01:00.0-1.=
3,
ASIX AX88772B USB 2.0 Ethernet, 00:0e:c6:00:37:bc
[442358.472995] usbcore: registered new interface driver asix
[442358.541752] asix 1-1.3:1.0 eth1: configuring for phy/internal link mode
[442360.596155] asix 1-1.3:1.0 eth1: Link is Up - 100Mbps/Full - flow contr=
ol
rx/tx
[443025.975392] usb 1-1.3: USB disconnect, device number 4
[443025.975978] asix 1-1.3:1.0 eth1: unregister 'asix' usb-0000:01:00.0-1.3,
ASIX AX88772B USB 2.0 Ethernet
[443025.976091] asix 1-1.3:1.0 eth1: Failed to write reg index 0x0000: -19
[443025.976108] asix 1-1.3:1.0 eth1: Failed to enable software MII access
[443025.976153] asix 1-1.3:1.0 eth1: Failed to write reg index 0x0000: -19
[443025.976167] asix 1-1.3:1.0 eth1: Failed to write Medium Mode mode to
0x0000: ffffffed
[443025.976181] asix 1-1.3:1.0 eth1: Link is Down
[443026.003862] asix 1-1.3:1.0 eth1 (unregistered): Failed to write reg ind=
ex
0x0000: -19
[443026.003896] asix 1-1.3:1.0 eth1 (unregistered): Failed to enable softwa=
re
MII access

The current drivers from asix are able to work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

