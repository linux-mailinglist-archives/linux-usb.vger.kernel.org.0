Return-Path: <linux-usb+bounces-27313-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4339FB37771
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 03:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56F7B1892A8E
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 01:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDE91A23B6;
	Wed, 27 Aug 2025 01:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eDUIQyb2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7550A1B5EC8
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 01:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756259724; cv=none; b=n1eCIGnVEXX5ARCHPhK9rKnAT2pYGaDeADBuk2+gusw+SHG3wCd2b7+8xNGNWSD2ayzP3SYtquNWzeTlpcJDgSeLoF255oe7GXUljyC77ZP08Ujx+Tqq9ivOL4R/cTB4ja8Jq36aylPgaMnVg46ywXcMZX7DpIFkzU22WzAwLbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756259724; c=relaxed/simple;
	bh=gWlpWz+arko0N8d1eEKhTt0r9y8Onan7/QnQC4yJm+Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hflZxSyQm8hBEc4v/XSBoZc5RhZVHpVpDGe662ln3QmJEyAF5K0xYn4EeIW+0U08WGc2oTMTYluzFB/Wax8UqL3zIK6PpxDcGx0E9seLZNFmqszTwSDjyLo0U2wdYMC97t/h6FgAukvmC7nzp9GIHAp9mPS9H+cgECfm/DYmHjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eDUIQyb2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CE76C4CEF4
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 01:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756259724;
	bh=gWlpWz+arko0N8d1eEKhTt0r9y8Onan7/QnQC4yJm+Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eDUIQyb2ciCV9aJ7NInW/218N3XkHVJ4euUMz2P7zG1aJLiZ350thcoCVgZrtPTqR
	 TujFOrxJl8J3Z2IQ9NTvOIl5O79afJJdFb6rf54vwnbGl63MFQzRdPa4ISR86hnENx
	 bXkqxgH2ESp6U2b/pNwfcVZ7Urbm3faNLmcrE4qtb3Y8gHJ/NFAVhfAqKoi14pSVnM
	 vDkytsczq2BL0k+VYIO2aEVSrsE882YXrCUZ4ioePB1t1bvZ8+C//SR+rJ8/YUFT1D
	 vg946QU0HogZL+cP+NTHsWOim7ZEQvfBms6v4njzdHfkEhRxUtqx3nstM30b5zINcj
	 PBisqFnMgztXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21AF2C433E1; Wed, 27 Aug 2025 01:55:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 27 Aug 2025 01:55:24 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-lWnLdvULe1@https.bugzilla.kernel.org/>
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

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
The usbmon trace is opaque to people who aren't familiar with the USB proto=
col,
but to people who are, it's a trove of information.

The trace initially shows the card reader getting suspended.  Then during t=
he
resume it shows that the connection was dropped during the suspend (possibly
because the device wasn't powered).  The device gets reset okay, but then
things start to go wrong at this point:

ffff9bbf9f9de0c0 215868796 S Co:3:003:0 s 00 03 0031 0000 0000 0
ffff9bbf9f9de0c0 215872346 C Co:3:003:0 -71 0
ffff9bbf9f9de0c0 215872402 S Co:3:001:0 s 23 03 0018 0004 0000 0
ffff9bbf9f9de0c0 215872413 C Co:3:001:0 0 0
ffff9bbf9f9de0c0 215872539 S Co:3:003:0 s 00 03 0032 0000 0000 0
ffff9bbf9f9de0c0 220976339 C Co:3:003:0 -2 0

The first two lines show the computer telling the device to enable the U2
low-power link state and the device not replying.  The last two lines show =
the
computer telling the device to enable Latency Tolerance Messages (a part of
Link Power Management) and the device not acknowledging.

This strongly suggests that the device can't handle LPM properly, and it mi=
ght
start working if you tell the kernel not to use LPM with the device.  You c=
an
do this by adding a parameter to the kernel's boot command line:

   ... usbcore.quirks=3D05e3:0747:k

where 05e3 and 0747 are the card reader's vendor and product IDs, and 'k' is
the code letter for "No LPM".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

