Return-Path: <linux-usb+bounces-27278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9761B35249
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 05:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79BBC1782B6
	for <lists+linux-usb@lfdr.de>; Tue, 26 Aug 2025 03:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E986C8488;
	Tue, 26 Aug 2025 03:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7iKmH+U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5730227816E
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 03:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756179516; cv=none; b=mhbLVWrqj15G2DM9P2d58/r8V1m3lBr/ergRVUnGrbFA8MbFYdbeexjM2t+1A2Ehx+GYYx+qXVpXy7qWUNoe07orrVsOngaZAAKObV9Me5ycOaD7sDjGf0dIphV9gUZ7v1CEURSAhU7K+EUUPeKyQEbnuQS9cdq3cmLG5dG3gZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756179516; c=relaxed/simple;
	bh=fAJW01msqxVLDibS4bg25Hq1/Rk5XegiTweWVUVFzWA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qwb1S33uFGhyjYMpMvQPY1E2FDC8eaF80tvL4p+IGmGkxNm0nUSXyIkScbq59s3iAv5OysXI19Epdwpv4IQHmXiPJACUcQ865LO/ijlyD3ognCsNTlLWbIOJZE4hpELTgKL/DCO7r734SDC5tf3AuygO350ythj2JxTO5ekUgxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y7iKmH+U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9B70C113CF
	for <linux-usb@vger.kernel.org>; Tue, 26 Aug 2025 03:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756179515;
	bh=fAJW01msqxVLDibS4bg25Hq1/Rk5XegiTweWVUVFzWA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y7iKmH+UTKVavUv8/yjUQ+odWTNqoDsoW5iTiXFY1zZSQmKOwC2k93umw84o9HU7J
	 eHxnXjkQ76u47t7MMD9PkBgOIvrtwHw2CMlWJhju32QNwpZV3YBHQsroV5pdxVWxiu
	 KZfiTd54ogd3bCnIdKK530+bfbMXblsqaeLBriZjpSFjwIRV/ybXjoeBCZJIQCJI+w
	 TATnoXqbi6mduhfmxK1s7ril6wM4inI2/kvNUujCd06JCBMDipA3vVPzIkKIOTuOzT
	 OMzIdFcypL5E9XT2bin1eFiN0azG4WRb2yU8F1atrNJtj609HUEG/mR9s5DFERcwwb
	 Zu/Se/Rr0kTYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A0136C433E1; Tue, 26 Aug 2025 03:38:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 26 Aug 2025 03:38:35 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-aPVatd5RLy@https.bugzilla.kernel.org/>
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

--- Comment #1 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
The affected SD card is in the laptop's internal USB card reader. If I could
patch around this problem I could use the SD card as a second flash drive,
albeit slower than the ata connected drive, but adequate for media files.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

