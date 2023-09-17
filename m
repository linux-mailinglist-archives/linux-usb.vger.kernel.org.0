Return-Path: <linux-usb+bounces-292-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C78157A3736
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 21:01:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 071E31C20C41
	for <lists+linux-usb@lfdr.de>; Sun, 17 Sep 2023 19:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAEB6FA4;
	Sun, 17 Sep 2023 19:01:27 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFB04A29
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 19:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E79A1C433C9
	for <linux-usb@vger.kernel.org>; Sun, 17 Sep 2023 19:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694977286;
	bh=rdAMBRWUwqQYw1gSgnSkVIIkPcnhrkHWcMIRTThJ63I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fZ0Th8OsDpV2erGyMWw64x3fDojWcuPHwr2+PdsWPbDoA7eBUt7Mn3SwPgoAQzmU/
	 wH46KQPbgELHWv30odj425Xm4QAlfcvrDdJ1hwEIPwJR61RflkheFPHmz3dUMfc9aR
	 7JbKN69/pUmJPBXWvgCfM8m4koshSSUTU/NtNRyoK3Vj8MZZ/ir9WOORaTUxNRBl8/
	 u9md2SiXdH60PSOMLfmOf5ggqQGM8wQRnwGjRvkCD+JmBmqHsxpwW2mSn83OafEFXg
	 T3MxTwzwzcOTKTeWkRysVuBwQivEBQP3HfMHahVkbZ80s0M/yPUkJfe2YUbSzClr1l
	 IrtYJtNKzaFIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B0B03C53BD3; Sun, 17 Sep 2023 19:01:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217915] System fails to resume correctly after Thunderbolt dock
 disconnected while sleeping
Date: Sun, 17 Sep 2023 19:01:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dev@mattleach.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217915-208809-LtBKC4PL1B@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217915-208809@https.bugzilla.kernel.org/>
References: <bug-217915-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217915

--- Comment #10 from Matt L (dev@mattleach.net) ---
Hi there,

I also commented on bug #216728 and can confirm that I am experiencing this
bug.  My hardware is a Dell 5430 Rugged plugging into a Dell WD22TB4. My De=
ll
XPS 13 Plus exhibits this issue too when plugging into the same dock.

I can also confirm that the proposed patch fixes the issue on both machines.

Thanks,
Matt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

