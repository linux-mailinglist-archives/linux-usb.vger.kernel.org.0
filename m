Return-Path: <linux-usb+bounces-14250-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 738FD9630C4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 21:12:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 14B231F25221
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 19:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5281AC434;
	Wed, 28 Aug 2024 19:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0lyU1Dx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A35991AB53B
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 19:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724872294; cv=none; b=WKK2zVwNPRlTEA6k68u4L2tAu6Fdry/tq2M3aeUv4qWdD6YL02LCRw+8DNYcuMYBPMXMVQdTfX3RHCzuhBQoKuF9qLKd3ufFu7KN6KZsBV2UL/kTKQwA+zRliXvA/uBaazyzRJLEr4xpRE8F93ZdDnzK0YCELL5iZw/I/yfY2q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724872294; c=relaxed/simple;
	bh=qHEPUhXW0IU/aF8dB397D8SsPKI3gAvUq13mUjrTB70=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RUvuEYoFEM34UUHDTJf9FsirZBWFQFyU8kum1/kBcQlWVOvDIiz5aP8KOcpyBd3b/qYrdsop7ueQN5IA6yTCyp3/xNZHdtKvciJd8XKuRw8eV9J6K+HXfrVXxWvd2ZjjiOHND996WK+Pk4XW+4EPDQQYwDl3yTGYvHzT2vG4YoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0lyU1Dx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 840ADC4CEC8
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 19:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724872294;
	bh=qHEPUhXW0IU/aF8dB397D8SsPKI3gAvUq13mUjrTB70=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M0lyU1Dx5TA/1addd3dS9PN07z4Tf/DgwZT3stHEcoVYMY3RsT9adgYZvsyu+lxpm
	 QXgHEP+AcputgMr/+S+hGgTdmSzgAo2XZasuDztpdO6hGXqajI2Lm3Gliy4UyiFcGR
	 v9YHgNlFE46sUBdCN5apmS0TxblRVCBzywgRYFmdmJL/y/3yh0EFzeuCxNbUhHoZtG
	 X7H/IcMjNc98QTEKn+cjDm33WLTsWLV3X/8Gwofs7avKbn17Rj279iNahJB1gF3cak
	 A2U4oVrlF1Bdy+vf5DLadYCceMGY4MZ7qWCSEVz4TeWMxp9NEhsDCbHfOfzpElIRlw
	 5N7VHm7jjRvRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7BAEDC53BB9; Wed, 28 Aug 2024 19:11:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 19:11:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-iW2yE2BbNT@https.bugzilla.kernel.org/>
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

--- Comment #22 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de=
) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #4)
> Do you run "powertop --auto-tune" somewhere? Then it might be related to
> https://lore.kernel.org/all/be791564-ccca-4dd5-915f-aa32b2482817@molgen.m=
pg.
> de/

(In reply to Markus Rathgeb from comment #15)
> I found the commit that initially break the USB on second connect.
>=20
> [2b989ab9bc89b29dd4b5509408b8fa42337eda56] iommu/vt-d: Add helper to
> allocate paging domain

At least with the commit reverted the Dell DA300z adapter still disconnecte=
d,
so my problem seems to be a *different* one.

    $ git log --no-decorate --oneline -2
    43275d604d974 Revert "iommu/vt-d: Add helper to allocate paging domain"
    86987d84b968b Merge tag 'v6.11-rc5-client-fixes' of
git://git.samba.org/sfrench/cifs-2.6
    $ sudo dmesg
    [    0.000000] Linux version 6.11.0-rc5-00058-g43275d604d97
(build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 13.3.0-2) 13.3.0, GNU ld
(GNU Binutils for Debian) 2.42.50.20240710) #289 SMP PREEMPT_DYNAMIC Wed Au=
g 28
15:29:09 CEST 2024
    [    0.000000] Command line:
BOOT_IMAGE=3D/vmlinuz-6.11.0-rc5-00058-g43275d604d97
root=3DUUID=3D32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=3Dnoaer
mem_sleep_default=3Ddeep log_buf_len=3D8M cryptomgr.notests
    [=E2=80=A6]
    [ 7951.874589] usb 4-1: reset SuperSpeed Plus Gen 2x1 USB device number=
 2
using xhci_hcd
    [ 7952.369334] r8152-cfgselector 4-1.2: USB disconnect, device number 3
    [ 7952.542017] usb 4-1: reset SuperSpeed Plus Gen 2x1 USB device number=
 2
using xhci_hcd

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

