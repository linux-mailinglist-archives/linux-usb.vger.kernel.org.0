Return-Path: <linux-usb+bounces-21511-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E63A572FA
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 21:38:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C2469170BFE
	for <lists+linux-usb@lfdr.de>; Fri,  7 Mar 2025 20:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CD72571CA;
	Fri,  7 Mar 2025 20:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eL5QdRcl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF9E183CB0
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 20:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741379893; cv=none; b=LxNCAZbEmG/5XaOd5LULpNKlBpf/NdqEZl9q9w6ML0u3USTxZu8E0a4kHc3Hhmd5r+G0ebUTBASGxufWoQIyCqJCwnKLitFAcoBC3ycgaGgErS+UQhE6/t8qaATyS8OUD4ylikxREOvytB0Ic3nZJDbAsR0lqjlfHTMKvbjUm6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741379893; c=relaxed/simple;
	bh=HLplMf80f4NfQuM1PvN6yfzg19zXhw93A0Vzz5p1YOM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MvmUUH1jrcUoSOkoCP8jDyKRBZZ/utU7TF/5Xx2CSHPVEzQ8RMRn52TCuwr7WbML3ab+wXatGgTf+nU7qlRMMvrjzs7yxTa+Lndv4SADeKTOycRHptpAB91jRtvnaB/czC8ikew5s36ADnQ03qrFLesAWSbK048wFnP/MhHiYrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eL5QdRcl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05A53C4CEE8
	for <linux-usb@vger.kernel.org>; Fri,  7 Mar 2025 20:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741379893;
	bh=HLplMf80f4NfQuM1PvN6yfzg19zXhw93A0Vzz5p1YOM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eL5QdRclJ+bjpJqpMpwPExpPiZpfQbC8/c8qF6quPnc5FSKwNa2H6jpHgFNbvEouh
	 V3rTJA20RZUP1H5lxWsELmF+Aeq9wS37qCPxggU3rU/p2IE246+ibXfGhC5tal3H72
	 PNaPVQalC42huMk4IgpJamFMxWh+VoRISn1GUVbtp7iLZVzbZp6/EgwNLHKIGGx5Sl
	 V4GMJKwP4N3DJnUSRKF9FofS/By03z+k3EhbdVgnHBZ1Qp6gLdqT5QXnOCE3Jai/ER
	 0DMtmhKJmgCFMCgRy0h2DaXekQj6HQ/s1guyoGycBIuUQgmb5MWt6h7kgnPHvo++J+
	 A4jQIFxf9psZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E883AC53BBF; Fri,  7 Mar 2025 20:38:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Fri, 07 Mar 2025 20:38:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-LTziZmOz3u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #32 from Thomas (lyz27@yahoo.com) ---
>Do those same failures happen in the case that the retimer scan was totally
>commented out?
Yes.  Same issues happen when testing the HDMI port of the dock with that p=
atch
applied.

> Do you have CONFIG_USB4_DEBUGFS_MARGINING=3Dy set in your kernel .config?
No, CONFIG_USB4_DEBUGFS_MARGINING doesn't show up in /proc/config.gz=20

Tried a few more things to see if it would provide clearer details.=20=20

In Linux, the monitor connected to the dock detected correctly, which doesn=
't
happen every time, setting the resolution to below 4k causes the monitor to
display output.  Before setting the resolution below 4k, the monitor would
detect HDMI signal over and over without displaying video output.

Booted to Windows and reproduced the issue of the monitor blinking on an off
with the HDMI output on the dock.  It did work after unplugging the dock and
plugging it back in though. Didn't check the resolution though.  If that is=
 an
important detail, I can get it.

Overall, both the Skip retimer scanning and 0001-thunderbolt patches cause =
the
dock to be correctly detected.=20

I'm not sure if I should pursue -- or how to pursue --  the other issues wi=
th
video.  They seems sporadic.  Amdgpu doesn't seem entirely stable.  So maybe
video issues are expected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

