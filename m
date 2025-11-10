Return-Path: <linux-usb+bounces-30253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E3C45E74
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 11:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E4A2D4E96DE
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 10:23:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F361DE8AE;
	Mon, 10 Nov 2025 10:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EhM2AWmM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4D288520
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 10:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770192; cv=none; b=FxoeApLjwuIGv6GJ3ng9lI9f0ylTCtNrEGGkGrw57ALySaE5+2z1RCEnc/xC5HOfDL/uxOiKNvPmPoeRMs4TpeyxS30PNTiBH1CZYgjdI3PESYuVgUO4Ov0DGGKibREZEFU6WW2j4Zj4LxFdeRiSYBi9l8lmfA1sUWIQwS4bPm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770192; c=relaxed/simple;
	bh=u1fUb9J2hzUWSaLwv4iUdUjGuRR1rR3bH9oxgGIGbag=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HfvnQfQB2HY9+LPWKtyPB36eYngeeSOFKloKldtQ4DyPQ3HG+JuE5Cq/QpDVeHxaW00uFMru+2s+duW/oK91r1eOhxhU5PwTcizstLRBxDI7/O3zayTt4Inlyl+A8RYvXh1ZCUABajdysbqCyfJlUVktdzRPb5th+DcW7Bi818w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EhM2AWmM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61B16C116D0
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 10:23:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762770188;
	bh=u1fUb9J2hzUWSaLwv4iUdUjGuRR1rR3bH9oxgGIGbag=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EhM2AWmMVq9sk3GQaB6zxZ920rZcL3Sx7M/xDEgYRioEI2/Hvel95SGr4KH3bVIYD
	 YZ+DyylELWOfIAZ1s5tHfsBWP0cOotjkaDB2Fs5hAU8ateqCKlgxf6RYVFYpGcGeJ+
	 bHYw8lnPxNyVxeLagje7WCKMvaN+nFYhRSDg81Fmi7Ch9DnvAOajzGygQDB7HQMUa1
	 iH5QNQ8+1AohjeeBj/R1EwKlR0U9CqZ6rMfFmTF73+oYaDxi3dU0X/qlVoTxrKW4J8
	 xdGBfaWGlmeSnFCVE2eu0AYioN+GoNEZoGNsd9J2D5PIf9BzKHyH6yari/b1dPD8ko
	 EoNFZ80bctLHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 52EE0C53BC7; Mon, 10 Nov 2025 10:23:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Mon, 10 Nov 2025 10:23:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-ZFK5EHXldp@https.bugzilla.kernel.org/>
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

--- Comment #16 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Alan Stern from comment #15)
> When the queue underruns is exactly when URB_ISO_ASAP is supposed to matt=
er.
> If the flag is set in the new URB then that URB should be scheduled for t=
he
> first slot in the future, leaving a logical gap in the queue.  If the flag
> is clear then the new URB is supposed to be scheduled for the slot that
> follows the preceding URB
I meant cases when the queue empties completely and there is no preceding U=
RB.

But I see that there is a subtle difference in EHCI - it still considers a =
new
submission to be continuation of the earlier stream if earlier URBs have be=
en
given back but their completion callbacks are still running. We can do it t=
oo.

But the real bug is xhci_get_isoc_frame_id(). This should convert
urb->start_frame and packet index into frame_id to be passed to HW, but it =
also
reschedules URBs which it doesn't like (and does some nonsense if the queue
gets too long).

This happens silently under normal conditions and the warnings at the end of
this function are bogus, almost impossible to trigger. So that's why no one
noticed. The only indicator is urb->start_frame discontinuity, but it seems
that class drivers trust HCDs and aren't validating that.

I don't know if that's the cause of those Motu issues, but it's clearly
involved in the other problem with low-latency duplex operation on CFC
controllers which was reported last year and which I can repro on my HW.

The above applies to xHCI 1.1 controllers (typically USB 3.1 and newer). On
older ones urb->start_frame returned to drivers is kinda bogus and everythi=
ng
goes ASAP. Which actually seems to work better in most cases than the buggy=
 CFC
stuff, but gaps due to late submission remain undetected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

