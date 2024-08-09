Return-Path: <linux-usb+bounces-13278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CA594D2BD
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 16:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B8E41C20C07
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 14:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58ED9196C7C;
	Fri,  9 Aug 2024 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLPawTA5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1481193069
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 14:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723215400; cv=none; b=bZUxICpw3SkbTKOjEFI/D/a97UfHunmi1U4Kvau4m4dbSbGJr8CZYcp6kRuK8OxjbAvd/R8MkkucnigfIB7pvkunT1ZzF+hicIIrALiDgZ4328HNtSenmj7Ua3oVXK+p3VZ7FblcYL9KQPvSKOX2SyOc+p4oHuEB+AJvse8RAjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723215400; c=relaxed/simple;
	bh=pnxFvrv5QXiBmukau79Ja7Lsk1YLZ5tdlJ7ah83w1ZM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BsyyBwnOkbjsUNqXyjlbOzhWrBUZdEADKtGVH3+/s10r3x9WKJE+pSYbfjIKP7HcQKDOUUrTQ3x2yxXNyelIvUe97i4dS+FPFfeJJDRnhqjGMKSkKEioWKBnjP6I+EDvlcnOIDLL+xACMUXJM9Gct1/SAqr5jbsWGg4X1hhzEX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLPawTA5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5225EC32782
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 14:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723215400;
	bh=pnxFvrv5QXiBmukau79Ja7Lsk1YLZ5tdlJ7ah83w1ZM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QLPawTA5G5cwl1Y9d4MUFLnywyQP9dm1ucHuBPNkK12HkjtBf2mEdPVdAPTlgPDGs
	 dDv6W+7cnsev/HZzv/UcJbhsvRZwMD7iYDC+HJj5oRtobCZBGv2IBZkfkGdJ5OoKsD
	 RNQ6DrqDdTREYI5ThEQtqVLfSMIU7XqMyIEAe/gCE+IsSCYXip2Xld6Ybxwo9aePaF
	 oZPOm5Gwi/YMenUOcJohDu1808Jkod1AE1ijYdJvWjLp9pBhscdKdynC3U+fHdhGwW
	 ndEKz2wIzKMmhaSEIDKrYztjoZFgfHUcqpwojuVQNZQ+b6f6oCIlitvF4ie+AsEJCn
	 q1Qte1ot0LX3g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3DFD5C433E5; Fri,  9 Aug 2024 14:56:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Fri, 09 Aug 2024 14:56:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-5gdEfwuy59@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #46 from CH (com+bugzilla-kernel@c-henry.fr) ---
> It's a little unfair to say that the kernel is unable to discover all the=
 configurations

I didn't meant to undermine the work of the kernel devs, I'm sorry.

> the kernel tries both initialization schemes if necessary, changing from =
one scheme to the other if the first scheme doesn't work.

What do you mean by "*doesn't work*" here? Does discovering a configuration
(but only one) counts as working?

Is there a way for me to try to replicate bith scheme steps manually?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

