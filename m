Return-Path: <linux-usb+bounces-19049-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C02A6A03278
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 23:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 492B418858F9
	for <lists+linux-usb@lfdr.de>; Mon,  6 Jan 2025 22:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E23611DFE3A;
	Mon,  6 Jan 2025 22:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ux4fXKZH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64479132103
	for <linux-usb@vger.kernel.org>; Mon,  6 Jan 2025 22:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736201580; cv=none; b=n2+j61KVYn5PIumM8NFjk687lfyiOpvQoAj4YDwHIR0lvgv++wZOVvBbXpSm0bVSaiiLfxdJKcEjgMTN7hg2x5ZdRv5br7aP4MYFqjXykeq7QqncOgTmMeYrProdSZLa0+rX+jT6GGCT0jJ3HM9+Bz+IkGXk8iuz4/EGE086QqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736201580; c=relaxed/simple;
	bh=0Gs3jutc0Ih18PMs9M/Uu4+DUOOF6euN9Fq0WMVxdOU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z9dNckynb8ZIOm/DC7YuVZDTxCwTLX/J82c474CpTih9B1vsSCATbz1nECiNNxj41PCbp+ChW4Sppp2RHkuPLlGbCKRPCbGCZJmekYJB4PxlsO0asgE/84pGoJRTEeXwG9yfhKE3bmVm2Bn41kBaFg1PpRh/sU/jt8fQ5mJ/+So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ux4fXKZH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3F48C4CEE0
	for <linux-usb@vger.kernel.org>; Mon,  6 Jan 2025 22:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736201579;
	bh=0Gs3jutc0Ih18PMs9M/Uu4+DUOOF6euN9Fq0WMVxdOU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ux4fXKZHbg70TzUksxHztfrasuF3yaRnn99zyIMD2CFf75fn2CS/1zHjPHjSvoD+S
	 dZlO3kVylZeGHWatjy8aakwBvWOvl5OrqONZY7G8nZecOL+AwObAIw0T7JxFjdlm/r
	 tL3A0k92OaM2gDXWil62+CPcYlkODGg0UMnTdvtY8uKx1L10OT/6R0PIEx+W3zLWxy
	 /xSH4quIDAgyB/G0zU8E3b55+kSXtpgYgJbOtcx3QHA6IDCnuf4eyrSj5I12F6aNAD
	 PejkSFqJIT2yFphe0jgekEDAnLVU92SE4ppgRFg0ShsCUdBzESn3DYBvdqlPrsygJv
	 XLUha3/iWqzaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C3531C41613; Mon,  6 Jan 2025 22:12:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Mon, 06 Jan 2025 22:12:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218525-208809-5gQ5xisuau@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #18 from Kaukov (kaukov.peter@pm.me) ---
After a lot of discussion on https://github.com/doitsujin/dxvk/issues/3694,=
 a
user suggested we try out a DXVK config option. Lo and behold, all the FPS
issues were fixed.

Turns out the issue comes from DXVK itself and isn't related to the kernel.

You can close this bug because it's not a bug with the kernel and is in no =
way
related to it.

Thank you for keeping it open for so long!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

