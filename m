Return-Path: <linux-usb+bounces-26936-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A38C4B29224
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 10:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 534EF189E32A
	for <lists+linux-usb@lfdr.de>; Sun, 17 Aug 2025 08:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AF023D7F5;
	Sun, 17 Aug 2025 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmVyjuAK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC443176F3
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 08:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755418199; cv=none; b=pwn68shZmty95UTOG42baYbmXl//9Lj493WWVnj9BiCbgDybM2dtcgzBKcBbCrm4WOR7yzAFPb0jFOvShYZfPN8NGHOFQJL/T0oDvopO7zXW25qF4WvmRSZniKglWx88o8sc7alwEGWQZGfoG1rF5rVOMfoOtltz+9TCai8yWFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755418199; c=relaxed/simple;
	bh=L2cvxwSEk5ZJT1P5AiUNJp9TLYsQ+h6SncqU7UoY6aY=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cd8eMHtKmMiG2jDY8FmesiD+eSZ8gRxlxZC+PHTVR0DjP9VN+LxpJnjrrxAdaSnPly4CmnQF8pTv9jTpAzCzuQMsmcMrR/Xozfd6OrYY7sALU/h3MNbxrz0A0GFaOPKxin1jSmGjGbWRfE2t2awYAQqe8VKgHeQPZJ0E5umvB0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmVyjuAK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB850C116B1
	for <linux-usb@vger.kernel.org>; Sun, 17 Aug 2025 08:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755418198;
	bh=L2cvxwSEk5ZJT1P5AiUNJp9TLYsQ+h6SncqU7UoY6aY=;
	h=From:To:Subject:Date:From;
	b=DmVyjuAKaM+MQ5Wo6cJfTGYHBmfuSmUNY3A45ksiFVNxS65l1BbBKnnXCjPkSjE1g
	 FjFKL2BHi+dBwuWYYdA1KvpoVO/ELB0slV6o+4zNNk8JmeMApH/XNFInHw+ULlwkSH
	 KiYsmIs1Yr3sgdGVkQVIxvMWKUvBcayqU1eWH77Z13CnpQpd+Rd817WNXQTPLPe/ao
	 M6frRIfoOiYxpmStE3DZOx8C7ylfzrfz2LtZ0Dfue/4cKc3HFSoPr/bXnEz4FL6eeF
	 z2c2EyojgSgCBVdga8r1ludmKALf1OJ6TfLo/Rozm17HuhfCjnSt4wsMCECtbxFOsU
	 0QBW4rO+hWeSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BD039C4160E; Sun, 17 Aug 2025 08:09:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] New: Plugging USB-C adapter into one port results in
 `Failed to set U2 timeout to 0x3f,error code -110`
Date: Sun, 17 Aug 2025 08:09:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
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
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220460-208809@https.bugzilla.kernel.org/>
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

            Bug ID: 220460
           Summary: Plugging USB-C adapter into one port results in
                    `Failed to set U2 timeout to 0x3f,error code -110`
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: pmenzel+bugzilla.kernel.org@molgen.mpg.de
        Regression: No

Created attachment 308500
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308500&action=3Dedit
Output of `dmesg` (Linux 6.16.1) with dynamic debug of xhci_hcd and usbcore

Attachments for linux-usb list message [Plugging USB-C adapter into one port
results in `Failed to set U2 timeout to 0x3f,error code
-110`](https://lore.kernel.org/linux-usb/97d9420f-1a7f-433c-bdd7-b7bab6c45f=
00@linux.intel.com/T/#mb4ac7d8ec970fa3a3cfb451d725d28482b2ad0d5)

From Mathias=E2=80=99 answer:

> Could you also take logs and traces with dynamic debug and tracing enable=
d:
>=20
> mount -t debugfs none /sys/kernel/debug
> echo 'module xhci_hcd =3Dp' >/sys/kernel/debug/dynamic_debug/control
> echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
> echo 81920 > /sys/kernel/debug/tracing/buffer_size_kb
> echo 1 > /sys/kernel/debug/tracing/events/xhci-hcd/enable
> echo 1 > /sys/kernel/debug/tracing/tracing_on
> < Reproduce issue >
> Send output of dmesg
> Send content of /sys/kernel/debug/tracing/trace

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

