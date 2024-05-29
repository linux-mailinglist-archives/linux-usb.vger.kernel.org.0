Return-Path: <linux-usb+bounces-10666-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1928A8D34AF
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 12:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A0A91C2320A
	for <lists+linux-usb@lfdr.de>; Wed, 29 May 2024 10:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88BF017B4E5;
	Wed, 29 May 2024 10:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/4sMLX/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1062516A38C
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716979207; cv=none; b=LpcoyxzyV1LHUtgJPniTPNwWF+23xxW2SLKHcNN7d3uzjwH5NfqcbUufHAUJ0GxxruUfgZ50fYZ7mYBd5C/NdjaCYexi7J2j+/6Y7/V08ql2BfSgmMc6nwgIT2lhHuBzx4oYKKUeYNokChGGc24QTnOFI7pwotbEhMK/M6j7taE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716979207; c=relaxed/simple;
	bh=teZBAQlpOTki2Z+w17RMfG/yzIQIWGGNKhHoC4pcUKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RDLtfgH9bmPBrLXgSu/qRJM3ur/0kQWyMDipj2NSkJVuBashvn4stbehNptzwtykHDcY7U9lPrJCbgcjNwGu1UfZymRXA8y/4/jWwUpbNsPIv8/97YoQb/IQJ2wNBvbF/p1kVNZXnBPxbggBytLUxvknGcnAFDYF+tVhwC62Kxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/4sMLX/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 825F7C2BD10
	for <linux-usb@vger.kernel.org>; Wed, 29 May 2024 10:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716979206;
	bh=teZBAQlpOTki2Z+w17RMfG/yzIQIWGGNKhHoC4pcUKU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=k/4sMLX/2Mt33a4+oB8qlyOCi3tHITOWDh2l+DUAxkkTPxuYHeC3YsUICqlskcY82
	 hhBs+fPyZr9fMdarGAu42DO6CJWgkK1foGLvx37hT4Wb4F8W0xe52+oujAlUF4boVK
	 I5TuVMPvJNr2E8jZgKLluyPlY+DgbTiTMf0M9N8pv4q8yAYhahjVvTmsb2C/T16q5K
	 BNYQ6BCR/23V1aaZvlr2fBmIsoSvNSTgrdCqvJu6WAivCztmnNK2KC2ib84WKYy1Q1
	 BxxEy0YazVZruXEO2sSZGXX4owjQhHT4Qu/NP1h5T+jjYmd0ZDzUWsvjzN72QiRQzZ
	 jLIA57JLAMQKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6CC3CC53B7E; Wed, 29 May 2024 10:40:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Wed, 29 May 2024 10:40:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218890-208809-2qaifixB3h@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Would it possible to get xhci traces and logs?=20

Alan pointed out that there's something odd with urb->actual_length=20
values set by xhci driver.

Steps to take traces and logs:
mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

trace file grows fast so please copy it as soon as possbile after issue is
reproduced.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

