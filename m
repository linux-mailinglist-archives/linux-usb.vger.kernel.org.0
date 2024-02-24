Return-Path: <linux-usb+bounces-7010-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5E3862404
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 11:14:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 638141F22E0C
	for <lists+linux-usb@lfdr.de>; Sat, 24 Feb 2024 10:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 668841B81F;
	Sat, 24 Feb 2024 10:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ghrlxw8u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E499814B800
	for <linux-usb@vger.kernel.org>; Sat, 24 Feb 2024 10:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708769659; cv=none; b=rJn8CsRGPjCJrW+LsDEeysJpBj0BvY2Yn6rk2mBFCzTKQLJl9SjUq2DJhcMf9COeuM77zrSIjThAL1QSJs6I6BwMkxnOKU0sj5kiSap4fNdIA4h27vFO+4TNdO/4WqogLCv0kyLUH1GMdchTAZsV45Uk+6OyBtEamL8+o2Ia/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708769659; c=relaxed/simple;
	bh=hCHl5QWMF/UvvtfLklHEoo9TM3fxtYpCLus3oS3lNrA=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=Bs2h4QeDmeLBxjgd6s35ruFjWsr9M1x/SUOyjxZafaOpKXDQTs7w1e7TkQneS3YYK8l0kH0JOLxFSxUmOUbaum5h75etKWVuw86ligvQESdfpcAvwrLQNpeAzeZI1HTn9x63cYg620WgQZyqQ4TejA2N0O6WKFygJ8dr9pBat7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ghrlxw8u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83A61C43390
	for <linux-usb@vger.kernel.org>; Sat, 24 Feb 2024 10:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708769658;
	bh=hCHl5QWMF/UvvtfLklHEoo9TM3fxtYpCLus3oS3lNrA=;
	h=From:To:Subject:Date:From;
	b=ghrlxw8uISFgKbB3OLfBy5iq21Fxu027m+Nq/CDVKFKQuklYAE3nc5GmXGweYnkD+
	 VjkByRAtojMY4dW9tOR8miuuitpagqaBMe2daMVm5xTQbRJhF1BGjQagye6iBIJYmf
	 d3JQnED6GLMqx05Y9ayAtfAMn75v3dAm5TPZRTAYeLplJdGHDPG1WSOG6Hh/YWIx+R
	 f57N/PCJ0v0IW/3Up7ma5/cC2Ty9kEekcbQuJkBW38aC1hqKFrkZY6nP4GEBQeJuhJ
	 2uq0sZ88zmbASblsHnmbU0SgsflwUrevNSrqaEs9bPsDE5OxBgljrbHOLLcXdW1FXh
	 1WPJE6ZxTM7cw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 66496C4332E; Sat, 24 Feb 2024 10:14:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] New: Thunderbolt eGPU bad performance
Date: Sat, 24 Feb 2024 10:14:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gipawu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

            Bug ID: 218525
           Summary: Thunderbolt eGPU bad performance
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: gipawu@gmail.com
        Regression: No

I opened this bug report because I think there is a performance problem in =
the
Thunderbolt stack.

I have an eGPU R43SG-TB3 adapter, which can be connected either via Thunder=
bolt
3/4 port, or directly via PCIe M.2 x4 link.

Using the eGPU connected via Thunderbolt, game performance is often absymal,
especially with games that use DXVK.

The problem is described at length here:
https://gitlab.freedesktop.org/drm/amd/-/issues/2885

but in summary, the main symptoms that indicate the presence of a performan=
ce
problem with Thunderbolt eGPU are:

- Low and bumpy fps, GPU clock speeds and GPU usage.
- Low or no difference when downscaling the resolution or reducing graphic
settings.

Using the direct M.2 connection instead, performance is as good as expected,
almost on the level of Windows.

In Windows there is a performance gap of 5-10% between Thunderbolt and M.2
connection, but in Linux the gap is much wider, sometimes more than 50%. Ve=
ry
few games seem to be unaffected by the problem (e.g. Shadows of Tomb Raider=
 and
Doom Eternal).

I tested with an Nvidia RTX 2060 Super GPU, paired with an Intel Nuc 13 Pro
(i5-1340p and Thunderbolt 4) and with a Dell XPS 9570 (i7-8750H and Thunder=
bolt
3), both running Fedora 39 and kernel 6.7.5. I tried kernel 6.8.0 rc5 too, =
but
with no differences.

Since the problem emerges with both Nvidia and AMD GPUs (as evident from the
linked report) and that the problem is not reproducible by connecting the G=
PU
directly via M.2 connection, bypassing the Thunderbolt port, I suspect ther=
e is
a performance issue in the Thunderbolt stack, perhaps in proper bandwidth
allocation.

I hope that information given here, and in the link given, may help to reso=
lve
the problem.

I am of course available to provide additional information, logs, and test =
any
patches if needed. Thank you.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

