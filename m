Return-Path: <linux-usb+bounces-26783-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 868A7B24121
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 08:09:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD99C16601A
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 06:08:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C7C12C08A2;
	Wed, 13 Aug 2025 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bdYEq6XR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A782C033C
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 06:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755065325; cv=none; b=FLX5XKxaPh1qQ6Qim+KLW+286clhae40XVAdt2KUOcpeTdO24JttZk3LPJEA2ay6Wy4Puf94H3gbyDKwts8nhnBfnE1ofBN1MXoS0ob0KCTYN9HGuqpyOQop8hmPyKlBpHhtWAhu7EJ5XZSKKywEI+cL74gZX6MgTCa1mPLfeIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755065325; c=relaxed/simple;
	bh=8vJMrIe8Twc1kQBCe/kluPY4gR5JSrlG7m9TRQJan98=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a7XZBT0wAzhxwne3erodZlYUrQ9FfAi4vitFF4+7QldyRVwBMNVOLG0s3fdIeJLQ7OOa5sZ6R3hmdkr/7U9b+qlD5BWKhrt4daLYCdtlGThsF9w/QNk/WD4RwFArSBxc7wytNFFxsDUJXEDEXgz+Kr3aUnUz0HeESbBH00QvOxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bdYEq6XR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E3977C4CEED
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 06:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755065324;
	bh=8vJMrIe8Twc1kQBCe/kluPY4gR5JSrlG7m9TRQJan98=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bdYEq6XRowJ/rtucF9zR2w3ytJ/wu1+CzqYJnJoNKE+Jk85Okj2cUMQMWiVTXgsR2
	 wvrqGaPB1Oy02MZWUdp+qgE6TtBWyTBaG9vSdngJi8EqiJ3aiULiYCpceWxmln4XHt
	 rWnsGEU7Hk2f9p0EMcTi4YVXMOBOszt8vH3zc0Sg9GdEKSXimqHcBWgV013ZN22Qrn
	 oKP0Qr1ywiKU/7m/K7wEk1tWviE9gc1qT3Zhm1IY6RAtuf0Q9tb8I/JvVMwoolzdcb
	 ErcOsu5/3Eup3eYELhyYh0TzPwTa3uyCqgAUZHoDcZbYuW2TYlBOcujVnH7+MjuChp
	 ID9HpsxA0cEpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CF342C3279F; Wed, 13 Aug 2025 06:08:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220284] USB4 / Thunderbolt not working after boot until
 thunderbolt module is reloaded
Date: Wed, 13 Aug 2025 06:08:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220284-208809-f7gHADn5AI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220284-208809@https.bugzilla.kernel.org/>
References: <bug-220284-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220284

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Does the problem still happen with 6.16? 6.15 will be EOL soon anyway.

[Sorry, this fell through the cracks]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

