Return-Path: <linux-usb+bounces-27327-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFEB387BE
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 18:26:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C73953A5F00
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 16:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 652BC248F56;
	Wed, 27 Aug 2025 16:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qfle1cLb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE3372116E9
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 16:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756311971; cv=none; b=RIavgeq12jSlHi2Q6VJXn9uJhqan/4NsbH+Hj29QU2jqwgI51LCNGiYMtmr7cSm0i6Gitk341CSjMh0CN5/hK/a/8FjkZJ/DZM9TugnAyEQ3HS16Hz77kHGrqueW6kmx+boGwyKYZY3z5lZI7mIrvAlUfImCY2Z2yMgboBQ3biY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756311971; c=relaxed/simple;
	bh=Lv+o2wGxKRINSTaRfUX1rTSKxPINIvCUWe0GlZ97BHc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kYMNtgeVWdRioPV5QrFQLJSAcXg++h3xVGOlOLulyaomhADPBA3j1/Xc6naqZf1Haw00tcrixIlb+N9ypuKASBUBAXI8n4/imqmowSzogWaxCa8y9hJHBMTXnUev8h7lsUEPo4VGmEqyUq03KwNnMQTtmrQMd5rx36Nh/92Jeeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qfle1cLb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 71CEFC4CEF5
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 16:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311970;
	bh=Lv+o2wGxKRINSTaRfUX1rTSKxPINIvCUWe0GlZ97BHc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qfle1cLbJUIZZpyvp83UQq2HV5j7/PlwuV2lOTpf5CU47c3obX0ET8pfwDlPxeNdF
	 ubZ3J0iOlIiB+7ygxQQanFEyEYDdi2PR9toA3aeBE2+yYV3CWdY5CD8e7kAUrxQQiv
	 NdMGZ0m17IJYbEKHcVeka/YKIDcP7ezQ+McwRp3Rec4EIylAYm1Cqhpm9njdQpRQ3H
	 097o5LCuHp5CPdJ7yhDovyTZdanSUeSsm4xnmuHYQA9ijk/+S07r6sBfDAiIW8/63u
	 JcWKLf393+jiYrA5UjI/1hO0i/RVv6aRXuLVRdFj5Ql7x1pE+bwPe6rIF3vGKFzRb3
	 I31OWBI7M5gYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E953C3279F; Wed, 27 Aug 2025 16:26:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 27 Aug 2025 16:26:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-ge1EIjPXqo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #9 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308565
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308565&action=3Dedit
usbmon trace of successful suspend/resume

The internal usb_storage device does not always disconnect/reconnect on res=
ume
from suspend. I have attached a usbmon trace from a successful suspend/resu=
me
in that the usb_storage device is merely reset and the associated filesystem
remains mounted. This trace has the "k" quirk in place:

[    0.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-6.12.38+deb13-amd64
root=3DUUID=3D678480bb-2d48-4a21-bdd3-d13f4a8d21ad ro net.ifnames=3D0
usbcore.autosuspend=3D-1 mitigations=3Doff usbcore.quirks=3D05e3:0747:k qui=
et
[    0.030419] Kernel command line:
BOOT_IMAGE=3D/boot/vmlinuz-6.12.38+deb13-amd64
root=3DUUID=3D678480bb-2d48-4a21-bdd3-d13f4a8d21ad ro net.ifnames=3D0
usbcore.autosuspend=3D-1 mitigations=3Doff usbcore.quirks=3D05e3:0747:k qui=
et
[    0.909039] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0x1=
00
quirks 0x000000000004b810

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

