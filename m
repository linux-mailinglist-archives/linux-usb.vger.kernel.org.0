Return-Path: <linux-usb+bounces-6857-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E685E56D
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 19:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B63081F22DE6
	for <lists+linux-usb@lfdr.de>; Wed, 21 Feb 2024 18:21:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C1385276;
	Wed, 21 Feb 2024 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AtHjJ5cj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F33F84FC5
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 18:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708539681; cv=none; b=Iei1Mvu7SkuTNMB2A190lhqxY3Hscf+h7Yycqp8cnApOyhK2f7G2rbUeZyaXisz5tT1H1YuydelDivS0in1sUH8XMeDKgKw8kbHqQdkSI/oHkt2I1DPBuOhJ0XiibYMIZCIRd6bClB9sRxw62cWNl7dIVzl+AM1/MbVmCODwFpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708539681; c=relaxed/simple;
	bh=1y/cXnYr81Xw22TbbST50A5n4CA4NCcQISUsTTs5H14=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k+9bkTL0hF8GVv2+ZraKAJZAVzybWySFw6lZZAB7X2yT57jgn2K2Da8oPDqRszFUZaEcXJHiNQ4vEJJchRvxia7/NV0HhBiaYE31XnflXvDLS7n+EyXzqME7zFjescxGdG9pdqh+K83mmT/ZxDbU1Oxco2zF3iPk5u4jlCEOdJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AtHjJ5cj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6ABBC433F1
	for <linux-usb@vger.kernel.org>; Wed, 21 Feb 2024 18:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708539680;
	bh=1y/cXnYr81Xw22TbbST50A5n4CA4NCcQISUsTTs5H14=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AtHjJ5cjRFlKyww7wob/fdveHQP8mL6abLOPDMyqyll/l3CVPZO9vmxwjNpiGPa5W
	 XJvNsktyQdWGCuNc+W4ENotr2giio4fWiBVF/zdNRQhoJQQtZa7tQsyfCE1YMinZhH
	 wB8cNDOzVX8dTu1QI0wZ4wv4b4Y5ItyxtdN4tUoF1xUoc4nqbBzzhXLNTGPqbEI8mr
	 KCGQZ0KN813ifDjT0l8KZV5eotPtUZ7fJ6nIpUoYorGWjv6Jgr7IagxB0AhAVWZIEl
	 ItM8xnete3CwZyTXNOcO6XFZVwy0fbwCPbPbXD6rMpt4+qD4GqmmZR4DcIGp2Orbk+
	 Veu1TbY1NIxbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9C236C53BD0; Wed, 21 Feb 2024 18:21:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218486] Linux warning `usb: port power management may be
 unreliable` on Dell OptiPlex 3620
Date: Wed, 21 Feb 2024 18:21:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218486-208809-j7dXPO2nUD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218486-208809@https.bugzilla.kernel.org/>
References: <bug-218486-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218486

--- Comment #3 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 305902
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305902&action=3Dedit
Linux 6.8-rc5+ messages with v2 patches (output of `dmesg`) with system
firmware 1.28.0

With Mathias=E2=80=99 patches (I just tested v2)

1.=20
https://lore.kernel.org/all/20240220135946.4028553-1-mathias.nyman@linux.in=
tel.com/
2.=20
https://lore.kernel.org/all/20240220135946.4028553-2-mathias.nyman@linux.in=
tel.com/

the warning is gone.

    $ git log --oneline --no-decorate -3
    b075462c1a037 usb: port: Don't try to peer unused USB ports based on
location
    c9b8f9ed3da92 usb: usb-acpi: Set port connect type of not connectable p=
orts
correctly
    9fc1ccccfd8d5 Merge tag 'for-linus' of
git://git.kernel.org/pub/scm/linux/kernel/git/rdma/rdma

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

