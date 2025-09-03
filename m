Return-Path: <linux-usb+bounces-27481-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5952B4146A
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 07:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EB517A4D52
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 05:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9352D63FC;
	Wed,  3 Sep 2025 05:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tYPKGErH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A16232F744
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 05:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756877946; cv=none; b=UZrUJ2ekZkhp7k4HGwccr63U7VIFs/rCVfVl8qwk1dq37tKThhYpGmaJpq/LcnI0OQ6I69fHuPsdsA67QWRViox770z88DN+lRdNoIc8emsJwCutKjPslYpx3ZdQiDhqIDvWpGO+N09fTHTajk4SD7EyoVuqDyW35xPi8s3rN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756877946; c=relaxed/simple;
	bh=oOQnXys+3VNCKpz0Ev5i9S+4TO4KzCsdNVMSBWUVu1g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iGqd5rmrDn5cavqT/2kWWpA3IYOUvyvuMMDgCjHxUt2THFW0JUbAYlzsfDgbIkqsfqLWoTuMuyuvQEklYQWZqqJ9eB+Ds8U9ZBVhrHEfH0jdQd6mSqSJdCxdYC/oedswEEfIahRodJA/MIrgILXV9FvV9ghA8ySgutACBvq3tmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tYPKGErH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 054CEC4CEF0
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 05:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756877946;
	bh=oOQnXys+3VNCKpz0Ev5i9S+4TO4KzCsdNVMSBWUVu1g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tYPKGErHFIFBVyl8y00UED1nTa/DiaE8gim7QwIC4XX8n0Rnq4HNVdnFBfve9Q/Ux
	 r1Y46GK9KJNWeb3bJMudZDgWGvv0j3Mfl6jYAKV0yITXUHntNyf4nV8VA6EKkqpdUh
	 3IXqAtnr0ii4q7uZITX7/UOuVbff5dcOIPYwre28AqSSxcvBHexjUF5VCnXQd2T6Tb
	 PRCWlroF0FEwulCo7l/79hORcnbMXO7DXdQ9iC91991sruPxfHa82/gEAW2bD67FxC
	 HlJTz911wL5HNBJr38MDeN1D5cWFmVUTu0Sl24EnI7Kz50uArd6goe/lT7IaYK8oYv
	 Ax0felFTZaCUw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E417AC4160E; Wed,  3 Sep 2025 05:39:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 05:39:05 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220491-208809-hLyyOGCIch@https.bugzilla.kernel.org/>
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

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #21 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
We have those PORTSC messages telling what the xHCI controller thinks about=
 the
state of particular root hub ports and what gets sometimes written to change
this state. See xHCI spec 5.4.8 for the meaning of those bits. Note that the
kernel doesn't write back exactly the same things it reads, because some bi=
ts
(notably PED) are "write 1 to clear" or other oddities, see section 5.1.1 f=
or
the meaning of bit attributes.

In this latest case, I suppose you mean device on port 3-2.

Suspending:
[ 1097.437841] xhci_hcd 0000:00:14.0: Set port 3-2 link state, portsc: 0x12=
03,
write 0x11261

1203 seems to be the normal working state for a SuperSpeed device:
12 - SuperSpeed, port power on, top bit of link state is 0
0 - link state U0, not currently resetting
3 - no overcurrent, port is enabled and connected

11261 requests transition to U3 (port suspend).

But after resuming things get a little different:
[ 1097.766164] xhci_hcd 0000:00:14.0: Port change event, 3-2, id 6, portsc:
0x100080

That's a lot of zeros here. Link disabled, port disabled, not connected, not
powered, no overcurrent but overcurrent status has changed since the last t=
ime
the change bit was cleared or observed clear.

So I can't be sure what happens here, I'm far from expert on USB 3.0 link
management and xHCI root hubs, but it looks like hardware took action to
completely disable this port in the meantime, possibly due to actual
overcurrent or some HW bug or other problem.

Then we see:
[ 1098.777817] xhci_hcd 0000:00:14.0: set port power 3-2 ON, portsc: 0x1000=
80
[ 1098.881792] xhci_hcd 0000:00:14.0: Get port status 3-2 read: 0x1002a0,
return 0x802a0
[ 1099.080653] xhci_hcd 0000:00:14.0: Port change event, 3-2, id 6, portsc:
0x21203

The value written by the kernel isn't logged, but a moment later we see
'powered up' and the link advancing to RxDetect state and then it's up and
running.

Then it looks like USB core registers disconnection, resets the port and the
device works normally from there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

