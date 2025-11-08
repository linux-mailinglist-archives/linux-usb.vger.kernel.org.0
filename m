Return-Path: <linux-usb+bounces-30223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A8480C42F83
	for <lists+linux-usb@lfdr.de>; Sat, 08 Nov 2025 17:09:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F129188CFB4
	for <lists+linux-usb@lfdr.de>; Sat,  8 Nov 2025 16:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0721F9F47;
	Sat,  8 Nov 2025 16:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJ1N3BjQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C4C133
	for <linux-usb@vger.kernel.org>; Sat,  8 Nov 2025 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762618158; cv=none; b=WgdftexguUDjQJS7VBcMkG2VG8E/Nxrt3/5vcWJQqxpQptBZljfpKE7Q/mA7ovybwvsLsJh1+XpNW1U50XMLqIJMvk/7CCgfrXWY9ZZWM7U3z4YbTflP98L3ZSWRqhHZCHE5Owjy9TrSpduKCZeYBbAXYf2N+fBnWtwzPgbYerY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762618158; c=relaxed/simple;
	bh=KjYIIYC5hN09Qvuq3Zg7XJq6Lysb5xJc/T+43fd7VMA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ohi6mfMv8i/i1YiUa3qft5MXSCHlaXVagQfFFpxOLLb9R8hkmxeKoWY7vnm3BYqG+3G4E3vOILzNu0KlcwVJ7InTyRaw0qp4m9Yw98HATVw63R2dWrn6LyQ0jppHBOVwjszedPQtMX7hP3ji4Rx2+QSIcZXlmKJNpl5DS9Qypj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJ1N3BjQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A124EC16AAE
	for <linux-usb@vger.kernel.org>; Sat,  8 Nov 2025 16:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762618157;
	bh=KjYIIYC5hN09Qvuq3Zg7XJq6Lysb5xJc/T+43fd7VMA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hJ1N3BjQSra06oUygd/FdcNB7pTOTajsYb9SfvPKmKYMnwx8EatgHzPxUvht7YUA+
	 nG/TrITdYR7aoVkq0Gz8ShWWyiZqnSNAPq6lafMlXRdMDR+9fL8GKbZRm8HaJprtwc
	 zcMAnGa13z38hF7v/vAHpafZr51ucQudtCCY1c7XRRzIipS/BmuXVDVSzBleWqAmfN
	 cd5NB7B8U/FCWAxZgn2UdqdCpfD6LC16WCwx+DjDDiKcRMGh1Qj75P+9iwRhWD1M4T
	 zPNNRXvTOJ410uR6KDpb4sxzh5usJibC9LqRJDteHS0VH2RLMhzNqWaK8AOVP+283C
	 mzYzwDGp2Bzvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 84465CAB780; Sat,  8 Nov 2025 16:09:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Sat, 08 Nov 2025 16:09:14 +0000
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
Message-ID: <bug-220748-208809-HSYpPoWEE5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
When the queue underruns is exactly when URB_ISO_ASAP is supposed to matter=
.=20
If the flag is set in the new URB then that URB should be scheduled for the
first slot in the future, leaving a logical gap in the queue.  If the flag =
is
clear then the new URB is supposed to be scheduled for the slot that follows
the preceding URB, which means that some of its packets will never be sent
because their slots have already expired.  This will still leave a physical=
 gap
in the queue, of course -- no way to avoid that -- but it will maintain the
logical alignment of URBs and frames.

Thus by submitting all URBs with URB_ISO_ASAP clear, drivers can help ensure
that the queue remains synchronized to within the limits imposed by the host
controller driver.  If xhci-hcd doesn't behave this way then it should be
changed.

As for inserting a gap to resynchronize after detected lost packets, it's
simple enough for drivers to submit isochronous URBs with some of the packet
lengths set to 0.  Figuring out how many packets should have length 0 will =
be
tricky, but that can be adjusted after the URBs complete, by checking their
starting frame numbers.

I believe drivers can safely assume that the 8 low-order bits of the frame
number will be valid (11 bits for microframe numbers), and that they are
allowed to submit URBs up to 50 ms in the future.  The kerneldoc says 10 - =
200
ms, but it's being conservative.  When a driver wants to keep latency to a
minimum, it won't go more than 1 or 2 ms into the future, anyway.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

