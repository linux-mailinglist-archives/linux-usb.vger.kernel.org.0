Return-Path: <linux-usb+bounces-2755-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5207E71FF
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 20:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5124EB20CF4
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 19:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFAA332C8F;
	Thu,  9 Nov 2023 19:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t2hpkkAi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556F52031E
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 19:10:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4FC1C433C7
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 19:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699557030;
	bh=6e3Gx54FZKh2od6Wm7+S3Qo9tibHpsNhoTUQaNs7eik=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=t2hpkkAijC5lkRVFKEXP7swtyGRfkVHt3YvmNf5WV1d2Ceqg5SXvsnXPzszlXHnV7
	 4L0nNszgrLW0Ket/ioIPXEDMgPhLOeJD6uTwsKkP8XHTez9sNfd8rd7OVTvPUuTUBN
	 V+juTJUtOMW39f/EgYDRaLrx6qZEnuBne00cd+986RZCmhoq1Qa6jiUrDtgWargddj
	 wYYjjuukJqUjWSrns8UdTvvXDSnBg4f0dzSxEfDNjVQS/jbsCyhcERmPNiZa1dZZQN
	 GL3YgxNce2CYoNB2xeh3FJTkOSudPQsaheGJmaomOWHZhtDnWPLAXGMI0KAxr588gg
	 qmVGqXa/lFtzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ACBB0C4332E; Thu,  9 Nov 2023 19:10:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218118] USB3 port does not work on Chromebook XE303C12 with
 Linux kernel 6.5.11
Date: Thu, 09 Nov 2023 19:10:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quark@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218118-208809-tDPTxXCrCL@https.bugzilla.kernel.org/>
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

--- Comment #4 from Andrew (quark@disroot.org) ---
Unfortinally 'usbcore.dyndbg=3D+p xhci_hcd.dyndbg=3D+p' did not gave more
information about usb3 issue. Maybe I need to add some extra option to kern=
el
config and recompile?

I tried to plug in mouse to usb3 port instead of flash-drive, and there was=
 no
light under mouse. And 'usb usb3-port1: connect-debounce failed' appeared at
dmesg.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

