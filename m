Return-Path: <linux-usb+bounces-28035-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A70F4B557C0
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 22:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 062D11892045
	for <lists+linux-usb@lfdr.de>; Fri, 12 Sep 2025 20:42:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C1D2D3EE5;
	Fri, 12 Sep 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qbBfTfCO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072DE2D372A
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 20:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757709698; cv=none; b=TXA0JAKZh2m2dmfaa0LWfq6Gg9cLq+XCjXr9OP6J5X0yPTr44XUak+ybZ4IvgJISa89hK3uliluPvtj6JKF3ZENe21KytHAp9I4SdbNmthptBpRw4FUtBUhcnic6yGqn3GmDg9e09Eh6AAmJjb1gBzYtVLASInYM9UcNx1A2MJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757709698; c=relaxed/simple;
	bh=god4XjZHPfUH77Xd3tXYi1T94K1cu5AprQZmA9ZjBRc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eqEFPj4N63bJxNlXF0KB6CI6z9z2Dp4916dUwJdi+vI/S2HG6yjBinmUwYnEQicORvHWVhOqIuBWwyiFeQybhSX7wUZeFtNQbUQMjoUEAL0E2dapR6h8k8KEcxpSivwWrqH4TftAdHSJkOgKllIQuUgu9q0/LwoBzmEd9eypiDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qbBfTfCO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C0A2C4CEF1
	for <linux-usb@vger.kernel.org>; Fri, 12 Sep 2025 20:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757709697;
	bh=god4XjZHPfUH77Xd3tXYi1T94K1cu5AprQZmA9ZjBRc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qbBfTfCOKF76okcjc0nfnBNv5oTqqaK5FZt8+zBDbPStJPim6hhpZ7J6R6RoSVCwJ
	 jXr93OdJFH+PQV+vYwgXsRxpz9EeCg2dbDtBFRwQGadkw05mCK6li0BG76lDKeQ+CL
	 uTBJlobKHgD56Ao/u1gE9z2b6ja2SMmMoFnCnrltsi1A0bdkYYDTZCrvfDfLrjS/aE
	 enBcgPl0UTAM7BSFCSmJJnGtkgynBcNJdU7ggf4a8Y1j0jRamu0QLDszFZAL0lnS1i
	 mMQQWABJpuUpOzVzPAalZDwMDJHjMVv+wxQBMLOdLh+vQpUgRiL1YHP7S76ZnJTgRz
	 P7kSUNekmFV8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7C147C53BBF; Fri, 12 Sep 2025 20:41:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Fri, 12 Sep 2025 20:41:37 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-N9kVaY0m8F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #64 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
There was a workaround: don't connect a particular pair of devices to the s=
ame
xHCI controller at the same time.

But your logs are different (see comment 6), so it doesn't look like the sa=
me
thing. And it seems you only had one device there (besides root hubs).

Could you open a new bug, and be sure to specify what kernel you are runnin=
g,
if any versions were free of this problem in the past, how often it happens,
what seems to cause it, what device(s) are connected, etc?d

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

