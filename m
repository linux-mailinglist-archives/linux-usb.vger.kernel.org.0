Return-Path: <linux-usb+bounces-3447-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 109757FC7EB
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 22:29:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCDB3283593
	for <lists+linux-usb@lfdr.de>; Tue, 28 Nov 2023 21:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2219442AAD;
	Tue, 28 Nov 2023 21:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MdgLXTIR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1F442AB2
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 21:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F0D3AC433CB
	for <linux-usb@vger.kernel.org>; Tue, 28 Nov 2023 21:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701206936;
	bh=XWyLktx460UoMA1VYdE7f7MeZLdW7p/O07R2u02V9Tg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MdgLXTIRX3RE16qDgnO++s/IALb7FBSYUFo7VqssJTBtM7NMDcliJcD/3m3CkMxI6
	 VuZU2hSHq3h0maj7mJEzvf9U9GfJWLqh316ZlIFovlV7mqxE2O0fdZufAhWM2IelJQ
	 a4AiET26COAlPMNP3QsD54AqftdwGtLk6KNsmBKQwVK36d+2byq2T53FUjZ+k03Pwu
	 41VeYJjPYLMnCaoikk4NStjXD67hmI0Y+QH7RUhZA/RCcGd9kPpL0/ANchBATy7rMr
	 oPzTa5TQH+vy3kAwZ4bdL8/upr2xXiHmOrWemEFaj0KDL/UsX/YadZPjY1hqtcizYY
	 bYktsi/Aa7lIw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DB939C53BD0; Tue, 28 Nov 2023 21:28:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 28 Nov 2023 21:28:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ferry.toth@elsinga.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-cv7UnjujwG@https.bugzilla.kernel.org/>
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

--- Comment #36 from Ferry Toth (ferry.toth@elsinga.info) ---
Your latest patch gives me:
root@yuna:~# journalctl -k | grep "hub buffer"
kernel: usb usb1: hub buffer at 6e1cda0, status at 6e1cda8
kernel: usb usb2: hub buffer at 6e1ce20, status at 6e1ce28
kernel: usb 1-1: hub buffer at 8001380, status at 8001388

The first 2 lines are for the root hubs.

In my case on Intel Edison-Arduino the distribution is Yocto generated. The
platform is especially suited to attach custom hardware, iio devices, ardui=
no
shields and the like, as you have direct access to gpios, i2c, spi, hsu. So
CONFIG_DMA_API_DEBUG was enabled to help debug device drivers.

I have to admit I never realised it to be an expensive option. And certainly
didn't expect to find bugs in DMA_API_DEBUG itself or kmalloc(). I'll turn =
that
into an optional thing with a comment on possible side effects.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

