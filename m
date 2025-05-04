Return-Path: <linux-usb+bounces-23678-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776A6AA869D
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 15:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 996187A90E8
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 13:57:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512D319755B;
	Sun,  4 May 2025 13:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HjIco5zb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3DF4315A
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746367136; cv=none; b=GNgv2AStp2cC5nhXRIZa4MYbxgdQF3adJVZ1Tm6SQCQlx6AkikOVs+ciH3GKgGDJALdUWzeyl4iGnuhFEmsECo0RS51mxLnZHCX5WNoBH9nm5NmFBgZ1vmcDorPMrKGWlW5kA4Z0tufHVCZgF4llx1HOZJ81OCBknk4v4BfqbUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746367136; c=relaxed/simple;
	bh=Qxgcew1IhgZTq6YBu8umkjAV//pjpj6qkpKfUoqeFFg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RVDotFxNKivqOHxW6ptkKjr3jRNbdleW5tGJO7gCTaaI3Lwzn5GyQXdR7yZAEO7czryjAPLKKvQerDajtIEXEge0/wPAtJjdXNxNSi/rwwUwpbWLtuuD9bZL44f3zALquUNl5pCKk4nl6nGyc3Gv9O8bF9rEvSDABWwRYREpc2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HjIco5zb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3457BC4CEE7
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746367136;
	bh=Qxgcew1IhgZTq6YBu8umkjAV//pjpj6qkpKfUoqeFFg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HjIco5zbgvnuIRTXiNLpd9TCyPiKbeluLlIb8Ps/cJiKmhRRMTR+4ZSW1gDZ1WPG8
	 GvKihIadV7i2PWoIbHL2855ngFoOo9owIfsNYyRmTpI2Vpl3upA5YrT5gop6QgVWqM
	 2Wuhupld6b49sGh2T0s4bjkJbZWNIWSTsz5EzAYr3Ggn20DmwHeSBgLambJYVov1Np
	 NlezX3+3gdWzfFNIwH8OQApxUxyAo6M3ZLfM4DyafaG1AczVtsYWUj8Eg+ULYXax9+
	 D9L/O8GQC232jJAJKeuBYciibzuOiANDhCLUzh/6CD7fd8fAEykWPI1OuWQsmMg/0h
	 vL+Dq33eBJb2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 268DCC41614; Sun,  4 May 2025 13:58:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 04 May 2025 13:58:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220069-208809-rluHGuQNPG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #33 from Claudio Wunder (cwunder@gnome.org) ---
Created attachment 308090
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308090&action=3Dedit
Autopsy Result (2)

A 2nd crash happened, sending another autopsy. After this crash I moved the
Monitor Hub (Webcam etc) to Bus 5.

```
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 005 Device 002: ID 19f7:0050 RODE Microphones RODECaster Duo
Bus 005 Device 003: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 005 Device 004: ID 0b05:1a53 ASUSTek Computer, Inc. USB Audio
Bus 005 Device 005: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 005 Device 006: ID 046d:c548 Logitech, Inc. Logi Bolt Receiver
Bus 005 Device 007: ID 2e1a:4c03 Insta360 Insta360 Link 2C
Bus 005 Device 008: ID 2109:2211 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 005 Device 009: ID 2109:8884 VIA Labs, Inc. USB Billboard Device=20=20=
=20
Bus 005 Device 010: ID 0cf2:a201 ENE Technology, Inc. 6K7732
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 006 Device 002: ID 2109:0817 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 006 Device 003: ID 2109:0211 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 004: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed=
 hub
Bus 007 Device 006: ID 1e71:300e NZXT NZXT Kraken Base
Bus 007 Device 009: ID 046d:c54d Logitech, Inc. USB Receiver
Bus 007 Device 011: ID 0b05:18f3 ASUSTek Computer, Inc. AURA LED Controller
Bus 007 Device 027: ID 2109:4817 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 007 Device 028: ID 1a40:0801 Terminus Technology Inc. USB 2.0 Hub
Bus 007 Device 029: ID 2109:8817 VIA Labs, Inc. USB Billboard Device=20=20=
=20
Bus 007 Device 030: ID 19f7:004e RODE Microphones R=C3=98DECaster Duo
Bus 007 Device 031: ID 31e3:1322 Wooting Wooting 60HE+
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 008 Device 004: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed=
 hub
Bus 008 Device 008: ID 2109:3817 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 010 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 011 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 012 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 013 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 014 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

