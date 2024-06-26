Return-Path: <linux-usb+bounces-11670-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF40917C22
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 11:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7D469B2657B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jun 2024 09:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EFDB16CD0D;
	Wed, 26 Jun 2024 09:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nTIMGq7D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1831662F2
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 09:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719393016; cv=none; b=RgP/en8D6bhMWi0z453KQS9HoYYC85faNNVmCOE70aamNuROYtP3pkBzrcLqfHrVIZ7RGD5+pF7GCGbFRFEKZfzmDZ7xQJdrUQoboIUeg8tAOt1Pf9IfJnhAFYZgUA+7Ue96UrL5DoYVSq5EvQiocvz0807S6HdgSnriP1BRrt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719393016; c=relaxed/simple;
	bh=OsIKUNtTa4B6ujR3xENU9V66GS5ayWtkIniVUqfCtaA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=trytzynH1JT1e1GFcTCLoD6v9yPH/AXKwh3bpco4VHEXqJRlHS3bEtnf2XH4cUUrtj1OfxX169mq+906S8JboKih3KsOa8SA1Vtk96Ms4vawzuQL9lVbihqqX6eDvBCtyjkYZS2EkZ7ThHOM/fzBCrBH9m1uBrnkHIUsAIGb3G8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nTIMGq7D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EF87C4AF0D
	for <linux-usb@vger.kernel.org>; Wed, 26 Jun 2024 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719393016;
	bh=OsIKUNtTa4B6ujR3xENU9V66GS5ayWtkIniVUqfCtaA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nTIMGq7DQCcwknGA1H50QBd1M6+7E9AgB43caiqd7GsnIyK92xbyh8peqceYfzukA
	 11SHh1fWCWyT1kqQlrSqIZGPLHfoNmIr117JPzmwS0bpuz6wFvgQ9mPFD3KS+kVKMS
	 sCz2LKYwi1CqpweGKHUVC+x0ddkxJbKnGXnHJV08h5EuuGhPKRCQn8LNkicdZ5aqGp
	 wAwna832AvtfrEzisNPQtSa/tGRg0Au1tN9330rP62jQJKxopT844XUyZgusocTS7T
	 hdQgdPQNiakQC13A0wvYTn9A1dq7vpofCWV87gfcPERG0xZEEzlymf9G2XM/qt69gJ
	 LY57nmtJrdFVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67B94C53B73; Wed, 26 Jun 2024 09:10:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Wed, 26 Jun 2024 09:10:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218987-208809-dkJpk5DaEh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #3 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Thanks for debugging this.

Issue 1, reason for SRE is unknown to me as well.
Issue 2 is probably due to PORTSC not immediately showing connected devices
after host is restarted. This is especially true for USB3 devices where dev=
ice
only shows up in PORTSC after successful link training.=20=20=20

A similar issue was solved in:
commit 33e321586e37 ("xhci: Add grace period after xHC start to prevent
premature runtime suspend")

In your SRE case we never event start polling the roothub.

How about a solution that is similar to your patch but doesn't touch
pending_portevent. Instead we always resume roothubs in case xHC was reset
during resume.

Does the oneliner below work for you?

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 37eb37b0affa..12b9c2c7f39f 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1172,7 +1172,7 @@ int xhci_resume(struct xhci_hcd *xhci, pm_message_t m=
sg)
                        pending_portevent =3D xhci_pending_portevent(xhci);
                }

-               if (pending_portevent) {
+               if (pending_portevent || reinit_xhc) {
                        if (xhci->shared_hcd)
                                usb_hcd_resume_root_hub(xhci->shared_hcd);
                        usb_hcd_resume_root_hub(hcd);

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

