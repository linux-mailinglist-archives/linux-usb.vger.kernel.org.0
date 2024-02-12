Return-Path: <linux-usb+bounces-6230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 016B985114A
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 11:44:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C3BF1F22912
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 10:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2F0422067;
	Mon, 12 Feb 2024 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPHKyeff"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8F438F86
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 10:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707734657; cv=none; b=lxmJZ6B+7xldkhqN/S7r/baVkTH2CgqDMfhQumgZfQajGIJwFfV95DV/nVeqW6Qc8todDoVtPAuNO5sqRc4SRC5zEZFQ2Um8xphiS5cxW2L5Haqdhya0ZVpPFla1WrlzFQ9V8KGzzCAW7vN+64weUfJ3n4x5XfN5Uf5kPCTfv5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707734657; c=relaxed/simple;
	bh=A9PxXJIW/AqhYzu5pFTcPUvEF3YHKHWmr57gefX56Uo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lOEhc0COMyPoLkcC2ye/yIilJLjHSxlLUBMy3NBOwFNcXIFbGtNyOA0Hp5Yn+y5VCTVFJgZUrytgHoNKgJeC3GU7W+E8ya3mjDx1Fsa2Lan4VrrQ3zG2m+AYZwI8n3CxCyg1ATV3n4SJ0Qt2pF35/E30ppkIuy2rHwxiOeUGwL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPHKyeff; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B4C76C433C7
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 10:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707734656;
	bh=A9PxXJIW/AqhYzu5pFTcPUvEF3YHKHWmr57gefX56Uo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YPHKyeff6uQXGzUayZJpaTXXo9hAulXsV74vWOrT8E/Wf+8dM55LpnY24EQrk2p+g
	 yXxnJE6ZQHLp1g1+hyr0/qf7tL1nniYYWlTN8wFpPKkU+Kh02Fm04gfP2M3XfkgCa6
	 bNNbTya4REVqDDxRv6bv/XON5jgP6kVZhIspcUd5MqxHqeBceJ5Z0r91uOOFeSDMVw
	 /yGrPjK4iOonSUGntHxRatrtp4QGZZ6PtRJnhrDL58t1BKcHzNKM1/7Wbv844kpLm0
	 8rdF+qM9pmkeC1jKtn3GQ8YAYVSjgLI4YC1Ga9KXD87eDhv1kCRYP1P19cBEpCQtj/
	 SMb6e5X2vryiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C535C53BCD; Mon, 12 Feb 2024 10:44:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218465] Linux warning `usb: port power management may be
 unreliable` on Dell XPS 13 9360
Date: Mon, 12 Feb 2024 10:44:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218465-208809-4wush0TSHm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218465-208809@https.bugzilla.kernel.org/>
References: <bug-218465-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218465

--- Comment #2 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
High-speed (HS) ans SuperSpeed (SS) ports are peered based on their Physical
Location Description (_PLD) object in ACPI tables.

The SSDT7 ACPI table dump shows that _PLD is created by calling a GPLD
helper method with some parameters. For High-Speed ports (HS0x) this seems
to be called with increasing port numer up to HS port 5. From port 6 onwards
all parameters are 0.

Scope (\_SB.PCI0.XHC.RHUB.HS01)
    Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        Return (GPLD (One, One))

Scope (\_SB.PCI0.XHC.RHUB.HS02)
    Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        Return (GPLD (One, 0x02))
...
Scope (\_SB.PCI0.XHC.RHUB.HS05)
    Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        Return (GPLD (Zero, 0x05))

Scope (\_SB.PCI0.XHC.RHUB.HS06)
    Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        Return (GPLD (Zero, Zero))

Scope (\_SB.PCI0.XHC.RHUB.HS07)
    Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        Return (GPLD (Zero, Zero))

For SuperSpeed ports (SS0x) the same is true. Ports 1-

Scope (\_SB.PCI0.XHC.RHUB.SS01)
    Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        Return (GPLD (One, One))

Scope (\_SB.PCI0.XHC.RHUB.SS02)
    Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        Return (GPLD (One, 0x02))

Scope (\_SB.PCI0.XHC.RHUB.SS03)
    Method (_PLD, 0, NotSerialized)  // _PLD: Physical Location of Device
        Return (GPLD (Zero, Zero))

Scope (\_SB.PCI0.XHC.RHUB.SS04)
    Method (_UPC, 0, NotSerialized)  // _UPC: USB Port Capabilities
        Return (GPLD (Zero, Zero))

Basically all HS port from 6 upwards and SS ports from 3 upwards report the
same _PLD, this messes up port peering and results in the following messages
during boot:=20=20

usb usb2-port1: peered to usb1-port1
usb usb2-port2: peered to usb1-port2
usb usb2-port3: peered to usb1-port6
usb: failed to peer usb2-port4 and usb1-port6 by location (usb2-port4:none)
(usb1-port6:usb2-port3)
usb usb2-port4: failed to peer to usb1-port6 (-16)
usb: port power management may be unreliable
usb: failed to peer usb2-port5 and usb1-port6 by location (usb2-port5:none)
(usb1-port6:usb2-port3)
usb usb2-port5: failed to peer to usb1-port6 (-16)
usb: failed to peer usb2-port6 and usb1-port6 by location (usb2-port6:none)
(usb1-port6:usb2-port3)
usb usb2-port6: failed to peer to usb1-port6 (-16)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

