Return-Path: <linux-usb+bounces-17330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFC59C0CD9
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 18:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F07961C22D80
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 17:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB5221315C;
	Thu,  7 Nov 2024 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n9Lsbr4M"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C7B190049
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 17:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731000630; cv=none; b=lDU+Negn7iuptbl46dcHWZZHt+KjaUWY1bWmrW0H4nn1hBf+gdYS+W5tq2cJfuuWLPAt6RoLDY9n0I3tq1q4S3C9dTxB8K4KgBqHCEhELWO9M8qZF3ISk01k+oXDA9ykPXjZTvHagKCIqIPS9gaVMty3JGIVa7MEBPM7d1931YE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731000630; c=relaxed/simple;
	bh=VuQll67w5Hft3zZ18wmXgkHKC+1I7Ej8Vmltc/cpI7M=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eqnSwP19+YY/jQecgDiDrmHOJvlETe/Ebr5eEeUkpAS903+8HL/bOS5P79Ayb9lEifF9xtEu7Gw/fpLJG7g5gLX9RFqhRogqGCPBomlNVA+IhqNpLJOIa9luc/YEQXR58NxnJCx/SdnrdGSRkkzVMcmjpcyOFJftwiuJfYvW/XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n9Lsbr4M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E01E0C4CECC
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 17:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731000629;
	bh=VuQll67w5Hft3zZ18wmXgkHKC+1I7Ej8Vmltc/cpI7M=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n9Lsbr4MS+TI8ll7VxQYIKRvDkuPPnqhGGRB4aYVqm3PWUfvplg+kpigh0fBHVOdf
	 mR/Y91jcVWBW0CsYNz1IpZl899Ulym+pFJyEgZ6/eXIfQMGA5j6K3OO9vxRjpvlN8d
	 8sfBemVz01GoaCtjguTk5yDNYrmgtLB2PNSrKtUnGe2xDCvAT3F0ucyOhFyeH7imUK
	 yzLFJK6yvTKpLxdzKhxWkPRODxd9Rd/qwE/pwsiCG3pocY0oB9eVdM3+Fp7kSY0kgj
	 QOUgDiF7PFPqEy/NdSUsApULo4Hf7Sm4WTu5Kvlnc6JWJfj0fnQE16YsXa3F+5o/Jv
	 y2GSWhc8w38ZQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CB640C53BBF; Thu,  7 Nov 2024 17:30:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] USB4 / Thunderbolt + AMD: unstable and slow link (many
 uncorrectable errors)
Date: Thu, 07 Nov 2024 17:30:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218795-208809-Z787QjxHh8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218795-208809@https.bugzilla.kernel.org/>
References: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

--- Comment #4 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
> pci 0000:35:00.0: 2.000 Gb/s available PCIe bandwidth, limited by 2.5 GT/s
> PCIe x1 link at 0000:00:04.1 (capable of 31.504 Gb/s with 8.0 GT/s PCIe x4
> link)

It's worth mentioning that this message is meaningless in the context of US=
B4.=20
There were various discussions on the mailing lists about changing this, bu=
t it
never landed anywhere.

https://lore.kernel.org/linux-usb/20231103190758.82911-1-mario.limonciello@=
amd.com/

See specifically patch 8 for more context and the specs that indicate why it
behaves this way.

At least with AMD dGPUs put in eGPU enclosures this was causing problems for
amdgpu because if used pcie_bandwidth_available().  We've changed this in
amdgpu to look at the link partner to exclude this causing issues.

https://github.com/torvalds/linux/blob/v6.12-rc5/drivers/gpu/drm/amd/amdgpu=
/amdgpu_device.c#L5903

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

