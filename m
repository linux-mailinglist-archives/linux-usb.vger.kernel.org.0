Return-Path: <linux-usb+bounces-3001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E83E47F0915
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 22:12:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 78E231F21C0E
	for <lists+linux-usb@lfdr.de>; Sun, 19 Nov 2023 21:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D68E14297;
	Sun, 19 Nov 2023 21:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eBpZQAhD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3421428D
	for <linux-usb@vger.kernel.org>; Sun, 19 Nov 2023 21:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6364FC433CB
	for <linux-usb@vger.kernel.org>; Sun, 19 Nov 2023 21:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700428359;
	bh=NVnt5Ngk2mvMjlxjzfNI/y0M9mHbMbTdsqNqo+ZNQp8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eBpZQAhDhwCBbSfHUi6QunzNYQBlCKY9eg5H35uMFZJPu7trx5l/FyZwW38Ad9TFD
	 faUtBFTRUkt7QXc5GwPB/VIILSvmlhumxwMqH8zySu7nxx34YFTV5dKr1Sh61P1tRv
	 y6AK75HAwAGy0anNzwQC8vhRTPt4E3UvPgHPXo/HBaUqzJ0mW14YshyaHldzzzEVHG
	 6xFoCE+xVZC3o7aMLYIyNbv6uKDLfC53TK7E32YcPBx5n/a8HLvefRbHEg7WHtkavG
	 VzrGMqnrRsKleGU70DB7yOE6BNOlYrXZ/l2OYprCG8XrDTVr8Tp6BeNxIiM/ImkeLm
	 /H1E0GKJbiMYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 51583C53BD5; Sun, 19 Nov 2023 21:12:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Sun, 19 Nov 2023 21:12:38 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215740-208809-7bX2hRGm0d@https.bugzilla.kernel.org/>
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

--- Comment #16 from Ferry Toth (ferry.toth@elsinga.info) ---
Created attachment 305426
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305426&action=3Dedit
ftrace, hub plugged at 131, mouse plugged into hub at 141

Sure. And added a ftrace see attachment trace_hub.txt.

In journal I got:
...
Nov 19 20:57:45 yuna kernel: ---[ end trace 0000000000000000 ]---
Nov 19 20:57:45 yuna kernel: DMA-API: Mapped at:
Nov 19 20:57:45 yuna kernel:  debug_dma_map_page+0x6d/0x100
Nov 19 20:57:45 yuna kernel:  dma_map_page_attrs+0x10a/0x280
Nov 19 20:57:45 yuna kernel:  usb_hcd_map_urb_for_dma+0x419/0x5c0
Nov 19 20:57:45 yuna kernel:  usb_hcd_submit_urb+0xa0/0xaa0
Nov 19 20:57:45 yuna kernel:  usb_start_wait_urb+0x65/0x100
Nov 19 20:57:45 yuna kernel: Map error: ffffd221000e02c0 ffff916fc336b4a0
Nov 19 20:57:45 yuna kernel: Map error: ffffd221000e02c0 ffff916fc336b4a0
Nov 19 20:57:45 yuna kernel: usb 1-1.1: new low-speed USB device number 3 u=
sing
xhci-hcd
Nov 19 20:57:45 yuna kernel: Map error: ffffd221000e02c0 ffff916fc336b4a0
...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

