Return-Path: <linux-usb+bounces-7425-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFC086F07C
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 14:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BC991F2171B
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 13:07:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B42681755F;
	Sat,  2 Mar 2024 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvQG3Irg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391C6168D8
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 13:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709384833; cv=none; b=IkF3tEYBcye8k5hUN9t8ugfNTHwerDu/3ojh1Samx3timblyN1UfuUv/HCVRHVxe+hty70oxEYwlzM59jvmG0NGNrQ4DLVKG1zBRRUNx7lvLIzSlle9gpc4qX6oyW63DzS9xlkUHlTAJkBJ8qfirq0kRtZzeDlL97h/vMFIHEJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709384833; c=relaxed/simple;
	bh=1kDdMhafcaFvYty4dtq+MEFnoRCkQQTVkRawOSkiWYs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OhBAVVNte2dUk8MurtgRYYlKOYjePgZc7FH8ugpVcdp+cbtKf4eGpGBWfP/uZKqdQRPzvnwJQJPUXrSZxhvsKoLidyJbnYc3GG7YY5bfM/pPF9cmaQBu2P11PIbgKjwT4csOSGni8SRfAuOxH+uSTt2DGrmUPXAJ8bMK3BPQDFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvQG3Irg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01189C433F1
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 13:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709384833;
	bh=1kDdMhafcaFvYty4dtq+MEFnoRCkQQTVkRawOSkiWYs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KvQG3Irg9l1aIZYX+un2b2IFy7I3+GBwfZcGmDtYXT/mGHoSV9ebk4gQb84kZWzL0
	 ryuwWmXu5OgtWpsC7yAzEx034g1dApb6oP074XXgIeLVLnJB9Ms5HPtjIVm/L808gR
	 eJ9e5mcaIaTl78Cq741K4ZY2k9xGqMCxqlSiMe7+dNhokL9fRgjpA9WO37N2MZJBke
	 qa9xBN7ol3di8BBe6p18ZCrnJ8POSyAVtHiQZqqm/pyu85Gh1nhCj9SMvfxdtPT8at
	 kVe/1uJBvmyE/T8ZmQXcWj+Uirj6r1ff8rxUumFPLjsIRquLWMnsj1AwdY5u/Dtx54
	 ZZR87D8UnZu8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DA9C5C4332E; Sat,  2 Mar 2024 13:07:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218551] Roccat vulkan 120 volume keys not working anymore
Date: Sat, 02 Mar 2024 13:07:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sascha.grindau@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218551-208809-nbNBe4mGW1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218551-208809@https.bugzilla.kernel.org/>
References: <bug-218551-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218551

--- Comment #1 from Sascha (sascha.grindau@googlemail.com) ---
I have two of those keyboards attached.
One in black and one in white.
I just figured out that the volume keys work on the one (black) but not on =
the
other.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

