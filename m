Return-Path: <linux-usb+bounces-18722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 281B39FA492
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 08:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95AA216645F
	for <lists+linux-usb@lfdr.de>; Sun, 22 Dec 2024 07:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1374C18732B;
	Sun, 22 Dec 2024 07:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EfBRuTzd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C1185B56
	for <linux-usb@vger.kernel.org>; Sun, 22 Dec 2024 07:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734853152; cv=none; b=fn4NtfF3Q02W+q918/Bkk96ym/hYnSFaAGNKa0KByfDxW9zHYctn1tBbckgOH+wjaqCeCE2RPGCauYZN4+DiOz0y2D01sBMMPRsFWJNAY5tMCt0LfchH+S90i2+BzhkS7vw0oLPkgo0HQ8oPfHIkMcUj2lAqMVQvtbjBinOcyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734853152; c=relaxed/simple;
	bh=lPLIgUJU4DXzMUVInWrG8kkGxEJADkzC9moVkTeYIEw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ie2Vq9lifUbehzJTf2TdUDp3UvJxOZDCccA+qL6kregpaNyLYKXyNCnERe1+JM+LyKOThg62QvpoWXZtrD2dWLi8vJfpR6eINsCir99nKHY25ZbuMzyAUtjwc5JYzVe3dEzs8PtcX+CPt1Xkr+xK2xZL3XK7luWKuvW0yHArkVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EfBRuTzd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14735C4CECD
	for <linux-usb@vger.kernel.org>; Sun, 22 Dec 2024 07:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734853152;
	bh=lPLIgUJU4DXzMUVInWrG8kkGxEJADkzC9moVkTeYIEw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EfBRuTzdr3F7JxHGNpRee5hTf1DerwRniicCgDSkS75cSXhyf8ukOQY2WTtxwsV7x
	 DkvSpmDvj3KTjRydVjsC+hlSHO2TGogDk67fI2IJK15tjdMbQd24Oqv21v+UwmKn5o
	 8uC6m5Qq1fHS4Xruw0I8MN3Rn4NVQe70nXkU12KvwAoIoktFWphG0VdWae/LVcATlA
	 RvZcZUM7HI6aZewwZJrN44Axq2DVD5gl6E5REW217/B20abNj+iu+Kggaimjm69myR
	 CvwYOkH8ltn/8LxjdvDqohFe+Bou5vyZM/E88Yj7DMpUES/yCdieLa205ZZxYzCZx8
	 EqmyETtaoW45Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 079A3C41612; Sun, 22 Dec 2024 07:39:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219616] xhci_pci does not activate uPD720202
Date: Sun, 22 Dec 2024 07:39:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-219616-208809-Pi9ewpZAOQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219616-208809@https.bugzilla.kernel.org/>
References: <bug-219616-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219616

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please bisect:

https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

