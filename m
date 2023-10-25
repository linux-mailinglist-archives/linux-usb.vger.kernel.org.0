Return-Path: <linux-usb+bounces-2166-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5407D66AE
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 11:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84E53B21143
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 09:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E03210F7;
	Wed, 25 Oct 2023 09:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jldmJ7eJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF5F208B6
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 09:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39F6FC433C8
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 09:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698225821;
	bh=8P70sO9jhnH2E+2Tscqi/aItB234l8A4f0oox/6xFLc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jldmJ7eJM1ID6224JFaIekE4CDMMbvuJro/bTi3885mosLKozcjN2Uy3lHpAgJMhG
	 pPByIfuJEQH9WoqfZHA50lILTn6nBYIJYAby60gWhK1mpsTdBqv2JlOZtLRb5QE/lo
	 aDUChS9/qIR3CVFRnfQnzNd4cbYT1gMEe2vs/6FBfPRz1rz4QWIIF7HZPp7rK58RG3
	 SQymESekgcN9QgnJ9q84FkVeRiYu4HSje3I5M/z2e7tvhVMgUB5ffooTf/iuRbwAF0
	 EJALeamF8EABZo8tqsSXxleGzU7milleJ0IWldGRaSrYaMmP89VumXLdZiHaGirXgc
	 u3ZVh18irwzBQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2072DC53BC6; Wed, 25 Oct 2023 09:23:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Wed, 25 Oct 2023 09:23:40 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-XSYt7r37Sn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #10 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
(In reply to Chris Bainbridge from comment #9)
> The IOMMU error is caused by a buggy VL805 firmware.=20

Makes me wonder: would it be possible to detect an old firmware and avoid t=
he
IOMMU path in this case? Or at least warn?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

