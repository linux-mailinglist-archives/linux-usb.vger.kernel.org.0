Return-Path: <linux-usb+bounces-3298-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D73E7F77C5
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 16:27:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AAC37B2140A
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 15:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6372E84E;
	Fri, 24 Nov 2023 15:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B+EQQB6x"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A392E82A
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 15:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C291AC433CB
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 15:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700839634;
	bh=T925OAW1mAC5k6Acpoghglvma5Yx2ywJVe3f3wXgzEk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=B+EQQB6xz/W2zQn9cv0pMyOc7+XMAKCxWzyK3oqwPOUPSom6bJXwGT9ctikJFJXX/
	 nsO3Q4E9naWisKf1M9pe1DLafZpPdXX3/hwMyQg9EuftCP1fCOoJKdGhd885eAicP1
	 Zw/Rhl+xhraRTo9NTVkbUiSwali2dbdDa+IaQV9Kv2cdPgGRia0dgEGih7czJT0hDK
	 ofYszJW7ZFXwJTy9m7Q2XEK9/KJzWZ8xuIEd0eobny+jgdiiyQ2igCDhvlod6pvGOc
	 6grzZAFmtkiutsty0zMCelSVh6+ZQPXTRn675Rrmm7VKlcWtb7+8yvKirIjR0QkNVB
	 U2FzSolthUevA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AC4FCC53BC6; Fri, 24 Nov 2023 15:27:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 15:27:14 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215740-208809-mM8RD2477p@https.bugzilla.kernel.org/>
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

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dan.j.williams@intel.com,
                   |                            |hch@lst.de

--- Comment #23 from Alan Stern (stern@rowland.harvard.edu) ---
+Christoph Hellwig (because I am not an expert on kmalloc and cache line
alignment)

Ferry: Sorry about the malformed patches.  The bad line was added automatic=
ally
by Quilt (I don't know why).  If I add any more patches, I'll try to rememb=
er
to remove that bogus line first.

Andy: There are two mappings in question here, both of them are reads, neit=
her
is larger than 8 bytes, and neither has a cache line alignment requirement
(other than the general restriction that on architectures with
non-cache-coherent DMA -- i.e., not x86 -- different allocations should bel=
ong
to different cache lines).

The first mapping is 1 byte long (at the start of the 8-byte-long hub->buff=
er
allocated near the beginning of hub_configure() in drivers/usb/core/hub.c) =
and
the second is 4 bytes long (for hub->status, allocated just afterward).  The
physical addresses and sizes of the mappings, as shown in the log, are:

  hub->buffer: 108342600 size 1
  hub->status: 108342608 size 4

Obviously they lie in the same cache line, which is what triggers the DMA
debugging error.  But equally obviously, on x86 or other architectures with
cache-coherent DMA, there is nothing wrong with them.

Incidentally,

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

