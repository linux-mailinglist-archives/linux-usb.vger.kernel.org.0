Return-Path: <linux-usb+bounces-25127-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 315CDAEA097
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 16:31:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E4E95A72F1
	for <lists+linux-usb@lfdr.de>; Thu, 26 Jun 2025 14:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2162EA752;
	Thu, 26 Jun 2025 14:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Du8N02/a"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A1A2EA492
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 14:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948236; cv=none; b=r78xgg7WbOw/bNdIumCKL/rrIDUefBkaQkcw8wUKK6yRUgVt9xftpMhCo1n+6/Stz7l0GWncg68cXrvW//axFvjl1Xt/w6IZgmjnHRYrhGlc0sQiq5lC9igQ3vMyTsMTUVf36cAH/ZJF9EEltn6RkKS6ebr7gOllBHtfG4QA7c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948236; c=relaxed/simple;
	bh=ES8AZ4INdbhrik/zU0eaHaRXXQ1YZQGt1mxwnbSqaVo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AIueOTMfuN3Z/BXRN14KBLy3b7k4ix/yHZy3NZToGaDBGf5eVebEPoq32YtoAYcKWL/S+YHYcNBTAQ+n+gafCtY5kLuYQPYCPY+Bogn/m1IMo7M6pZDn3CSaVOdUYQaeC9JB2W8D+QlBbGLD2lItvWo63U/wJPD9eRWhv1YAbhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Du8N02/a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4E88C4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 26 Jun 2025 14:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750948234;
	bh=ES8AZ4INdbhrik/zU0eaHaRXXQ1YZQGt1mxwnbSqaVo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Du8N02/aMQkrzHbS4BsdWr7eeWlt8Oio4hW8D6oqN1tSsYi0ZT+4WfMZn18J3jVuv
	 za2tYOh+I0eVPy9dw/x9l/ZhRxd8zWLRizJ1sAq9+nu6jWNJqs9ARu2cj7+N8Hx7K6
	 SCimmYBqvvQ+9Fx0tOkI6hyFWv57XQW06IRg8txtKPrYlLCv3ruhEx9CRJoBDfpUCt
	 EQezdW1yl1eSt9mdQKJf6EXoLnNMHG8Ps8ff8HO+638+sfNvqr6ucRKjgGo37+EMYj
	 8f6RiouSYX0E44Z449sfu4cFAOQdwOnUMX8QDiqp+nc5Yte/CKkG0v92oKtUK+XpeT
	 9TlmWTwuG452g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9B2E0C3279F; Thu, 26 Jun 2025 14:30:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Thu, 26 Jun 2025 14:30:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220272-208809-FMmzhw6lR7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220272-208809@https.bugzilla.kernel.org/>
References: <bug-220272-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220272

--- Comment #2 from Alan Stern (stern@rowland.harvard.edu) ---
What makes you think the mouse problem is caused by a race condition?

If you enable USB dynamic debugging, what shows up in the dmesg log when the
mouse is plugged in (both successfully and unsuccessfully)?

    echo module usbcore =3Dp >/sys/kernel/debug/dynamic_debug/control

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

