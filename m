Return-Path: <linux-usb+bounces-12808-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BDC0944225
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 06:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A0D1EB216D8
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 04:13:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9675113D624;
	Thu,  1 Aug 2024 04:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+5nEbkQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0751EB491
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 04:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722485584; cv=none; b=Cpo7NgQ0GIbbi00SetrQglzfkvrCeTJrGwwEcpYzLOXMokzVKI3J+GliS59hsv4Sb1v4OyaZrYVFP39Q/2BracTIaCeNYypUMwChPE56CtALIXl0ZCa7r08rNPdtaFjYaQ9NXiDZUrv0jPpEyRq0iZ4ehuTuLvhtBevljc3A6O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722485584; c=relaxed/simple;
	bh=LQBv2+FmcX6RarJD4O+li63SlqvkQVGbYcSeO+tBMIc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h95xoEc5/uDZs9AlfatqC6ZdwxYZIhQxT5WzhGF+xDsjtLfstM8xxkcQlSyJ8v44l7w4ynzWX1eItiRjZQa0VQG5Y2Zih7LYDhK1z8Y4Dy+SpRrVu5XHtUQHrXZi1B17oKUhu8UvgRkET0SK8aIvgV7F0BCHpjMv7HR4PFtcW+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+5nEbkQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F15DC4AF0A
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 04:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722485583;
	bh=LQBv2+FmcX6RarJD4O+li63SlqvkQVGbYcSeO+tBMIc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s+5nEbkQQctiYXRl+flb9yf9kgzyS9amppwBOy6mby5fyLv0oQ/vb/xfC6Qr1y2k1
	 56g+o1cXNSu+JcCtPx6BPq1UgNTPisOSzCzzpzh8jWh4u7NU2A1mZUmqs5PGKW34vu
	 YeUf7UDB6IX1y7wfDF+HiXR0XPypaa4AMBRt5cqtED8Wv86u7UCeICWer4I9laPGNY
	 C8/CWTd/Gp5YqBbHOz20acm8+oWpYHLu+ON2w6t9Lw6Lz8oRmKRlB8aDHtMG1iHhhb
	 XffBmPW8O9SW1Vq0L2B3GgWET5u49+tCb2y6V7IruLcgwDMhDRcx45B++b5HjNPCUq
	 cKEI+WuWO6IjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8B964C53BB7; Thu,  1 Aug 2024 04:13:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219113] I/O-errors freezing the system [sd 0:0:0:0: [sda]
 tag#11 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD OUT]
Date: Thu, 01 Aug 2024 04:13:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ijaaskelainen@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219113-208809-oQT7XbafgO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219113-208809@https.bugzilla.kernel.org/>
References: <bug-219113-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219113

--- Comment #5 from Ilari J=C3=A4=C3=A4skel=C3=A4inen (ijaaskelainen@outloo=
k.com) ---
Comment on attachment 306644
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306644
dmesg

> Could you try mainline 6.10.2?

No Sir, not at all. Debian GNU/Linux supports only 6.1.x and the new kernels
are also buggy. I don't want to play hangman.

> Add to kernel boot arguments: iommu=3Dpt amd_iommu=3Don

Butt I am on Intel Atom platform.

> Do you know any kernel version which doesn't have this problem?

No Sir, this is a new platform for me.

> Disabling UAS should be enough if you need this disk to start working rig=
ht
now, albeit not with maximum performance.

Sounds like an idea to me, the hangs itself=20
cause a terrible loss in performance so I think it could actually increase
performance  and stability. How do I disable UAS?

Besides there are no new bioses for this certain Intel Compute Stick Cherry
Trail.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

