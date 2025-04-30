Return-Path: <linux-usb+bounces-23571-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 021EBAA47A1
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 11:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D7CB03B148E
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 09:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9BBB23815D;
	Wed, 30 Apr 2025 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZtTqUFs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4094C23771C
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006567; cv=none; b=I4pmpihidXpz8CjdioRdU47PFsqyOdvQX9/dzDhw/YZVZob8v57rfGQaB6XuPFyhb5olcRfAyMUpWqUUtOyaiCKsIQvC5jegfrXXwBYt5HfZ+KdqiqnyHhmZ+GfwqFhEVdmrF3cS/ddK/9QyiXNZfENl7c9QYzjv5zHeZzaM9lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006567; c=relaxed/simple;
	bh=kaEXHttuADjf7leBALnFb9uNjOZXy/xYZn6DMSWgAmo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iepZDp+c43osoDJ4rDfo9/Q8v/zUsC1XQqnSNlLI0e/tiAMUZBml94rapqnqLnvrcAmnrBVDZWNLzWxwYKjbrvGQ9hWrcXj4Vqv1Sz0hzoULlNeM19XsZSLooMOktmO9VxvP8Yhen3ggd+URIs+OL2736hpz9t0TLa9XFOHymNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZtTqUFs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7222C4CEED
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 09:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746006566;
	bh=kaEXHttuADjf7leBALnFb9uNjOZXy/xYZn6DMSWgAmo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iZtTqUFsTomHfldoOZW6Xrp2oGMcwfXqIEBLHX9QpaeznbekEd88u+XFV0sxkheI2
	 E+Im/ioZgGaLAreKV44SulPBH3glKfAt+kEfmGbiNrtaY5koef9LKva+N14+3irMOi
	 PVAtXJaygUvuOjFE7O4dQM5riVNlHgUWdUka6QexSf5Cf3CHkCOmkBCZxFc5uffEMk
	 XsPb7fY6Ijjx4Eu4Yh4j48Y2u6dqMulWVnRtUrVcpM6rbVPCt08T6MD2BMXjHQxtT6
	 s0rIiTyBgphqmZdnVKEvHtCmUlWryyamkiwb3ruOg1Cll8CrH5k+ggCa9DxvUqKk6X
	 gdkSja2d5xhRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A841FC41612; Wed, 30 Apr 2025 09:49:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Wed, 30 Apr 2025 09:49:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-3QAqJmmZUt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #7 from Claudio Wunder (cwunder@gnome.org) ---
Running the echo commands to proc resulted on zero noise on `dmesg`, but I'=
ve
mounted the debug partition and can see files here:

```
=E2=9D=AF sudo ls -la /sys/kernel/debug/usb/xhci/0000:6a:00.0
total 0
drwxr-xr-x.  6 root root 0 Apr 30 10:01 .
drwxr-xr-x.  9 root root 0 Apr 30 10:01 ..
drwxr-xr-x.  2 root root 0 Apr 30 10:01 command-ring
drwxr-xr-x.  7 root root 0 Apr 30 10:05 devices
drwxr-xr-x.  2 root root 0 Apr 30 10:01 event-ring
drwxr-xr-x. 20 root root 0 Apr 30 10:01 ports
-r--r--r--.  1 root root 0 Apr 30 10:01 reg-cap
-r--r--r--.  1 root root 0 Apr 30 10:01 reg-ext-dbc:00
-r--r--r--.  1 root root 0 Apr 30 10:01 reg-ext-legsup:00
-r--r--r--.  1 root root 0 Apr 30 10:01 reg-ext-protocol:00
-r--r--r--.  1 root root 0 Apr 30 10:01 reg-ext-protocol:01
-r--r--r--.  1 root root 0 Apr 30 10:01 reg-ext-protocol:02
-r--r--r--.  1 root root 0 Apr 30 10:01 reg-op
-r--r--r--.  1 root root 0 Apr 30 10:01 reg-runtime
```

I'll wait for the next crash to happen to zip them via `ssh` after next cra=
sh,
but as requested, before unbinding/binding.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

