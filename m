Return-Path: <linux-usb+bounces-20850-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C4EA3D4D9
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 10:34:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 491AE3A7DB0
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 09:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71A861EE7C4;
	Thu, 20 Feb 2025 09:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEtknpYs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61101EE019
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 09:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740044042; cv=none; b=KP9ExXryGg9y270NRdzmfaSowdVbPhUMtKKdyF3QXTIzuMoqnh7y+h4TBV04TZopMrOCLY8XI3Re3Jem9Tivq9f+EFEUAsYLnORJ7LRO/a8OVCdETovveuafClyZyYNAAX7jyIjcQQYiFogO2dzDtqqDLKc/gyieSRDxWak9UBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740044042; c=relaxed/simple;
	bh=XfDSzFBnElzwLEibOlJPVoVSbBP8Jlyvy+hFoJJ5oc0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qmFycMMp7gPDyFim0oBOfZGBVRN51Xv5XlkmPXkZAO+uBHLLZeLnynHvgWr5WkqEDmBsHyFuZ5hYa9Jfu+LxnZmeXTpqCe4fV2y5K6GoCUVMHiq1r8kcm3R0aUPwD0+4ow6r72BclJJsCq219cvTxjNqBOLekCJrfzUDW4AR0bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEtknpYs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EF33C4CEDD
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 09:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740044041;
	bh=XfDSzFBnElzwLEibOlJPVoVSbBP8Jlyvy+hFoJJ5oc0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KEtknpYsNW1xGxoYKyHXM0mDMh/gRmQQMUUCen2sxow9VH1SopDn2dCLDHdHylFTX
	 K6kaC7PoQiDAg3UO1zoXHJ2AJL+e1MbEYCfE/B64xB8Bd4Rskj3TWu5PFFtKCUQV5z
	 uwCg5GBEUpm/eiF9Phkahf+ZEB+uBVjsU77lISQqbxQO96zBXO55e843yFfDOS2Pv9
	 ur9ewJP4zD6dU0xZin3KOVYl9EgPbo81SproHiJitOqDyZxFYPkfwG8j2GMwCN81sS
	 lYR/Ae//+dPb6x9BNMvEzMgd8+UmzvabTpE4gOKeJ4jh/p2XKYGpGzDLRgz/VIcTsU
	 GS/NyTs2BNTrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 56272C41614; Thu, 20 Feb 2025 09:34:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Thu, 20 Feb 2025 09:34:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-ogZoKabOSR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #19 from Frederic Bezies (fredbezies@gmail.com) ---
Oops. I meant USB HDD / SSD peripherals are not guilty here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

