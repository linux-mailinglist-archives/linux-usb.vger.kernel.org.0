Return-Path: <linux-usb+bounces-2361-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AF77DBEA5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 18:18:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7A36B20D9F
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 17:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E7F19467;
	Mon, 30 Oct 2023 17:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tBGFCBhd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897F715EA1
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 17:18:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2B03C433C7
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698686291;
	bh=Rf2NrDmdWB9/63KHPvNIf54e3c6ndefyOZFPuGXg4Ig=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tBGFCBhdnljQVt28Q2Q/VGLrnlFZgYh/I7k5XYjdX3CxZ2JxyHzAMYcMi0BN+Y6Sg
	 pY3XEFzGlACJUIigIb4YhDvFZpFjzDJLxQAak+3dAY/BNZpxaowFsduB5ToLWth4Na
	 KAkBPdpHLRCUjd1+t5Dq5QMo3oM/b4He8vBmxsKN5vIfDYzG2DbVP7zHW9YUGno4H9
	 oU0Bw8Q+0zJdUuHYDisx4Q+EFakCi5So/MATCYJp/fQiVZw2OLCq70ddDkRpEfvGim
	 8KlEYugD+j7gM47fYJ2XPhZwupQ9MG+O+ESh1fII9bae/D692rWDVuD8zcgqz0SCN2
	 4NsZKQeafg2fQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D8487C53BCD; Mon, 30 Oct 2023 17:18:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 30 Oct 2023 17:18:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: qba100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-G67g7XUyHu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #14 from Piotr Pi=C3=B3rkowski (qba100@gmail.com) ---
Honestly, I had already forgotten about this problem. In the meantime, I
changed the HW. Lately I have little time, but I have somewhere this HW sti=
ll
and if there is a need I can verify something

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

