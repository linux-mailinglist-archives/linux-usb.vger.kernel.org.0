Return-Path: <linux-usb+bounces-12844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04001944A06
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 13:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31DA41C22D97
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 11:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752EF1662F1;
	Thu,  1 Aug 2024 11:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yjx7NSA6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2603183CC8
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 11:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722510321; cv=none; b=S0l8toidKrq4qj/RHNDfw0ozBgvnAWQ2UVP/gQMT7Lvxiu0yhyB3Lfni1iwY8ppg06MBihZ/1uhQUdL3tuN7dcN6JhV8VpG5se7b8OJVNoYtYfO5MWGllDp36M2Rn0BFxij4KHOJ+fUX7ADrO2RzvoVELtKdMduHzo2KrS4wZgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722510321; c=relaxed/simple;
	bh=LYlL5jPCnxsJyMzfc1uV7bOaqJcGU77imVci7qcPdBU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=h4tEpYcRLVJw3muN/OiIPIoxLItVhlYNrXa/BLle+TUF56mkFGRz2XoD3EmM7fIuv6MLbEPHX+VZy165H+urxCStPZQT6g723SmcFerFb/4rpgpIuMjjoZKR8BPO29aR7cMw0bbvM89ojMIFi1nnUmXv4ZYc6FNaoVHPsxUoPMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yjx7NSA6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 92E7BC4AF0B
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 11:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722510320;
	bh=LYlL5jPCnxsJyMzfc1uV7bOaqJcGU77imVci7qcPdBU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Yjx7NSA64y5U5H2rCXnvNyfr+K6fqXT8LyuOF7ARxJT9UilWLEcumRMyx9ZpT6mpG
	 Ihpz7vdZ5jaslxXbUPXSIUipC2qIat35nUnrbJJOYR9SXj48a/8CpB/eG1ejTW3H4K
	 GDnaxTJ2plnWSrSWQGuaOn9AZXaGcHK4jmTJ2SPlaCrilZwFqVwwF9MifMewY/rXaW
	 FZNogkiEyD/BNltwSFxAMEvX/Woeb2Ww10gsA09TJDiZPszINFKQ+YEHfvLnfSpw1z
	 wO0EgfjLk/ub0hUkA760VKgy9gBp4fcx/MPzWhdpSfQwR8+EzcZf2d5E8hlcAQ7gLc
	 6Td1Kkd8NQ7bw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83168C53B7E; Thu,  1 Aug 2024 11:05:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219113] I/O-errors freezing the system [sd 0:0:0:0: [sda]
 tag#11 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD OUT]
Date: Thu, 01 Aug 2024 11:05:20 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219113-208809-QFWREezggR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219113-208809@https.bugzilla.kernel.org/>
References: <bug-219113-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219113

--- Comment #6 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
6.1.102 kernel has a recently added patch that touches this area:

Commit 5ceac4402f5d xhci: Handle TD clearing for multiple streams case

After that patch xhci driver we may issue 'Set TR Deq' commands for each
stream.  Before the patch we only queued one command.

If there is a flaw in one of the stream contexts, or command itself then we
could see that 'Invalid Stream type error'.

Can I ask you to take logs of this issue with xhci dynamic debug enabled?
Also enabling some specific xhci tracing could help:

Steps:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
echo xhci-hcd:xhci_handle_cmd_set_deq_ep >> /sys/kernel/debug/tracing/set_e=
vent
echo xhci-hcd:xhci_handle_cmd_set_deq >> /sys/kernel/debug/tracing/set_event
echo xhci-hcd:xhci_handle_command >> /sys/kernel/debug/tracing/set_event
echo 1 > /sys/kernel/debug/tracing/tracing_on
< Reproduce issue >
Send output of dmesg
Send content of /sys/kernel/debug/tracing/trace

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

