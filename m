Return-Path: <linux-usb+bounces-11566-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A18B91392B
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jun 2024 11:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72F961C209E5
	for <lists+linux-usb@lfdr.de>; Sun, 23 Jun 2024 09:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11F42BD0D;
	Sun, 23 Jun 2024 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+YTKftX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6F44597A
	for <linux-usb@vger.kernel.org>; Sun, 23 Jun 2024 09:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719134114; cv=none; b=ZeBWXc853v6JN+5BIxlQ681wQHYLUX61lgwECHg1aWB4zbF2/+fv6Llnk7WgW8ktqcenwTw1ulpdfcfYCIDt0bUWz9RFfVjfb1pCwmKfCnKl12KIgHQGWwsLR5zmuC3lF+xqnOG85V/Ihj754eV0i2nBCScvmxRR/81AzGbYF90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719134114; c=relaxed/simple;
	bh=zF6Z0HXXNnw1G85y2KJE76XIlwYRpeMymjGwO5y/rC0=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D02JesOwCD4lxZQxjXfKv/NKNhk/9A0Hrxv/1YFYXZ9vyCwXn4VuSiaeOnL8LTHfdZjJUQn8KcBbBCllg7wYlScFjN6xdxq+EVC6Z9CMtB62dZp9k7KJQs+UYSJV3JvDPr4znswbFL2+TmXDpC5Wckoy+uxbgWLKzS4s/rGyMOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+YTKftX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0E44C2BD10
	for <linux-usb@vger.kernel.org>; Sun, 23 Jun 2024 09:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719134113;
	bh=zF6Z0HXXNnw1G85y2KJE76XIlwYRpeMymjGwO5y/rC0=;
	h=From:To:Subject:Date:From;
	b=F+YTKftXGFF/MCs4m1ObWOg5gfM4sbX7pT0X4hwhEB4Yj5dRvgK5HbNHKdbN0GeLo
	 TL0quV+DiyUTu/KnL7/C3IYdrZXDBZO+qyZ79Nih3i+Dpa81JoCq347IOT7p9n3IZ0
	 6UmRIP1YWivKCUgjQ3keC0s3MBtoNXYOcp6a9I5WesE7Hn9DBblibALrdgVOj5yZ41
	 viOrZ1VMWZtpG2F0CHXqJd+SEpLcRZuelzvlmxqniS1S67I3+VIKJKxQd6GSQWvkai
	 7RfNJXA6EQbAMIoQ0Tfd0eu7nPr/CB7FfYwTyEdV/CPybIZEYZB40sMlR1xzIhyA+X
	 Zvif7qVItgnsg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9CA63C53B73; Sun, 23 Jun 2024 09:15:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218977] New: new dtb break orangepi's usb gadget
Date: Sun, 23 Jun 2024 09:15:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: plusls@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218977-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218977

            Bug ID: 218977
           Summary: new dtb break orangepi's usb gadget
           Product: Drivers
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: plusls@qq.com
        Regression: No

I use Armbian in my orangepi one board, and I use the usb gadget to simulate
keyboard and mouse.

It works on Armbian_23.11.1, but it break in Armbian_24.5.1.

After some time, I found out that it is cause by linux kernel commit:
b13d48408e9f0aa80f3d9f93960aa49bd0da7af8, when I remove the "phys" property,
the usb gadget works again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

