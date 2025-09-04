Return-Path: <linux-usb+bounces-27520-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F49B42E85
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 02:59:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41E087C156E
	for <lists+linux-usb@lfdr.de>; Thu,  4 Sep 2025 00:59:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C633C199949;
	Thu,  4 Sep 2025 00:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jgo2s8Se"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B9D215B971
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 00:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756947557; cv=none; b=aygNo59es6WfbSNJYHZJ+THSANhzBeKMRg6ylehOmjrvhgZgjloOrKsDcYJmx9Clfv2QzG3bbr6LgEmBZoPq2cgqMmYhADzq1Ec7MFwSzRHWc6YtD6rIb4iWMZZWfH0wxSOeV4VwQ8lz5luOn3XyjgqWxtnBneJIL1c9sfvvnek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756947557; c=relaxed/simple;
	bh=SyZdVuve0ge3apaXT4OmykbKEvgxyLtohhzV3/lEUrM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iYuwyYagKCbnZPKS+Bmeoc3FamEDb8dPa5rrwQWITUw427wDTx4ij3Ai6JgdRGsZiP/5/cUjqwh0IkeuwiOzjdUsel+Y49CADBFbL8ojSzAuQ5Ww0pkm+B5Lk7a10RNewpMEl0/zWpgu6yBNt6Clf2H2S6mp5EpS5308a8GwFAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jgo2s8Se; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C3F34C4CEE7
	for <linux-usb@vger.kernel.org>; Thu,  4 Sep 2025 00:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756947556;
	bh=SyZdVuve0ge3apaXT4OmykbKEvgxyLtohhzV3/lEUrM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Jgo2s8SettHzKzhbYVqeCPxEYO0HDYnkKp171+ubmrsU1HnGv3QIUUPMQbUPMnhy1
	 ep63T7GlFLk2a/bR4BLjZh2SWbzzWQ116pKsrte3c+sWA9CGuhQMbYg55AYG6eP1sF
	 8OJoMJJ0cVjVC0X5QtuY5iT42MUx63COE7WoHxQYuTiFwM9dNnNduEPL3XS7CqO35e
	 qlEPgn2vMQ5pl3JWb4vQiwEyfKW6lbf/69BrjPv3L2xZ846A/NhCbVCeUnla1m9Q9o
	 8lj9HIcx8cI6LmHbkeW00KZNJy6Erqn9vJ1slEVitFk1ejHtv2Cce1CnJZYwSAncpy
	 6SEqAoSMuYGDA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B6620C4160E; Thu,  4 Sep 2025 00:59:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Thu, 04 Sep 2025 00:59:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-jftovUgFSn@https.bugzilla.kernel.org/>
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

--- Comment #34 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Alan: It may be that the usbmon trace associated with comment #9 is not wha=
t I
thought it was. Since I can't readily interpret these traces I can't verify
that they contain what I think they contain. I may have made a mistake.

When I say that a device disconnects/reconnects I get this information from=
 the
dmesg log. I did my best to match the usbmon trace to a proper dmesg log bu=
t I
may have made a mistake. I want to emphasize that every time the device
disconnects/reconnects as far as the dmesg log is concerned, the USB filesy=
stem
is unmounted. Every time that the device merely resets and does not
disconnect/reconnect the USB filesystem remains mounted.

Here is a log snippet where the device, 3-4, disconnects/reconnects:

[22784.760311] usb 3-4: USB disconnect, device number 3
[22784.761239] pci_bus 0000:01: Allocating resources
[22784.761855] pci_bus 0000:01: Allocating resources
[22784.762047] done.
[22784.762056] random: crng reseeded on system resumption
[22784.876977] PM: suspend exit
[22784.878740] usb 2-4: new full-speed USB device number 15 using xhci_hcd
[22785.031677] usb 2-4: New USB device found, idVendor=3D0cf3, idProduct=3D=
e300,
bcdDevice=3D 0.01
[22785.031687] usb 2-4: New USB device strings: Mfr=3D0, Product=3D0,
SerialNumber=3D0
[22785.036360] usb 2-4: USB disconnect, device number 15
[22785.214926] usb 3-4: new SuperSpeed USB device number 4 using xhci_hcd

Here is what a reset with no disconnect/reconnect looks like:

[   58.003736] usb 3-4: reset SuperSpeed USB device number 2 using xhci_hcd

If the device is always disconnecting/reconnecting at the usbmon level, thi=
s is
not always being propagated up to the usbcore level. To the extent that is
true, the usb_persist mechanism is already working at least part of the tim=
e.
If usb_persist is already working part of the time that should make it easi=
er
to get it to work all the time.

Just to verify that I did not make a mistake on comment #9, I'll attach ano=
ther
usbmon trace where there is no disconnect/reconnect at the usbcore level. T=
he
trace that I'm attaching has Bi/Bo:3:002 in every line. I interpret this as
meaning that the host is only talking to the USB storage device. When a
disconnect/reconnect occurs I also see usbmon lines that contain Bi/Bo:3:00=
1,
which I interpret as talking to the associated hub, and Bi/Bo:3:003 which I
interpret as talking to the reincarnated device through a new device ID.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

