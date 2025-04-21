Return-Path: <linux-usb+bounces-23262-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A97BA953EA
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 18:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EB877A9027
	for <lists+linux-usb@lfdr.de>; Mon, 21 Apr 2025 16:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD981DD543;
	Mon, 21 Apr 2025 16:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a8kFThld"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAC22F3E
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 16:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745252135; cv=none; b=aG69mTUbUQw83O/X6D3qkYsPWbpcCu+E68D8wFvMrbzzXLwaQAKomv/m8Cg3PxR7Nbswi7eAfFXUh7qtJJQzPGSR13QD+/xgPOOHIHRi8zSF1Zl/z3mDCVgivqNZ+h/2Q3ICIrp+dtXHND6x6bm7ZA/juv0yIuuqbMAgzf72OGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745252135; c=relaxed/simple;
	bh=FiwA9ZbOf59WoKyO4d+C9jynfSSLMKd3Cczs6cH5+Lk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=DaTc/p4KgQZ2oUMnL8zrXgQ2ov4rc0Zejo2bgw1zUZQ7M9SLP8srCdFym+esgBjJNqPHIOH+MR6M+uK3FEGuhj8CUJOyz0CxGZOo2o9cY+s0hnUn5PkmT/5/CvbA724x8fkmrdpPq/kunX/i/Zr2LY1sAIVSNqcT+hJYdQDm9Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a8kFThld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45CB4C4CEE4
	for <linux-usb@vger.kernel.org>; Mon, 21 Apr 2025 16:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745252135;
	bh=FiwA9ZbOf59WoKyO4d+C9jynfSSLMKd3Cczs6cH5+Lk=;
	h=From:To:Subject:Date:From;
	b=a8kFThldVb3rYZ6mYHs5dElF5sCgo3aAvyNcD9KSCjSx4kygsmvyxB+UoYHl+jtOj
	 FHiQPcXtkzq45vGo6ox/BoHK0Vy4gqvlUmrTXet2c5utHULFw97G+SJ505u5i9S4wZ
	 UGsFQ/Fw6K2i/NeR+u/JOSC3lL6OlhEDI0Cfv48YzOsFzFOvIX3U3Mu5S4mIgEJOua
	 tq9gE4bNAru4uNe0rwgzWcMfPGQXJFpBLyrKZWJLLKBGlI8cARARI/ZoEtmDdaVlB1
	 ugzmMn1+SxuleyJknk2J+x0aB8Am9KkFsIagWzcsmA2wRqBf1+tsDdHbPfP2yVyY6q
	 tRHJkJiO68J6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 375A6C3279F; Mon, 21 Apr 2025 16:15:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220042] New: kmalloc Redzone overwritten in
 usb_get_device_descriptor
Date: Mon, 21 Apr 2025 16:15:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: m95d@psihoexpert.ro
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220042-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220042

            Bug ID: 220042
           Summary: kmalloc Redzone overwritten in
                    usb_get_device_descriptor
           Product: Drivers
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: m95d@psihoexpert.ro
        Regression: No

Created attachment 308005
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308005&action=3Dedit
kernel config

Hi.

Asus Tinkerboard S (RK3288, armv7).
I get this error while booting, and every time I connect an USB device:

[   23.437577] [  T282]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
[   23.447578] [  T282] BUG kmalloc-64 (Tainted: G        W         ): kmal=
loc
Redzone overwritten
[   23.457246] [  T282]
---------------------------------------------------------------------------=
--
[   23.469617] [  T282] 0xc5818c52-0xc5818c53 @offset=3D3154. First byte 0x=
44
instead of 0xcc
[   23.478587] [  T282] FIX kmalloc-64: Restoring kmalloc Redzone
0xc5818c52-0xc5818c53=3D0xcc
[   23.487655] [  T282] Allocated in usb_get_device_descriptor+0x90/0x1a0
age=3D1713 cpu=3D2 pid=3D27
[   23.497031] [  T282]  usb_get_device_descriptor+0x90/0x1a0
[   23.503086] [  T282]  hub_port_init+0x15bc/0x26e8
[   23.508268] [  T282]  hub_port_connect+0xacc/0x2438
[   23.513642] [  T282]  hub_port_connect_change+0x218/0x500
[   23.519599] [  T282]  port_event+0xaa0/0xddc
[   23.524292] [  T282]  hub_event+0x458/0x9b0
[   23.528883] [  T282]  process_one_work+0x8a8/0x10b0
[   23.534258] [  T282]  worker_thread+0x784/0x10a0
[   23.539338] [  T282]  kthread+0x2e0/0x344
[   23.543738] [  T282]  ret_from_fork+0x14/0x28

I did a git bisect and this is the result:
# first bad commit: [fb5eda0dfe2256b468fc4e95207a4df88457274f] mm/kasan: Do=
n't
store metadata inside kmalloc object when slub_debug_orig_size is on

I also saw a redzone error in usb hid driver, but I didn't get to bisect th=
at
one yet - kernel build is really slow on this SBC. I'm going to open a sepa=
rate
bug report for that when it's ready.

I'm attaching kernel config and complete error from dmesg.
Thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

