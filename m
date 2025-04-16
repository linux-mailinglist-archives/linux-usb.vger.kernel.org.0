Return-Path: <linux-usb+bounces-23157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC663A909E2
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 19:21:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 344FE190571F
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 17:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9932B218ADE;
	Wed, 16 Apr 2025 17:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JA1RjVDx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C75217F35
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744824002; cv=none; b=C9maiZvV0sbm4p+pnVSXwulB9e2AfWq+7LfA4rTIIo2WOCJFz4wsKhaw59zxHYggbnLAqwZDTGCxHsbFmAvtpTsxJmxhK4szzB0a/hvdT3cuFCfAOYnbWCkGZstX2c3jNvuFn9LoHg7Eh6245eabRJKb8mhe3T4yKRxBXR+3K5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744824002; c=relaxed/simple;
	bh=B3ZbGHCut46hMDX1GVJfkG2DBQJZWNjv15c3LPUeB9w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kC4ln/ZlL8JHZYuPWl4iMiPdhRCiQn58Xgy+JBLBrkMCCEbjW7BAOhdbxzuYpp1aw0WmlrkVzcBhLU5kBEPBloYOi/bo+b9xO9ZvpleaIhb0PkINOEbzXDSSrtyZKXSNDJucBBrcYC37WQTro1nPeleLV95rJlvk2t1nRkkxgSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JA1RjVDx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E3DCC4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 17:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744824001;
	bh=B3ZbGHCut46hMDX1GVJfkG2DBQJZWNjv15c3LPUeB9w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JA1RjVDx7zdIgsVhGE9RAxYSmLA7t8THmkMLemNEUtMSVrSGH0HsOyBcKN7yIdO+p
	 RWCsOXmYiKATWkx9+1+1H4C6VoMvF2Gww+cxvgWxfPBWtmPh0wf1dbhOcF1cLHMPkX
	 Kj1VXPFanxw6a5Huy+nhuK9i0+P6Vxy7u+1gm65ChW+H7TXuEgNWWo/Cqd/+uttDHO
	 UvE6zA525JJHXzTJrTZJaZ8s25Q5r4GjRcHxhQN8K3+yfh0dO8oFwubHUMl9GXnOcK
	 AAcgWD6bOaa6J0vb1YmqefqL7WN5OavK7LVhQOiwcF4/PBPC9wzUhq8jYxJ7FOGsxp
	 oXVaPNmcn7yPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 73D3CC53BC5; Wed, 16 Apr 2025 17:20:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 17:20:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joe@solidadmin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component
Message-ID: <bug-220016-208809-hPRS1pfD3D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

Joe Doss (joe@solidadmin.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|USB                         |PCI

--- Comment #4 from Joe Doss (joe@solidadmin.com) ---
(In reply to Micha=C5=82 Pecio from comment #3)
> What if you disconnect the hub and connect an ordinary device in its plac=
e?
> This log looks like several USB ports on your computer should be complete=
ly
> dead. And some SATA ports too.

I just swapped my mouse into the USB A 3.0 port that my hub was in and it is
dead too.=20

> This looks like devm_request_mem_region() is failing in usb_hcd_pci_probe=
(),
> and maybe pcim_iomap() in ahci (SATA). So something to do with PCI, ACPI =
or
> other lower level stuff.
>=20
> You may try your luck reassigning this bug to drivers/PCI, they seem to be
> responsive to bugzilla reports.

OK sounds good. I will reassign this to drivers/PCI to see if those folks h=
ave
any ideas what is going on here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

