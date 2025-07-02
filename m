Return-Path: <linux-usb+bounces-25416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46FFAF6029
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 19:39:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19D1E17E604
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 17:39:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 691A22DCF5D;
	Wed,  2 Jul 2025 17:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MmtUmOF1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E528A2F5095
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477940; cv=none; b=CHtq5rHi/ffH8MTSeI1X4dnYSO7H2A/BIY7X6KdQTM48/Ve9SmXzLdJMQXvZ1W1QTxAgYX+snLnE4qQQE1uqYYxMp9zVlelw6/suYsFu7A1ZOh8jxi1zFySWhgDgRrPSHUeNLIego8KbY58HXW5jbRSWon3eNxw6ym1MNrMqgdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477940; c=relaxed/simple;
	bh=wKf3uA2thkcQq/EsXLL9Q/2weUim5bcBA4RM4cnH02E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KD7I7+yUf7qpto+BB5WJL/lYTDc1UqhJIDG6zhSX/F6QL2GFovd5Q796VNxPziksqPzwCSPqqz7xGjHPuql30eRbaJIgRqASiP6cFT0qR5Ew93UHq/RL4Ha23hLZzZek3HKVMCNQ+qVYT29lOKfGku9a/SEjGLJSBPx4fv243PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MmtUmOF1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AC13C4CEEF
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 17:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751477939;
	bh=wKf3uA2thkcQq/EsXLL9Q/2weUim5bcBA4RM4cnH02E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MmtUmOF1x5gj+spbSblN8DO5NaFyEuDKFzIGtDWT94Q+hIS0g3HVNKq8FCKTqoKkp
	 EZuF1pZb5Lki5QyXHCo+xYRBDnL/7HGoAdb/Y7xWajNKLuCHJ4DmNcc3HcI1zt4CoT
	 YNkoqBhC9rsjMtHkxmZVQvSoxOaL7WemUr1TLzTWdYZdi5TaxyqEkzPrLtlVZdESqP
	 /X6HTUWZPTp8GFyQTr55I4i3dY26OAhgAZ0A3P/Ll4ScB4ZKL9RH/aDSrjpBX5Zwf0
	 N/Im+o20N0z/12sxMAv0ByAFOOor+aycAFdkvoMJk9m15gEh2/cCZcbW7Q5nYr3Mwp
	 dWELOGC697R+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5CABBC4160E; Wed,  2 Jul 2025 17:38:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Wed, 02 Jul 2025 17:38:59 +0000
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
Message-ID: <bug-220272-208809-NMaDwx6NcX@https.bugzilla.kernel.org/>
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

--- Comment #29 from Alan Stern (stern@rowland.harvard.edu) ---
As far as I can tell, the buffer is not cleared each time the URB is submit=
ted.
 The hid_irq_in() routine in drivers/hid/usbhid/hid-core.c doesn't do anyth=
ing
to the buffer.

Marcus, you could try modifying that routine to have it store some test dat=
a in
urb->transfer_buffer immediately before the call to usb_submit_urb().  Maybe
the test values will show up in the usbmon trace, but maybe not.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

