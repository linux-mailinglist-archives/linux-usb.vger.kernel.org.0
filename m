Return-Path: <linux-usb+bounces-23704-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A70AA8FA5
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 11:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F593169D20
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 09:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2090F1F8BD6;
	Mon,  5 May 2025 09:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YR/rJmPj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E891EA7DE
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437541; cv=none; b=JngAkDNG/YjMastZWYML/XXpo+qPAJ7NAnUAsUeafx/l1siqQyN52t3nUVvCrAVzloec/z2K2PncUjY4NMk37++AzuFLNj4vt7w0+9qILWZHL/LvargYGlOzDVTIw9+t3JXNCed1fXtGEUurVix0IuKiCGT3NtZnCgl9REfy9rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437541; c=relaxed/simple;
	bh=Si9HsXa0cU732hccynTWWdMVByEFUx3ElmWIrBdEHtM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T49dRqVxAGdCvGVUkUiTvAynHX7v7KcHJ8luP12YEKtXBQd+y4bFE4oB/GftxGG9BKep2z0jat39c1kjlBsAGGR/PCCA2hdbJMwxe9KB2vnWmL1OCKXkJSOeSX+vDxvNh19KOO1+PyKG0qx9CuLjEpF1tRX9fOp0PzblfJuBVrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YR/rJmPj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E251C4CEE4
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746437541;
	bh=Si9HsXa0cU732hccynTWWdMVByEFUx3ElmWIrBdEHtM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YR/rJmPjtQTpgZ94A9E7iwAhCc4BhR0oIYcBfaTo69dnGmHe0hKpRsTX9DcBfHN1t
	 E8M2oDHWPezQmQpzKd0Ka8Qgj3l5cINRt7RtfKHey4bRISB+5G63rLyhD1d3bzil3z
	 Ts7fHBbw2/i7oWPNyY9FRnaM69iCA7+OSOWcsT+JQM2/5kgBgKoYmO6LR9xBRbSkCV
	 U2tRi2BVPgwUTKIKS1LYqf4EKEgmv2wukCRgxC+jyuX47XS3bmNlTN+kZ4pFVQe4tA
	 a9QC5Hb5dUGJYIAx8Rf2p0wVFojVjnX4318U+UouL9uzCYPLjODb+xAp1c8/h5xZZj
	 45SFh4O9buJ2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 02AD8C41614; Mon,  5 May 2025 09:32:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 09:32:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-kYyXmSAjy7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #39 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Claudio Wunder from comment #38)
> Seems the case. Can I add this flag via grub?
Yes, if you use grub then add it to grub config. Like any other kernel
parameter.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

