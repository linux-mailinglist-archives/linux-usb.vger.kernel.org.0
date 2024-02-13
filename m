Return-Path: <linux-usb+bounces-6371-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AF98538E5
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 18:47:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E2CE28B7DB
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3891D604C6;
	Tue, 13 Feb 2024 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JwxIRNCE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B743D6024A
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846453; cv=none; b=GQ9JqNrtCPiReXAA3ZOV915Sn4bqaZfpIULX/JTaT/yNUWOJhWc6rjGAPQTvYlG6qTJcuAoRVUDFP+V6r1E0DjB6a5wYk10yVsY92lCC72OQCarf0q5rhejSYCW4lxuzbZNd9NXaERfkJxDS19i96FPrG9zeYHy2RBrNA2iqbcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846453; c=relaxed/simple;
	bh=I1mlDTEXl8E3GfVWoguXf/5uHgPOprbLz8pozqy3DvA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hOYuNtpqHvC2L7aA8zmocekM3nyVczKhLL+oB4cPN1wiHWRbmwexYulkoQHc9/ygy5ohUm/PUJ9CykUKsfmXAHk4GMvs1ODqWwEeKdY5GWPiYjLSmkJtdUDDMyiacovY4IUC9ynPHxjTUzRhwRPp1Nkiy7cBe8MQrVA5y61t02E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JwxIRNCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E2EEC43394
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707846453;
	bh=I1mlDTEXl8E3GfVWoguXf/5uHgPOprbLz8pozqy3DvA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JwxIRNCEazpsAZWBLdbBzxh+ypU/5u/Z2vu55uJoMb6CKTpa26BYq0HygrIassaLP
	 zduf30SEsp/U+xtOdcIBmQoGbYHbRIVcw5UUAScHwD09k4gCRc5O6QjcXWIgFv3pVZ
	 nonNMAXboevWPglSXgQhB7h5JqbXEQzbkVfPGJA4L22SlhGq72GHsQkgItKwEgPaBi
	 Hnwdv8kFhvBo/gd9wpqpY+WP2dpcvrRY2KAzmslnLbpeml3Tel8xfTAyCmim01vvyj
	 K9Bcjfhok42twC28vlCU9T64Wk6rXefKnoVjspLFgQ02EsJngVjyXXseauGzpBJBpC
	 WFngycLl+rwfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 30082C53BCD; Tue, 13 Feb 2024 17:47:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218465] Linux warning `usb: port power management may be
 unreliable` on Dell XPS 13 9360
Date: Tue, 13 Feb 2024 17:47:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218465-208809-U5Wsiq49Yi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218465-208809@https.bugzilla.kernel.org/>
References: <bug-218465-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218465

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #4 from Artem S. Tashkinov (aros@gmx.com) ---


*** This bug has been marked as a duplicate of bug 218490 ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

