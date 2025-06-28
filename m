Return-Path: <linux-usb+bounces-25230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBC7AEC88F
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 18:11:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BB69189F386
	for <lists+linux-usb@lfdr.de>; Sat, 28 Jun 2025 16:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C88F821770D;
	Sat, 28 Jun 2025 16:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R+fMUAkG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB572192F1
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751127098; cv=none; b=toLBDVft96JMNzLX4av4K4I03ziTM6bUI67z3lWti9jPtM8MOuPHfo8C25yJD2j8ao76d9M51QNeK0+bG+qcVDJ+wmwX0GcbWZQQCjrfWKh+Ds+t3QndQVdfNKBRLO6cV9H9ZzHcQClkga4x6vdg+Kn1HwHXiCXXmnar3NJIUEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751127098; c=relaxed/simple;
	bh=pA2FU2ruUpb/nhcRe2GdoprrZYp6n5pygosz6eEyoL4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TEl9ohk1qszU6bIWXSdqfXxa9OgMTS49JGA8ywMOL0rcQXH9bOOcK91dWbDjeVoeH8TsRy3+s+Ql5hCIQJ8C1EmW5lzRemifYoAajlNlGFD0/SBH9VgBWWDdrBV41jbhMC5zm2SBGqth7YMYyk47p23O+WtMTjYV8C/eABEn+6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R+fMUAkG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE516C4CEEA
	for <linux-usb@vger.kernel.org>; Sat, 28 Jun 2025 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751127095;
	bh=pA2FU2ruUpb/nhcRe2GdoprrZYp6n5pygosz6eEyoL4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R+fMUAkGJVlAaQYHrdbAQ7LzMdpi9YIYeT14aYOaHkQfPR5L/3D7OFepIkNU90Nxr
	 I2MOsYKT2qEjqNpsMV+2EX0XsX6irE4pSvvSaD/G+PJMmj5nm16/AcTwsuf8nT4ksV
	 rUSIeaR9dTjZPCfMJ4v1XZsmsWF7GCJL3/zgaZqLBuH589QSkaQeDY6rQsdYLQri0v
	 51OQabqXvbc9QN/1l114lX2pqkvXUm6HeGWzmeSvw+dJOlS8XUSEvDkSPFSKPUImU7
	 S9h7fVzl+CiWh/eNIVKbnX0BBKVHOYKg15fvEAotMJc0VzmTaGXmOhGOVTtUL14cDn
	 uYqwEd/9YimOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE268C433E1; Sat, 28 Jun 2025 16:11:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220272] Latent race condition in USB code unveiled with
 optimized memset_64.S
Date: Sat, 28 Jun 2025 16:11:35 +0000
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
Message-ID: <bug-220272-208809-dpxkyIQK2g@https.bugzilla.kernel.org/>
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

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
In a way, that's too bad.  I was hoping that the mouse still wouldn't work,=
 so
we would be able to do further debugging to try and figure out the real cau=
se.

Oh well, at least now you're better off than you were.

Note that the "1-8" in those commands will change when the mouse is plugged
into a different USB port, so you'll have to be careful if you want to auto=
mate
this.  A udev script that triggers off the vendor ID and product ID should
work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

