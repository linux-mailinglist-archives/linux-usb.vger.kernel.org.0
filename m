Return-Path: <linux-usb+bounces-30075-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECAB7C34938
	for <lists+linux-usb@lfdr.de>; Wed, 05 Nov 2025 09:51:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C2DA192014E
	for <lists+linux-usb@lfdr.de>; Wed,  5 Nov 2025 08:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2890D2ECEBB;
	Wed,  5 Nov 2025 08:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ER1B8Vwt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9828B2DEA83
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 08:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332503; cv=none; b=B+33fkA4S5yrt9iD8SDdttH9ttRp9qaD68DC+YJ17sD9qbsJkQLQGxvN2ZBZ/sHMoiq7PNcEm0f8wwl5BdjUHJEbZJs12KeYRILbTuu+OxdoIhZWNQehl87frnncUjwP/J5qvxYXBd8AJBjXQUOab6Exx7qcwbKy4/6KqCO/rpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332503; c=relaxed/simple;
	bh=EZligCjiMuGp+tPa0LkB08lQJZ7PYZh7EcSFvva+h0k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m222tr4mTrlQyRtb/fRm11tVc9WS9/6Qhf2s2Xv2E4A0pQ4fbusT/+CSiaYU41AYx/DY43PNkI+Zg9x6FSZJbqN/xUjD0TkPlXyUPWGbdF/qiZ5RP3++VfoSZyJ5I4eMYmrYqU5iLs6GQekJnpvd+/pE+LDxR4m1D0WpOd640CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ER1B8Vwt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18588C19423
	for <linux-usb@vger.kernel.org>; Wed,  5 Nov 2025 08:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762332503;
	bh=EZligCjiMuGp+tPa0LkB08lQJZ7PYZh7EcSFvva+h0k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ER1B8VwtTIH6diRAr3NDRXPbln1FXCctHD3GjU6TwxpgzKNueJjVq+jdlS7RQTcV/
	 ZaFZVwTGQwTAcqSEuTAVV7EnymaD6WlJRhH38wFTg1myiQUHB7HE3pWsQef9E+vhKb
	 p1WPF66AL1PM5Sp22HFEJyVMdIR3JTtFbxAR7iVn52SwzquR4ooxAcNccVWT3K+zWx
	 ipArVhYnGOj5+G1kDP2Xg7k8qvhB4e4ACUp/ggUDz9SNXe9OIZlfPGmgmr5A4lL/6G
	 Bl6tMX13o91MSeQ38o8kGu/f58by48K77qibsSYFz94kckCGss+R3LXsjp8zJSV5AI
	 lZ1kE47utkAhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 13359C53BC5; Wed,  5 Nov 2025 08:48:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220748] usb: xhci_queue_isoc_tx_prepare ignore start_frame and
 always assumes URB_ISO_ASAP is set
Date: Wed, 05 Nov 2025 08:48:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nick83ola@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220748-208809-e1hOFSJ2CP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220748-208809@https.bugzilla.kernel.org/>
References: <bug-220748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220748

--- Comment #2 from Nicola Lunghi (nick83ola@gmail.com) ---
I haven't tried any changes as I'm not familiar with usb devices and wanted
some feedback first


> Did you try the obvious?

> +       if (!(urb->transfer_flags & URB_ISO_ASAP))
> +               goto skip_start_over;
>         /* Calculate the start frame and put it in urb->start_frame. */

I can try this and see if it works yes. my problem is how to see/debug this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

