Return-Path: <linux-usb+bounces-27512-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99956B42B80
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 23:08:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4606E1BC5443
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 21:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A4542EA753;
	Wed,  3 Sep 2025 21:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKL3BXeH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F361F2371
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 21:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756933704; cv=none; b=GGCTaEewq8XQj5oqrS4ns0F6NBWcC8V/ykU0ys2zyw9xC8ABw0/EHRhs2OznSiE2BhDgQBVjM0RBJz0A98hvuyjh5yTnP/PbCxITzj0FiUgU0lSVbY1mD9CddCHP0ij2bdtgS7u604bzh5tgKQ5w5vRqjrmvIt3H66Jnwd6UAOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756933704; c=relaxed/simple;
	bh=AaqEgQia7YLGHRxGEZACKVUnL08gf/BxiEmqsZ2/5Ro=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LLkyJbrGeoyeHez+RSWDJnRHS8fwezQULGAUenO3KPVXvXSqdJfvywkAI8XZIPvWXC7TySZupjb8WX69Ez1wQwfr4I/6x8SblighvjvTRAyhdRgCoTHFIdLDnWSBziNG/UBiagHurk4mevUThz73u4WMENAgRvY6M8J48CQ0Gy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKL3BXeH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 210DFC4CEF4
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 21:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756933703;
	bh=AaqEgQia7YLGHRxGEZACKVUnL08gf/BxiEmqsZ2/5Ro=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kKL3BXeHefkdCqVzMgOxzPpkyTtg8FVTgwSFWMml1RmjVch+7CFJh39ieIfie6YKx
	 UW+XY+34S36nLODroVa1elKAn3JIbnGg/BIc3GRZdFi7WK7LHE4EivB90hnxhaju1o
	 aEijPFefJJjFLfd9NKrt2w1kHKS0VGyMkYefLZCKoUTHm21rvJKHgigrb3pRweIR+I
	 eI+1NarZJo0NoWxr9Gzac/WbmSnsXg+efhqlu8oqt/d6+I1zTaNw0LvhOoLAP1rfYr
	 eoZGoDDRobsVMY00RivYYMnLDhWpwSpt4P2GWQPWgpYrKpBmCH29zrd4DHiOEC41WL
	 vfSq8RkMbTGUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0EE30C4160E; Wed,  3 Sep 2025 21:08:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 21:08:22 +0000
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
Message-ID: <bug-220491-208809-0JtUO0lDLK@https.bugzilla.kernel.org/>
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

--- Comment #31 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308613
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308613&action=3Dedit
xhci_hcd and usbcore dmesg trace, emb-qm77, S/R, USB storage manually
disconnected

This is a dmesg log fragment with xhci_hcd and usbcore dynamic debug enable=
d,
suspend/resume events, with the USB storage device being physically unplugg=
ed
wile the machine is suspended. This attachment is matched with the previous
attachment, a usbmon trace.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

