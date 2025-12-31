Return-Path: <linux-usb+bounces-31860-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE74CEC064
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 14:31:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED83630078AC
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 13:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE95F1C8FBA;
	Wed, 31 Dec 2025 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ojx/uBcp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462642AD35
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767187891; cv=none; b=XQMxjN1kwrEIHoKIFefUZbuSH5/qh+p2Er8XOSOY8AtURqyyud8PTbAVAbBnsR5hC2k6dOhWHsHvgp7ywauH/Rvx+IpxuMM742+1B9e4+muE6QsaPWxHAidiKObXj1ARsaVq3sy39bcwWxm0MnP7qLWoW69kmwBusGuIXyPOtBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767187891; c=relaxed/simple;
	bh=knQ7K/y0AIqFHYo4DXgQBZXMZfrgkvBfOwG10hcUREs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dJ9UjaEA4XETzAdAS+8DkV6MsT4zgpeEUPK2TXcS2rcv0htYy1vaxMkURIoqywXDTU0tA7/IOXWS5yQ3oESyrC36HuAeh6QwLEOh4mt8bvqp/uBSqJ6JRt6oCqmQJ2w7SELfQepZKw42fV9GtIlWivg1a62t9lzgwdG0gbxPagw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ojx/uBcp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE8AFC113D0
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 13:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767187890;
	bh=knQ7K/y0AIqFHYo4DXgQBZXMZfrgkvBfOwG10hcUREs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ojx/uBcpgGXAmXWdzU1saSp+tr2QUOk7JkCum5CSKIT01wbTGE2trz0uggkX6tRla
	 MjHfbEb1WARN5GTNlmsC39cC36hixEcPTrebqfgXBr77/rclbM9h1kQ6/kPNT8BnOY
	 MD80ZELInznR/pg1dhECPMBMjh28F9Srtk8mXPuW1a5iNmk93XU6m7nEEEGfzjwvVz
	 qChH9o5kmeeu7MzVGPUZfHd6c2U7mfegvP88JDTQ7ZTiBMb4L7TvMJzNm/4hLBBow5
	 f0xx0C0VOAbzNNWu3y+XRdvptT2Tnu5IoPLYvwcGAy0E8DWGrng4nr5wEQdeRwLEXY
	 imfAPhX8i64hw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C85CBC433E1; Wed, 31 Dec 2025 13:31:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Wed, 31 Dec 2025 13:31:30 +0000
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
Message-ID: <bug-220904-208809-vGmH42ihqP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #7 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
These ports should wake up on plug. Summoning Mathias if he has any ideas w=
hy
it is not working.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

