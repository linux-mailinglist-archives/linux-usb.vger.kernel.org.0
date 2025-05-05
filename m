Return-Path: <linux-usb+bounces-23700-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CAAAA8EB0
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 10:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A8F593A9332
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 08:58:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D47AC1F4623;
	Mon,  5 May 2025 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTmqPULA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58598155C88
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 08:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746435493; cv=none; b=MBG3W4esRSxWnT43X0rdDQbJ5VSpRFe+b0az5/dB7BbAGwDsWgoqUd6jQdhFDkXg8yo6TQveSjneRHmvuIEO6yKnoTc4teJu4HKMvG1bos7JSyR5n6Rrev0GwX3iOs8y6GmlsdP1VBIn29Pv/jJfH2i0x0K2lCHRKl1CDgGPHmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746435493; c=relaxed/simple;
	bh=VL4Mko5vAan7UKeE/kQURTfzVLlbV0qWYqKJ+OH5EuQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aa9zs7tmee6HcPR+Gsc9XGKbyNLHKoclncadeALnWutcLIuxD/MBS+0DFxHAoFyLPvUeq4PtLZhKlutktD/8ExH/zGqygKdgWJyuaidkEGmPMkz4q8UpU5n1svaELInw7ETG0Wa2+E4IeMGOWRCZWbEWz4GihawUs/tXcUCSYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTmqPULA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B6B8C4CEEF
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 08:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746435493;
	bh=VL4Mko5vAan7UKeE/kQURTfzVLlbV0qWYqKJ+OH5EuQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UTmqPULAtko0HZADX2RoE1Gmvadnw50WaJcOm5AP52lg1tvFNkIyEo6ApqcgnkpGV
	 018sRzqnesUxuwHw/LAM1BoxxaRLZF9IXvrysJygyQp+S/4ZsTxDWE1pg5B+Zgqb9F
	 zK7Q5Nx688t4iFrEqiGqiNyZgo7PHNbG3u7T9eM8498KQuvizJvt5jouHQBxjQD62w
	 XkLrIlFG+CxH35Emsl9DCO2vD4cQB9mmN8QmAtAYSYBWkpC77KJ4J44z1eywG3nf62
	 80ENDuvAWAT/cpmVgGoDf4x0taRfOjozSNxiGBgX+IKsq/oOoD78bA5/nWYHKl6k6W
	 d9jKGhNlkzESA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0EA88C41614; Mon,  5 May 2025 08:58:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 08:58:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-BdaDQTvVFi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #37 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
I would suggest to reenable power management, and try something else. If you
moved the problematic hubs to bus 5, try to move the problematic webcam to =
bus
7.

If bus 5 crashes, the problem is only hubs and the webcam is harmless.
If bus 7 crashes, the problem is the webcam.
If neither bus crashes for a few days, it looks like it takes two to the ta=
ngo.

You could also try a quirk which seems to reduce some bizarre failures on my
AMD B350 chipset. If your kernel has xhci_hcd and xhci_pci built as modules,
run:

rmmod xhci_pci xhci_hcd ; modprobe xhci_hcd quirks=3D0x4000000 ; modprobe
xhci_pci

If they are built into the kernel image, you need to figure out how to add

xhci_hcd.quirks=3D0x4000000

to the kernel boot parameters in your distribution's bootloader config.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

