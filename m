Return-Path: <linux-usb+bounces-27496-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC64EB42576
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 17:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 473E5586856
	for <lists+linux-usb@lfdr.de>; Wed,  3 Sep 2025 15:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D4F5238C15;
	Wed,  3 Sep 2025 15:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+3pkxuF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB15F23B618
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756913364; cv=none; b=iGh73+X9akmLEQZxEHOJorBfaqPJrnQFuPSWVt65UBPYv+O1Hpk1FbZrZ3/r/TpiSOxTG7cdlZ0MZJiV6HMkTvlt7aEb9vdn2eihAGuHJiM1SL3eq1m1AwvaUTHTdPE2hJOYUwSjKNlGV1l1TX3Lxfo7JPvNcAyhgs3E6LqvA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756913364; c=relaxed/simple;
	bh=5LysssXKo6frhUJJRHx3Z07rvU5ptDKL2e6xD0FsotI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FQikHktgjOM6m5ZML/INsb33/JsWlEmamRJH+mQGW2YWfV3oLLslojndtcDU1+ZKC4H1Q9zGzh+Xqv7wy7UIxCZdk9oY6W0b8cNuF2JnMhNgOWbNLIN1Y5G4CxMZYXlzaU6OrbHQhqpfRH8MoS6JHZo1yJMqri1+2bf8aQN3anU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+3pkxuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5BCADC4CEF0
	for <linux-usb@vger.kernel.org>; Wed,  3 Sep 2025 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756913364;
	bh=5LysssXKo6frhUJJRHx3Z07rvU5ptDKL2e6xD0FsotI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=n+3pkxuFRJ4+WTyq7AaYS1MowSFT7WldosljxgmyzpgM+cdl329DcE1f1PXR1TztC
	 CLd9Q3HpamH6RJ19CgoCaUpZGk8DBw5urKAC/1jCWpMN99LyrVUZo8Ax4u77rBU/HF
	 4UPWHu3FLbl6luZA5cOSG4RM+WFBWbSUrMar8uMvr0wMMGKos0UJ1FDn6aT6T27QK8
	 G6CztrT0HIvXQYdgp9AGu1nznYqDK0yv7V8D2cu+sEzPs7ROmN9Kb3O3MZ4i1gkTdf
	 aIF/hmkK0JQmTx7atprLjBjY220Q0+y/lo2neUkDL99Bb7G5Y7f2KAWFDyQvcw0LFt
	 rzarOGXBVrZQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49C6BC41612; Wed,  3 Sep 2025 15:29:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 03 Sep 2025 15:29:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-ySQYy8loKg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #25 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Alan, I think there is some confusion over my terminology. When I say that
something reliably disconnects, that means the disconnect happens on every
suspend resume. The emb-qm77 disconnect happens on every suspend/resume,
whereas on the Samsung machine the disconnect only happens say 20% of the t=
ime.

When I say that a disconnect happens, it is invariably followed by a
reconnection. This means that in every case the device continues to work ju=
st
fine. The problem is that the usb_storage, or uas, context is lost and the
device must be remounted.

When I suggest to extend the kernel's usb_persist mechanism, I make a purely
philosophical point. In all cases at issue here, the device is not actually
being disconnected/reconnected, the D/R is being simulated via software. I =
feel
like such a software simulated disconnect/reconnect falls into the same
philosophical area as the current usb_persist mechanism. If the
disconnect/reconnect is happening in order to "cure" the device, then someh=
ow
the connection state should be preserved so that higher level actors, such =
as
usb_storage and uas don't know about the disconnect/reconnect. Currently, w=
hen
a disconnect/reconnect happens, the reconnected device gets a new "device
number", and since this "device number" is visible up the chain, the chain
inherently fails and must be re-established all the up to filesystem mount..

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

