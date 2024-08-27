Return-Path: <linux-usb+bounces-14181-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D98E9611B1
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:22:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC94D2819FC
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 15:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 692401C578D;
	Tue, 27 Aug 2024 15:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLSemgMz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582F17C96
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 15:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724772146; cv=none; b=rXwGYS8p+lgc9hu7Oj4dvdYYgfu16KQO91neYqM0/kizwKVEsK1ejoTNAcVfgmmuR2HJVkC2zYQoM5EP2FHE6tRixYBdvNIkE2qbcw4s9/Ly9eyRGayoNnTyq/YmM+nKygIP+pAK9txabzJFboQljJArW9qwht4PL3jh5RbpYP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724772146; c=relaxed/simple;
	bh=j/loQmpZtNfngUCjHUwAwfZ7kRYT8arR+gJ1x0kvdzw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MxLDv5a4RspEn3cCzR/3DTqE2TPGCr5aEZ7Rk8Zyop3gAr5iI5G/2Can1ocAoOI+NgvVZcfmIL7uG242YHUfEenJKkMdHbfhkk9ewPMpV9iNknyH/+RTPYntQ42OY9N5LEYmF+2//XXLPGHAbXc7U09xiaUn/+BW2sdoGXTe6RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLSemgMz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6273FC61041
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 15:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724772145;
	bh=j/loQmpZtNfngUCjHUwAwfZ7kRYT8arR+gJ1x0kvdzw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eLSemgMzNw/gE380rSuIL7TKxARfx1wVpDkseywmTymf6SHsBNENNVLeirtjfc7Q0
	 geOiK8ROoKrvmzkUoUm7KPCmAhRX+EY5dh7KX2rFLNlwzpexhZr/OeE9CJDuG/Ta5E
	 0IJ52+vAq+WhxCAvezsLOr8ESoLHjuJNhbrgLODmHNJtpEfTKnGYzkhfsfBU8I9SpE
	 RI9yvPwFhVcI5yIrd/jr/d1azcOJi7JC2Hv/Rq42ihagZiUVJcTXnZO7tQ8TSrKssc
	 XDL5cPOvO2ZON/j6PfF3QOR+EapfoAbGtRJI9yKpCBY4yFc1r/Q0o4mn2fqv3laftU
	 EuA6O9td98BeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 52F1FC53B73; Tue, 27 Aug 2024 15:22:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Tue, 27 Aug 2024 15:22:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adamw@happyassassin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-ubtz0ydLKK@https.bugzilla.kernel.org/>
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

--- Comment #11 from Adam Williamson (adamw@happyassassin.net) ---
I'm not replugging mine, but as I noted, the Thunderbolt service (I forgot =
it's
bolt.service , not thunderbolt.service) is producing a similar effect. I do
indeed see similar messages to yours *after* bolt.service starts:

Aug 26 11:47:21 xps13a.happyassassin.net systemd[1]: Started bolt.service -
Thunderbolt system service.
...
Aug 26 11:47:22 xps13a.happyassassin.net kernel: pci 0000:55:00.0: enabling
device (0000 -> 0002)
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:55:00.0: xHCI
Host Controller
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:55:00.0: new=
 USB
bus registered, assigned bus number 5
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:55:00.0: hcc
params 0x200071e9 hci version 0x100 quirks 0x0000000000000010
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:55:00.0: xHCI
Host Controller
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:55:00.0: new=
 USB
bus registered, assigned bus number 6
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:55:00.0: Host
supports USB 3.0 SuperSpeed
Aug 26 11:47:22 xps13a.happyassassin.net kernel: DMAR: DRHD: handling fault
status reg 2
Aug 26 11:47:22 xps13a.happyassassin.net kernel: DMAR: [DMA Read NO_PASID]
Request device [55:00.0] fault addr 0xffffb000 [fault reason 0x06] PTE Read
access is not set
...
Aug 26 11:47:22 xps13a.happyassassin.net kernel: pci 0000:56:00.0: enabling
device (0000 -> 0002)
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: xHCI
Host Controller
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: new=
 USB
bus registered, assigned bus number 7
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: hcc
params 0x200071e9 hci version 0x100 quirks 0x0000000000000010
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: xHCI
Host Controller
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: new=
 USB
bus registered, assigned bus number 8
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:56:00.0: Host
supports USB 3.0 SuperSpeed
Aug 26 11:47:22 xps13a.happyassassin.net kernel: DMAR: DRHD: handling fault
status reg 2
Aug 26 11:47:22 xps13a.happyassassin.net kernel: DMAR: [DMA Read NO_PASID]
Request device [56:00.0] fault addr 0xffffb000 [fault reason 0x0c] non-zero
reserved fields in PTE
...
Aug 26 11:47:22 xps13a.happyassassin.net kernel: pci 0000:57:00.0: enabling
device (0000 -> 0002)
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:57:00.0: xHCI
Host Controller
Aug 26 11:47:22 xps13a.happyassassin.net kernel: xhci_hcd 0000:57:00.0: new=
 USB
bus registered, assigned bus number 9
Aug 26 11:47:22 xps13a.happyassassin.net audit[1]: SERVICE_START pid=3D1 ui=
d=3D0
auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0
msg=3D'unit=3Dcolord comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" host=
name=3D?
addr=3D? terminal=3D? res=3Dsuccess'
[snip unrelated messages]
Aug 26 11:47:22 xps13a.happyassassin.net kernel: DMAR: DRHD: handling fault
status reg 2
Aug 26 11:47:22 xps13a.happyassassin.net kernel: DMAR: [DMA Read NO_PASID]
Request device [57:00.0] fault addr 0xffffb000 [fault reason 0x06] PTE Read
access is not set

And indeed there are no similar messages in my 6.10.6 log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

