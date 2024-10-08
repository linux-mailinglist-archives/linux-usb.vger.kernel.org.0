Return-Path: <linux-usb+bounces-15844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF5E9947E1
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 14:00:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 918051F2188A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 12:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7E81D6DD4;
	Tue,  8 Oct 2024 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EdOC/488"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E061C2339
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 12:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388834; cv=none; b=JaEc7+hlDO3hdjpp/xmwnlwDUOy+Z78NAUXUTwXlIQxxAIl3lGJx6y4I6v7SVzGtspSAd7/VBwTnsbsCrfO797cHyzbPEwVgWsaNJn+z3jGjSmWsDEKyVxYOU9cHvYiswMZDMIo8Zo9TIQClA//Dw+26dm6wm2H3a2cELw0fHWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388834; c=relaxed/simple;
	bh=fzeNNaIb0IVIdeAnGmlwK9lAcif4oN0dlJv5cC57zO8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mihg1DGes2oGAQCsSLLMZUGWLa6BgCKYfg1S8NZjJwzB2F+2MkMB0BXk1zoa347UObMpJFSx8QkC1Wd7oZ6OC4MdE9yW4Zl/Ku7hcqGXBgdcyECCGhXubwfoNGTob88l7WdzHpRYbdMeg4Ip/HTmCTiOPgBJpIByENcTCCofVeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EdOC/488; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D08F2C4CEC7
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728388833;
	bh=fzeNNaIb0IVIdeAnGmlwK9lAcif4oN0dlJv5cC57zO8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EdOC/488Bq5mQWNgGaCd1Psg2zglNtf+C6MEZx9kEO6cHUS/cQR6VyY4MDF7GDS0X
	 M5li47vVhJJtRfYNMgYlLmf2sWOZJArMPU5F0jqfGsupQt7Alpsr5F0ZMM1vjOheXQ
	 8W5bFNjA707LcxkTkvcRH5++LFoP1ZNpN6gvLtyLPavsPfsTSr+vSz2kStMg/H1H2I
	 tDJq9Bdth+QCQTo3pXlaStZYLQCFqa28wvCDABEFqsZy3LQg/bbLeglLPNaQhx0cp8
	 GJ+F0vpRaDCf5TCgtSzwWn3BTrSRDE7Ysj/L6RvM/YD//8z2qIwHfxCTJJyotYk9yN
	 C069vp+otKryg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BA0CAC53BC2; Tue,  8 Oct 2024 12:00:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 12:00:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-D7dWNIzlyu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #2 from Tomas Mudrunka (harviecz@gmail.com) ---
> Don't do that, you will end up with an unstable system.

It's an emergency shutdown in embedded scenario, we have capacitors that are
able to sustain the system for 1 second in case of unexpected power loss. I=
t's
plenty of time to shutdown filesystems and drives properly. But we simply
cannot afford to wait for userspace. Works nicely so far.

> Yes, that is because you are shutting down things in the proper order,
like a normal shutdown will do.

Is there a reason for sysrq shutdown not to do that? I mean... c'mon...
shutting down SSDs cleanly is the bare minimum we should do... if we fail t=
o do
that, we can as well just unplug the power without trying to unmount or sync
anything...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

