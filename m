Return-Path: <linux-usb+bounces-2452-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BD96C7DF0C2
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 12:00:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 49507281A59
	for <lists+linux-usb@lfdr.de>; Thu,  2 Nov 2023 11:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9E11426B;
	Thu,  2 Nov 2023 10:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kN6VVeEk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E260710A3A
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 10:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65848C433C8
	for <linux-usb@vger.kernel.org>; Thu,  2 Nov 2023 10:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698922797;
	bh=egWSpLvGIra5L3oXAE8EriCq5MTOyQ2iMBwe0m3wdOQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kN6VVeEkjLLkZhfIHGe+RqWx8eTG8UfnjiersswCkSn+eagtwTBvGnePXeTIOnEbM
	 lh7JeOiIklnu3Zg9C4jc/rGyLMBfiYLbBJFt467dMaL/6pjMCNka+lTFv8s1tEghD7
	 lsbhwLizG6ZtaMcl6somC5WwUNDlfhZuD0xtqdEdkCMFdxlXLpMNRYkJpclWPEQ9R8
	 KnXvrynv7sMDpbE2HfhqRvu5DKVItge5ALMPEytD6yyAK/GNn09v69xTE83i6LHstq
	 r5p0vipVoG8zDVvh/VwCasW7FnCnELgWlzP554J5Em9H7dqLzfhBzesZ2ROjDqy6Vk
	 cJk/qD0AkNNDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 52D83C53BD0; Thu,  2 Nov 2023 10:59:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Thu, 02 Nov 2023 10:59:57 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-aWFC9pSc1U@https.bugzilla.kernel.org/>
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

--- Comment #17 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
If I understand correctly this is caused by the VIA VL805 xHC controller wi=
th
bad firmware accessing some DMA address outside the allowed range.

With IOMMU enabled the IOMMU will prevent this access, and the controller
fails.

I'm speculating here, but it could be possible the controller accesses past=
 one
of the DMA ranges wile trying to read-ahead.

If we can figure out past which area, then its possible to make a driver
workaround for this controller that allocates a bit larger DMA chunk for th=
at
specific purpose.=20

DMA memory allocated for xHC use before any USB device is connected:

- dcbaa device context base address array.
  arrays of pointers to device contexts
  dma_alloc_coherent(dev)

- command ring
  dma_pool_zalloc(segment_pool)

- event ring
  dma_pool_zalloc(segment_pool)

- event ring segment table
  info about event ring, segents, size and location
  dma_alloc_coherent(dev)

- Scratchpad,
  only touched (RW) by xHC controller, not driver.
  dma_alloc_coheret()

DMA memory allocated for each connected USB device.

- device contexts
  dma_pool_zalloc(device_pool)

- transfer rings,
  contains TRBs, metadata about transfers.
  dma_pool_zalloc(segment_pool)

- stream contexts,
  dma_alloc_coherent() or dma_pool_alloc(*_streams_pool)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

