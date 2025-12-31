Return-Path: <linux-usb+bounces-31856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E0252CEB9DC
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 09:54:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87AAA3032A90
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 08:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCC9314A86;
	Wed, 31 Dec 2025 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LwXPOwoZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDBC1A840A
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 08:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767171287; cv=none; b=eHFJv30C2DIkpu70YdRxLvRxQAAz379s+c1Xk7xEkMlMGZ4Q2fV19C5h8Tng3nj/w4EvXdvFLqMhPVwcLWkb3JiLO4k+ZlxPK4GfIJiW+tb+g80s4pMCd7OWnv1EXdOobiOgrzOj9KY3n8sHyCEGOJAW3XyCJjl6Cjx8dJKJyMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767171287; c=relaxed/simple;
	bh=8G4aj4jFh1rso6Sidv2mhwucf5rlPrymAvLOWFvDDC8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FDO738DV6RcOlF5F7FuUot0RDeK0FWEOqnIjYSPKSFqWcCLTikqpsjRjbpfF3tfqr/6FDxcvG+/+o3QZZig+wIZAB8CTfis3V1nbIuyuWojYQJSuYx3W92OJrjjaFD1gSTn0xBhHS5usrWG0/Sqd1YG6SWyWCJmTxGDjrd/cmKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LwXPOwoZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F1F7C113D0
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767171287;
	bh=8G4aj4jFh1rso6Sidv2mhwucf5rlPrymAvLOWFvDDC8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LwXPOwoZUMIwH8+XUvlqdnLP0P2PqO4VrSZ5y1wB0IFmELQUBE/kiL9RDHhEymxPX
	 EaBfsuWrBSPEboDGxa4cu+oQC5Wd7AbSr9OgEX/6OXLJIi9j4RQjjGuwHdeL+joUJm
	 SAvLAw3Pn2B6E6hewmIbhhjRuhgO1zIKSfF5N0gld46r6GtUYC74NjlfjVUR9rBuCj
	 B8C3iB7IHgt7RhIQXFwjihuA3dPv817UNcfLP/qf4akVOIIr+qTKDK7eR/CVv5cFw3
	 LlJBEi1xOSM8igY9LyFrLLbli5LnSMGsyCZZTKDOibZ6sqQKsbKnLdNM+Z9520edWH
	 zfKvSL3Aux9Jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1645DC41614; Wed, 31 Dec 2025 08:54:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Wed, 31 Dec 2025 08:54:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas@jetzinger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220904-208809-fZU9Y5ET0b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #4 from Thomas Jetzinger (thomas@jetzinger.com) ---
Created attachment 309100
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309100&action=3Dedit
full dmesg with thunderbolt.dyndbg=3D+p

Kernel: 6.18.2-arch2-1

Repro: Boot with dock =E2=86=92 ethernet works. Unplug/replug dock =E2=86=
=92 ethernet gone.

Key logs:
- Boot: cdc_ether registered at usb-0000:00:0d.0-3.1
- Unplug [178.9s]: r8152-cfgselector disconnect, cdc_ether unregister
- Replug [189.1s]: Thunderbolt resumed, USB hubs + HID + audio re-enumerated
- Ethernet (2-3.1) never re-registered

Note: "r8152-cfgselector: Unknown version 0x0000" at boot - driver falls ba=
ck
to cdc_ether.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

