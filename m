Return-Path: <linux-usb+bounces-14223-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D05F39623B9
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 11:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89F9228256C
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 09:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D448167296;
	Wed, 28 Aug 2024 09:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRUtDMOp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA30B166F1D
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 09:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724837961; cv=none; b=MCDvSRASxCNYOgVNCrpGvm/VAWn5/35OzqfxR235D+sJp7ZKY8IYoVkmOZVTFd68TjIpptfClO0J4K+4rA3Ulyiel5RlbtR/PYRRDHU82aSCdJDBUUbzD8ZyqgE1njjxhkdUsmDKO5oFTe3ZTW0a+kD1YnQy0ZgbTJOIxBIyLeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724837961; c=relaxed/simple;
	bh=ZBrOLBICfsVkakxG+7zV+d/QuKN+SfwE68J7ul+LdPg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ic4YKVL8ENY4vvw+3MqMWy1O5bnCiEv3aGf3iqDilgSyrLScfmbmcs4C6duB5upLyLlKhRsB4GVmT/pESAZZzWQ5gd1v6s0iWzvz3CDpv7tMGzes4FZAzwN21MeWuVDF80WXKG7iGJY922ooUlr9OoZ/71ky8Fxui8SpJ0rqkHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRUtDMOp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 293D5C98EDA
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 09:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724837961;
	bh=ZBrOLBICfsVkakxG+7zV+d/QuKN+SfwE68J7ul+LdPg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GRUtDMOp15NIQ6rcRNLgj/56+n+keQg50fH1Swi9oulTiZSIzuDNRnMmspkeuz5Hx
	 fc1DTPWUcdsiS+SzOr5fcPJII1A4ctjasEBK3wCn2d7KeOhqVACR9og97wxwfm918p
	 t3FnbBJeN+1+x4PWtMwmv3MvkDjsxAAJEOj7iIl6jLY8UIaorf3UFNHdJoYOVDzDia
	 Sm0m9OCvCLHlVKbtiPIbVZY23PjfHYnPUKa/0vTwLF1c9rOGgezz2kWMlOTOr1PW2c
	 zCaLxWTxNsCGGWn2oxcC3uVMBV6ldPHugie1wHbLawJo75qp7WkA6HJVlHGw2A1yNe
	 MEDqHmgc0HrvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1469EC53BC3; Wed, 28 Aug 2024 09:39:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 09:39:20 +0000
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
Message-ID: <bug-219198-208809-8QR4ij67Gr@https.bugzilla.kernel.org/>
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

--- Comment #15 from Markus Rathgeb (maggu2810@gmail.com) ---
I found the commit that initially break the USB on second connect.

[2b989ab9bc89b29dd4b5509408b8fa42337eda56] iommu/vt-d: Add helper to alloca=
te
paging domain

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

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

