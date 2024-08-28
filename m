Return-Path: <linux-usb+bounces-14226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C1856962462
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 12:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C345B21D67
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 10:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE08216849F;
	Wed, 28 Aug 2024 10:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eijH5Dy2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3510415852F
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839931; cv=none; b=ffhtRFuDo4qMkAx88Lbt/WbtMdpBwAc/F3kohduVjDHeB6h/B9dxxjcz7ZpJBBOkoY7sKUHKzgW9MAc7Fc3t93qYh/VuBXJ4LOu2bzzzlyjvYO7iUvgU9Tc+HdaPIIJ4BwfsSFo95ZxvsXT3VPdAgIjyqmtBJA+i6sTHyviJo8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839931; c=relaxed/simple;
	bh=Yo0S3bZOcw0Hdmcvl76LINoZZu5e1iyIrTG1qZgHdus=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZmCbj66rrvwkEEZJ0xfrPkGQU0SUraz3gImQ/O4FnW6sfH+s2xKaGVdOcYW+Vhswk5s/Vn6ohnhDpXiMQDRi8rSvHrMn+IfIwX7lksEiO+QWqdn1EXxKA5VXT7CYGAuapkb+O4iIm8d0g3QxNg1f+xYpE3m/qlfSOeATm0JRAXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eijH5Dy2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5577C98EDD
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 10:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724839930;
	bh=Yo0S3bZOcw0Hdmcvl76LINoZZu5e1iyIrTG1qZgHdus=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eijH5Dy2EM0C6rOUYMCEF2NLnj4R93RM/AUktswhrEQZ+Y4314blsNp9cFQEGBjJ0
	 8bJ2/J9GVI0Vj+U18SijUgfxv2xfCFwEtvOlS7mjXs2rdZfHXncaay1iqUTFCcKE/l
	 b5fa2EsXBZUcn1qYwnYW/eilVS3MHI5wZINY+lJhxtpWrv8xZdy9FmrNvg4Qvo/M+a
	 jxsbiu70DzUaAeJ38TcQhSpBd3lPywdJnGR1cV3USEgkNiZ8j/mb1n/H2nDSy3BFD6
	 RiaWgHIrBxj+Er0NOH0r3qiMj/5mAmuAM3U48IT89cgDRADXVxLrRXgRuM4ccYRvPv
	 nfoekBb2h6zcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A822AC53BC3; Wed, 28 Aug 2024 10:12:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 10:12:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maggu2810@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-WzgVTAsqIc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #17 from Markus Rathgeb (maggu2810@gmail.com) ---
Yes, sure.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

