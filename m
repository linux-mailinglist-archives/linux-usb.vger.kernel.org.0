Return-Path: <linux-usb+bounces-15930-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB296996C10
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 15:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 267D41C216A8
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 13:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B36EB195FD1;
	Wed,  9 Oct 2024 13:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nNIbygRg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B13A161313
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 13:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728480742; cv=none; b=VyzDcsJhVWheyW5CpcEqdkuJWZQvTPeTpUZ0APfYmffC+oaQW/8Jr/XSpWbGMd+LPdxIu4ZP5sSPxvKWscb9u/5/4LUpGYJTn/KN6Dr9tZJHM76VZwRfhDTz+ISxHxJSH0DFckYhdu0zIVNR56bYJvWhZqh8UGBuzSHmIXA0hCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728480742; c=relaxed/simple;
	bh=NoX6Rav+TbXwRkUVLk71mcpZ0ylvf34kDxw+K25ZOLg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BZoisorfXarHRopZhI8TlgwM5qY3xpf/ZRwwrZgOuW980nKXPcVvUBj7VpHr9i80lJqJ4qNfETzQEORYB6W1lDKgbjdwwwIoGAEAc7jgs7C2uiQ+3+kve6AAGZT3IIXrPV7nfC5VCq8JaPwWVnh0qyrh/M32TQ1Gv/p9POnMc28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nNIbygRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7CD8C4CECE
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 13:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728480741;
	bh=NoX6Rav+TbXwRkUVLk71mcpZ0ylvf34kDxw+K25ZOLg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nNIbygRgz6oT8F0wqSv0xwaJpROcAUkRhx2w9dRaNE+XNY8nNFu++dx/7+nvq4m5L
	 6Q3aQVGVvofCr/r5HfBckoJ7rJWn3sWZhveeDn6oUoT9uDijg7gfMQZylTAMLzGZHd
	 CSRG+HpOQ1fuGNnN2K4MHPyAIMNrB5qGu5ZeNBSiADQx9+mGrLXErimonaKf7N+506
	 qhXu0CNy5iL2mIZaXJ35Ylwf9g2w3lx8Sv9hcW+yTHeVwRamy9hItSJhXt5Vj1eoV0
	 yCor9FnWpint6bmco3Sdz1q9rJXlkjfZs+oTc97SiiZdTztoAnuitb0BbJz4lk8vM1
	 yP6pRAJrY5DCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B3FEAC53BC1; Wed,  9 Oct 2024 13:32:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Wed, 09 Oct 2024 13:32:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-b5rwZsXciI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #15 from Tomas Mudrunka (harviecz@gmail.com) ---
Ok, i've just went through elixir and found out that
echo o > /proc/sysrq-trigger

actualy leads to kernel_power_off() which is function described as "Shutdown
everything and perform a clean system power_off." and which then calls
kernel_shutdown_prepare() which calls device_shutdown()

weirdly enough this is only true for 'o' and not for 'b', because 'o' handl=
er
is not pre-registered in sysrq.c (unlike 'b') and is additionaly registered=
 by
pm_sysrq_init() in kernel/power/poweroff.c. which seems bit inconsistent at
least, but i am not aware of reasons behind this design.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

