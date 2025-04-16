Return-Path: <linux-usb+bounces-23114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFCDA8B46B
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 10:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F3E58189ABE7
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 08:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 888C322E410;
	Wed, 16 Apr 2025 08:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXjZCWmz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF4A8494
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 08:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793590; cv=none; b=T0Gri4wMmkUifT4H2sS5DFnkNT8Y6zj90hkD7SPpORR3SYZuy1Fs9siiSA8NV2oZTXQCA7mDkmia+JB0ybbrKWrm0QUen+WzHv8wEUSNQplu81jPA4pdWbeGOfyOUqjxGiI2yWP2jvGwkOFmOd0xnGueyqLLORXJeWebSqp8GMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793590; c=relaxed/simple;
	bh=swiWd4v74rhonA1+AhFGT3b9R5gJE7Yb7SKn8S6yx00=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s2Q/17abtcS5rhSUk1rh5te1IK2u2SplJ6hA+oXyVpm6WEbVeW5eDnqgrVI9cfed84cTG7d1lC3V5GAlfoS/vfutY0TpkFOhj/dVUqwjIC1FPcrdqb76T+RTBTNX2WRv+0NjOv8BGBfL/6JroSB6uPaKPUKYaDWRCYLLRs2mGCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXjZCWmz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80760C4CEE2
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 08:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744793589;
	bh=swiWd4v74rhonA1+AhFGT3b9R5gJE7Yb7SKn8S6yx00=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RXjZCWmzmiLrw+Y3p+ij1wxySfeiVdxjZIsanc7JtFsagP51mSA4OuE9/jF8sdzoz
	 pR1oRGligKK2TDWPpacQ6FfA6Cccfv6VnresRQlCd1LxMl5mrdijSvU57hDpLi/Vtj
	 XSLtS2h0N3cfeSF8J7QQnuFpZQhpsOaaGDfYCILfMkZiBpNnxwccHtQHgRdRTI5cGR
	 Nr2YZEkuVyx8V0mTSJYR6VdEZZaId2BBOnTbnbD5nc5dI/Tpr/71zGE3S6kcrVveL4
	 hobG/mfSg7CeMBo4KPkg4rddskKf0T1M4aRdgxQedBiiK1ZCs64oPMnB2k3DaQlFwU
	 nRyuTlTY0m0Qg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67E34C41612; Wed, 16 Apr 2025 08:53:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 08:53:09 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220016-208809-y5Q5xRNaVG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #3 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
What if you disconnect the hub and connect an ordinary device in its place?
This log looks like several USB ports on your computer should be completely
dead. And some SATA ports too.

This looks like devm_request_mem_region() is failing in usb_hcd_pci_probe(),
and maybe pcim_iomap() in ahci (SATA). So something to do with PCI, ACPI or
other lower level stuff.

You may try your luck reassigning this bug to drivers/PCI, they seem to be
responsive to bugzilla reports.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

