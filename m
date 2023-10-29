Return-Path: <linux-usb+bounces-2327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7437DAED2
	for <lists+linux-usb@lfdr.de>; Sun, 29 Oct 2023 23:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5511828126C
	for <lists+linux-usb@lfdr.de>; Sun, 29 Oct 2023 22:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E11CA78;
	Sun, 29 Oct 2023 22:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c8fN6056"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CD017C7
	for <linux-usb@vger.kernel.org>; Sun, 29 Oct 2023 22:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5912C433C7
	for <linux-usb@vger.kernel.org>; Sun, 29 Oct 2023 22:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698619171;
	bh=mOKgI4ftr9ZyMdNQ9K5l5DRiyNvWihRLuAuBDYHa4VM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c8fN6056ce83zdWUxSktGQBFAvn1/LF77UNyvWgxMIONR3A/wGSXtIrYre7Ry72ci
	 t1CDjbtxEYqEoGw3mMvwxJ7vEnktoMj8vxjHdE+PXkxaLMJutQchpTTuTRoCIFaCnk
	 76TP8CSNyt3xMJ9umSyONE5nkg168Bt5Cc+QGNIePt7kLgspgmCV6OxyDAe1ENChq5
	 eyVPpgJlPyDGyhgB/Vqz1z3nuGkV9xSCMLPsgSF1TH7q4SDqTPutj46pUCGob4bVEM
	 Dk3MaOpCxyMO2F8aqVEmLPDrKNlG1NQzVUP0N1AWPJQmMf5lFPG7juqBVCImzv4EMB
	 KCHplg+LTLrfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9BE09C53BCD; Sun, 29 Oct 2023 22:39:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Sun, 29 Oct 2023 22:39:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chris.bainbridge@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-gFOcysIheV@https.bugzilla.kernel.org/>
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

--- Comment #11 from Chris Bainbridge (chris.bainbridge@gmail.com) ---
(In reply to The Linux kernel's regression tracker (Thorsten Leemhuis) from
comment #10)
> (In reply to Chris Bainbridge from comment #9)
> > The IOMMU error is caused by a buggy VL805 firmware.=20
>=20
> Makes me wonder: would it be possible to detect an old firmware and avoid
> the IOMMU path in this case? Or at least warn?

It would be possible to detect, the firmware version can be read with:=20

$ sudo lspci -d 1106:3483 -xxx | awk '/^50:/ { print "VL805 FW version: " $=
5 $4
$3 $2 }'
VL805 FW version: 00013500

imho it would be a good idea for Linux to track the latest firmware versions
for *all* hardware and warn if a firmware is out-of-date (even if the firmw=
are
updater is only available on Windows). Earlier this year I had an intermitt=
ent
issue with a new laptop where the desktop would hang and processes would ge=
t IO
errors. But this only happened once every 3 weeks or so. It took a few mont=
hs
to isolate the problem to NVME firmware (it was a HP laptop with Intel NVME,
and I was unaware that these drives have locked HP-specific firmware). The
firmware update was a Windows executable. I've also seen many forum posts w=
here
people have problems that were resolved by updates to
GPU/motherboard/NVME/ethernet/wifi etc. firmware. Many of these problems co=
uld
have been resolved a lot quicker if the kernel log contained "old firmware
detected!".

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

