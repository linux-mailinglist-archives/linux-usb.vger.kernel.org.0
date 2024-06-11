Return-Path: <linux-usb+bounces-11128-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4EB9036DE
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 10:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70DFA1C20F59
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 08:44:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5CF174EE3;
	Tue, 11 Jun 2024 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXuYfmYx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557B516F8F4
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718095437; cv=none; b=YG2k55a5CcbKpo98mCuXSINtxMLVy07aITWKgK0mjzyEyWe7cQavtqNgibJkCJeXX2nbzUT9ye8mHzHZEuDLqJoK6zgi90LAYteqkDw5r/fCy8T2z9xZ6dOFJvZnzpl80vKT82dI4svlNuj/G3AbNFVCzhvvohGY+Cu1FcdSuPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718095437; c=relaxed/simple;
	bh=FCQVV04F7qXEn/FPIKFUNtq7eTpkTGi7lR23NRIJOsU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D6hONSHASX8Own9qorguCbVSOkY7K+kQHIHFTMuogY4+j0xfB5Q6uunCEBoCZ9ELTpVcjZsen5XQVyP76qSzDe98rnUgPFqYinEKy3WHL9T+p53W3rJi6JEWPhFjYvCnODUKJTzoUs4jZKkgzlxL6uKUv9PJOVc3Tgzeb0NX7Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXuYfmYx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC190C2BD10
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718095436;
	bh=FCQVV04F7qXEn/FPIKFUNtq7eTpkTGi7lR23NRIJOsU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eXuYfmYxX8ygASm+Fes64R8I822YVHwEmrE6ELvxUDaav2/jJVNbfRJ+8o2/PMyuG
	 uypTo91oLVw7IAVxeljX1+jIcucvouSjEoTZfLt7k6dcQbL2HR0Cu5Ct0NQVWO1sNY
	 feGH9TZb0En8m7D9wB3JNH+05z8eFtXC/CYTWRIYvZJjBJglTN90voeIuiQMz06HiV
	 ax6u8Zs3kHbOtJhtgSE10ChRltueRViHIgKT2Uk7Yr48JxQUcevLkDKgGfzzczdFLO
	 tRYMBA317LalYt3rX+0ttYY3AmMI9QUlmG1fbKqFbDCkZBqmbOTYZFxTcneQlt7FmH
	 FZ6dwTaUaGV7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CAA96C53B50; Tue, 11 Jun 2024 08:43:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Tue, 11 Jun 2024 08:43:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-3ZPvHS3t7C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #13 from Jarrard (jarrard@proton.me) ---
(In reply to Mathias Nyman from comment #12)
> Your device was initially detected and trainer as a 10Gpps SSP device in
> Linux
>=20
> There were some issues reading descriptors from the device, and giving it=
 an
> address, so port was power cycled.
> After this the device was enumerated as a SS 5Gbps device.
>=20
> There are probably some small differences in how Windows and Linux do dev=
ice
> enumeration that cause this.
>=20
> [  363.960026] usb 4-4: new SuperSpeed Plus Gen 2x1 USB device number 4
> using xhci_hcd
> [  369.344592] usb 4-4: unable to get BOS descriptor or descriptor too sh=
ort
> [  369.370574] usb 4-4: unable to read config index 0 descriptor/start: -=
71
> [  369.370586] usb 4-4: can't read configurations, error -71
> ...
> [  370.325161] usb 4-4: Device not responding to setup address.
> [  370.537171] usb 4-4: Device not responding to setup address.
> [  370.744627] usb 4-4: device not accepting address 5, error -71
> [  370.753259] usb usb4-port4: attempt power cycle
> [  371.861790] usb 4-4: new SuperSpeed USB device number 6 using xhci_hcd
> [  372.067721] usb 4-4: LPM exit latency is zeroed, disabling LPM.
> [  372.157551] usb 4-4: New USB device found, idVendor=3D07ca, idProduct=
=3D2553,
> bcdDevice=3D 1.00
> [  372.157560] usb 4-4: New USB device strings: Mfr=3D6, Product=3D7,
> SerialNumber=3D3
> [  372.157564] usb 4-4: Product: Live Gamer Ultra 2.1
>=20
>=20
> Logs with dynamic debug enabled for usb core and xhci host could possibly
> show more info
>=20
> <boot>
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
> <connect device>
> <send dmesg>

Ok Cheers I'll check this out and post results if I find anything.  And yeah
the USB devices under Linux do get power cycled from time to time as they c=
an
freeze up occasionally when used in OBS.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

