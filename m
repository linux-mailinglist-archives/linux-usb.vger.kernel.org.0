Return-Path: <linux-usb+bounces-27757-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CE9B49D42
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 01:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBF123A77B0
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 23:02:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19F64239099;
	Mon,  8 Sep 2025 23:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o/dTgfLR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8153B84D02
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 23:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757372464; cv=none; b=WsmQFonFuP24yowRi8XMC5ZucQIrNF7t5uZ+1Vs8MiD4xKDWt92v6r5lY1JQ+8G7QinRmWBx5u9k/766v6R2eO1waZK367KpL+4B+D3+0z9Er4pVfdguovKmKyhbqar6Q1kGbsDx/uzhAgFRIgpG5v4heB3+RPc7tJ2WPoAwiIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757372464; c=relaxed/simple;
	bh=gu7/7QnqcpovYog0TGFKJ8RqmZBkEgfwQD5FguXzHSs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cunBTIfN2nrBWbU0w4/2KwgLMVBqaapfUFzDTiGu8T8dw5xfbQLjESZwY6m5dT1hT37MoYbbcg4wsMN4QukYXK1K/+9Sc2RaQ1MmuWkEHmVVaNHNgvfc/sRqTo4AFLKqtH2+RNdqGBsK1mqPvvpBYnw6LvEELS+jkt7pdY1+8Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o/dTgfLR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4D4E9C4CEF1
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 23:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757372464;
	bh=gu7/7QnqcpovYog0TGFKJ8RqmZBkEgfwQD5FguXzHSs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o/dTgfLRLpBfZAtvRtoEADgjDVcavgWjhHcFGogzOXiz0S4MUYWZMU2/RXfrw02n4
	 6Azt7vvvMDHFNaa5Ac6f+AaOPvt2/yGO+K5GjfIjXG9a7fUddp4y99/8DX5Ki6Aw9N
	 ENrLg1Ra2Ld0WHGjdWB3YuhgHCeNaOQ1iR9G2REZMOCJIUb9LlEgq5b6oI1mkQvnWJ
	 GdE+Q6qaDMsMCYHeSPAl+ntj1PxGBQwYzwyi5KTf95mTPIcCoYYZAT5vkFMoPgXvY8
	 XUJ26zcDKNRyASugnGuaKBXFh3ijWowtUbYUREsDZTEPyV2i1Nca/Vk2V05Bd9bJlu
	 3UqcOzcM3cnCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43AABC41613; Mon,  8 Sep 2025 23:01:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Mon, 08 Sep 2025 23:01:04 +0000
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
Message-ID: <bug-220491-208809-s6uMdNgQ9d@https.bugzilla.kernel.org/>
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

--- Comment #48 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
I spent some time over the weekend instrumenting the kernel so that I could=
 use
kdb to poke around kernel memory. I particularly wanted to examine the cont=
ents
of the variable reset_resume_delay which turned out to have the value of 0x=
1f4
as I was expecting. I first looked at /dev/mem as a method of reading kernel
memory but found that that method has been essentially deprecated and not
documented as so. I then instrumented for kdb/kgdb and eventually found tha=
t as
far as sysrq is concerned, the ativ9 left alt key is different from its rig=
ht
alt key.

I then found that if kdb is active for long enough, kernel stalled, then on=
ce
the kernel again runs, the SD card reader will disconnect and reconnect
similarly to what happens sporadically on resume from suspend. I'm still not
certain about this observation. It hasn't happened enough times to be certa=
in
of stall time requirements or even of correlation. I've just finished disab=
ling
various systemd daemon watchdog timers that were confusing the issue. If th=
is
kdb correlation turns out to be real, I think it should be a useful clue.

I've got a kdb breakpoint set on the usb_disconnect function. If I can figu=
re
out how to keep the system from switching virtual consoles when it hits the
breakpoint, I will acquire a stack backtrace.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

