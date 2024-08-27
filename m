Return-Path: <linux-usb+bounces-14167-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2FD96055F
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 11:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 86F581F23552
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 09:20:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A9E5199EAC;
	Tue, 27 Aug 2024 09:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3AB02Xp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65F3194AF6
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 09:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724750400; cv=none; b=EjbA65CYnwVm8ML/SfHCfDGAHh9BuKihRKYV2dfIQveS7dMCOBjC2uzstiy/tOQbdEbkXFUTlLtn2YpOTEi/aWdWzav+3Ppu8gM8fdy046EtfczerV4dyrWKjYVa4QzHlAEGjHCeAjKmbhQP407pWevE4/aP/Zezz9dbOvi4qvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724750400; c=relaxed/simple;
	bh=FiPPhZuyXTCB/bzbslq5BFJ2JbVPZAAG6B7bEfTgTnY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TA6Z9zKMpJOiGK4TqPlW15A67JokmKCFeMdJbuzSB6gDn8odgGiExMN1wGAeIyc6wgMMnz+86CQJgCGoyOhq9dfYHZs41RBAUi/217HjHREirMJ+d7GMShA/beIKQiLN+CAqfXh9YQ3iUPJfYUYOVo4ZewEFSQuRNvleaYOyyc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3AB02Xp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A953C8B7A0
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 09:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724750400;
	bh=FiPPhZuyXTCB/bzbslq5BFJ2JbVPZAAG6B7bEfTgTnY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q3AB02XppHhE4GIAerqBGJgWIydLCiNeZcOOurx27s8udPWUNWVmA3vttP99T4qyn
	 qF5nBloZE8Aj8uo//MZkFeawVe/anjtLKwBY54WaoilCdaPXyfuI2eLkDSlFTtYzwY
	 f6CHu2iMsEoG5SyIyKtgvUUeWJ6QvrJ5pg33TYfniVtatRNGbT6yMVn1D1469VpsY5
	 Bi4nb5rKyNVID+3fdBmffVQpVmvbj+UNt2/rSavRPNlBNzTSzV4Y4lSKHIfPec8W4a
	 9LQcwGbwezY7c6Z0RObIoJz0izGLgeV2q3Vf1Vx9u0MweRh0coG69A2cHzBRV0NrFm
	 qa7t0ehsHgEqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2F00AC53BB7; Tue, 27 Aug 2024 09:20:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Tue, 27 Aug 2024 09:19:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-mrE0Cwrj0A@https.bugzilla.kernel.org/>
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

--- Comment #9 from Markus Rathgeb (maggu2810@gmail.com) ---
Does a git bisect help you to identify the problematic change(s)

I am currently in the progress...

$ git bisect log
git bisect start
# status: waiting for both good and bad commits
# bad: [8400291e289ee6b2bf9779ff1c83a291501f017b] Linux 6.11-rc1
git bisect bad 8400291e289ee6b2bf9779ff1c83a291501f017b
# status: waiting for good commit(s), bad commit known
# good: [7ba498d9d1bb67bcbc2a79f19a9054cdc8b95098] Linux 6.10.6
git bisect good 7ba498d9d1bb67bcbc2a79f19a9054cdc8b95098
# good: [0c3836482481200ead7b416ca80c68a29cfdaabd] Linux 6.10
git bisect good 0c3836482481200ead7b416ca80c68a29cfdaabd
# good: [280e36f0d5b997173d014c07484c03a7f7750668] nsfs: use cleanup guard
git bisect good 280e36f0d5b997173d014c07484c03a7f7750668

But if you already know what related changes has been done, I could cancel =
it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

