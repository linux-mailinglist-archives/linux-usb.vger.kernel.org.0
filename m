Return-Path: <linux-usb+bounces-25145-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C4AAEB158
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 10:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 385661C2403E
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jun 2025 08:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74CC725178F;
	Fri, 27 Jun 2025 08:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kJGJ3K3I"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E312F1F17E8
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 08:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012886; cv=none; b=ZbpSU8ggSL1dMICVXsGtBkvIYFSLjUtZXbpWBpl57UBZrKN6MVxXjdDXLPEp7ORR0Vf1h+c86yblPyDZxpf6DkWNcNhWvgXfwDJi0pVn+iRzfVmykLbW6pB0kNjcdWT3kQY8vdgey1KYmtBDgkOWKSF5NRQezd/4AmBZJjFR+XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012886; c=relaxed/simple;
	bh=vD9ecPvQQF/46T/up4BcXOCSXy+a2DfFkGcMCl1heeg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j6l7KDJniElHMwWkbaSfa3rUcGv9YjMSbBLMg+1N0N//NenwmGTvdd6h5u3Hwoep5iNk1lqpfOvj++vt3Ce24xeiXxl0KYUYZxkgiZHC4cqxc9Zr0flwfwmgvLtdaf/IIcb6pAOIbo+N1e5yDENogIEv3P65EWyfMBShLcIqQQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kJGJ3K3I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8640CC4CEEB
	for <linux-usb@vger.kernel.org>; Fri, 27 Jun 2025 08:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751012885;
	bh=vD9ecPvQQF/46T/up4BcXOCSXy+a2DfFkGcMCl1heeg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kJGJ3K3I5dGUEQ2d2Z1GmEmbl7VmR6f+VyB9gIDC8nTkNQDHVa2VnUf0N+ZQqccqh
	 bAuHxLiFcSrXoslaLgvlussnppWPfw+lkGhx1G8Mo2QHN/wVymnWerHGCUM5mzHPJA
	 5DAwkpMeaaALoDlPGpMB9MLCYZUgwHy/H5RGY8KLFwy0OaEes8dwo3vLL8KRKK/tXv
	 mFTCglWoM/ToR7BESyBO5/7RcakuZUDcm0m6rgeqbDaGGmQUyEM369OxOMu4LdbQrz
	 mGMg+h51m7wqBtwtFqgpoIf9BgYy9Yp+HdUP2sj9vWMJi6dxIsvG31I6N7TlLD3QoP
	 IHhRu0abUCTjw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74266C433E1; Fri, 27 Jun 2025 08:28:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Fri, 27 Jun 2025 08:28:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220272-208809-UxGyKx7ydD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #7 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
> However, AI analysis by O3 and
> Gemini 2.5 Pro both claim that my custom memset is fine and pointed me
> towards multiple problems in the xhci_setup_device function of xhci.c.
>=20

Could you share these AI reported xhci problems.
I'll be on vacation next week so reply will be slow, but I'm interested tak=
ing
a look anyway

also log with xhci dynamic debug could be useful:
echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

