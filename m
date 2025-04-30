Return-Path: <linux-usb+bounces-23578-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52795AA4B91
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 14:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2BA999A3C93
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 12:48:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BF1925C700;
	Wed, 30 Apr 2025 12:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6DvjCz2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383225B1F0
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746017290; cv=none; b=o+mE88I8UgFPAFmxgWrx5SITGTuMfwWFd1rtau/pXk+q+n1WaEcfhccqVqUOSRUIwp/XDucTAiuP7+WUpG93F/9JeaOWRrOxGAhKz9ncMxxZj0UZrgeEbVdTIlmPT1GKyNUc5jg7M4WE1ru0QFLpQSFBmwtMFiAHetBX0Bnw7WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746017290; c=relaxed/simple;
	bh=AbBga1l9ibLq21Elx8ZcMM0VMup8DVG+yakC7/ZEUGc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c268mjZZ8GFw7EBLztR0yXd2y1zNT0sHUNBZnj4yxNzeOnA5sOnRb4toJkgWgP6trySNxCz+xAfz9LphZg3ZjnvUecFSawNYDLIZ1W/DrWyRg/Ki7vNtZ64Cb6dWGSAcH1BjJj2kes+/EfgfJ02RaqYEc1Uf0g6GUcqFmKxgWEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T6DvjCz2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16913C4CEEB
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 12:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746017290;
	bh=AbBga1l9ibLq21Elx8ZcMM0VMup8DVG+yakC7/ZEUGc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T6DvjCz2osA2ktoPYQj1Pmlv9sFmBKVAcFdH+FQUiOzjRTdhR+hAIxLPfViqZ6Uiq
	 Sx2hW+21AU5gYRccxCoQLHN2LhPyu4fm5R1UU6O6+hnhFZQQS+zz4nC6tBn5Tok3Vm
	 R/fPS0R2EuhTbXw0SxX+t739O7EPnQfY2e9qod2Gm8LosutW24f413B36sD9s+SQBO
	 tUprjRNuQSGF548tI14ITlghs5ewKcCh7+7bFO0Lhzw6q/Hc/4fR7KoQs+H6jsAclb
	 ndPKLPoNvjNEj7n7P/EN5caO2RKB1/10aHK6Tc5x4EZrGBY7T5Edb2laqY5oLcUBVB
	 P9EpYsLYZhlvg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 069CBC41612; Wed, 30 Apr 2025 12:48:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220052] The usb/cdc-acm driver uses memory after it is freed
Date: Wed, 30 Apr 2025 12:48:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ben.maan@aimvalley.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220052-208809-YWXG3xPBUp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220052-208809@https.bugzilla.kernel.org/>
References: <bug-220052-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220052

--- Comment #2 from Ben (ben.maan@aimvalley.com) ---
One of our customers complained about a kernel panic that occurs now and th=
an
after disconnecting a usb-cable. However, most of the disconnects are witho=
ut a
panic. After some investigation the panic shows up between 1 and 100 discon=
nect
attempts. From the panic output can be seen that the acm_softint is one of =
the
last functions on the stack . This function is first calling a usb_kill_urb
that frees the urb memory but 2 lines further the allocated urb memory is s=
till
used in the acm_submit_read_urbs->acm_submit_read_urb.

Exchanging the 2 lines as indicated in the patch solves the problem complet=
ely
and the kernel panic is not seen anymore. This is proved by 7000 'virtual'
disconnects.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

