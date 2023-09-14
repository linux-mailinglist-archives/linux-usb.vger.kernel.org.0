Return-Path: <linux-usb+bounces-75-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3497A09C3
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 17:51:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD0E82824CF
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 15:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EF2822F0C;
	Thu, 14 Sep 2023 15:46:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD003CA78
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 15:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22BECC433CD
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694706368;
	bh=ARdtiFE4a9t6U0JFvdJLbQ0yaaVLRAEvGZl6E8WEdcM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fIuTxlsCTHBBVHNyeJUsDXEoKA/1vYXlabyDmyyAeVge8QbIHOgzTFMrNm7NxFkm7
	 A7FK+gVq3+NKC3WrdY0w/Pg99qkkZJONbKBryc/QXiY6pNvNHz4VB0uvgGX3shsIeF
	 6YJY4kl1FWWPl1UlMGgltTlBm7MLMYOeHc3ELtli3/Od4dznommCdkmWz3n8PUf3K1
	 JoOiwxIz0bo9wWO7dbgnPDHv6x6PsTKzz4ijyMOcftPCrxyGy74+82uSzLEMHTZ09T
	 M3tYnBA2PghKvalmpr3D4QY/+gUqtaEinXuALJNlVJCD9M/pBkHUCnarwqYnRheJ50
	 KJUuXpILwDErA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1513AC53BD4; Thu, 14 Sep 2023 15:46:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Thu, 14 Sep 2023 15:46:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-iPNJoeUXGa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #39 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Hi, yes the delay happens because the PCIe link does not come up and this is
the actual reason, not the patch that increased the delay. Can you add
"thunderbolt.dyndbg=3D+p" in the kernel command line, reproduce and attach =
full
dmesg so we can hopefully see why the PCIe tunnel is not created properly.

Also, did you tweak any BIOS settings from the defaults?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

