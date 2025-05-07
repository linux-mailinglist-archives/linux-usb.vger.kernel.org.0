Return-Path: <linux-usb+bounces-23784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A9DAAEC90
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 21:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C70FF7B9A94
	for <lists+linux-usb@lfdr.de>; Wed,  7 May 2025 19:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6164928E5F1;
	Wed,  7 May 2025 19:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UeS2d9fK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FB321B1B9
	for <linux-usb@vger.kernel.org>; Wed,  7 May 2025 19:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746647882; cv=none; b=p51ER6pDI2IlBhhhVW2bnsInwTL0RFTkdLl11MHO9ARdeiYj9wLtKm1eTK5FLBE0SbXamHopyIP06OwyxqQsWmH/whFaYK1gtHjXHpDShLe/CuKgjlyZfnrFHfz649fGXIcz3CYALstbitg6P1fuMaNUbdix2cMpn3MR/RxHduk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746647882; c=relaxed/simple;
	bh=KqZrSfdyykaIguBbDxDxNQcAjz1QzkLEMuom2uveZCo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iy4imR9EwpB3Re2oPyFcvBgDQBx5MN6npkOYoS0croH7Zg/0X1TZlxroet4kH2mvgeX6ymTXght/4QVuP7sxCSxy4NG9IpmCRTUF2uBJEkCtdHXJui4IcV9V+z4Ngj5EJvZKHp+LDMBZZO1ZOn2Xnj+1KlVuWjBZjCaTIBa6Ep4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UeS2d9fK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56B92C4CEEB
	for <linux-usb@vger.kernel.org>; Wed,  7 May 2025 19:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746647882;
	bh=KqZrSfdyykaIguBbDxDxNQcAjz1QzkLEMuom2uveZCo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UeS2d9fK+1TUBkInG3LX5d4MCN4/j6cLtvGL4cEvcdQihPzHJt3S5QSkPyeusvAo/
	 A/y+jJmDs3KiqM+ZF3EZ8JBjReDfxHQB4JMFyiIrQTCCxQFzoVMvuHa5iEDZbSYucP
	 Zz1Bbpo4G9lntZ0Nok4XPq3d7OepviWUu8wpitOo9qITTKA70z6O0XVpOnShtfRFK6
	 M22DnoWOs8dk8GLyMhbnLbs/tESIoOTbEyrYYjDim/TvFx6mZ/YoyEepx9HBrtiXJr
	 LxSfvmotY0NI0FWPjMYqMwIjFr5aLgJQDspqGGYLOuaxsOW6/9zfG1AWma0SvtVwT8
	 3x197EnTJeYvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40A65C3279F; Wed,  7 May 2025 19:58:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220033] xhci: Compliance Issue - avg_trb_len not set for EP0
 during Address Device Command
Date: Wed, 07 May 2025 19:58:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220033-208809-TAs7aHTser@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220033-208809@https.bugzilla.kernel.org/>
References: <bug-220033-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220033

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #3 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to Chen-Tzu-Chieh from comment #0)
> Some xHCI hardware vendors may validate the Input Context at Address Devi=
ce
> time and reject contexts with invalid values, potentially causing device
> enumeration issues.
A scarier (and more likely?) possibility is HCs failing to validate this fi=
eld
and yet assuming that it's non-zero, then dividing by zero or doing some ot=
her
stupid thing and crashing and burning. Bonus if it only happens once in a b=
lue
moon.

But as Mathias found, the spec is self-contradictory, so it works both ways=
...

> While xhci_endpoint_init() later sets avg_trb_len correctly,
Are you sure? ;)

This function is only called from add_endpoint(), which doesn't seem to eve=
r be
called on EP 0. But non-default control endpoints would be set to 8 indeed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

