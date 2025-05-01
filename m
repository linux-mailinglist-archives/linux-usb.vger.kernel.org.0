Return-Path: <linux-usb+bounces-23610-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 112B6AA6510
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 23:04:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C838B3AB724
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 21:04:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE6C2609DF;
	Thu,  1 May 2025 21:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="erM79b6N"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347181946DA
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 21:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746133454; cv=none; b=rRgabVots59porCO3bwvFFF+OHpV7VUT+4ZMZrVdAHSZgbG2vTGhH7IsZIovljn9Azwn1ZpldLfCinMAhAkqgSTmTdPPMTq+j6OUNd+uQ4TC7Drj/XnVfbetxSyaU0z31I0vkSHt1LdNboZH4sP0t4dtfuzatmZ0FxKLeFcpJBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746133454; c=relaxed/simple;
	bh=hgbcaxu5UsXlaEZaOhiR/bDZ7z8DF+n981BzNRq1Nm4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nOKWGzdDOt93xSdr00tTS8NwOHIdWxplxe+HCZUoPDw6e3fALAv9bAP87pCeNd1taVF2pEUwdZkchO6+pdKI+xk23XgsfVWXUSJ0mQ1xo/+itmiRrUb1dmtfWCYvjdZVqaPVa5z7e0mwTfA86TMlRLZbWjG8Qz4vvA4O/JWOpWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=erM79b6N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B589C4CEED
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 21:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746133453;
	bh=hgbcaxu5UsXlaEZaOhiR/bDZ7z8DF+n981BzNRq1Nm4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=erM79b6NfclkLmPQQsBrCNEoQxtfYZFoOaQAXf5TRpQWzmyDHfAafk4rMNXhamaof
	 RBgw8iKCjLoq0PI3ZhjeP8TBTYdtMMBM1crzKXav6agbK9/VvcRLVm0bDFx9uccYcQ
	 WJUj54Uqh0g8Q9/sdbdgQuR+d59z8LUjOe4Jwjx20gbx0vEsULroMAQEdS/UOqN1vd
	 2PxzijDky+GIqQQehumQInBLcPXYaiMrQxIHUoO+xuK+mhr77NQlqCI1J/AyPM3zwo
	 sZCQspAihrerOnCsqxwg/xnaZ0JrQA3eXEIIne9+C+UWZXefTBUL6wKQZrojDZC5Jh
	 RIRGbg1TJXyHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8DCD8C41612; Thu,  1 May 2025 21:04:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Thu, 01 May 2025 21:04:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-PJwoouOdAN@https.bugzilla.kernel.org/>
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

--- Comment #15 from Claudio Wunder (cwunder@gnome.org) ---
Aand it happened again, during gaming workload. Unfortunately, I had restar=
ted
my PC and the debugfs partition was gone, but here are the logs:

```
May 01 22:53:53 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Abort failed to
stop command ring: -110
May 01 22:53:53 angel-thesis kernel: xhci_hcd 0000:6a:00.0: xHCI host
controller not responding, assume dead
May 01 22:53:53 angel-thesis kernel: xhci_hcd 0000:6a:00.0: HC died; cleani=
ng
up
May 01 22:53:53 angel-thesis kernel: usb 7-2: USB disconnect, device number=
 2
May 01 22:53:53 angel-thesis kernel: usb 7-2.3: USB disconnect, device numb=
er 5
May 01 22:53:53 angel-thesis kernel: usb 7-2.3.1: USB disconnect, device nu=
mber
10
May 01 22:53:53 angel-thesis kernel: xhci_hcd 0000:6a:00.0: Timeout while
waiting for setup device command
May 01 22:53:53 angel-thesis kernel: usb 7-2.3.2: USB disconnect, device nu=
mber
13
May 01 22:53:53 angel-thesis kernel: usb 7-2.5: USB disconnect, device numb=
er 8
May 01 22:53:53 angel-thesis kernel: usb 7-3: USB disconnect, device number=
 3
May 01 22:53:53 angel-thesis kernel: usb 7-3.1: USB disconnect, device numb=
er 7
May 01 22:53:53 angel-thesis kernel: usb 8-3: device not accepting address =
3,
error -62
May 01 22:53:53 angel-thesis kernel: usb 8-3: USB disconnect, device number=
 3
May 01 22:53:53 angel-thesis kernel: usb 8-3.4: USB disconnect, device numb=
er 5
May 01 22:53:53 angel-thesis kernel: usb usb8-port3: couldn't allocate
usb_device
May 01 22:53:53 angel-thesis kernel: usb 8-2: USB disconnect, device number=
 2
May 01 22:53:53 angel-thesis kernel: usb 8-5: USB disconnect, device number=
 4
May 01 22:53:53 angel-thesis kernel: usb 7-3.3: USB disconnect, device numb=
er
12
May 01 22:53:53 angel-thesis kernel: usb 7-3.4: USB disconnect, device numb=
er
14
May 01 22:53:53 angel-thesis kernel: usb 7-3.4.2: USB disconnect, device nu=
mber
16
May 01 22:53:53 angel-thesis kernel: usb 7-3.5: USB disconnect, device numb=
er
15
May 01 22:53:53 angel-thesis kernel: usb 7-5: USB disconnect, device number=
 4
May 01 22:53:54 angel-thesis kernel: usb 7-5.2: USB disconnect, device numb=
er 9
May 01 22:53:54 angel-thesis kernel: usb 7-7: USB disconnect, device number=
 6
```

If it happens again, I will be ready this time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

