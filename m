Return-Path: <linux-usb+bounces-19944-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BAB6A24BDB
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2025 22:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C8F9164BB5
	for <lists+linux-usb@lfdr.de>; Sat,  1 Feb 2025 21:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112B31CCEF6;
	Sat,  1 Feb 2025 21:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0jmcy5E"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834701C3BEC
	for <linux-usb@vger.kernel.org>; Sat,  1 Feb 2025 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738444517; cv=none; b=pRvbQYPArHzQPNBuSkyD0uTuTx4lc1jVrquWeDF5Lm/Lfui2hT589Osg6mf+pl67oGg9lYSfONyBRfwhJ+YhKDGEKyzxA0LbTdugONoJfaRZk9ynVglebWqUr0OSRtYk3YBpvAxHhR8zksFMdcl1rhYq1J2CAelH2b64YEQXGsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738444517; c=relaxed/simple;
	bh=1ngFwU246dHxf7ZCjKzrtLd/ozUbLQhPnNpr/MIAlB0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I3dF5n2a8bBaFkBACUzbDSCnRpLEQ9Fe39PRdRygEJv1bWUrVtqALsADBf+tZgU7gJA1Wmv1at4BDU8jyaPHrc8lPUpbKt/kwTSCuQRlWx7JCPqPMfC1yNhzHl0NvWfl6Th3/zE1okVxtzJba/8/cPCutDtuJ0zt0ZtLHpeqZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0jmcy5E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2CA3C4CED3
	for <linux-usb@vger.kernel.org>; Sat,  1 Feb 2025 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738444517;
	bh=1ngFwU246dHxf7ZCjKzrtLd/ozUbLQhPnNpr/MIAlB0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M0jmcy5Ef8woH/zoPFhQONa476yo5RVGWq5nG+WRz9EJkLEgB+xs9wz3fLlLhrhoC
	 h9Fcd90n+uLmJ35ogkGENfECSIO9UFWgSRZJin4EK5lYibx77HtZ57ZqAFaYjc/0+g
	 OlFVe8Gb1fC7ztFJNwXY+igDJXAH/3FBG/ZK1VjpKF+SFj0WMFCxuF2Y5V3NSVWH7b
	 r7mhDuHJLILpsgtG0k1YNnceYxk/0bmOR8x8/xheyd46UWQE+KngrbGux3Bg0Z/dDZ
	 sBPTbg/ZAJu3U4NDnxa1ypNds4PNxDoIPVMdKR78zlQw0JhSd+AOiWgYdfNcGcx4Xx
	 sQ2+3wTvM0FaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DACAEC3279E; Sat,  1 Feb 2025 21:15:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Sat, 01 Feb 2025 21:15:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pchelkin@ispras.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219590-208809-2Zjsx8YcDr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

Fedor Pchelkin (pchelkin@ispras.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pchelkin@ispras.ru

--- Comment #7 from Fedor Pchelkin (pchelkin@ispras.ru) ---
Hi,

is this warning reproducible on your system only during the initial
startup/booting the kernel? If you then manually load/unload 'ucsi_acpi'
module, are there any errors observed in the log?

Do you have something like the following in the kernel log (dmesg)? Does it
happen when the WARNING occurs or when it does not occur?

[    6.482546] ucsi_acpi USBC000:00: failed to reset PPM!
[    6.482551] ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed

I've also encountered these "failed to init PPM" errors and the WARNING. Lo=
oks
like PPM is not quickly responsive at the kernel startup phase. That's stra=
nge
but as a straightforward solution the attached patch helped me. It turns out
that it takes around 8000ms for the PPM on my laptop to start responding du=
ring
kernel startup when the selected timeout in the code is 5000ms. You can che=
ck
the patch. If it still won't help, try increasing the timeout some more.
Otherwise, the cause seems to be hidden in another place..

Also checked various kernels, and "failed to init PPM" errors go back to 5.=
12
kernel at least on my system so that's probably not a recent regression. I'm
not talking about the WARNING - it appeared much-much later and probably ju=
st
revealed the problem clearer.

See https://lore.kernel.org/linux-usb/Z18hJM55ED2hYJ6D@lappy/t/#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

