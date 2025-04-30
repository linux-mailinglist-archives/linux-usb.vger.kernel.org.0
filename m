Return-Path: <linux-usb+bounces-23590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B29A9AA57F9
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 00:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 208FB171BDE
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 22:36:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E802248BE;
	Wed, 30 Apr 2025 22:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KH0gZFH9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8831EB1B4
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 22:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746052574; cv=none; b=WWQty8IyBcaKS0ZsNn2raLEeDR5FVRWWIkngimxX7KYsUcjseZYkW23t8Q5muepy1a5aCE2etxjMGLsf3/GAF1zXZQMkKZ3bsZ5blgvQaINEJcCAwC7OXZyGkfKYpXkm5tvQSuZgzTgea52fZX1UGeQmCwg+yDAHRAcLXBo1wH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746052574; c=relaxed/simple;
	bh=21F+ggmUo6L+ewtz6TJec/+/2kVjoausIGovcO58Crw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qAd5P/p6+Pj5SUcbTecbZQxGSOSLBKkXpeXPNZwu8yJL9Qyx5u1W9I0A2J10CyX2GX38kI6MM5A1E9WpiP/vPKTasCBhRPPznbFHAy39TzOAGVoBa11ONrueGKE7dA8IkKhfkgK9BV+5ZdN4uCAh/9aMQz7i6rWb88ACZgvD4fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KH0gZFH9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C698C4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 22:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746052573;
	bh=21F+ggmUo6L+ewtz6TJec/+/2kVjoausIGovcO58Crw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KH0gZFH9Nc6+eEXtUFMF18WnTaC0TBbvnXO1KisrtW1H6DdqP9MVprTOJDamQ86e1
	 lfuQy75yJyATUBQhzIDlUrdpOq7Ajn91087VUGc9LzkmLCfo0Bjd5WnyvoELb5VYKs
	 eAxQmP81q/bGgkDelbVTAqWNmxTmLpH2dEYaSXcqkEIDtZPQWhbo4eyFaANNMRjVa3
	 l98YoNK7fTWDAgTbSsybveDu3aGdbi3XugXhNFC6Lhlhti+zl0PZkT6YguEMeD86TA
	 Mcudv3iRZQmXLb8TpgUg874SRoqxiR4t0SWHzvYxFkTMG34fSDI/R40xejtDZEycWR
	 zMBj5Q4wmeeIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7FD3EC433E1; Wed, 30 Apr 2025 22:36:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Wed, 30 Apr 2025 22:36:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-GZkX4RNfbR@https.bugzilla.kernel.org/>
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

--- Comment #10 from Claudio Wunder (cwunder@gnome.org) ---
> This means it's the "600 series chipset", which is reportedly a Promontory
> family chipset, made for AMD by ASMedia. And IME ASMedia controllers are
> pretty buggy.

That's interesting... I do recall on Windows at times, resuming from sleep
would.. have issues (I had to change the AMD drivers to custom ones due to
SMU/ULPS issues. I'm not sure if this piece of log `xhci_hcd 0000:03:00.2: =
xHC
error in resume, USBSTS 0x401, Reinit` is relevant.

> The debugfs dump will tell...

Never been so excited for a crash to happen lol.

> I think you said you have more of those logs, is the above always appeari=
ng a
> few seconds before "hc died"? It seems related to the 8-3 device, a VIA U=
SB
> 3.0 hub.

For the sample of two items I have so far, it appears that these are showing
up. Note that on both the original regression and the current "apparent" one
(if we can even call it a regression?), these errors above are happening. I
will need to wait to see the next crash also happens to have said logs;

>  Were there no hardware changes, like USB devices added or moved to other
>  ports?

Nope, no changes. I know older versions of Fedora (40) had no issues, but i=
t's
been a while since I've used it (I was recently on Windows 11 (no issues
whatsoever, except for AMDgpu ULPS driver issues) and now I've been fresh to
Bazzite (Universal Blue/Silverblue) and been facing said issues.

It could as well be _my hardware_ -- but given the coincidence, and that wi=
th
6.13.7 the issue disappeared for a whole week, and then once going to the n=
ext
update of Bazzite with 6.13.9 and the update with 6.14.3 it has been happen=
ing
again. (Curiously on 6.13.9 it happens not often, but on 6.14.3 it was
happening every few hours; Unfortunately since with rpm-ostree I rollbacked=
 the
system, the logs for those boots are lost; I could attempt to upgrade to 6.=
14.3
to see if I find the bug more often)

That said, I genuinely don't know, nor if it is due to a Kernel change.

> IME such problems tend to be happening under particular workloads,

It happened before on both resuming from sleep, intensive workloads (i.e.
gaming) or simply when typing/using the PC normally or when the PC is idle.=
 I
discarded power profile or power management at the time as a cause. Enablin=
g or
disabling OS-managed ASPM also has no effect, so I ruled out being an ACPI/=
APM
issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

