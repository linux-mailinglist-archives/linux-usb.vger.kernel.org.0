Return-Path: <linux-usb+bounces-30220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5A3C42B61
	for <lists+linux-usb@lfdr.de>; Sat, 08 Nov 2025 11:33:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C65BD3AB2A7
	for <lists+linux-usb@lfdr.de>; Sat,  8 Nov 2025 10:33:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86DC63002C2;
	Sat,  8 Nov 2025 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZY5nldi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660852F88
	for <linux-usb@vger.kernel.org>; Sat,  8 Nov 2025 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762598007; cv=none; b=uHw5U45+qj4HhOskNZCoqvPAdrAExz10vVPpFAwKB31hySu4UVxvlJ9meMs+eeKS6qevHPwjtp7x8c8UOIuoT0Q8ap0xiWUdpwsKDPl1rIAZtvSPk7U/W3AtdObFQllvtyB2iGFNhqJwM3GYYIqGFpxzRbQGdYrZw4xPHjxSwY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762598007; c=relaxed/simple;
	bh=C1yXKPZgb2S9PSsK3zvNL5FfiC6VnN8klum5fWbs7y4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ORVjpJ2KGs9iOYqMIqeokuz4Crqzn5T/vdjmukm8//hcoEA/9visGLPVyLNu0ybgejTiNWdZuj1Oi9I/4QavaO3NAZLtUUfqKN382fixqc+lZvq+HYHwu+E50TYLfVleT949yiR4ZB0sx2Klw9oJSZeykbJ0blkJ4sybXmBCSJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZY5nldi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A4E9C4CEF5
	for <linux-usb@vger.kernel.org>; Sat,  8 Nov 2025 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762598006;
	bh=C1yXKPZgb2S9PSsK3zvNL5FfiC6VnN8klum5fWbs7y4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AZY5nldiyS5bx1dRLiKOpUMlW2aGBCkAwJ42XWItk/aCfbPV6xtNRHD77YKgWzGru
	 ZSYg7yonYXUIkZRg76cgrtgfuFtBYVOSpQKm3d2xG8EgrcFuYRgEv5KPZwxfrcAHIr
	 2itZoGase5BZcOqlXoFMKRUWtOX6OEqXA/KmufR/tHdSAAQzjHaTohoA6ZOnOi5XPh
	 0GWtR26bwxqIJBvwvQYaB3yHLJ6Dp3WOe+S6vvG2iqMsB03i+PH9eIv0Te9NHGyCSW
	 klqpVlDvW0dqx6d/hrlTHdtFPpfWnt/HClp53F7TqIqosmoIPRdDicbWEqh/8arji9
	 UXf9dU1xV2j1w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 85992C41613; Sat,  8 Nov 2025 10:33:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Sat, 08 Nov 2025 10:33:26 +0000
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
Message-ID: <bug-220748-208809-rLQqknZiaE@https.bugzilla.kernel.org/>
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

--- Comment #14 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
I skimmed the linked forum thread and it seems the issue is not so much with
"needing a specific frame interval", but not tolerating any missing packets.

https://linuxmusicians.com/viewtopic.php?p=3D177688#p177688

So no-gaps scheduling is already the default *without* URB_ISO_ASAP and dri=
vers
don't need to fill sequential frame IDs themselves if that's what they want.
Note that this stops working when the queue underruns - next URB is assumed=
 to
be a new stream and will be scheduled into the future, not into the past.

If there are gaps despite the driver resubmitting on time, that may be a bu=
g,
but a different one than originally assumed.

If drivers want to insert a gap to resynchronize after detected lost packet=
s,
I'm afraid that's not supported in the current model. It would be technical=
ly
possible on CFC xHCI hosts and likely EHCI. A concern is how drivers would =
know
when frame ID overflows back to zero and how much into the future they can
schedule.

The urb->start_frame field is now output, so drivers can use it to confirm =
if
the URBs are scheduled sequentially as intended. At least with CFC, it appe=
ars
that these numbers should be consistent with reality, though I have never
tested it. Debugfs/tracing/printk may be used to check them against TRBs
written to the HW.

Non-CFC looks weird, maybe it could be improved somewhat but not sure. The =
old
xHCI 1.0 spec is limited in what it guarantees.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

