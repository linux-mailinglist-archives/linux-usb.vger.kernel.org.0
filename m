Return-Path: <linux-usb+bounces-20681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E6855A36F8D
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 17:51:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C7107A199A
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 16:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 570F71DE4D3;
	Sat, 15 Feb 2025 16:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fD4Rd/uX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A951991B8
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 16:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739638264; cv=none; b=qm+T6uLFVouLwLcQ4/BlcmqIjLzKSXNc0d0kAo21CzVKAyICHE6WAr6hm691B54JdnwvkjzdvMEAGJM7yAs5ngFBkVvE7DdziQ4gHq2lraYWvIQk/9oIDvj1lgV1a5fnT8kswd6s9L8JcgrpYtK2EklYXsa2oxXEatU4AdiBOhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739638264; c=relaxed/simple;
	bh=o+WgrgRTD9SVfBBdKdVR5oSGmJL6K0neSlewxyG08og=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JYq8og1J/YNrYU49iMd2w37UnfLW4kmgQv6uzSaM50SyvC3p71wH3xqSLdfjzmtD+64d9utfnpiW04GGB6NYW4ohSZkvTkr9zStB/0/wXI924mKTrkDjumVz/q50vUoxQmMvKOW8zUHzj7y9XD15Kmtb5Wz4fIxF6XxZxqKFCi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fD4Rd/uX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3823AC4CEE4
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 16:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739638264;
	bh=o+WgrgRTD9SVfBBdKdVR5oSGmJL6K0neSlewxyG08og=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fD4Rd/uXTUzdM/+eAbV2Yk0oN5v91F3NpipCM+hdvnRcUaD4G/oVPy3nrp3B1BhGd
	 Q5EdKNIO0dK5Jicgy4xQGnjoaxlPME7ypbQ5bhxnxVkwnu/r9mAcuDijrva2+j9/J9
	 PhYSl1CGAZPkQJrjVo+AgmGQiw3Slxv+PZfMpQTgaA9/IoOxgM2vb6swLHnOK+ztxP
	 sSHrtAHRHYdXZME31w7vZ+VQKS7FvlQet8Qh45iEKsdK38pyDCNaG99d+hw4cjvlah
	 ShBVzLPdpadeen7B2lgo0rdMaIwlzc6pR2TKL71GNUIH3VGdFRnXL0/u5TmTiJTkhJ
	 42oYQgav3vG8w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 28E5EC41612; Sat, 15 Feb 2025 16:51:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sat, 15 Feb 2025 16:51:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-onsRXaprGw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #9 from Frederic Bezies (fredbezies@gmail.com) ---
Modification done. I tried with my external USB HDD copying big files. I do=
 not
have access of the previous USB peripheral .

Here is the output while copying 2 big tar.xz archives (6 Go each).


[11012.004194] sd 6:0:0:0: [sdb] 976773164 512-byte logical blocks: (500 GB=
/466
GiB)
[11012.004519] sd 6:0:0:0: [sdb] Write Protect is off
[11012.004523] sd 6:0:0:0: [sdb] Mode Sense: 23 00 00 00
[11012.004846] sd 6:0:0:0: [sdb] Write cache: enabled, read cache: enabled,
doesn't support DPO or FUA
[11012.070815]  sdb: sdb1
[11012.070970] sd 6:0:0:0: [sdb] Attached SCSI disk
[11012.324232] xhci_hcd 0000:30:00.3: Stalled endpoint for slot 1 ep 2
[11355.077282] usb 4-1: USB disconnect, device number 2
[11355.166387] sd 6:0:0:0: [sdb] Synchronizing SCSI cache
[11355.166436] sd 6:0:0:0: [sdb] Synchronize Cache(10) failed: Result:
hostbyte=3DDID_NO_CONNECT driverbyte=3DDRIVER_OK


Weird there is no other output. I'll try another external USB SSD as soon as
possible.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

