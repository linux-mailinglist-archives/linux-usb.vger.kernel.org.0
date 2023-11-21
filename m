Return-Path: <linux-usb+bounces-3143-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B58E87F37BD
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 21:51:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C11628286B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Nov 2023 20:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B04E35101A;
	Tue, 21 Nov 2023 20:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZB/RDzim"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B7338DC6
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 20:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93FF4C433CB
	for <linux-usb@vger.kernel.org>; Tue, 21 Nov 2023 20:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700599901;
	bh=fS8Lgca3rk1wObymmCCXmK+O9lQlVIWukZzU++uHKgg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZB/RDzimI7tNyVRHaHu+s4Z8y6VuL/YNvld+eIcX1GJJX6lEfftCYmPYbXuhtSjIS
	 mGFMUT88jlNBTG/wR33hL0jYLj/w/0wIbTcaDAn3ljuo7M8PGaa1wUJNZPN1qusKE8
	 +b4gr+NU25vokqugkFzYlQDa2an1Pas1hDxONybFlzZk9nqTegpR/hovXgVHimf8kW
	 8N7NytXarMthjl10PQvNofvw5mKe3YARGPvk6sCVaL2Mz6xH2dHwBM1EsM8DKdReNd
	 ZQXV/+GgoJxRDhjiWm8xS8PkaEpVdRi+8xl0jBNd5GqIBcN6A/hIoQ3JsUMXKkE9db
	 u3UzNdMw76i+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7EA94C53BD5; Tue, 21 Nov 2023 20:51:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 21 Nov 2023 20:51:41 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215740-208809-73z3fnqdMO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #19 from Alan Stern (stern@rowland.harvard.edu) ---
Created attachment 305456
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305456&action=3Dedit
Diagnostic to find DMA overlap

The patches are prepared against a 6.6-rc3 tree (it hasn't been updated sin=
ce
then), so they might not match 6.6 exactly.

At least we're getting some good data from the patch:

> DMA-API: dwc3 dwc3.0.auto: cacheline tracking EEXIST, overlapping mappings
> aren't supported, len 4
...
> Map error: 128857248 128857248 len 4

The fact that the addresses and lengths agree indicate that the patch works
right, and len =3D 4 means that the mapping error is indeed for the buffer
containing the hub status data.

By the way, do you have any USB hubs besides this one on your system?

The next question is what other mapping already exists for that buffer?  Th=
is
next patch may be able to tell us.  It's supposed to produce a second stack
dump when the overlap occurs, for the call that created the first mapping.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

