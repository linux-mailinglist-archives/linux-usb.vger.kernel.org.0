Return-Path: <linux-usb+bounces-29445-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A95BEF82F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 08:45:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1BF824EC9B8
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 06:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D26B246BB8;
	Mon, 20 Oct 2025 06:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eGbVX85n"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E222D6E7F
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 06:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760942749; cv=none; b=GFvWe7CtMI6IondAmc9UHpNMZXFMnCAZ9wk1nmR4QXhf74gb+INSKTST81BsOXdSB2X4Kjo+C/go9HZQD2fBsKF3SjXmcys99T44ikQVpmYyXe1H7c4IpaKCSJ2GouN3isPMf73HbDx7NIKMXrpew2B0rG6ticucbOB5m05yzo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760942749; c=relaxed/simple;
	bh=n5sSmflRB0DY4B3VmUeKODPIRs5QaWgPqP6WwJw0hEg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tHb5xkcoo685c9//G3wSimVwyJQlwQzbFSTGZITStMPLW4qZn0RLuTSVp2RNnhXJIoqDeS8qfdzTj+ascEbl94wpkwEKX0MmQBjwmr8sIMjniCLK3To63Yk7OykYVb1iCpLzyo9qLuaof57D/bQaPBmpDEWVyEioif0MAfvK9bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eGbVX85n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1CC5CC4CEFB
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 06:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760942748;
	bh=n5sSmflRB0DY4B3VmUeKODPIRs5QaWgPqP6WwJw0hEg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eGbVX85ntMkalonphTVWKiKdlHE8m9w1dXjEbXTDvpP3AnWpFHradDEiN4AsrdQ2U
	 ILr/B/GbRZfQMT968M89wcM4Fq62L7Pd93NuCvb9TKa8qiGiZLfhf7ShBroInc9VRf
	 dW+Ky61Ai7VoTqFAxWEKsfOwjQl85ZybGLf/CzY2NKLZOOkH0GzZ/5ao0Y+tgcrj5t
	 lAHu1c6rXmBcI6tR+kAwI7yM3ele/6mr4dig1/jen5XS88glkBR8Ls07DhlsZGq6gb
	 mGGS2ZLF76m7C4t6lvFUK0FRCzuPatwGHuGt8Eccv+b5j/N4cfrwt3NzEmlGUM1fWm
	 gjlO0hxVA3/cA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0A917C3279F; Mon, 20 Oct 2025 06:45:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220686] REGRESSION: USB devices not recognised when plugged to
 Thunderbolt 4 USB-C ports
Date: Mon, 20 Oct 2025 06:45:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220686-208809-rKskhJXwcT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220686-208809@https.bugzilla.kernel.org/>
References: <bug-220686-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220686

--- Comment #3 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
If you run 'lsusb', do you see fewer USB buses on the broken version?

Are you able to build and test upstream kernels from source, or work with
Fedora to nail down which change caused it on their kernels?

Sometimes distribution regressions aren't even caused by code changes, but =
by
changes to distribution's kernel config.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

