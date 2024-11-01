Return-Path: <linux-usb+bounces-16949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0BA9B92C7
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 15:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C0AD01C20E1E
	for <lists+linux-usb@lfdr.de>; Fri,  1 Nov 2024 14:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACA4E1A2C32;
	Fri,  1 Nov 2024 14:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FtPCE/2L"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306F4197A87
	for <linux-usb@vger.kernel.org>; Fri,  1 Nov 2024 14:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730469821; cv=none; b=k3TBcZTtjCyHTeHLXY9xxYeL7/ULUL/j4MKFHu469BdgaQOIf2riCpZ9onNAeDMUy6Dng6AkbQBBmpPYFauRSYlM0OzLEYzcqxy7kPNut7pSiON1UTbvzBXk8t4197ipruWXEvjRRGqeca6qqZIwt+M2TFIutg4fT8latCav8D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730469821; c=relaxed/simple;
	bh=Q8HhOjRUNdwvdPGy8SIAh5SQsNjXXkk4rrgpt2FQ+jQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FK5DTerppTPxzJrIOihOcClgg6IsiAblNg4UJfeXfjWAtbB+jOfzxn5Jr+dvKVZkB1pjSttjcykuvhvEqeOZqenkqfjQoHw8rBb6Iqa1SphPiVXJKcg/fIrbl6fWgohn9zARWs0sS/cbGcuvkIeh8c5oU87RvrdAtSJp86LRLak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FtPCE/2L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC4F8C4CED4
	for <linux-usb@vger.kernel.org>; Fri,  1 Nov 2024 14:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730469820;
	bh=Q8HhOjRUNdwvdPGy8SIAh5SQsNjXXkk4rrgpt2FQ+jQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FtPCE/2LDptIZ+uGMpRedPI4QKXQT53KLw05L8bjX4DjeI3YpfG865MuLf5dqYnTk
	 Q30XUUzeSR3XfaznzjJ5j9NGCGKe3I965NoE0GDWakmktZDe7kT4X8qIOZaBTFQp7G
	 +AKKrnB202SRqPacyzg9klZjFYh54q2ax78/X8XYM9qf/G43RJ6L24tEKd9onS/eT7
	 SeKM66HHwIAUjcG0B88nh7G8+sF/so/hcUcTIvVJ04/ce10hSu0XEnTcee1VNBtW0b
	 E1FfMk03twgCasYn4lfX6naj9OqWc4kt4w3hq5/LfJ9fcuzDYrTpjaihjLoMixWN4P
	 bhj91ffSEcBFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C486AC53BC4; Fri,  1 Nov 2024 14:03:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Fri, 01 Nov 2024 14:03:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lists.rolf@reintjes.nrw
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215906-208809-k4izxAoLPq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

Rolf Reintjes (lists.rolf@reintjes.nrw) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lists.rolf@reintjes.nrw

--- Comment #19 from Rolf Reintjes (lists.rolf@reintjes.nrw) ---
(In reply to Mathias Nyman from comment #17)
> If we can figure out past which area, then its possible to make a driver
> workaround for this controller that allocates a bit larger DMA chunk for
> that specific purpose.=20

I am a debian user and opened this bug report:

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1050352

In the last mail I was pointed here.

So I now offer my help because I have the hardware and can reproduce the bu=
g.

I am not a kernel developer. But I am able to modify kernel source files and
compile a custom kernel and let it run on debian, either debian stable or
debian testing.

May be I could test new versions of the driver.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

