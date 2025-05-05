Return-Path: <linux-usb+bounces-23728-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD302AA97D0
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 17:46:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5105E3AA543
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 15:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4391D2641C3;
	Mon,  5 May 2025 15:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ptl63A58"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE603263F38
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 15:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746459952; cv=none; b=t/qaXuTIA3M+0R22wBLyzGOaQbXJf+mBp+lP4Fk5l9rnKv+xKBEeVc772pCHVPelykQwddj30oz/4sCN0QDmlcvQQldH2HLzMi8z/yywWxnAxY2O/BHOX4MFhFM0GDrAm1qBOgleKbcyRbDlYw+vWMUENGxJueUCf4xelbqCOrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746459952; c=relaxed/simple;
	bh=E5Rq6IzyvjLmBlSr1GRjKyiALCZWWxJyNCb0ZUTpSSQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=e6g5Tu5pRqAQ+B0Q8pMgqI1TaTZIogydxFaI+slDD9roePhEIADUVcOJTMu4714uK/g5tLWuBPNWyTASXno9iki0rTqDu8i6YkBI8bODGsE9DYjnc/LuLTVAdQsMBtRzM5oYDpasRrsZCTYW2o6im49HQ32/2Ae5p6zqk03DCU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ptl63A58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2F287C4CEF1
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 15:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746459952;
	bh=E5Rq6IzyvjLmBlSr1GRjKyiALCZWWxJyNCb0ZUTpSSQ=;
	h=From:To:Subject:Date:From;
	b=ptl63A58vUQ3zp5EvdcaAc7HbAqShTkvCnY5LNFRKpS04JZo/q0EKM0ryObt6OAF7
	 rw2ym7INyX89k/d5/aBaec+gc4VlyM5GgfdoMQ8zIKU/7wKJtDX9b4+OtyEaXY+gR0
	 vYvoD4YwZ0LNBU+Ch2+3EB4NpL0fu+AffrsUnkyWH5vI06nDdshoVNn64+LUXFv6FY
	 hOhcR2T847D81YzME6uXSezJCa3DL97sQeGxUZYLRFA7kQdVYKMTSS3u5wq7SbBDyc
	 APeGvApPUswDAbSAqJ0dXubwF5PWwXZ6xOBlHYOTaURfcZQfSqiLjndDfolENAd3eU
	 xpW3hC7lF/WFQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1F5FEC3279F; Mon,  5 May 2025 15:45:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220090] New: usb: teach the usb subsystem about non-coherent
 dma
Date: Mon, 05 May 2025 15:45:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: flaviojs2005@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220090-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220090

            Bug ID: 220090
           Summary: usb: teach the usb subsystem about non-coherent dma
           Product: Drivers
           Version: 2.5
          Hardware: PPC-32
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: flaviojs2005@gmail.com
        Regression: No

This is based on my findings attempting to bring the usb EHCI driver
"ehci-hlwd" in wii-linux (https://wii-linux.org/) to mainline linux (6.14).

1) drivers/usb/core/buffer.c needs to use normal memory when the device uses
dma and is not dma-coherent: `!dev_is_dma_coherent(hcd->self.sysdev)`
Writing to uncached non-32-bit variables corrupts memory in the Nintendo Wi=
i.
Unfortunately linux puts private non-32-bit variables in dma memory (except
ehci_qh), so regular memory is needed for non-coherent dma.

2) usb_hcd_map_urb_for_dma@drivers/usb/core/hcd.c needs to ignore
URB_NO_TRANSFER_DMA_MAP when the device uses dma and is not dma-coherent.
I did not check why it is needed, probably needs the sync that comes with
map/unmap.

3) memset@arch/power/lib/copy_32.S (and
machine_init@arch/powerpc/kernel/setup_32.c) needs to avoid alignment
exceptions with uncached memory...
ehci_qh_alloc allocates zeroed dma memory, which triggers an alignment
exception.
Removing the patch__memset_nocache code in machine_init fixes the alignment
exception.
Maybe there needs to be a nocache version of memset?

?) no idea about the rest of the usb subsystem, but I expect changes are ne=
eded
wherever it assumes that dma support implies the dma memory can be treated =
like
normal cached memory.

--

Context:

wii-linux is currently stuck in an old version of the kernel, usb not worki=
ng
in more recent versions is one of the blockers.
I wanted to try making a rust driver for my Wii so I needed a recent kernel
version and usb 2.0 working.
After trying to understand the hacky changes that come with the usb drivers,
while trying to port the EHCI driver without hacks to a more recent version=
, I
found a commit that breaks the strategy that I used.

Commit 461db2bdbf3c978e76dd10a04a63fa06bb29114f changed the conditions need=
ed
to trigger a sync for non-coherent dma memory.
Assuming that syncs are needed, I was able to adapt the code and got all the
way to mainline (after disabling KUEP/KUAP) and here I am sharing my findin=
gs
so stuff can be fixed.

--

Nintendo Wii memory:

MEM1 - 24MiB starting at address 0x00000000
MEM2 - 64MiB starting at address 0x10000000

The dma-coherent term is confusing but in this case it appears to imply
uncached memory can be used like normal cached memory.

MEM1 and MEM2 are dma-coherent with 32-bit writes.
MEM1 corrupts memory with uncached 8-bit and 16-bit writes.
MEM2 corrupts memory with uncached 8-bit and 16-bit writes from the PowerPC=
 cpu
side.
MEM2 is fully dma-coherent from the ARM cpu side (inside the Hollywood SoC).

The corrupted memory is the 32-bit aligned value of the 8-bit or 16-bit wri=
te
and also a surrounding 32-bit value (maybe more, did not check).

Devices that only perform 32-bit writes can use any memory for dma.
Devices that perform non-32-bit writes, like usb, need to use MEM2 for dma.

I'm not sure if linux supports the concept of minimum address in dma
allocations without using reserved memory, but the Nintendo Wii is a use ca=
se
for that support.
I do not know if the Nintendo WiiU/Switch/Switch 2 work the same way, Ninte=
ndo
has included backwards compatibility so it's plausible.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

