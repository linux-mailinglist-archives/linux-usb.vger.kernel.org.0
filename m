Return-Path: <linux-usb+bounces-20725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2E7A386B6
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 15:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A0A27A4A23
	for <lists+linux-usb@lfdr.de>; Mon, 17 Feb 2025 14:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B68C22541E;
	Mon, 17 Feb 2025 14:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ljl3NVN9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DBE9225414
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739802984; cv=none; b=PeOkavAuGD9LO1cNKy4d6Xm5t2ir8nMIsQtBQRWUgoVkFFTZ0JBTUdrk5hoQwj6udSbPUjPDHBBTdRleGUjHUDM6hw/avScozPhN4HyVhoBGSMNVjI0WdPfgRmJl5VmWzJ5YoNxGKibIIjc4hYIKQDqDiFqzKtkhV/s7W1QKTeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739802984; c=relaxed/simple;
	bh=qOwUTnnEpH0Sk1L2s05zXhfwl+kxXwCvYhInjYjKeaw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RRpuXuZPMKg/uFgojshGwb+mX/cSdsit5o7CNXvb3xY9E9T5YY2Lpm4xnKkTEX6H6npzLtGxtoWmSHVbUFx9C9sXkk5Ya5tMXZx0bJ5VVHBax0uSFtTyabAgR31EY4D7XcZBM0N1jGIgL29j08GUON7KR9Aqc0w/GG7fx/Zwtlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ljl3NVN9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B6F9C4CEE9
	for <linux-usb@vger.kernel.org>; Mon, 17 Feb 2025 14:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739802983;
	bh=qOwUTnnEpH0Sk1L2s05zXhfwl+kxXwCvYhInjYjKeaw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Ljl3NVN935kFCRINw0e23RTSTwkqyw5y97xDuPqKp8od4QT//twZACcnZ5JHYLRF1
	 8AiZrm17o8sIBZr+16mHKljjpo75fgJ/b/2TYFhfGTR8to3BiUI/Xtcy7G5huNpI6g
	 oLV/7tBAIwDAFkmkJpKeZwxxRVoT+YES1QWOVOMBRnwqd7H49sAtyVC2PETBAkswXy
	 ZS/HkkYXzkVOOVKnWE4bTwtZyKDT0rfriOALMJhcf+XswbaJqFFNjpEUEIl2kq233/
	 pgiYSoDKwSJ5UFjq/6fM/s/fDI20Y1uHhO+uNX85mddDT+HBhOBlGZKQMxLXhMof3C
	 zevj/HnbGdLvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6CABCC41614; Mon, 17 Feb 2025 14:36:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Mon, 17 Feb 2025 14:36:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-WOKLG6uxB6@https.bugzilla.kernel.org/>
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

--- Comment #15 from Alan Stern (stern@rowland.harvard.edu) ---
One possibility is that the SSD doesn't like LPM.  You can disable LPM by
writing

   0dd8:0562:k

to /sys/module/usbcore/parameters/quirks before plugging in the drive.

If that doesn't make any difference, you can try collecting a usbmon trace =
that
shows the error occurring.  Warning: The usbmon output file is likely to be
enormous, and the interesting part will be only the stuff that gets written
when the error happens.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

