Return-Path: <linux-usb+bounces-3522-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C23F87FFB71
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 20:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F35661C2119F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Nov 2023 19:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D296D52F79;
	Thu, 30 Nov 2023 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbvvCwug"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C94652F66
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 19:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A465DC433CC
	for <linux-usb@vger.kernel.org>; Thu, 30 Nov 2023 19:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701372902;
	bh=keA5SAXwktWFzY6Yf+Fz6Qgzdt64sbkehJrJd0s3CEk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dbvvCwugtxfl+IHgRi6qPM1paqKv3ms/kCOJNc3Bhi8tsBB4orM43c5DkMkJfCCqI
	 75cAiBTTGdluUCR7hAZWHJoa7Zq59w4fAUfE1OeFNv//dcB01OxoRBOvgCXuLMliFx
	 UyaxgmRKFsCdv9BcOHUSsTzHioHXy1CX30szvYxBxjK4UOqR92nVVOEsd1D9CCSpnG
	 ozX351k+Cc4T+n0s7IqJ2U6mbNIIka56WxC70BdQdAwVsM3jbeHKTvuthnMPEv5N/f
	 k/2JK9rEWG24BpTkR0BH0ailgb/akDSZseWDQEyDP2LsakvcBkdp0sPxK0/Q14YuGv
	 PTw6tXbUB5FEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 91554C53BCD; Thu, 30 Nov 2023 19:35:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Thu, 30 Nov 2023 19:35:01 +0000
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
Message-ID: <bug-215740-208809-l7p8iEiIXh@https.bugzilla.kernel.org/>
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

--- Comment #38 from Ferry Toth (ferry.toth@elsinga.info) ---
With Catalin Marinas's suggestion "force the kmalloc() min align to
cache_line_size()" + attachment 305473

root@yuna:~# journalctl -k | grep hub=20=20
kernel: usbcore: registered new interface driver hub
kernel: hub 1-0:1.0: USB hub found
kernel: usb usb1: hub buffer at 71c7180, status at 71c71c0
kernel: hub 1-0:1.0: 1 port detected
kernel: hub 2-0:1.0: USB hub found
kernel: usb usb2: hub buffer at 71c79c0, status at 71c7a00
kernel: hub 2-0:1.0: 1 port detected
kernel: hub 1-1:1.0: USB hub found
kernel: usb 1-1: hub buffer at 65b36c0, status at 6639340
kernel: hub 1-1:1.0: 7 ports detected

and stack trace goes away.
IOW the 2 root hub kmalloc() are now also aligned to the cache line size, e=
ven
though these never triggered the stack trace. Strange: hub's status is alig=
ned
far away from hub buffer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

