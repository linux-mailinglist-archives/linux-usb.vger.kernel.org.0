Return-Path: <linux-usb+bounces-3000-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEB37F0796
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 17:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4438C1F22397
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 16:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F85D1427B;
	Sun, 19 Nov 2023 16:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3wgarXX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A319A13FEE
	for <linux-usb@vger.kernel.org>; Sun, 19 Nov 2023 16:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27877C433CC
	for <linux-usb@vger.kernel.org>; Sun, 19 Nov 2023 16:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700412471;
	bh=phxqc9rlDWHzLk6JWsDp58afweCaV4Yq1gIiT9alI7o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U3wgarXXGX8vVGxkOFyM+RvWnIbh3xBBxWOh2y+j9dXmcD8/5I1jBO3fFb6t26Sp0
	 tSX3MIt8GcAeZgAVWjmfmzUEkYAtHNwb6/W+75cX2quTKxBoB2KnSPMz8rTir9TBPl
	 JREjofiAnEPhjpGnsCdNofYf5K1owmedhzuMMZ50qIKs/03xh0PEM8q1GIQkFao3nz
	 OmNdwRjqIF+8ziQCe0fB4nbnvKLhbmLBKbTn+0MvLu0OoociKkMuMgXGzCBmz0YwnU
	 hqrp3swERVAcFSQ0KncdVuDRXYhGb8Z6l7mkTAkxadov+VAlDxTPHBCUxyHLTjfzqP
	 PUnBcssdw1D8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 10A89C53BC6; Sun, 19 Nov 2023 16:47:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Sun, 19 Nov 2023 16:47:50 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215740-208809-Rt8Q0wthC7@https.bugzilla.kernel.org/>
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

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 305425
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305425&action=3Dedit
Diagnostics for overlapped DMA mapping

I just tried booting a kernel with CONFIG_DMA_API_DEBUG enabled.  When I
plugged in a hub and then plugged some devices into that hub, nothing went
wrong.

So since I can't do any useful testing here, maybe one of you can test the
attached patch.  It won't fix anything but it should help confirm what's
happening and provide a starting point for further debugging.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

