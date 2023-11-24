Return-Path: <linux-usb+bounces-3299-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E16B7F77D1
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 16:30:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C03C11C20F05
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 15:30:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50E962EAED;
	Fri, 24 Nov 2023 15:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="inRrtOiP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65DF286B9
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 15:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49357C433CB
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 15:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700839817;
	bh=xDBaGiYym8xvwlx33eazKrc9ltAEjQoEohE64GRQlLw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=inRrtOiPR43ttrHvzPn91otENePi2FcBEyarL+qRKdLT1p6HWoV5ykK/9Qad2BVzV
	 /AHScHzBPumo/DI9myevvIXT+yw0lnjUukZD9X9YCq9niO+hHiD8rTH1idv9dacmh/
	 Zaji5E9G8mab+/EEg65EiIEQL9bOxtYVdxv2thwOEtZle84D0pMeeEBbm7jIWGNOYk
	 j5J+gX0816VEZdqBhMOAyyJpaFIbft40mdmQn8IB1DCPJRpJMo3K/sg0M3bWtShwtE
	 nAR/J5Jr5eQXmKSkDmivKugd3FaonLsdctuv2prUQVCJfBCRoufMmrQAw4TTaqRTIo
	 mAPH7hBpfOn0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 296D6C53BD3; Fri, 24 Nov 2023 15:30:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 15:30:16 +0000
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
Message-ID: <bug-215740-208809-hKMHIMcWVd@https.bugzilla.kernel.org/>
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

--- Comment #24 from Alan Stern (stern@rowland.harvard.edu) ---
Sorry, submitted the update too soon.  I meant to add:

Incidentally, the check for overlapping DMA mappings does not take into acc=
ount
the possibility that a mapping can extend over several cache lines.  Maybe =
this
wasn't deemed important enough to check for.

But in any case, it seems clear that on x86 there shouldn't be anything wro=
ng
with allowing several different mappings to refer to the same cache line.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

