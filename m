Return-Path: <linux-usb+bounces-27482-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BB5B414BF
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 08:12:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCE29189F046
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 06:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A49D22D73A8;
	Wed,  3 Sep 2025 06:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMDM6FYo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0F14A9B
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 06:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756879934; cv=none; b=eIhDdhGxSVObdbiohzYpRMPPQ7A5S/sY2SoAspCrjlZ0zYY45khfcLuZCB55qz0hL0491G0Vlybszn/L7KcNdjYs8ifOWHYQz91rJl7dvC+SgGLpf+ia7T50n0c/NpLI7WsqYI7srnq/OUk/XIVhJSrtKy611TAG/rVRivuF9vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756879934; c=relaxed/simple;
	bh=ndj3k+dD2fWtkIEC3ej5iD08vXvV9F98FcQ81h1joxo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BFo93/aQycDb8omY8vj5sRqx9bRrVsXfPqPyz4CDunaqkbyBUo4q7v5MEyQC7CcQZdLFPDmZUKyOJ7fng+tyUfx/khK8pJDCECcUnMWX/bPV6/428iPCZTyOzk5EdhdBpy7X3aavGvwiuSFFYF4/HuRpUtAKM2AD5oy0BhOjA4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMDM6FYo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9ED08C4CEF0
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 06:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756879931;
	bh=ndj3k+dD2fWtkIEC3ej5iD08vXvV9F98FcQ81h1joxo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iMDM6FYo+aBwVQ9fg6LB1L6rOxo/2lSfeUl5ytIipWbVc5jDTEln05DnCD3e6cvBX
	 tbCsqnhs0Ev7O4Y2MnZyZvVvF/V5AXFDvoQxIOuUCtARvMbxvLo57HR921ZAxKszl0
	 9uC1bra/FPzqPciOIzeTtQ+4A22CKfj1sFvepMbvUmwQba4uGO4plqV8uNgcuA7TxG
	 iPRLJHE7xmvGKF875Y2IH7aJnAGqUmFDk1QYtwefETKgeuIE/M9MrJfljTjstuMe1O
	 UrBdF5PMsJmAa7erKVWd1cObM7Degh122OSi3UVuRy7rdjkL/+VPLZP32V4ahvinvH
	 xx7emj2z//NVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8D274C4160E; Wed,  3 Sep 2025 06:12:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 06:12:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-Mnu7iNmPPl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #22 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Note that these numbers are completely different from the other cases, so I=
'm
not sure if the cases are really related.

For example, the very first log posted here shows suspending the devices fr=
om
U1 low power state to U3 and then the device is at U0 after resuming with
"connect status changed". Perhaps it got power cycled by HW?

The kernel immediately attempts some control transfers which fail, maybe de=
vice
firmware is waiting for a reset?

The device gets reset after the control transfers fail:
[  158.205065] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x1203, ret=
urn
0x203
[  158.205101] xhci_hcd 0000:00:14.0: set port reset, actual port 3-4 statu=
s  =3D
0x1311
[  158.268775] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x4202d0,
return 0x4102d0

Things are different from the other case, because "connect status change" a=
nd
"port link state" change are set. And the 'd' stands for 'port reset' (still
pending) and link state SS.Inactive.

Then it comes back:
[  158.332893] xhci_hcd 0000:00:14.0: Get port status 3-4 read: 0x621203,
return 0x510203

If not a HW bug then I would guess the device disabled/enabled its upstream
port. And xhci_hcd has flagged it as "inactive" and will be returning -ENOD=
EV
on URB submissions:

[  158.389217] usb 3-4: reset SuperSpeed USB device number 2 using xhci_hcd
[  158.404819] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[  158.404838] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[  158.404847] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[  158.476865] xhci_hcd 0000:00:14.0: xhci_hub_status_data: stopping usb3 p=
ort
polling
[  158.508898] usb 3-4: reset SuperSpeed USB device number 2 using xhci_hcd
[  158.524913] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[  158.524933] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive
[  158.524941] xhci_hcd 0000:00:14.0: Can't queue urb, port error, link
inactive

I see no way to clear this VDEV_PORT_ERROR flag, I guess the core needs to
destroy and recreate the device?

Then the port seems to be put into U3.
[  158.629069] xhci_hcd 0000:00:14.0: Set port 3-4 link state, portsc: 0x12=
03,
write 0x11261

[  158.656170] usb 3-4: USB disconnect, device number 2

And later the device comes up after being reset once again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

