Return-Path: <linux-usb+bounces-3285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F197F7346
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 13:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D5F41C209D9
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 12:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72982031B;
	Fri, 24 Nov 2023 12:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohYPfb1P"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35A0D2374A
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 12:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F9A1C433CC
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 12:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700827326;
	bh=emVDzqg5q4/67zNB2dFd+ngKIViEXXMXZdwEgp+nyTo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ohYPfb1P+ZCX1h1KmeCRKXmAz9ArG01cx9O4YY1/Q+OeXntZgddgp2CJ5IAiD+Ihw
	 KFB7qyQXklHvSkPl9g2GRlHbbN13vc9fezj0zVt3HVeHxXHaW37Na/LFafO/nrz2DE
	 sJOaZCKXoyyI133ZKEfzvrdJ0b09YbWXVMXdwkU9O25HqU1h64QvLYXjZeUAcXcdYL
	 mWQwFw4OHmw+N9gnQObJaZ0QQMhh7jOtQ9JxZUqOmlVyLaWKMsw3oVU+bSvmZH36dX
	 Mj2iYS4u2jLzsbU2KQGe5qzKoP0vtobMSIWzjgmvvoZLj2lb829ZdRk0Kqa6/c1L7y
	 8eE4jMEByYcRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 90256C53BD2; Fri, 24 Nov 2023 12:02:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Fri, 24 Nov 2023 12:02:06 +0000
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
Message-ID: <bug-215740-208809-aYUieqwRBz@https.bugzilla.kernel.org/>
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

--- Comment #21 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Looks like read mapping is bigger than 8, I think it might have a cache line
alignment requirement. But I have knowledge of USB core code, I believe Alan
knows much better what's going on there.

Btw, I don't see USB using
https://elixir.bootlin.com/linux/v6.7-rc2/C/ident/dma_get_cache_alignment A=
PI
(except the only DWC2 case).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

