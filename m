Return-Path: <linux-usb+bounces-21214-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B13CBA4A30B
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 20:50:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 90817188A5E3
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 19:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A190230BE5;
	Fri, 28 Feb 2025 19:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fzO6N1I+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FE6230BD9
	for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 19:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740772145; cv=none; b=Vo4l+8uWi/In3E/Tb6AFWwTCiPnbTHhwgPU3p15ii05svurKfP8+cBVP6XcjOgh6uugH3En5PJN5jGg2UOUGJmlmMBH2pfUbUQv8huhBpnHat38dNqazJiIdl/sTvlWM0aDE1nVKxLM4kTwzEkqGmmhvW14wqzZHtzWlpVGdxVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740772145; c=relaxed/simple;
	bh=x5tPgVYZiho6Jf9Qv2JEXOFnEuf9SH+JK0jkinBhoCA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=d0ArARBt3QrXJFCslzSbVAfKm7jLhGAvhL/PYIHEPqL71Lpzt0KWzzTER4Htrkrhu31LKvaIN2Q+yy0ku8sBxqcYDcGdZZ+soyZJls5Y8M+mA9oAknNQORu2grUoUOAn1j5VPOPeQlMs2FfhjXB8vnlqcb3QxH6i5+/9whQTeV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fzO6N1I+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55EABC4CEE5
	for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 19:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740772144;
	bh=x5tPgVYZiho6Jf9Qv2JEXOFnEuf9SH+JK0jkinBhoCA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fzO6N1I+kqL/lH7kpbWvGRnqSZx8ChSXs7HSub+p6J4qxNhxH8Ri3a41y/5ShZkxZ
	 67C1UO2kkXvLCpXkDHR7SuyXW0uXVgekYrRq+oqY8t9xkILhqPeg32hjRiD3HMhDJ6
	 XyrAPgp8MqAt+Y47YdNf+yddxU7vkvaf2uj7Pq42wa9ZvGIUNA7PBr0CxqdRPuXnTA
	 XMVLX86W+UtIG3v+BGp51HN0/FJ3cz31i0c1zPKB3Nxocuiq8CRVRT4PrEfY38cCkV
	 ggPsiMULOG1tkfuNIOUL3v2IF+nIZtGMQhZCho+f17aw19P6Aw/LbJkL7OLpPCY+z/
	 xBaQuQYrdsvvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 45F5CC433E1; Fri, 28 Feb 2025 19:49:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Fri, 28 Feb 2025 19:49:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219824-208809-fX0MMehMUt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #9 from Artem S. Tashkinov (aros@gmx.com) ---
Created attachment 307725
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307725&action=3Dedit
xhci_hcd and usb debug log

(In reply to Mathias Nyman from comment #5)
> 6.13 has a lot of changes related to endpoint stopping:
>=20
> e21ebe51af68 xhci: Turn NEC specific quirk for handling Stop Endpoint err=
ors
> generic
> 474538b8dd1c usb: xhci: Avoid queuing redundant Stop Endpoint commands
> 484c3bab2d5d usb: xhci: Fix TD invalidation under pending Set TR Dequeue
> 42b758137601 usb: xhci: Limit Stop Endpoint retries
>=20
> Endpoints are stopped in order to cancel transfers, before suspend, and to
> soft reset an endpoint after clearing a halt.=20
>=20
> I understand that bisecting an issue like this that triggers rarely isn't=
 an
> option, but can I ask you to try running 6.13 with xhci dynamic debug
> enabled.
>=20
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
> and send dmesg after issue is triggered.
>=20
> It could reveal a bit more what's going on

I'm confused.

If I resume the laptop and don't run these three commands immediately, all =
the
USB ports eventually die (usually under 5 minutes).

If I resume the laptop and run these commands immediately, USB ports contin=
ue
working like they always did before. So, weirdly and unexpectedly, when
debugging is on ... it fixes the issue.

If I resume the laptop, don't run these commands, and then when the USB por=
ts
die I run them, there are no further messages from the xhci_hcd module.

I'm attaching the debug log (again, no bug here) regardless. Maybe it conta=
ins
something that will let you understand what is going on.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

