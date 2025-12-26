Return-Path: <linux-usb+bounces-31771-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B1BCDEC06
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 15:09:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A60C3001183
	for <lists+linux-usb@lfdr.de>; Fri, 26 Dec 2025 14:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8571DF254;
	Fri, 26 Dec 2025 14:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jW+P2aOb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77E4199E94
	for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 14:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766758142; cv=none; b=ILHNUoniirZlaprN5ttQMhh6wpvMbuvWlWFvBd5mYtyp4D28M5xWjN4EkCoVepFLX+K7cj4lre5dKz7UdZhg0AsdqpLLa1greEOWhPM84RicmKLkYgLUVsJku+RHJPJq0MM0OS8lMsBbxlD7pWMvUXAqjFCS2B4kY/9iZZ4mO/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766758142; c=relaxed/simple;
	bh=OfTTT5qVojIksa48CeOVyI4HSOa7+NbTue/qQquWZEw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QWDRz1FIXddjCLrqQcZD/dwG2r94zzD07h0EI7InZkju6uqTwCCHIXrOQVkVMsjrxPcDjvhHyLhls/nVeaHp4VLMhg3RnwW0uzzQ4MD/bqejO3HjN+pXJ1arCs81eNjUaw9KF3CIJG9pUqjh4BMEEZw48JSy7e85MA20kS0mkEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jW+P2aOb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78422C116C6
	for <linux-usb@vger.kernel.org>; Fri, 26 Dec 2025 14:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766758141;
	bh=OfTTT5qVojIksa48CeOVyI4HSOa7+NbTue/qQquWZEw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jW+P2aObyk2YHZeHzB8Ma8BiYZi9INWrVcUWKzLwwK0VNxtsrvNdr6Eb16Mwc7fWU
	 YbxSAzsh3uY8AKrTGauGf9oIzY0iA0Lx0+3nYWO6NLqVWDY+yEemBhSGHcUEKpNcHy
	 OLQ34PUB9kMudQc0mvY6k1FCOzLEvdNfyGK6l2UR73zauomPfYpwFI3h1o8IBETVHE
	 ZiYhfRLrQaehCs8nODi1kEuzuVfkGsfnac8e4+ncbOxByXSSiiVgceR4cdtFq009iN
	 +K2s+dAELQAdMiP8ygfotr9hly9kHqdTZS3wj1LEykihOMMqjHx6qb1Q1iQpJKpdlN
	 +YzDweIbA8NnQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 638CBC3279F; Fri, 26 Dec 2025 14:09:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Fri, 26 Dec 2025 14:09:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel.exact088@passmail.net
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220238-208809-wBy8oXDUJM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

kernel.exact088@passmail.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel.exact088@passmail.ne
                   |                            |t

--- Comment #14 from kernel.exact088@passmail.net ---
I'm experiencing the same issue with the Blue Yeti (046d:0ab7) on kernel
6.17.12-300.fc43.x86_64 (Framework Laptop 16, AMD Ryzen 9 7940HS).
In my case, the mic works fine until suspend/resume. After resume:

Device enumerates correctly (no errors in dmesg)
ALSA can open the device
Recording fails with: arecord: pcm_read:2279: read error: Input/output error
sox shows 0 samples read, amplitude 0.000000

Physical replug restores functionality. USB unbind/rebind, usbreset, and
USB_QUIRK_RESET_RESUME do not fix it.
This appears related to Bug 215219 which reports the same device ID with
similar symptoms.
Attaching diagnostic data (dmesg, lsusb -v, sox analysis of working vs brok=
en
state).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

