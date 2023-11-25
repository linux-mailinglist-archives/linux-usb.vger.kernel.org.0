Return-Path: <linux-usb+bounces-3317-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 231EF7F8FAE
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 23:15:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9EB4AB21033
	for <lists+linux-usb@lfdr.de>; Sat, 25 Nov 2023 22:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A80CD31584;
	Sat, 25 Nov 2023 22:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzwah6Ag"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 104099442
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 22:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 923D1C433CB
	for <linux-usb@vger.kernel.org>; Sat, 25 Nov 2023 22:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700950519;
	bh=brsAELMPduV99YPiXYKifYscpDcx+nsVX228ULJ+S90=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kzwah6Ags2uYNMADvwbMCiR1jw/v7EnTTKMzDWMH1O1+Qo7izQq9Wpe/mCVy1PcGi
	 oVIH4qaONLOpchrt5LkRxVIjKrpIQg0NHh4dI0IrDwcKoHjuAMIGplvZVJwKzvsQDh
	 xf4g5VWP60b4r09cTlF5zBw50qureAHvizJjYV3IS7y8DpeLFWv0iJawvpgLuVKegk
	 ogyvBR+vQaH53O16ogtlP9LlrfwQKXYvlpv/5RlhmyP+USPdR7dHsGVkgrlYLo5o68
	 wFvTh9RyVlZKF5a7uQOPSfGde+KOSoc9xXEcuhP4jrrwr85aRt9mOIZN5/SsM1eCkK
	 +tfdRHJfN/veA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 80C0EC4332E; Sat, 25 Nov 2023 22:15:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Sat, 25 Nov 2023 22:15:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-215740-208809-RJpeuh8D0E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #305444|0                           |1
        is obsolete|                            |
 Attachment #305456|0                           |1
        is obsolete|                            |

--- Comment #34 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 305473
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305473&action=3Dedit
Revised (again) diagnostics

I revised the test patch slightly.  Now the addresses are printed in hex, as
they should have been all along.  Also, there's a line to print out the
physical addresses pointed to by hub->buffer and hub->status when a new hub=
 is
configured.  Here's the log for plugging in a hub, then plugging a mouse in=
to
the hub:

[   32.757399] usb 1-1: new high-speed USB device number 5 using xhci_hcd
[   32.886200] usb 1-1: New USB device found, idVendor=3D05e3, idProduct=3D=
0608,
bcdDevice=3D 9.01
[   32.886444] usb 1-1: New USB device strings: Mfr=3D0, Product=3D1,
SerialNumber=3D0
[   32.886631] usb 1-1: Product: USB2.0 Hub
[   32.889566] hub 1-1:1.0: USB hub found
[   32.889813] usb 1-1: hub buffer at 100e71818, status at 100e71610
[   32.890499] hub 1-1:1.0: 4 ports detected
[   42.761267] usb 1-1.3: new low-speed USB device number 6 using xhci_hcd
[   42.833935] kauditd_printk_skb: 101 callbacks suppressed
[   42.844775] usb 1-1.3: New USB device found, idVendor=3D093a, idProduct=
=3D2510,
bcdDevice=3D 1.00
[   42.844841] usb 1-1.3: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[   42.844890] usb 1-1.3: Product: USB OPTICAL MOUSE
[   42.844933] usb 1-1.3: Manufacturer: PIXART
[   42.851150] input: PIXART USB OPTICAL MOUSE as
/devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.3/1-1.3:1.0/0003:093A:2510.00=
09/input/input10
[   42.851585] hid-generic 0003:093A:2510.0009: input,hidraw8: USB HID v1.11
Mouse [PIXART USB OPTICAL MOUSE] on usb-0000:00:14.0-1.3/input0

The cache line size on this computer is 64 bytes, same as yours.  As you can
see, hub->buffer and hub->status were allocated in different cache lines, so
the DMA debugging routine did not detect an overlap.  That's why I didn't g=
et
any error messages.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

