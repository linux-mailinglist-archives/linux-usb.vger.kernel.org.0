Return-Path: <linux-usb+bounces-31851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A71CEA7E9
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 19:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B86ED3037CCA
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 18:42:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9698932C312;
	Tue, 30 Dec 2025 18:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSugB5x4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E20E2F28FF
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 18:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767120164; cv=none; b=pIT4TXp2WeqHxSSWOc5TFVpvSdCzskXwQ20VzxLE16lrKvBcZ/5xRtv3+XBfVL2d9UTCHr8C5hJR0N47VYQKIodRCvBQr7/QalWr/Gyy3v1Bd8rUVgr97yEqNPpejVQl/Z+xmd8GVRfVoey438k5i7qPcptGO9oOYJMlji92eOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767120164; c=relaxed/simple;
	bh=4qNwd6ZKnb9olyXFWULC6A7T62ob4hnUOx1xXGNILYg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Tf9KZEHu1Jh/gBPHc0/OzqaWMBxngyZw8IQj+69kPL68x0LM0IlCHyVxNdhjgcSMifmlj54dHYt9epdIaIdUQmN0+7eMYDOSsW3CFmbXARouVVLTZcExRx5MYPDhRgRTbEwAJkB36JhpfGY+YGaLh34bypAZ/AFKtpTdlsKX1UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSugB5x4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F0D6C16AAE
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 18:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767120163;
	bh=4qNwd6ZKnb9olyXFWULC6A7T62ob4hnUOx1xXGNILYg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CSugB5x45Br+z3W75h9P2WNooMKRpUoStuK3hXdXSO4h1D3+JNBfZy0Y5GzctdPzF
	 1YeOLe42bSJLSJStAabqEUOk0urhIWbnhefiYrwa8jrAk18l1ZIHONNPNd1iVKP/k2
	 lE/9C/BKS+hPkDM7tILhaOKvWUDJRM6Fclf+Jp8fHdpZPls0bGqr9sIKsto7ZL+CpK
	 ksC51u4jq30JfFk/IpdDWaed89PBOdYShnN+EubJfG+GZRpW1fVXG8ZxZq3fgCz5Rx
	 Qu1mpo/41Jn3RhXVEzuxI4W8au+1Jz+CdecNoYa7zk78ZRdx/MQdck2XMpxhIbDzqH
	 tN3jXOpL0tsRQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8F056C41612; Tue, 30 Dec 2025 18:42:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Tue, 30 Dec 2025 18:42:43 +0000
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
Message-ID: <bug-220904-208809-V6FmHokPgV@https.bugzilla.kernel.org/>
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

--- Comment #2 from Thomas Jetzinger (thomas@jetzinger.com) ---
Created attachment 309097
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309097&action=3Dedit
Disabling UCSI does NOT resolve the issue

Hi Heikki,

Here are the logs from two test scenarios. Both tests confirm the issue
persists regardless of UCSI driver status.

## System Info
 - ThinkPad X1 Carbon Gen 11 (21HMCTO1WW)
 - BIOS: N3XET63W (1.38)
 - Kernel: 6.18.2-zen2-1-zen (custom build, also tested on stock 6.12)
 - Dock: ThinkPad USB-C Dock Gen2 (40AS)

## Test 1: UCSI Enabled (Normal Configuration)

**Boot with dock connected:** USB 3.0 works
 - Ethernet (17ef:a387) on Bus 002 @ 5000M
 - USB3.1 Hub (17ef:a391) on Bus 002 @ 10000M

**After disconnect + reconnect:** USB 3.0 FAILS
 - Only USB 2.0 devices enumerate (480M on Bus 003)
 - Bus 002 (20Gbps SuperSpeed) is completely empty
 - Ethernet and USB 3.0 hub missing

Key log pattern:
 usb usb1: root hub lost power or was reset
 usb usb2: root hub lost power or was reset
 usb 3-3: new high-speed USB device number 14 using xhci_hcd  =E2=86=90 USB=
 2.0 only

## Test 2: UCSI Disabled (blacklist ucsi_acpi)

**Boot with dock connected:** USB 3.0 works (same as Test 1)

**After disconnect + reconnect:** USB 3.0 STILL FAILS
 - Identical failure pattern to Test 1
 - Same "root hub lost power or was reset" messages
 - Only high-speed (USB 2.0) enumeration

## Conclusion

Disabling UCSI does NOT resolve the issue. The problem appears to be in the
USB-C/Thunderbolt physical layer negotiation, not the UCSI driver. The repe=
ated
"root hub lost power or was reset" messages on usb1/usb2 (Thunderbolt/USB4
buses) during hot-plug suggest the xHCI controller is being reset but faili=
ng
to re-enumerate SuperSpeed devices.

Full logs attached:
 - bug-220904-test1-ucsi-enabled.txt (Test 1 with UCSI)
 - bug-220904-test2-ucsi-disabled.txt (Test 2 without UCSI)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

