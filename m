Return-Path: <linux-usb+bounces-15368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71244984A0A
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 18:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1AD61C21D17
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2024 16:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B001D1AC423;
	Tue, 24 Sep 2024 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syKhrKGe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9121ABEB5
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727197016; cv=none; b=uJcEt4N6O5LOZWRdv9lRvBM7SIu6gTSq2+NAbdBCZtcwJXXNdSVRHIktpPxZv7iesXZfMT16PeCv69TYjT6A5khzkeYzyuqfon/8fwYit1sOdKp6KESprIV+zSBJxuvMs1GXbi+9VCscEBNAw5RY0s5B4hfM/8abCiuAllLHF9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727197016; c=relaxed/simple;
	bh=HoNtl0FsX6PkZ/u3iMHuq62S6/DyL6nbK8SQZJQPwOg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iavhvhUlrDoUhqo3GYxljCuEd3FjYV1OOBCFb4G3dgXAfxxmWMFjHvJqkGtTdROtA3TIZdDVGyJkpGDmz0fOw3Aw/9BxQbL6XBThPOFJy18+ImKgzX0y/ni9kwfwY2pyvQkd1qZSu5bsD3axHJGOlnGCiXjbu3MK5PJ/bpP32zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syKhrKGe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE2D3C4CED0
	for <linux-usb@vger.kernel.org>; Tue, 24 Sep 2024 16:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727197015;
	bh=HoNtl0FsX6PkZ/u3iMHuq62S6/DyL6nbK8SQZJQPwOg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=syKhrKGe9euqhsuZ+jVfn+QAVuO+/jx/2P6Pk++/ESiRrVipE7UgQD07asRIIvoxp
	 GFXP7S78WLH2dWzQ4edgPHtF4wrxGQfJi6Rp1a9IiWedKlgkPs7pM2mVExLoaP3ijT
	 YgaI4tqe8gL4uiSiYcSVQef6VZ1pNW1S1c94od9hiFD+MpNUINkz7wTb9cFMzBi6RO
	 iTFec10proJgH/jcp9CTKi0M/TnVxqXulZbpW23INlEwyaw8FhlqYANYy2dht79e1k
	 JoO54CQvk1V/rr4SA8mis6g/40xY18Ok2U/isM0N/1IhQwrGrnJkxqCaLRefNNZTpF
	 zMyJC5oF7aM4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A5F56C53BC3; Tue, 24 Sep 2024 16:56:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 24 Sep 2024 16:56:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-y6enYzLifr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #40 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Also note, the boards are not limited to Intel Merrifield based ones, I have
the same stacktrace on different Intel SoCs, like Apollo Lake (Joule).

[    0.145195] smpboot: CPU0: Intel(R) Atom(TM) Processor T5700 @ 1.70GHz
(family: 0x6, model: 0x5c, stepping: 0x2)
...
[    2.740381] ------------[ cut here ]------------
[    2.741675] DMA-API: xhci_hcd 0000:00:15.0: cacheline tracking EEXIST,
overlapping mappings aren't supported
[    2.744345] WARNING: CPU: 0 PID: 64 at kernel/dma/debug.c:607
add_dma_entry+0x219/0x350

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

