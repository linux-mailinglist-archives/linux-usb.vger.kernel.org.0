Return-Path: <linux-usb+bounces-21152-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FB8A4829A
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 16:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DE7E83B4936
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 15:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF14726A0E8;
	Thu, 27 Feb 2025 15:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hjLOVkFA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3051823BCE3
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 15:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740669167; cv=none; b=nHxq2QtDp+0d5f8GeBsibWbZWdddQ5oETBzO/FwWtFK9VBl+BIBlIvCWzSEGC12qSm1KkxZdMAXhEyKklNpUXYCc7J5awKKe9v4d2h4suWqxRj941dX1OXV9ppDSdG7UR+sk2aMFktzcVJ+vBPfQUGQJKcEaDc4JDYNxPnpf5IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740669167; c=relaxed/simple;
	bh=1BJ2PBcmdES/GgHXIhwOFfiE539rmcjXa1ExJ0mk5IU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LYhWHHDnMPmstU5kj4hCBWB/AFTxtxLxfE68aPQZx0VacGQcJCsC1DX5KmFy15ZYH1y9VXKuUQXuIcTx8S/Niq3VIqrUa7Rmuwi9vXYGeouF76ZGMcnbRDyyfxg9Vk+GHw3nA/zvftJjK/+9CzArbD+xM218qx0akE9yVfTeOiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hjLOVkFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 801ACC4CEDD
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 15:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740669166;
	bh=1BJ2PBcmdES/GgHXIhwOFfiE539rmcjXa1ExJ0mk5IU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hjLOVkFAvwi5NKEKyL3+baiHYHEk2s5iKMw0xEVsTNxQ915veoSg+lHadg9Hi1rvn
	 Z8Q9ygCkLXHFuqocx0UDts6ULKr0v356STnyeKab92sAmd//yadaTdi5078lfTHqzD
	 niM/zTVSaA3IxWb1DGK6knZLdYbSNyTWwG/+ArXh/AbWkdw8sr9esOtHTIEVkLIRPU
	 go1Dq1tWKPbHor7/HAzxFitg9W5331RjF1yshllBX4DUsc4REnferYNXGnYaAoBCaj
	 hzIZiF9ulVdSVtFCo683zZCnWFkTndQdgbskWbG4uQnQUo7dRYDqArNebKQtBURpD0
	 tw6e3ujggpvrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 77F1DC4160E; Thu, 27 Feb 2025 15:12:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Thu, 27 Feb 2025 15:12:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219824-208809-DpJ75zFGIU@https.bugzilla.kernel.org/>
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

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
6.13 has a lot of changes related to endpoint stopping:

e21ebe51af68 xhci: Turn NEC specific quirk for handling Stop Endpoint errors
generic
474538b8dd1c usb: xhci: Avoid queuing redundant Stop Endpoint commands
484c3bab2d5d usb: xhci: Fix TD invalidation under pending Set TR Dequeue
42b758137601 usb: xhci: Limit Stop Endpoint retries

Endpoints are stopped in order to cancel transfers, before suspend, and to =
soft
reset an endpoint after clearing a halt.=20

I understand that bisecting an issue like this that triggers rarely isn't an
option, but can I ask you to try running 6.13 with xhci dynamic debug enabl=
ed.

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
and send dmesg after issue is triggered.

It could reveal a bit more what's going on

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

