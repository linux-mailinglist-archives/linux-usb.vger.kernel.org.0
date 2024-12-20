Return-Path: <linux-usb+bounces-18718-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 048229F9C48
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 22:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C8E55188E38C
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 21:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A3C226186;
	Fri, 20 Dec 2024 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkM3Xky2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3042F21D59E
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734731146; cv=none; b=CoqTNecehVRQk2XwBjR0SwywKE5pwHO0yqdO67lmR7gv/S/OaCw9MXZAMWbrMxWd3oO93mSW+pbl4+trZyTYs1qr0+QlV0p8YTnP3E+1AbyGrWlFmSMFPQobmp3JN5Aijct8w+K3xGNk+RgaehLbbnlPkixeIOytJljLcKtWEYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734731146; c=relaxed/simple;
	bh=HC9CGEiitV76c3hrg7b0BwCjz+on7uGmRCH+MNQW1d8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tL6ugDkMVRQeCQfUggOtwvajFPzgg54MJ/dvbcxlFQ6Rc/WZYpl8SM5+pzftZ0uxIdQQi2Lpz/4y7lyIeTXOsf7o2yi0VzLrL5BSGHB4sa3XFWFCt7uQcUBhMmcM3S5H0oPBHEqF76p4VQZLJ5OsnQdXOmffvXZ1N6nmS5YBeRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkM3Xky2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD76AC4CED4
	for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 21:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734731145;
	bh=HC9CGEiitV76c3hrg7b0BwCjz+on7uGmRCH+MNQW1d8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gkM3Xky2WCLo66rnoyVqtHJ48AvteVJaPEb/NeFskcBc8d0mfaNbEoTSdftxwLKPl
	 bRjx+aQAMNc4D7o2VvMkuYMBl2NVfQaAnj1KxOSlIbKse8ySyYxaSM2rgZ2tfmjU9h
	 Pm7z5Tap0j3dL1HV6GScUXf2DFghp24Pv6Ty3vKTENTUDFddVZRMFCWP8pxwoygsVM
	 GmpcyisfZw8bqLsFyVuF6LXtYxVlN4G+Zz2cogYQdkejE6IWX4eWLFsBJooUOOy4RM
	 4xAgOK1p3ztyivZ/kKFzFBxdq2LAikVbtYYXxLfG6P3nTyj4/vkrtvCHH++lw8P0/3
	 v0rLMgAGp/1cQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2201C3279F; Fri, 20 Dec 2024 21:45:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219616] xhci_pci does not activate uPD720202
Date: Fri, 20 Dec 2024 21:45:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219616-208809-Xk7S4JqdMF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219616-208809@https.bugzilla.kernel.org/>
References: <bug-219616-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219616

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Is this lspci output from the working 6.11 system?

On 6.12 you should see
        Kernel driver in use: xhci-pci-renesas
        Kernel modules: xhci_pci, xhci_pci_renesas

and you need CONFIG_USB_XHCI_PCI_RENESAS to have this module if you are
building your own kernel, see commit 25f51b76f90f.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

