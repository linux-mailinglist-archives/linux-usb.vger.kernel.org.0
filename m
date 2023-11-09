Return-Path: <linux-usb+bounces-2746-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD6B7E6CAA
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 15:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC8A21C209DF
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 14:52:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 110711DDCA;
	Thu,  9 Nov 2023 14:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NClU1Y/D"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3BA1D688
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 14:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC2E9C433C7
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699541569;
	bh=rheRcdwkUr+OrYU5mUPAarw9/fBgLqsFOu4T2vfNpEM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NClU1Y/D7ZxAH9HJPORD33yZqW/+1PLLoq6xE7Evr8TYt9YMIUfR0XtVzQNwtxIxc
	 cWJWRMvmCDKWNiPxy0XrDc7km4pKo4RZhU+3TtxQTxhlPRXc12iyYL9qoZupxeehhR
	 Kk9JnKQwO4La1Pfb8eEWHt1Edp6GhIWPcYfi1H/F3fJaSuV1kqF+jZ6J9C8BCzMnjC
	 zkquM/GeB604xbrmU8RLaF0da0yBg79PJDQThZER/PkoUIGlDWJTzAcZ9DI4TjTIS7
	 mKZglRTwoyat80e8x/6VhRH6q/X7KTkYAnt7HOGBzQcX/BndoZdg72c28dKfGFL592
	 Q1RsWjMoVpGXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BBC89C4332E; Thu,  9 Nov 2023 14:52:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218118] USB3 port does not work on Chromebook XE303C12 with
 Linux kernel 6.5.11
Date: Thu, 09 Nov 2023 14:52:49 +0000
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
Message-ID: <bug-218118-208809-vA3pMbODiI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218118-208809@https.bugzilla.kernel.org/>
References: <bug-218118-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218118

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #1 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Can you try git bisect to find the offending commit?

looks like xHC host does see something on port 3-1, but can't get
it enumerated properly.

dmesg shows some issues with phy and regulators:
samsung-usb2-phy 12130000.phy: supply vbus not found, using dummy regulator
exynos5_usb3drd_phy 12100000.phy: supply vbus-boost not found, using dummy
regulator

Maybe there is an issue in turning on regulators, supplying ports with powe=
r?

Enabling dynamic debug for usbcore and xhci at boot could show more info, c=
an
be done by adding:

usbcore.dyndbg=3D+p xhci_hcd.dyndbg=3D+p

to the kernel cmdline.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

