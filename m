Return-Path: <linux-usb+bounces-134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F817A1C44
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 12:31:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B5A0E1C20F9C
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 10:31:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B11AFC0C;
	Fri, 15 Sep 2023 10:31:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0497F101C6
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 10:31:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A5F4C43395
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694773876;
	bh=5H8nlNCAOGEJXxnAC0HhnYvHUgFz+fVjyVzEJe1QwQ0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IpHdr8L9dhdsUcsoSEZGFzBm4Ep9B7ijOc0Olrf605T3+ztUSve97sX1WUDonkqay
	 /ncQGO95Cj0N278F6pzUHLwHOpl2ARPcqWFaUswL65IAUpeqyMRLMz4OVFlrvctbr5
	 w0A4QZdf4xF43012FWwClbBfqK8sxdpLtiXFU4E5sijelFuRV4uN9wgFGZZp3XK1qZ
	 Dw2/3fQYua0LBukHVtqBx3BrCRpIy4ZBlS3t6P7BRHStmrXVIjJmQq9gCz6lLomAGP
	 8RcMIR181HU1mBeRAHDM0mYUSNNYNQc+6EVsC8vaYmAQ82S9j6MzeylWia7OD7WprW
	 irTgDBUt6ZC8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6997FC4332E; Fri, 15 Sep 2023 10:31:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Fri, 15 Sep 2023 10:31:15 +0000
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
Message-ID: <bug-216728-208809-JhTjKrfG9P@https.bugzilla.kernel.org/>
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

--- Comment #42 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Okay you unplug the dock on purpose? Okay I see.

So what should happen is that these PCIe root ports do support active link
reporting so with recent kernel (v6.5 I think) the PCI core checks if the l=
ink
is active before it issues the ~60s (arbitrary) wait. However, it does not =
seem
to work in your case. Now, you have "mem_sleep_default=3Ddeep" which forces=
 S3
and possibly enters into completely untested BIOS paths (these systems are
pretty much all s2idle).

Can you add CONFIG_PCI_DEBUG=3Dy to your .config, and remove the above opti=
on
from the command line, and see if it reproduces? If it does can you attach =
the
full dmesg again?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

