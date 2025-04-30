Return-Path: <linux-usb+bounces-23572-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883E5AA47A7
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 11:53:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691659A8385
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 09:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 376732356D9;
	Wed, 30 Apr 2025 09:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZryZeejh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6561E1021
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 09:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006791; cv=none; b=DBn6kWZ153TSqaT97pp6IVqNZL58qzqvdDAmVthNh5MlC8svQHtMIzGCnZlg685XEYUMNEpocTuv1i19MSXde9nrHO0QHe/kwYN9/ttpDRqz3nH1nuZ/2J+iJ7Wls8jOrmqq/KRcqBPw7UzOWLCaw9QSWIxwysCkfQQNwJFKfxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006791; c=relaxed/simple;
	bh=b1TFYvRmc36SJVjOFbCp0DEnZC+M1FbdiEdDcZSvVlk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=F3vMxYKrDY4XPiQddi/qNCgmq9ZMxKXytQ/6qtX2whTFkJnSL5idsFITGVWdztN8BZLgdbVT4hxLRMljb18UXuGLvhV5U7Sv533r0Jod5LNBprPQGSTqjXnjH3Sn9zcUr32ZZJ8qPXDJb/ex1mVrcCA0hemd0a0hyKpwDS0gpOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZryZeejh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A7A4C4CEEA
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746006790;
	bh=b1TFYvRmc36SJVjOFbCp0DEnZC+M1FbdiEdDcZSvVlk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZryZeejhlUaxq8HhmEY8Lcro4zkTtx/b4mwRqmQPmqV6fcT1Gmme143NiGIcqarQs
	 VKDS6s7EsThdVSy7GMBQhMLuMdZg1ZJZZFFgWn9/1oMcBkmoB9pcEjmNAEDlFSNgqC
	 SrFavlyTy7oe5Nxz8zSI5QVZS3h9V4DJaFPlPcKlXgwHTZrhUpyYTNE68TzsFyQGxG
	 2oB+ocqQceg2Wxzv3VSbGhfsPydmJ5GGW9B8UwARh1xkfmZW+zjfTwaaw927fe6EBu
	 EDrbGTAJ605hs/wMDuSDFrSzqqjeQzB0c67P2COCHpob9hy8CoQ4o899iWEp2FQ4Jf
	 AY19VTPtghO3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02F7CC41612; Wed, 30 Apr 2025 09:53:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Wed, 30 Apr 2025 09:53:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-n1fagSwYNL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #8 from Claudio Wunder (cwunder@gnome.org) ---
Ah, BTW, on the current boot, these are all the available USB controllers:

```
03:00.2 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD/ATI] Navi =
31
USB [1002:7446]
0f:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 NHI [Maple R=
idge
4C 2020] [8086:1137]
3b:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 USB Controll=
er
[Maple Ridge 4C 2020] [8086:1138]
68:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset USB 3.2 Controller [1022:43f7] (rev 01)
6a:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset USB 3.2 Controller [1022:43f7] (rev 01)
6c:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI [1022:15b6]
6c:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI [1022:15b7]
6d:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
```

A random note, that I'm unaware if it has any affect at all, is that "Legacy
xHCI Hand-Off is disabled" on my EFI; I assume since modern versions of the
Kernel this isn't required.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

