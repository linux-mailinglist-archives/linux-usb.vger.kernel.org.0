Return-Path: <linux-usb+bounces-24765-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F33ADA427
	for <lists+linux-usb@lfdr.de>; Sun, 15 Jun 2025 23:23:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6B7D3AE56A
	for <lists+linux-usb@lfdr.de>; Sun, 15 Jun 2025 21:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 862A627A133;
	Sun, 15 Jun 2025 21:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXXz96jV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6072E11C1
	for <linux-usb@vger.kernel.org>; Sun, 15 Jun 2025 21:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750022600; cv=none; b=Y5XO8pjHk6tPRdlnfionDNeeIdol9SqKL/jcccW0WkswJgu3maF6SiSylKeAOCdhvHY2CWr8ut0AU2lKH70/iaq954t/hUTuPMzYIiX9+nHz6UapBLQcb9ZLV3kfEjT9LfoB6dDsMQtDuIHF+sCCOZ0Z3KKa2htAKM0ZyNaRu1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750022600; c=relaxed/simple;
	bh=eFZJUftPDzuKQoW107tBZTLmMZ+UDgfNUebdQ58ubzk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=by2oljioRxZEf2BF67AmG8spw3kAYA8X2XzZPfo0XeNDmv8GbuRLY1zgxgA4BN6Gqe2MGo38ahlMdfKJYFHnLE5A3P270shmB6+v58yxWvmzzOE0eDnCwVkE2PVtTYvAmPYzWysWjNsEgvCRS+8cXzYxZJRaxueaAlAuvC7/ABw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXXz96jV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98512C4CEE3
	for <linux-usb@vger.kernel.org>; Sun, 15 Jun 2025 21:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750022599;
	bh=eFZJUftPDzuKQoW107tBZTLmMZ+UDgfNUebdQ58ubzk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iXXz96jVUnWaG3P6quhh6/0X2v4EzyCRctXcLdAS77wG1umutYNjTR0xwcjFmu0y7
	 YGJjtbC6JvrnqOOdgzf0k8P223rh2k5pL4ZR/Ab9yd0tbZJuM8cBW45ryhI/R2XOmq
	 Yg+ObOUo+Yedv1UeD+uGZ9xWiPlF/31ZdsUDpJuRtHnoD78KEQO/FlJBTvVcZXW5i/
	 HsQZz3uJVpRNmbsvdNign69WT4qEx2UU3i5318D2URvAxU9IzeOhomIfN1EMDByeYC
	 gCd/yl7HJmXQfKAJtQpc/fDAIrgqhq0G/7OuQwELFZK6BUYmmSiNkM4jjv6xgDdKl9
	 KrSxXuSUMrZ0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8DE88C433E1; Sun, 15 Jun 2025 21:23:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220236] Corsair K100 USB keyboard not working after resume from
 suspend on AMD platform (ASUS B650E-F, Ryzen 7800X3D)
Date: Sun, 15 Jun 2025 21:23:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kosimo@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220236-208809-NdPwH3a52N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220236-208809@https.bugzilla.kernel.org/>
References: <bug-220236-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220236

--- Comment #1 from Cosimo (kosimo@gmail.com) ---
[cosimo@archlinux ~]$ uname -a
Linux archlinux 6.15.2-arch1-1 #1 SMP PREEMPT_DYNAMIC Tue, 10 Jun 2025 21:3=
2:33
+0000 x86_64 GNU/Linux



[cosimo@archlinux ~]$ lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 001 Device 002: ID 0b05:19af ASUSTek Computer, Inc. AURA LED Controller
Bus 001 Device 003: ID 05e3:0608 Genesys Logic, Inc. Hub
Bus 001 Device 004: ID 0e8d:0608 MediaTek Inc. Wireless_Device
Bus 001 Device 005: ID 1b1c:0c3f Corsair iCUE LINK System Hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 002: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed=
 hub
Bus 005 Device 003: ID 046d:c539 Logitech, Inc. Lightspeed Receiver
Bus 005 Device 004: ID 1b1c:1bc5 Corsair CORSAIR K100 RGB Optical-Mechanical
Gaming Keyboard
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 006 Device 002: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed=
 hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
[cosimo@archlinux ~]$

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

