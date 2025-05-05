Return-Path: <linux-usb+bounces-23723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FACAA9511
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 16:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53DD9189A7AD
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 14:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7195E192D6B;
	Mon,  5 May 2025 14:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLYF603u"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF89020102D
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 14:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454076; cv=none; b=tSG2XN8EWNz1pE1VHgKdtoYhRhMnG3nwRGQ87twDU4dUqvM+sSJLmFJs3Lew9/FxGJdiB8H5fSX1yIbEkxXYqPvvbJTh3IypIvIF2DDLM6MkZHf9rrbR54tAKh2skWeiGs/Qe9x44thyKFTQdsCkr+WztdgW+QEbXXhQ5PLJjns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454076; c=relaxed/simple;
	bh=hECbBpsvp5ZRE09nxonYYkl2906r0KqRGne6wcHQw+U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mAPe02Aj0W1oVY8r0Ewsk8XwgECsyMrNXn8UMU1jTneglH0V/bPU2qC9lE+6N9wWvGOEEA3U9yIPIfoVGoEyEyfgDvSAWb+yA39Rv9M0ag/kxmOvpZ7/LOouNrU05+guzCUuOePGCTxLPQk5JRLeSnqtieDVsw7lAAQGyeO9U1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLYF603u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F99FC4CEF0
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 14:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746454075;
	bh=hECbBpsvp5ZRE09nxonYYkl2906r0KqRGne6wcHQw+U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=BLYF603u/dEkpBS5+7/iDrG+5DGmv0Rqs9N0yVuNu6VS7ilwKO6rk4Rb9vA7g+3oh
	 Vsdav6IoN0/mLEB5imFRGnT+LaN69VlYkMLsCrThMMEeWQtvqOK5pW+VuG2/zCh2Yj
	 KIaVjDDuIinvidSqEuQfsMLMmq8ZF7/U+Zo8kwjSdn+4Y7NuOwEdhC/phSjBjD2m1d
	 fc+rv7WzSzBFDhkThsSX/O2lLLj+vAEPKkDy2tWbvOlp2eVKoIEahD79w+WViHQyQ1
	 MiNMOLc3ChphabjgFY1rIxtILSA0ri3j+5usnWQC9hTvLuqR1BBlKkcNRHD+onCyUr
	 r9OT2/gWnVxSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 53333C41614; Mon,  5 May 2025 14:07:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 14:07:55 +0000
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
Message-ID: <bug-220069-208809-q1PqW5UfSP@https.bugzilla.kernel.org/>
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

--- Comment #43 from Alan Stern (stern@rowland.harvard.edu) ---
Indeed, in that commit it looks like the call to hub_hc_release_resources()
should be made _after_ the hcd->address0_mutex is acquired, not _before_.  I
didn't realize that the reset_device callback would put the slot or device =
into
the default state.  That's exactly what the mutex is intended to serialize.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

