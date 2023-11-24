Return-Path: <linux-usb+bounces-3311-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C7217F8617
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 23:22:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39E3C283972
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 22:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 172053C49C;
	Fri, 24 Nov 2023 22:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKpQ1O1q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651393D98E
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 22:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01145C433C8
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 22:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700864561;
	bh=xoHZj8qtxo1+i2MWPyN4GddXt2UtZgz57Dy2qH51xe0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AKpQ1O1qY7xU77JFL6bwzm7sy/RRFlrKI+F76rndzkIx4zwTxcZ6q5Pjizqv38EXC
	 LAkymN9Uv2qrsiBhG0JFwANjFQUZLkF09Gq2qxoz+hVBMz/wH7VWs0I7KzTTbTDs6/
	 yFekqD2Lj3SKjAEwvD0OAGLEOtVfUHj6wmQEh6LWltpJxE0573qBJfxXkkTPiIVscO
	 L3eHB8EqSygbWw+7ZKTtTLmXqXJyKrwf3Ns0garK1NjffrPXgPMFmTGFPaI/3hoovc
	 x2RL5zishhF0j56l9UzILq53NPQOlm8v8VZyTo6uPXU6G2nN/7TMbXDvAxRuV0lz/k
	 M8uZqhGDzY+NQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E5A0CC53BD1; Fri, 24 Nov 2023 22:22:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 22:22:40 +0000
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
Message-ID: <bug-215740-208809-Wa9Y1kexOW@https.bugzilla.kernel.org/>
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

--- Comment #30 from Ferry Toth (ferry.toth@elsinga.info) ---
So I checked and:
root@yuna:~# cat /sys/devices/system/cpu/cpu0/cache/index0/coherency_line_s=
ize
64

So I just simply added to your debug patches:
diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 0ff47eeffb49..ba5864b23aed 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1420,7 +1420,7 @@ static int hub_configure(struct usb_hub *hub,
        unsigned full_load;
        unsigned maxchild;

-       hub->buffer =3D kmalloc(sizeof(*hub->buffer), GFP_KERNEL);
+       hub->buffer =3D kmalloc(64, GFP_KERNEL);
        if (!hub->buffer) {
                ret =3D -ENOMEM;
                goto fail;

and the problem disappears.=20
But then, why Comment 15 can Alan not reproduce this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

