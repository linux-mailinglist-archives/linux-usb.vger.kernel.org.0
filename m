Return-Path: <linux-usb+bounces-14261-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 254F6963C2D
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 09:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D0A3F1F25A81
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 07:06:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4B115B543;
	Thu, 29 Aug 2024 07:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZTMxWAmG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93C414B077
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 07:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724915210; cv=none; b=mY7A+DR9v/SmaiCoh4iEtoRphtDOoDRfwiUAmYG1pNDiw9ws2679pCW8TkRfJup03f3qKcqa7vq6S4123dZOxKfrAFVGpBnS1vvtKMYLFnoghsxgWq69X5D+xZ+DrJVaOxz+aElgvxB+iEEMsbUrQxgXnQSPr24C9dPoDKhs6xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724915210; c=relaxed/simple;
	bh=SFHhg3Z5+fzzfbIotHHawBvQfFitQ8DPr+yL4AlplRs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qwETJPO9Zz4dsiNou1B6SEE+GXwSRzBw0Mc1mX5HPtQFv4TKp7vEJOTFU+0Dqh7SIk0U8qAiAj8nCFUqaaRqUUJztazPo465uavPNJE1Q8HbQjTMoC+nZIvubcyvLBsP1mFuV5wCn9KgEykROr+fq14cYFtqsrd1A4jkNBLkB8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZTMxWAmG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8EB80C4CEC6
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 07:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724915210;
	bh=SFHhg3Z5+fzzfbIotHHawBvQfFitQ8DPr+yL4AlplRs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZTMxWAmGynayjmoT10ELsYPZ+brCNehFOzV/eFCMXc2NSoyHLEP6ugUbFAWhltLVp
	 d0YoYGbtRwAGOh1DiRmcgUKllL9ii7dYxRK95ibbCEjXWnqmhx2nK9MN+ZVxmbMc6e
	 FUEtf1GBjGGUCMNTNE7CAojdj6UYHlrvJEoKEwVha6ehriWc3Y21NtqFBA0+A7tFDU
	 H1iOUr+OjuLZ4iOjTUjJINCt3GaYU6ONbXjm+7RiaftnmIPiGx7tTdACgCkG6Ja7v6
	 FXhrFCCajUlLOHe2pQYYkhq+X0JrcFr0JUBNgYm0B5SdcJDtuMqCGka8Mf4ZeqJdhO
	 8A2KXHshyReSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 70473C53BA7; Thu, 29 Aug 2024 07:06:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Thu, 29 Aug 2024 07:06:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-Mv27iLSRfr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #26 from Markus Rathgeb (maggu2810@gmail.com) ---
I resetted the git tree to 2b989ab9bc89, did another build + test.
This commit is still a good one.

$ git bisect good
f90584f4beb84211c4d21b319cc13f391fe9f3c2 is the first bad commit
commit f90584f4beb84211c4d21b319cc13f391fe9f3c2
Author: Lu Baolu <baolu.lu@linux.intel.com>
Date:   Tue Jul 2 21:08:38 2024 +0800

    iommu/vt-d: Add helper to flush caches for context change

    This helper is used to flush the related caches following a change in a
    context table entry that was previously present. The VT-d specification
    provides guidance for such invalidations in section 6.5.3.3.

    This helper replaces the existing open code in the code paths where a
    present context entry is being torn down.

    Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
    Reviewed-by: Kevin Tian <kevin.tian@intel.com>
    Link:
https://lore.kernel.org/r/20240701112317.94022-2-baolu.lu@linux.intel.com
    Link:
https://lore.kernel.org/r/20240702130839.108139-7-baolu.lu@linux.intel.com
    Signed-off-by: Will Deacon <will@kernel.org>

 drivers/iommu/intel/iommu.c |  32 +-------------------------------
 drivers/iommu/intel/iommu.h |   4 ++++
 drivers/iommu/intel/pasid.c | 106
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++++++-------------------
 3 files changed, 92 insertions(+), 50 deletions(-)


$ git bisect log
git bisect start
# status: waiting for both good and bad commits
# good: [3d51520954154a476bfdacf9427acd1d9538734c] Merge tag 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma
git bisect good 3d51520954154a476bfdacf9427acd1d9538734c
# status: waiting for bad commit, 1 good commit known
# bad: [aba9753c0677e860f982edff98c7fe5a2b97758c] Merge tag 'tty-6.11-rc1' =
of
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty
git bisect bad aba9753c0677e860f982edff98c7fe5a2b97758c
# bad: [a4f9285520584977127946a22eab2adfbc87d1bf] Merge tag 'clk-for-linus'=
 of
git://git.kernel.org/pub/scm/linux/kernel/git/clk/linux
git bisect bad a4f9285520584977127946a22eab2adfbc87d1bf
# bad: [f66b07c56119833b88bffa4ecaf9f983834675de] Merge tag 'vfio-v6.11-rc1=
' of
https://github.com/awilliam/linux-vfio
git bisect bad f66b07c56119833b88bffa4ecaf9f983834675de
# bad: [afd81d914f6fb3e74a46bf5d0dd0b028591ea22e] Merge tag
'dma-mapping-6.11-2024-07-19' of git://git.infradead.org/users/hch/dma-mapp=
ing
git bisect bad afd81d914f6fb3e74a46bf5d0dd0b028591ea22e
# bad: [afd81d914f6fb3e74a46bf5d0dd0b028591ea22e] Merge tag
'dma-mapping-6.11-2024-07-19' of git://git.infradead.org/users/hch/dma-mapp=
ing
git bisect bad afd81d914f6fb3e74a46bf5d0dd0b028591ea22e
# good: [cbf9520823bdd4c44c94b5988e354ee12d57fa58] Merge branch
'iommu/arm/smmu' into iommu/next
git bisect good cbf9520823bdd4c44c94b5988e354ee12d57fa58
# bad: [c2b2e5c50330b29804339df4e7adf70e9f19b793] Merge branch 'iommu/core'
into iommu/next
git bisect bad c2b2e5c50330b29804339df4e7adf70e9f19b793
# bad: [31000732d56b43765d51e08cccb68818fbc0032c] iommu/vt-d: Fix identity =
map
bounds in si_domain_init()
git bisect bad 31000732d56b43765d51e08cccb68818fbc0032c
# good: [804f98e224e41c16e3b70f97790f84894745a392] iommu/vt-d: Downgrade
warning for pre-enabled IR
git bisect good 804f98e224e41c16e3b70f97790f84894745a392
# bad: [3753311c9190f833963fb47336dfe17221d93706] iommu/vt-d: Refactor PCI =
PRI
enabling/disabling callbacks
git bisect bad 3753311c9190f833963fb47336dfe17221d93706
# bad: [f90584f4beb84211c4d21b319cc13f391fe9f3c2] iommu/vt-d: Add helper to
flush caches for context change
git bisect bad f90584f4beb84211c4d21b319cc13f391fe9f3c2
# good: [2b989ab9bc89b29dd4b5509408b8fa42337eda56] iommu/vt-d: Add helper to
allocate paging domain
git bisect good 2b989ab9bc89b29dd4b5509408b8fa42337eda56
# first bad commit: [f90584f4beb84211c4d21b319cc13f391fe9f3c2] iommu/vt-d: =
Add
helper to flush caches for context change

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

