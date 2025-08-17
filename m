Return-Path: <linux-usb+bounces-26944-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B76BEB2957C
	for <lists+linux-usb@lfdr.de>; Mon, 18 Aug 2025 00:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 745674E3A15
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 22:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C159D2192F4;
	Sun, 17 Aug 2025 22:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UA6CKjXY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43874200113
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 22:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755468958; cv=none; b=mgyTcz7lDkxaRIw290K1kMB5jrpcL6IuVpWEOPca0InEhbG9MuWEmdcLxcvjm7zS5lgpjs8hMr2XBQwUURQMVFV+Pw4lbNx4DvJjwyrStgDDguzYmvZB3n/H4oxGvketnWAyXBjzq1H/tDLvwlxfFkP8/ecp1nYFWE9gdoFT0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755468958; c=relaxed/simple;
	bh=mo9qj4plK3hi+PY9guZ7mdS9szYyTCt63cqv34m1crw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hiv9aQ1yTBzGVx7aZI3Dmc65+AC+SS0oiI4rGuxQbilwrjpUWlyVIqP5rRdWSdRqSmauAtYD93yUr38e5kZDfoJrtj+X1i3WGKklFZnc5msEUE77ZiYxca9tceejO4k2cwQznnmeWxI2aATQRVUbhCGSlusjQyEQTtzpjjUp60g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UA6CKjXY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9E3B5C4CEED
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 22:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755468957;
	bh=mo9qj4plK3hi+PY9guZ7mdS9szYyTCt63cqv34m1crw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UA6CKjXY0RCRkJh1/Pur9RIlIMNxmIfQ8bik/doGferXIPnumfk2LCLHPdqmTPSFX
	 msyO4CVZTdTD1Dr/5hIeWt6JZGmEuT6a0349VgBPF6+Gv05tcMNnqN9/32tKsToxFL
	 WqZtQdc3LS6fARdeB8LXId7hcmTtIcLVPnPAn/227qo46HCzn0s3UegQYoqu4VUevp
	 MzRSFb5hnNvQc1TkcFKk7sZgufS38lEBKXVaX9Dsi+d/UFEjg4kMplxJO3b2FCXuyU
	 a3qfTUPi2O4y1OgToZiFeUDOp+YFUx/sKJbJdtKLIss9vFBoMsL/ge5pYAyEcdY/lV
	 So9B557l39bKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8ED15C4160E; Sun, 17 Aug 2025 22:15:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Sun, 17 Aug 2025 22:15:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220460-208809-bYN8FNUVkp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

--- Comment #2 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> echo 1 > /sys/kernel/debug/tracing/tracing_on

I wanted to attach the contents of `/sys/kernel/debug/tracing/trace`, but
Bugzilla (Nginx) aborts with error 413 Request Entity Too Large for the 4 MB
file despite listing 5 MB as limit. So, I uploaded it [1], until Bugzilla s=
etup
is fixed.


[1]:
https://owww.molgen.mpg.de/~pmenzel/20250817--dell-xps-13-9370--linux-6.16.=
1-messages--tracing-trace.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

