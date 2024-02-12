Return-Path: <linux-usb+bounces-6255-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D9D1851EAD
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 21:30:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8562A1F21219
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 20:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83862482CA;
	Mon, 12 Feb 2024 20:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDX/6dP0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0859846551
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 20:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707769782; cv=none; b=XaLS+0MRsdWtePY8isVtabnnqfd/nMAeJ0CkRFcACYaHWEEWDzDThc5P6DHYHt+glvKHd/a3Nb3vtCriWmCXDlHzqerWaJeQxa7Nh72z9rCZWgFp5OoRjCHfvAI5mmOjtNR4ZkjPIkPYCHflP3FZikQQhPW7Wid6PzzCup6wcS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707769782; c=relaxed/simple;
	bh=1+24rsFzdRqFOx1G07G8fWYGWLa5C3ni8qm4djzhuN0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=phVMPPgkphJTia2AMjqeg5HSc0Z0w9MSe75GKi25tj9wiWK/usbkO1F4YO93xY79IIeBmltUrCPZPGgRUpxEfgDoCiuDdZaKueiTQCWoynuB0m0XHQ2sXmla22TUpD6kYxSiRKcbsh4gqeKLB4dNev9k7EXgLi6ZioPJ1gt88Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDX/6dP0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65947C43330
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 20:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707769781;
	bh=1+24rsFzdRqFOx1G07G8fWYGWLa5C3ni8qm4djzhuN0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oDX/6dP013anzroWAlwXo16D1atBdv2wb44xfBlE9YjE0sfTuAQnxKS3WR+n7l7XI
	 54ww6AzL4rYyLTeNtax6FD9DIN+8qbZGyukK0DXNqpaLK6uYRMEcZxB1PiNQv5qnt9
	 PtC2Je+cPjomXaPqThM0So8nqWMFmLdgR/lNQ9HskU3ABL4myjxo4IROoe1V6d4Dx+
	 qd63kCO98E5G9L97A+mP0TzbHwpa5T2W6j2+FRZKvYLr+aUTUkUh1Ucy2N61MlyKAZ
	 9cRsrnpUGvWCoooqVq6cX0VsawyNC9krx/n3oyjaais4FGxgPqrlNWhQYUy4ZZLY7r
	 +sP36Iahdwysg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 53F86C53BD3; Mon, 12 Feb 2024 20:29:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Mon, 12 Feb 2024 20:29:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: rustamabd@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-iDSU74O8W9@https.bugzilla.kernel.org/>
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

Rustam Abdullaev (rustamabd@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rustamabd@gmail.com

--- Comment #45 from Rustam Abdullaev (rustamabd@gmail.com) ---
So, on my system, Lenovo X1 Extreme Gen 5, the commit
e8b908146d44310473e43b3382eca126e12d279c does not fix the disappearing
Thunderbolt issue and instead adds a 65-second delay when resuming from sle=
ep.
Could it be that such a wait is too long? After upgrading to 6.4.1+ the wait
after each resume is excruciating.
And can anything be done to fix the Thunderbolt issue on my system?

[   49.135899] pcieport 0000:21:02.0: Unable to change power state from D3c=
old
to D0, device inaccessible
[   51.415400] xhci_hcd 0000:56:00.0: not ready 1023ms after resume; waiting
[   51.415407] thunderbolt 0000:22:00.0: not ready 1023ms after resume; wai=
ting
[   52.471401] xhci_hcd 0000:56:00.0: not ready 2047ms after resume; waiting
[   52.471406] thunderbolt 0000:22:00.0: not ready 2047ms after resume; wai=
ting
[   54.743394] xhci_hcd 0000:56:00.0: not ready 4095ms after resume; waiting
[   54.743399] thunderbolt 0000:22:00.0: not ready 4095ms after resume; wai=
ting
[   59.095398] xhci_hcd 0000:56:00.0: not ready 8191ms after resume; waiting
[   59.095403] thunderbolt 0000:22:00.0: not ready 8191ms after resume; wai=
ting
[   67.543405] xhci_hcd 0000:56:00.0: not ready 16383ms after resume; waiti=
ng
[   67.543410] thunderbolt 0000:22:00.0: not ready 16383ms after resume;
waiting
[   85.207405] xhci_hcd 0000:56:00.0: not ready 32767ms after resume; waiti=
ng
[   85.207409] thunderbolt 0000:22:00.0: not ready 32767ms after resume;
waiting
[  120.023396] xhci_hcd 0000:56:00.0: not ready 65535ms after resume; givin=
g up
[  120.023401] thunderbolt 0000:22:00.0: not ready 65535ms after resume; gi=
ving
up
[  120.023570] xhci_hcd 0000:56:00.0: Unable to change power state from D3c=
old
to D0, device inaccessible
[  120.023628] thunderbolt 0000:22:00.0: Unable to change power state from
D3cold to D0, device inaccessible
[  120.092723] ACPI: EC: event unblocked
[  120.094771] pcieport 0000:00:1d.0: pciehp: Slot(8): Card not present
[  120.095141] xhci_hcd 0000:56:00.0: Unable to change power state from D3c=
old
to D0, device inaccessible
[  120.095163] xhci_hcd 0000:56:00.0: Controller not ready at resume -19
[  120.095166] xhci_hcd 0000:56:00.0: PCI post-resume error -19!
[  120.095167] xhci_hcd 0000:56:00.0: HC died; cleaning up
[  120.095175] xhci_hcd 0000:56:00.0: PM: dpm_run_callback():
pci_pm_resume+0x0/0x110 returns -19
[  120.095200] xhci_hcd 0000:56:00.0: PM: failed to resume async: error -19
[  120.110113] xhci_hcd 0000:56:00.0: remove, state 4
[  120.110120] usb usb3: USB disconnect, device number 1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

