Return-Path: <linux-usb+bounces-12758-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 182289437B6
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 23:20:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48EFB1C221BE
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 21:20:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECAAB16C872;
	Wed, 31 Jul 2024 21:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnuKSyzX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719A916D31B
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 21:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722460774; cv=none; b=NpDyp/wPbrh0t5bhJJ7XlIq0KHYzQG9he60haUG9WreCIqMD19r0KLP0WxS7kZ8iTmeokZ8IbZAJl9NkyGgN7V7ISIwqF9klIhWF9MLweoai5Zvpe5jpkXgLk69KLGGVHD8RxM8/RAVZa+HXUAM2gvbXgPSvuvTJi3IBkoD/TPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722460774; c=relaxed/simple;
	bh=mEh9oTuY6cpEK+uHqAEZ7MOYj+4XB6AG9CH+QobD02I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QbCQFHpjrWYIW8ivYXeOgBMptTdDQu6w9IFP43yUeI/2UFMilDAgqRCrnEOvqcYmvExJXWR6D68Yq7lZ6MYbI1EB3OghCfOrEMqRWbXY7xaCwo3r5jp/htEuJb7m3rt5rb4nRZagwZAVs/5UDOclaSjrrJLK5nWOxREGIgdP91Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnuKSyzX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5BEEC4AF0E
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 21:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722460773;
	bh=mEh9oTuY6cpEK+uHqAEZ7MOYj+4XB6AG9CH+QobD02I=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qnuKSyzXokBhA8KEWI5+ft7/voFndSVH+bahTg917p2xt381cvT+PnULgcPzxmbTO
	 0lUIrDeeL4ABDURf8Nj+/4ma0BZvEVbAgZDyI7pkjNIku3/JM+ZiDdKi7KNYDXyi39
	 qEWicD5x9rH+Ck9+J02j+g96dpZqMD0Hhw7yiz1hvI4j25Q6SnoBgWUmqZvTT5u+5J
	 Lu8dG0uSO4uRWlgzo2bLkVEEVMHOUSn1RkneoygZxu1XiO/qH43/6eoZ3azuVD7ZYD
	 b+bBqJTQBNuaJ4dDf7X7WTwfovYi4r9+h+ftVjyzLIBR9S133ajLhgkc+s1YVTe4P5
	 X6uoa6/xnLgsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D07B4C433E5; Wed, 31 Jul 2024 21:19:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219113] I/O-errors freezing the system [sd 0:0:0:0: [sda]
 tag#11 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD OUT]
Date: Wed, 31 Jul 2024 21:19:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219113-208809-HL0vlCq0SM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219113-208809@https.bugzilla.kernel.org/>
References: <bug-219113-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219113

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #4 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Disabling UAS should be enough if you need this disk to start working right
now, albeit not with maximum performance.

A quick glance at xHCI spec 4.12.2.1 suggests that your USB host controller
believes that the USB device or the kernel has given it a wrong stream inde=
x.
This could be a bug in the device, in the kernel xhci driver, or in the host
controller itself.

Do you know any kernel version which doesn't have this problem?

Upgrading host controller or device firmware may help in case it's a hardwa=
re
bug already patched by the respective vendor.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

