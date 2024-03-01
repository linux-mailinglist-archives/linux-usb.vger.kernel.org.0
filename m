Return-Path: <linux-usb+bounces-7376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7F086DB95
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 07:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A63B61C22DD4
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 06:42:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F5167E74;
	Fri,  1 Mar 2024 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RUG8Ks1C"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D387C67E62
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 06:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709275330; cv=none; b=F/E5R5D1WDxu1J7z6xndMIqkf8FGqLdcTBUdp1WkqEvSip1X2hFQ4EHmzDYPaV1p7qIsbgLe+D/QMJbhfvfnnSe6bEK3BzU0Fg5aTWvqlaL5iwcWQiAmKB9aKXGyaAFzqnwLRg6VM+11Owi5u8e/b6MJQwfAQWTK8wmwA32o7yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709275330; c=relaxed/simple;
	bh=XMFhkw31VZpZxREME8nCUd4mTdVkExOFjZEVylXZOlE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TNMaV3etDi4h1DbEdoqis/CuaxVbm2SCgtLzLc1nz1HWar8fRl+IbGyrcXL2g2f5OIndZEHXpRLD0dp9w76qc8Cngc+cLdZ5TO+l+ZsvTN5JYiPixLKqZTLz3aAAlZq7WCy+N+oF6eLdF++Hta47uHjelI2aH3vGckFlKJN/Kjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RUG8Ks1C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F345C43390
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709275330;
	bh=XMFhkw31VZpZxREME8nCUd4mTdVkExOFjZEVylXZOlE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RUG8Ks1Cwy5dix0QGhCfRhOiYyuPChuZ3AZw2x3u81QsVIl6k9NNQFTMYAtKxZX2z
	 XjZoHWlH0UMce8D7JB29QDDkoYnHCO1nKEZ+J8NdAuwtSO2sG4x4sx0MXuY+kAa/8T
	 q5Q6OEIaSf6iUjkTGihkF3AJn+GSNaYQKn2iBabMl9DJb+ucQU8weJf6V4KhxAuLAf
	 y1kfDBo/yoyQEBz/r52G9MSzwTjMy1LidKM81dc4vaAEOzuXykpLaaRqoUV++PM8Fk
	 OXIlNJ+4DUc3s556XJ3Vi8qRlS5zpuZ8O3/ECtVSnet7WtJrmh6H0EBfjfItOMif5W
	 lv/G7FpafPXng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 39080C53BC6; Fri,  1 Mar 2024 06:42:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Fri, 01 Mar 2024 06:42:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218525-208809-zB2VVaxyjh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #9 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Okay I see a couple of things from HW side that may affect (or may not). Fi=
rst
is that the real PCIe link to the 06:00 eGPU device is running on limited
bandwidth:

                LnkSta: Speed 5GT/s (downgraded), Width x4 (downgraded)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-


I don't know why this is but it could be that the graphics driver tunes this
because it finds the virtual links only supporting gen 1 speeds. However, t=
his
is not true, the virtual PCIe links over Thunderbolt can get up to 90% of t=
he
40G link if there is no other tunneling (such as DisplayPort).

The second thing is that there is ASPM L1 enabled on this same real PCIe li=
nk:

                LnkCtl: ASPM L1 Enabled; RCB 64 bytes, Disabled- CommClk+
                        ExtSynch- ClockPM+ AutWidDis- BWInt- AutBWInt-

I suggest trying to disable it. Passing something like
"pcie_aspm.policy=3Dperformance" should make the above to turn into ASPM di=
sabled
or so.

Also I suggest experimenting to disable IOMMU (pass intel_iommu=3Doff in the
kernel command line).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

