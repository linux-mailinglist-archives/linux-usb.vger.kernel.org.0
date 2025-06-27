Return-Path: <linux-usb+bounces-25188-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F53FAEBCD1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 18:08:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 677933B93E1
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 16:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67A882E9EBB;
	Fri, 27 Jun 2025 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0M0Dywi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E180519A288
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751040518; cv=none; b=fFtS+QwGjqSDr+aaVHjldwEfiEAnbYpgpQiA38JtZy4O+ku326nN9d1t0hDFYyh48A7tqU9rwsL2BrjGYFSSbeKdgSJYw6hoiHfxmPObIEMJIqPXGhcaHpxl3s0zH2nwGi7gOd5ZPz3wVIRnH8j00KLpKFaKSAv88RES5HeFyA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751040518; c=relaxed/simple;
	bh=6jH/3jemH46DN1Zu3HoTP5w5eZbf3DyHl4D3t+x6ZQY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TD8muZ4YFqdHnsMGzHA9fcnU8kJxHjbfU0tkaRjUdxAq3KoqyOft1+a1IPc7Lx4gX+kACS016uUESlbnnL1Tya/cD0nrcLvImoj+Zq++dkOhg+MZE0uHKrVK3Te4lk/tgH1WRsghuMKsBdnLs80PMid+1SY7KuetHEcpir933Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0M0Dywi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 584F7C4CEED
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 16:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751040516;
	bh=6jH/3jemH46DN1Zu3HoTP5w5eZbf3DyHl4D3t+x6ZQY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=O0M0Dywi7uTWQVQ/RyuuTBso99AH/OS/I1Kiu85v7RQAc8iweidlfZbsl81MUXzDz
	 FY4aV1CB8+ovtEUh1JMhxsb8CorqTNehzlzQ48w/8T00xPgFkIgLozW6XQKGKRJMxE
	 OWw4WhrxFHQO/derVq5DhULx5zqNDVJhDyRDRDe1Q8kZmrwqAjRD6GZY4VyHqet0kJ
	 9FMQf96vwvcqUlJGmW+GdoXP/Avymrc3dTjuigakmM/o+op6NqBhMmCWSNjwmcNNEo
	 q+CMIx3lQ0GtNp8l/lVxPnv+RCvujyneKrTH1WGNg59YwABEN+VZk9yWdRbqJc/JiJ
	 nSFoLPiUQrRIg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4157EC433E1; Fri, 27 Jun 2025 16:08:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Fri, 27 Jun 2025 16:08:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m.seyfarth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-CtWnLFWF69@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #10 from Marcus Seyfarth (m.seyfarth@gmail.com) ---
@Alan
The logs contain the dmesg output (via journalctl) from a fresh boot (befor=
e)
where the mouse does not work (after a fresh re-boot). And once after plugg=
ing
it out and in again in the same USB slot (after).

I also find it perplexing that the dmesg output does show the Sharkoon mouse
being detected early in the boot process (as seen in the before logs) but
repeatedly and consistently not working once trying to use it on the Plasma
desktop. I only see a static mouse pointer which does not move a bit when I
move it.

I also could provide the dmesg output as I have these logs as well, but they
just show the same output with more fine grained time stamps. No errors or
other useful new information are shown there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

