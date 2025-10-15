Return-Path: <linux-usb+bounces-29320-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C9DBDD776
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 10:42:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 98DB04FC788
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 08:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18A3D313537;
	Wed, 15 Oct 2025 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tb49z7BR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2D8306B35
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 08:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760517700; cv=none; b=Akuga2ChOKM/9pe6GqbvzjK3PxcuTS4yDdq7KBFCInwP0/uBc1UExUH8rFcQsQIfkejN0y8N2oKTXZURT58sPFzEISI8mKT+eL6icdAA67kViq7lKpFaAJWApuh+Ls5c8IDz1AHD6vhvVLyPwI9gZHt/QYGw782i9p/u8XrWANk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760517700; c=relaxed/simple;
	bh=B0C7tyPsgXFra99zHcqN+DGrq2pt7YuixPFQVbTh+Y0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K7NxfSTHpl0QaoFd/RdocQOX06Zkqj1pmTxmVEjUcJhoSYV49trSxNWHZXP76G/GaeFNeO/vfxG+Pqg9tOJ7kCMZwY+08NMmDh7FZBJYKu/mcoeUEOMkHgYheUY+q1WjV2JB6EgiWyDhahBrbpurQTUDFZ+i18T0Sts5E9frjWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tb49z7BR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10D84C4CEF8
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 08:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760517700;
	bh=B0C7tyPsgXFra99zHcqN+DGrq2pt7YuixPFQVbTh+Y0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Tb49z7BRQtHIzuNECyCivFhCrU4G/naDjJaRVVPIunhfg7QlfwyJCTJntVgV/sUGp
	 v619xX4oqxqwzZeVdgOOEscZGWwYCGj6VdTd8Fz6JPw/L/mDLTzk7Y3pAnUsUHZCQU
	 7NHuAOE8dUpBR2T3Be8oIQf5mzUhNggS5Hiug0NTTBInZOL9VeDDrEHMBmAEuOmH+y
	 uetmZw7CG6lrX705XgyRR7DFG9XglwYKvBRc2wOdZYLRNYw+PIB9I4TsE1+0Y2DS7U
	 b2aigmq5EOnmGi1iTIVlgT/F0TrsOkIzr9xkSXZ5iaSCPHHHnr4Iv+9N+zmSvd5A7w
	 PcgHEC+5k9J2w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F0B3CC41612; Wed, 15 Oct 2025 08:41:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220667] xhci_hcd prevents S3 suspend to RAM from working on Zen
 5 system
Date: Wed, 15 Oct 2025 08:41:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kode54@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-220667-208809-dLtZ80Nago@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220667-208809@https.bugzilla.kernel.org/>
References: <bug-220667-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220667

Christopher Snowhill (kode54@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.18-rc1

--- Comment #1 from Christopher Snowhill (kode54@gmail.com) ---
Log messages from 6.17.1, where it appears to connect without the suspend
message, but reports that it has no ports:

Oct 14 00:01:16 copycat kernel: xhci_hcd 0000:1a:00.0: xHCI Host Controller
Oct 14 00:01:16 copycat kernel: xhci_hcd 0000:1a:00.0: new USB bus register=
ed,
assigned bus number 9
Oct 14 00:01:16 copycat kernel: xhci_hcd 0000:1a:00.0: USB3 root hub has no
ports
Oct 14 00:01:16 copycat kernel: xhci_hcd 0000:1a:00.0: hcc params 0x0110ffc5
hci version 0x120 quirks 0x0000000200000010
Oct 14 00:01:16 copycat kernel: xhci_hcd 0000:1a:00.0: xHCI Host Controller
Oct 14 00:01:16 copycat kernel: xhci_hcd 0000:1a:00.0: new USB bus register=
ed,
assigned bus number 10
Oct 14 00:01:16 copycat kernel: xhci_hcd 0000:1a:00.0: Host supports USB 3.0
SuperSpeed
Oct 14 00:01:16 copycat kernel: usb usb9: New USB device found, idVendor=3D=
1d6b,
idProduct=3D0002, bcdDevice=3D 6.17
Oct 14 00:01:16 copycat kernel: usb usb9: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Oct 14 00:01:16 copycat kernel: usb usb9: Product: xHCI Host Controller
Oct 14 00:01:16 copycat kernel: usb usb9: Manufacturer: Linux 6.17.1-3-cach=
yos
xhci-hcd
Oct 14 00:01:16 copycat kernel: usb usb9: SerialNumber: 0000:1a:00.0
Oct 14 00:01:16 copycat kernel: hub 9-0:1.0: USB hub found
Oct 14 00:01:16 copycat kernel: hub 9-0:1.0: 1 port detected
Oct 14 00:01:16 copycat kernel: usb usb10: We don't know the algorithms for=
 LPM
for this host, disabling LPM.
Oct 14 00:01:16 copycat kernel: usb usb10: New USB device found, idVendor=
=3D1d6b,
idProduct=3D0003, bcdDevice=3D 6.17
Oct 14 00:01:16 copycat kernel: usb usb10: New USB device strings: Mfr=3D3,
Product=3D2, SerialNumber=3D1
Oct 14 00:01:16 copycat kernel: usb usb10: Product: xHCI Host Controller
Oct 14 00:01:16 copycat kernel: usb usb10: Manufacturer: Linux 6.17.1-3-cac=
hyos
xhci-hcd
Oct 14 00:01:16 copycat kernel: usb usb10: SerialNumber: 0000:1a:00.0
Oct 14 00:01:16 copycat kernel: hub 10-0:1.0: USB hub found
Oct 14 00:01:16 copycat kernel: hub 10-0:1.0: config failed, hub doesn't ha=
ve
any ports! (err -19)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

