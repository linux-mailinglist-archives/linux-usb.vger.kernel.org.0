Return-Path: <linux-usb+bounces-2853-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D957EA91E
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 04:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0670A1C208C7
	for <lists+linux-usb@lfdr.de>; Tue, 14 Nov 2023 03:25:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD2768C09;
	Tue, 14 Nov 2023 03:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/cygs+5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55FE07495
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 03:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEE05C433CA
	for <linux-usb@vger.kernel.org>; Tue, 14 Nov 2023 03:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699932304;
	bh=3+BD5apSez+jrPDh1aMgbH/meLVj5LHkfPeiWwt1HOs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r/cygs+5d8TyNiltjTzmR8s8MYDaM/ZDUKYwbwkpv9f8y1fwpfYrGN60EkZs9xYfV
	 +K8xkmatSypuistnIUfjcgSnshSlT0ahCEVuFlImJIGA46drjtkf5moNHHJXUyee8m
	 DSbsl68U28jTth8xrnQ6VV4U9ekXWwHHaC3jn3794Ontmwn5omIffhrmhWekn/C4Yd
	 Ru1MbTbLGZOJwZJllpcK3h785KuzWazAlm+dex/ZzHc8hAe44cazH3v+6eILLF+a/s
	 OddGRDVE2tRkUBho9SMjwDotfE7bLKNXoLopBBUzFU7oUWs2876f+NaAYlN9rwBbJk
	 T2LlC2LFVERgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BAC74C53BD5; Tue, 14 Nov 2023 03:25:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 14 Nov 2023 03:25:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-g3GLtoKrpr@https.bugzilla.kernel.org/>
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

--- Comment #11 from Alan Stern (stern@rowland.harvard.edu) ---
I don't think it has anything to do with the init3: section.  The stack tra=
ce
shows that the problem stems from hub_ext_port_status(), probably called by
port_event() within hub_event().  And the place where hub_ext_port_status()
calls usb_control_msg() indirectly is protected by a mutex!

The I/O buffer being mapped multiple times is hub->status->port, and it doe=
sn't
get used anywhere else in the hub driver AFAICS.  (There is a comment about=
 the
phy driver also using that buffer; I don't know what it refers to.)

[It would be easier to track this down if the DMA subsystem would cause the=
se
erroneous mappings to fail instead of pretending that they have succeeded.=
=20
Grumble...]

I'm stumped.  I'll try to find time to reproduce it on my own system.  Prob=
ably
would have noticed it before now if I had tried connecting an external hub
recently, but that just hasn't come up.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

