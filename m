Return-Path: <linux-usb+bounces-9750-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9731F8B19D0
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 06:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2D36B23FD0
	for <lists+linux-usb@lfdr.de>; Thu, 25 Apr 2024 04:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 154352D60A;
	Thu, 25 Apr 2024 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIeap/ho"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9017C1AACB
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 04:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714018315; cv=none; b=T7b1QAK+lrpNfBhakYLnPC+S2u3VZv+zY3WFa6EJMqziBkHn+suzas6bkQWAAd3mp+WztVOo4cYTS3aPWJUDe7y0K0ca6D8I4pHr5+dV+16FgFeFr0DP4XSwuofYXT7snRUz5f2ysKPJzqWsA/yNaCv2xaglhf7r4Jq9vsZOT7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714018315; c=relaxed/simple;
	bh=zYLo7hoMVGbyW1Y2/TqQsMqqLA4lK3os57LglumLMcE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Zv/+X/oceGDmQp175c2EGJC8zBDEQNxwCZf1jjUi3hglf8gl9RwoPtlOnhR30hRCkF2ejJcfvS5tpa7YC2Ng9N0cPlZCYEUcV4JCvs8sgyOIRPjzclMeeIl5PgoEz02rZq5QoA2qzKZIj3bMSVagH2xLGszmhErtsWtGK/HETkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIeap/ho; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1194BC113CC
	for <linux-usb@vger.kernel.org>; Thu, 25 Apr 2024 04:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714018315;
	bh=zYLo7hoMVGbyW1Y2/TqQsMqqLA4lK3os57LglumLMcE=;
	h=From:To:Subject:Date:From;
	b=uIeap/ho8FDOgZqt4Ab1VSffHDfWKBxvxyG4ZMQco7JDnxaDprJWAEt6f5Av1cTSg
	 ESEooPmMB/aivZMSj0Dm57fkMTmLvSTq9dF2rgBca1YMlrt+jo1I6cK58e/fybmYXy
	 bmQLOR1uc6umVF1S4OQ06yP5x/1Xy2dNfoE/ZZncDz6Sq2LbgxxF57f5AA3LOdd3qO
	 42oBexjU6UFoG4bkXzYDFrAX42Jpgs5HjoKoup12dSYGsvptpJKtyfnS+ZWyIFL2mx
	 bIeiEkHaGKHOO82hwn424yFyNHeMbX4JQ4FRkogD9qu/hleaKnuAQ89eQDECD2CaPr
	 uB8f41cQRpZsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EF4D9C433DE; Thu, 25 Apr 2024 04:11:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218773] New: device not initialized
Date: Thu, 25 Apr 2024 04:11:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: roman.gruber@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218773

            Bug ID: 218773
           Summary: device not initialized
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: roman.gruber@gmx.at
        Regression: No

This is kina a longterm old bug which is 10 years old

Cold Boot

Where is my mouse?=20
connected via ASUS X670-P Prime Mainboard -> usb cable -> Monitor ASUS PA27=
8QV
-> USB Mouse

Sienna_Cichlid /home/roman # lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 05dc:a410 Lexar Media, Inc. JumpDrive 128MB/256MB
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 003 Device 003: ID 0b05:19af ASUSTek Computer, Inc. AURA LED Controller
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 002: ID 2516:014f Cooler Master Co., Ltd. CK351 Gaming Optic=
al
Switch Keyboard
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 002: ID 05e3:0610 Genesys Logic, Inc. Hub
Bus 007 Device 007: ID 0763:410c M-Audio AIR 192 6
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 010 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub


replug cable / oh mouse is here ...=20
i3wm / Xorg-Server Running / openrc ...
could open already vivaldi browser, terminal and other stuff. The X Server =
was
fully functional and also the shell was working and also the keyboard was
already working.

Sienna_Cichlid /home/roman # lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 05dc:a410 Lexar Media, Inc. JumpDrive 128MB/256MB
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 003 Device 003: ID 0b05:19af ASUSTek Computer, Inc. AURA LED Controller
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 002: ID 2516:014f Cooler Master Co., Ltd. CK351 Gaming Optic=
al
Switch Keyboard
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 002: ID 05e3:0610 Genesys Logic, Inc. Hub
Bus 007 Device 007: ID 0763:410c M-Audio AIR 192 6
Bus 007 Device 008: ID 093a:2533 Pixart Imaging, Inc. Gaming Mouse
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 010 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub


Sienna_Cichlid /home/roman # uname -a
Linux Sienna_Cichlid 6.8.6-gentoo_15_04_2024 #1 SMP PREEMPT Mon Apr 15 05:2=
8:26
CEST 2024 x86_64 AMD Ryzen 5 7600X 6-Core Processor AuthenticAMD GNU/Linux


Happens regularly with different kernel version, since I own that hardware
April 2023.

USB Devices not properly found / working / especially mice is a very old bug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

