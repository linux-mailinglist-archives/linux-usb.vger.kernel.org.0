Return-Path: <linux-usb+bounces-7748-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E569876DE0
	for <lists+linux-usb@lfdr.de>; Sat,  9 Mar 2024 00:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EB6EB20FFC
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 23:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FED33BBDF;
	Fri,  8 Mar 2024 23:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e1bnZOMw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B6011707
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 23:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709940906; cv=none; b=IBq4Mmei1FVCzyVrP2ZTHYslA2de/cjdiP6DWvYNUSJDwuxHRMxamfDpNUUi+AVfwjGxv/yF3uzPCqPkk94s5vRwAWlmU6jRYe5VjXIn+JSfmP0qxCQeSxuOvmy+V0luFVyVwZ9v2mmGJ6iBGRH0EIJTh1qZuKJ7koGRsxiI4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709940906; c=relaxed/simple;
	bh=4RM70+P0XiOBtRQSPQNjK3ATyGahxNk0286ox/09ntQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cj7NeNUndNcj1tfEODqrX6n+76tVHouSwP9Uepla33/JEP7ooFGHkaLk7RW04FsraSa75LZDBtnTeReNQ1lqllTIpjV/gCmXiYdQyYJsZlKemR3bhpvwbwCGVKNNOxpDBlgm7QATEEQYI9PKfw01CDUcFEawIMZJpM7+tYkc7vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e1bnZOMw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6FE6DC433F1
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 23:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709940905;
	bh=4RM70+P0XiOBtRQSPQNjK3ATyGahxNk0286ox/09ntQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e1bnZOMwSR2+ZSX3FdnhkvGQrFJqwLzFfjiAG3IbKo1bmERA6I3w4+iyuBlOriuAM
	 O1caSRplalIz2K1Iuw0f9h7YWrotF3F8Ig1AGUej7+RlWHqRIZM1cplYHY1LsDFYRp
	 8FA4b6FghmbTiFcAS4T3uzc0nkFmziW0ZTYA623aC9ik4NVJiCsHdZpz06ruxLuBcW
	 +lBzr0w/Zxc6TKhMwpevWztBCwZ0RtZPXbzIW7dOY4NoK/ex1K1vgzZL/QFi4hmufM
	 1UM8O4qtA5v5xEaXsvwlJzjXGZXbhvTG5+VJDlR08XpEelA1WHKnIHAzsT/GU3X2m+
	 CEq2kLb/HAi/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5ADB6C53BD0; Fri,  8 Mar 2024 23:35:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 08 Mar 2024 23:35:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ibmalone@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218544-208809-PySPETcX2P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

--- Comment #16 from Ian Malone (ibmalone@gmail.com) ---
Thanks for looking into it. I think we can close this then, if I manage to =
test
the packet size fix I'll find out where the correct place to submit it as a
device quirk is, by itself that might be enough with the current scheduler.
Unlikely I'll get into porting over that old scheduler reimplementation, I
don't really need it, it seems few people have, and it almost certainly
requires a deeper understanding of the protocol than I've picked up so far.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

