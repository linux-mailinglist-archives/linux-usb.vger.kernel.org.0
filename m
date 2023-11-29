Return-Path: <linux-usb+bounces-3465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA667FDBC4
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 16:44:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 783781C20938
	for <lists+linux-usb@lfdr.de>; Wed, 29 Nov 2023 15:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC67538FBB;
	Wed, 29 Nov 2023 15:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XbgKAV2h"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EBCD38DED
	for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 15:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C567C433CC
	for <linux-usb@vger.kernel.org>; Wed, 29 Nov 2023 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701272692;
	bh=OBJqfwLphCLQFu0q/bTbaSS+TOP+Xi9G1wSEMxPjxCA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XbgKAV2himLVJwzOOjc/K9P2PWr9o3BFVwAX32zoIWhC2kGCDrbfQd0vHIacv240U
	 vMuinoE9vZKOJIXzeUaCrku8YPX3D0maNL4//mNNV7Tzwye7Q4n5+1J3OxDufReE8X
	 tExdkDlwlFQT3EtHhFaC3CSHg+3FAKq+LcoZhITWnm6KxBl6SuvKNxO2POvDGc5+nc
	 WWyyDZQKFaXvTOtJYOnt5mv/KP3vyCeJDhVL0xP7vW5CUv1ho+JF8RUd8Zr2jbp0rB
	 uRxibTVBrgI7FUbZmRpGQC9DMz6v8TBPxP2MncILAnTg2cVplkVAwLoAeBkk3PH+17
	 gH4uS/DMTgdfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 78390C53BCD; Wed, 29 Nov 2023 15:44:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Wed, 29 Nov 2023 15:44:52 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-eYH291XW7b@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #37 from Alan Stern (stern@rowland.harvard.edu) ---
Okay.  On an Intel Edison-Arduino the slowdown won't be as dramatic as on a
large system doing high-bandwidth I/O.  But you'll still want to avoid it if
you can.

Have you tried testing the patch posted in the email thread?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

