Return-Path: <linux-usb+bounces-17851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9C19D9036
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 03:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89F7169CF0
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 02:00:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411B08F58;
	Tue, 26 Nov 2024 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZDKLO1J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBA1B672
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 02:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732586404; cv=none; b=CEuEKJWbUcD2V0JjbDzEELe0QwXt8PKaBc8XWczogsDtwAa24GkM37Q2N+Jlh5fhvr6Nrk0uUAdWsPHJSOpq66WH/pxIPDMGoKb8uEqcL4PDvpsvsLYuB4UpDOQm78PaEYCTSyqvjeNetkfLbDAAGKUO1sB6uXrg6sFRcvzxqfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732586404; c=relaxed/simple;
	bh=dopAIxWZZ1aalfrJshKqHxZAydvoStQXJ8Qpa8L0kag=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YasyscFRUjfdtEGDBV04w7Xm7k97S/8N788tdT0XC/eKJVlFgj2o/oecy4eBPyv58vKTSXtyNfFOiANR0ZVW3Ymb7nXm8eYGgczjSk3xEfBe3Sa5T20BSfJeCzxduMyUbKLQH6dsb2C7Ccb00fcTcVMIQH7DTQ/SIV8p9OF62Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZDKLO1J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51144C4CECE
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 02:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732586404;
	bh=dopAIxWZZ1aalfrJshKqHxZAydvoStQXJ8Qpa8L0kag=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KZDKLO1JtYwtXCXZhf84xjdFV+KBULLfFYsQOs1J0YUM1XNEsIHA81bYAytYNQoG+
	 SmgRuMpzT3eQ0y2eZhR7Xeif0GDIRrp3bWST1/EiDjAdVtRFryQyrgF33OOadxGrVC
	 TufRyhtXTalFH+QfFRh349I9lzL3PVWUmoq3kHj54UyK9qNeUEW50ZU+a7Tb+Wrp2m
	 1+408CfXmW39fxJiIGV1NcgmdxxgxN8MgHxQFR4GJ6uWuAcYQQwzsAHbOCltL6ASg+
	 twjUwudprwGl3kj9QWF+pkNFTv0xoGES5kOwjGTHiP2liqc4EuWKfmdHhGdJKOkkJq
	 j/RnbmRQ/HHRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 349A4C53BC2; Tue, 26 Nov 2024 02:00:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219532] Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
Date: Tue, 26 Nov 2024 02:00:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219532-208809-ZOjaovfWPG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219532-208809@https.bugzilla.kernel.org/>
References: <bug-219532-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219532

--- Comment #3 from James.Dutton@gmail.com ---
I think xhci variable must be NULL entering the xhci_handle_stopped_cmd_rin=
g()
One could put a null check at the top of the function, but I don't know what
one should do in that case.=20
Its a void function, so no error value can be returned.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

