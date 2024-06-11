Return-Path: <linux-usb+bounces-11145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B19903EE3
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 16:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B33AB231C9
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 14:33:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 871E917DE35;
	Tue, 11 Jun 2024 14:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cyr1Smde"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A32176FB2
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 14:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718116388; cv=none; b=ZnUM+L4PxjKyJ3Mhs3vvTGZqPdV9r9OxttmRUbwDAOKDHfjFFLJrD9j3ERueQW04drRITg60IGuQNbsFubS/Pevs+OjoVkCLNLjbZaMC0MUJWLx1Ukhu6rGk7f4FQqeEFey7XoCiU4Yu4lBua8Bm1/yXiNHMuCRoSW4dst2Y76M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718116388; c=relaxed/simple;
	bh=hoJPQgD5dhuFGalxbCYUQgkg6FiAxWDcsPF3DygkvMc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZMAyI5VAHlO3kY3UUZz/PLXKNBxRmQwu93DDjIwky1G8iiz/eZIy8ZPcArH/eprr4SjrnnrLryLFskOoZCznQQ2AJDAPSX+bNFiArPjfJzQi9BGD6JIAxixn3VJsNY2D8ZphpDWje0xbE812wcAhqWNgtKPCGqX/qpq9UWU/6XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cyr1Smde; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EE26C2BD10
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 14:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718116387;
	bh=hoJPQgD5dhuFGalxbCYUQgkg6FiAxWDcsPF3DygkvMc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Cyr1SmdeyDGA6bPZo/1c19ynRVjnjC6XsDXyvaQj84DDJT8J6Ntp1vyA3LX9cFvV1
	 yWxnFOEA6VJ/DlKZ1JMEdLk2DYNVEtzmXlG13s9h4WCBIxXwCu0jMCj3sLUGXPnP5t
	 wAgBfIN40ROIFqobD4SkW/wLsRVInzYYFTsAw8iHD7VW8WXSGTm+nMrROAm7DfPRgA
	 PO5aT8edWvkgADAJznnDMhMbm9aSMStHICWHLYBZaGz3g3713IfDqF/TbN8wVIYylT
	 3VZCIunZkpxoin1kqLgcpBw3zPZznsJCuoqQODy3aJQ1UOj9cJcqMzLANC/geBHIor
	 0rSlexwNg58PQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8BDF7C53B73; Tue, 11 Jun 2024 14:33:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Tue, 11 Jun 2024 14:33:07 +0000
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
Message-ID: <bug-218943-208809-8xGIowwtRY@https.bugzilla.kernel.org/>
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

--- Comment #17 from Jarrard (jarrard@proton.me) ---
Ok seems I'm a bit of a idiot and had secure boot enabled.=20
Now the commands work.=20

Got a whole bunch of stuff.

[  619.877598] xhci_hcd 0000:30:00.3: Get port status 4-4 read: 0xe2a1203,
return 0x310203
[  619.877612] xhci_hcd 0000:30:00.3: xhci_get_isoc_frame_id: index 0, reg
0x64b start_frame_id 0xca, end_frame_id 0x448, start_frame 0xd5
[  619.877627] xhci_hcd 0000:30:00.3: clear port4 reset change, portsc:
0xe0a1203
[  619.877641] xhci_hcd 0000:30:00.3: clear port4 warm(BH) reset change,
portsc: 0xe021203
[  619.877654] xhci_hcd 0000:30:00.3: clear port4 link state change, portsc:
0xe021203
[  619.877667] xhci_hcd 0000:30:00.3: clear port4 connect change, portsc:
0xe001203
[  619.877679] xhci_hcd 0000:30:00.3: Get port status 4-4 read: 0xe001203,
return 0x203
...
[  619.929597] xhci_hcd 0000:30:00.3: Set root hub portnum to 8
[  619.929602] xhci_hcd 0000:30:00.3: Set fake root hub portnum to 4
[  619.929606] xhci_hcd 0000:30:00.3: udev->tt =3D 0000000000000000
[  619.929610] xhci_hcd 0000:30:00.3: udev->ttport =3D 0x0
[  619.929616] xhci_hcd 0000:30:00.3: // Ding dong!
...
[  619.937709] usb 4-4: Device not responding to setup address.
[  619.937754] xhci_hcd 0000:30:00.3: // Ding dong!
[  619.937775] xhci_hcd 0000:30:00.3: // Ding dong!
[  619.937811] xhci_hcd 0000:30:00.3: Slot 7 output ctx =3D 0x0x00000000fff=
c2000
(dma)
[  619.937817] xhci_hcd 0000:30:00.3: Slot 7 input ctx =3D 0x0x00000000fff4=
2000
(dma)
[  619.937823] xhci_hcd 0000:30:00.3: Set slot id 7 dcbaa entry
00000000dcd62c49 to 0xfffc2000
[  619.938588] xhci_hcd 0000:30:00.3: xhci_get_isoc_frame_id: index 0, reg
0x833 start_frame_id 0x107, end_frame_id 0x485, start_frame 0x112
[  619.938720] xhci_hcd 0000:30:00.3: Port change event, 4-4, id 8, portsc:
0xe0202a0
[  619.938726] xhci_hcd 0000:30:00.3: handle_port_status: starting usb4 port
polling.
...
[  620.141591] xhci_hcd 0000:30:00.3: Set root hub portnum to 8
[  620.141596] xhci_hcd 0000:30:00.3: Set fake root hub portnum to 4
[  620.141600] xhci_hcd 0000:30:00.3: udev->tt =3D 0000000000000000
[  620.141604] xhci_hcd 0000:30:00.3: udev->ttport =3D 0x0
[  620.141610] xhci_hcd 0000:30:00.3: // Ding dong!
...
[  620.149708] usb 4-4: Device not responding to setup address.
[  620.149752] xhci_hcd 0000:30:00.3: // Ding dong!
[  620.149774] xhci_hcd 0000:30:00.3: // Ding dong!
[  620.149810] xhci_hcd 0000:30:00.3: Slot 7 output ctx =3D 0x0x00000000fff=
c2000
(dma)
[  620.149816] xhci_hcd 0000:30:00.3: Slot 7 input ctx =3D 0x0x00000000fff4=
2000
(dma)
[  620.149822] xhci_hcd 0000:30:00.3: Set slot id 7 dcbaa entry
00000000dcd62c49 to 0xfffc2000
...
[  620.357571] usb 4-4: device not accepting address 19, error -71
[  620.357587] xhci_hcd 0000:30:00.3: xhci_get_isoc_frame_id: index 0, reg
0x154b start_frame_id 0x2aa, end_frame_id 0x628, start_frame 0x2b5
...
[  620.365636] xhci_hcd 0000:30:00.3: // Ding dong!
[  620.365655] xhci_hcd 0000:30:00.3: Bad real port.
[  620.365662] usb usb4-port4: attempt power cycle
[  620.365668] xhci_hcd 0000:30:00.3: set port power 4-4 OFF, portsc: 0xe02=
1263
...
[  620.573567] xhci_hcd 0000:30:00.3: set port power 4-4 ON, portsc: 0xe020=
080
...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

