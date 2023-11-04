Return-Path: <linux-usb+bounces-2534-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C077E0E4B
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 09:06:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6C809B21457
	for <lists+linux-usb@lfdr.de>; Sat,  4 Nov 2023 08:06:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2530C13F;
	Sat,  4 Nov 2023 08:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHXkBRAo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCA2322E
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 08:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75F98C433C7
	for <linux-usb@vger.kernel.org>; Sat,  4 Nov 2023 08:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699085184;
	bh=1lZeUpdBWKsinrmE07jgwF7CRoGf+j40iIVfTitvWvQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fHXkBRAoMJGrXo3st2W2/siHSSwGubqU5oG+ijvWt8GLazzxoqfn214YEDwPc+8gR
	 5Cj85lyK6tJNoTlZR7huo5NVywiRP+dmqWQyf+V6ceRo/uFPseCPvccHsHXhy9/2r6
	 qkR+xWcoa0RjX/p8gPHy/z6JrvtI3jEkhhF1XCddKJ6U3+KFLnwPLRL4h/PIz3tsg+
	 AXQXoTIIEDBVo1j5U6uqvN/VUigIBbLTwgXh8yXY64rUn8+mAM/02RLJUPTpTFSzKK
	 aa0wLpQ2OoRzAfYZDMh5UeH4AylXyrEGHUcBxuptLttq2sF46RulJmdF3GzV2dhcjb
	 Un3YZDU0yChTQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5E4D1C53BC6; Sat,  4 Nov 2023 08:06:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Sat, 04 Nov 2023 08:06:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215906-208809-zTqZMWvAwV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|regressions@leemhuis.info   |

--- Comment #18 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
(In reply to Chris Bainbridge from comment #16)
> It's not a regression in the kernel as Piotr said in comment #7.

Ahh, sorry, missed/forgot that in all the regressions I deal with. Thx for
pointing it out!

BTW, thx Mathias for nevertheless looking into this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

