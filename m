Return-Path: <linux-usb+bounces-22992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C7DA8657C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 20:28:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B771E1BA83DF
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 18:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA07125A64C;
	Fri, 11 Apr 2025 18:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VBM7mHai"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181F2367DC
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 18:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744396077; cv=none; b=Pn2WFQVrASDvLmE3WuzsA81hoV5LL29XGZFAN9fnS2ZQEwFNja9DJIMAzYECxkpS68UrF7JcGwpPRfzTOT+LC37cjb2Ayhb+Adf4kOvrlbpOrkU0WEj3/28vVWUkzNHMbmwGVF0CIrDD+sJkKfADVhPOmko21RyClEuVo4nGQe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744396077; c=relaxed/simple;
	bh=v5s560SEHN5NpjNs3MCfIMVgFDo3p4UeRoTBEdad8HQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JI6OcgbAx5sBqDrNhbY2jV3XBtqgGNJt73C82TBefZvdYEU8bqbyJ7LGcw8eXZQOX7BhIhLi99/HVxl4/dgQmQEEtkg4C0Qk3mo9ap2iy592n4QqzLMuKYuot/I817LiXKaWQ50544ozg+pmQIM7PflgioZUKLuHbmkq61v+NSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VBM7mHai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93087C4CEE7
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 18:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744396076;
	bh=v5s560SEHN5NpjNs3MCfIMVgFDo3p4UeRoTBEdad8HQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VBM7mHaiZzOi8A12bRsQ/jat3n0a6XZpMEabXXgDZCMt1VmwTL/ucJzQW+M+6g1Yy
	 ocDlZwR5aZrgca+E2SigOAXsChhWwMITjbDOUuYehZIcacg7dL2xM4iDcSuqlCsRYa
	 xapgUrj+1udlgxqlY7XEdLU6U+D3dgASI82HkwLmdXlTI+s2KjRZgcM9b2dlM2roVs
	 4moElw+qIPI4Mgc1/Y7FdGYpDuIyU9lCo74kmQRfG3BTP1PgE0Ujro42cHKPOnLb72
	 8aj88yOWOcWQlbOAqQlyygtQQC/ZIDiTrfDOCGpqd3cjNGA1lF5cBV+GaVZnee1TYr
	 0kS7AkHFcOTSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 842D3C41614; Fri, 11 Apr 2025 18:27:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220002] USB tethering fails with rndis_host on 6.14.2
Date: Fri, 11 Apr 2025 18:27:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: julien.dlq@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220002-208809-fRJMauYkli@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220002-208809@https.bugzilla.kernel.org/>
References: <bug-220002-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220002

Julien Delqui=C3=A9 (julien.dlq@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |julien.dlq@gmail.com

--- Comment #2 from Julien Delqui=C3=A9 (julien.dlq@gmail.com) ---
I have the exact same issue with :
- Phone : Fairphone 4 5G
- Kernel: 6.14.2
- OS: Gentoo/Linux

I just reverted that patch, and it works: d34963d968a6 rndis_host: Flag RND=
IS
modems as WWAN devices.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

