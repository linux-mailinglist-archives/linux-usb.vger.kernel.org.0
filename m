Return-Path: <linux-usb+bounces-21426-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 712C5A54A3D
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 13:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B57883ACC7A
	for <lists+linux-usb@lfdr.de>; Thu,  6 Mar 2025 12:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FAF120B1F1;
	Thu,  6 Mar 2025 12:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbdMZNir"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20815190051
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 12:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741262633; cv=none; b=qJ345S4BaaHtBJ1ffeciqo1HiCX08wKSLLEmuZuRyQ0sQdbl1ZaV7wx2OpInufoaA6wKFAxYXBq+VNEEgmN3g53RcKj4F5LJnky/sGpViHrCf0slDu2CkZWm9Ii8vFDIq+bWVzYM0omBjJYNYd6xM0RTUlJhR4jnx/iHD3PchWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741262633; c=relaxed/simple;
	bh=tFv5c6o/qloG0sgDKnpNYzeg99/94TK6zxCxGMiHbz4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PKIeRaZVs1fmjIErhMyBPwON54vOUtrZdf5D+Bni7dZdCZs2QtIrRzXcuJaQX/+cmORrRgJAQo0xFm8fumHbk034OB/cA9ta0Vfyj+2cC/i/09uv/cLbaUvPFuT22DE5Hg0Qv0kUI8LvTeJ3ce8mTkhWVQWM1Xv8hzOUs6S+HWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbdMZNir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80A4AC4CEE8
	for <linux-usb@vger.kernel.org>; Thu,  6 Mar 2025 12:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741262632;
	bh=tFv5c6o/qloG0sgDKnpNYzeg99/94TK6zxCxGMiHbz4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=DbdMZNirHCtg2DiBJLQa68j27D39rLodbTusZGrVIImEmqBnmAvU18y++ZBXbOuBa
	 6xsk59NbIkN6uP3J1rZwJPmwngiGA0wE/wGwp8h4a7NOKS32bOZtA6dgjekGPvsNcP
	 FPJRgjp45Ajeia+gNaFatYoRQzoFvxTOFxLauFa6YMEfwkhHrIzd7Jf+WGWaw85Wqb
	 WifK4oA6uwoJCSaW7LHM3iQ6tdrxWOj4k8FOluh+ZvlZXq7R2PNdDk2FfzVrFBe3uh
	 YPzvoD56xEYcC7clQu30TsqScMaqPYM7sGVrwR0M/kzHjbZld8CuFLT82xCYVmkZdT
	 0LU734yPmL9iA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6F1DCC3279F; Thu,  6 Mar 2025 12:03:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Thu, 06 Mar 2025 12:03:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-ACHEPCvlJw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #18 from Artem S. Tashkinov (aros@gmx.com) ---
Looks like there are multiple people affected by this regression, reports h=
ave
started to trickle in:

https://bbs.archlinux.org/viewtopic.php?pid=3D2229550

BTW https://lore.kernel.org/lkml/20250304085139.4610e8ff@foxbook/ has been
queued for stable, looks like 6.13.6 will have the issue fixed.

Please check.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

