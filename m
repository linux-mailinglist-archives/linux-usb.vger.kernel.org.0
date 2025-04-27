Return-Path: <linux-usb+bounces-23509-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D292A9E51B
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 01:27:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81496177BF7
	for <lists+linux-usb@lfdr.de>; Sun, 27 Apr 2025 23:27:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 023FA20487E;
	Sun, 27 Apr 2025 23:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJmTFWjj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAACB663
	for <linux-usb@vger.kernel.org>; Sun, 27 Apr 2025 23:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745796429; cv=none; b=FrcKe8A9Fqwv7/UA+Yg5oscewrnVntL44F9w269oxYQYp+sTWs3pGSGS1brqxubPi9AqPx3hwAQUNKMsPry2qJM4lkQxZMDX14lRVHLp8KjDPJJmy3tJ4lRGdRTKnOUd+IsiSPhkoPAGMzp6K0KvR9QBdtwZRgYXb9Edpz4IjlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745796429; c=relaxed/simple;
	bh=h1wvxLPFZmtVdrgqiMGD8hvct7YLb3zoNWkbIRVBAmk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n2KvdpnAqixmH2h0MKyIfh/AalmxQs3B4oiwhRdCcwpqd/dH4zjBWlGFhCbAPvMEWQ29R2zPoiLCGJJtcziKnlC4cFqybT72K3cSCjPXeo1Vy+oavVTTl5ejkZpZK7oHh3cQSIP+/T4eckn6L+75L63kPZZQQ1PzZqnpsXn/h6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJmTFWjj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB708C4CEED
	for <linux-usb@vger.kernel.org>; Sun, 27 Apr 2025 23:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745796429;
	bh=h1wvxLPFZmtVdrgqiMGD8hvct7YLb3zoNWkbIRVBAmk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YJmTFWjjVD0NepidyJ9/lH9nL8s9CkT4m2bSLq76WvEaaZMU27mXF0UTXZk9eV5Ga
	 CvJxerLvmILuEgmy/Uh2oR+pwV6wr4V+NR7t1X/sDVWgbQBYuEQzxQo8qZQq6McsUm
	 NWLUvAM5NAboGVX/8iBP2UpfI9nilyCOJR2rGaSMmH0AC1FFE6yPbpO0DBt4DO+GXV
	 3uMOvCtg42yh6UIlX6D4fH7eigb0z4lezjNehW4BhYnkcpLLrlHHhkTe8E/eNWA9of
	 DE15L0g7RmN9xdjBBwXGL3DkIOa/ApymBHH/l9ZIbSPtRuPWJUYTnEbA/b6P+g08vF
	 dEovrRP8SwKlw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D5595C3279F; Sun, 27 Apr 2025 23:27:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Sun, 27 Apr 2025 23:27:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nrkowalski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220027-208809-gVvYEpSvda@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #4 from Niko (nrkowalski@gmail.com) ---
I did pick up a NVMe with USB 3.2 adapter and have confirmed that it is
properly detected and operating at the 10Gbps SuperSpeed Plus speeds.

[3323020.361533] usb 4-2.3: new SuperSpeed Plus Gen 2x1 USB device number 9
using xhci_hcd
[3323020.373970] usb 4-2.3: New USB device found, idVendor=3D152d,
idProduct=3D0562, bcdDevice=3D 2.14
[3323020.373975] usb 4-2.3: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[3323020.373978] usb 4-2.3: Product: External
[3323020.373981] usb 4-2.3: Manufacturer: JMicron
[3323020.373983] usb 4-2.3: SerialNumber: DD564198842A6

/:  Bus 04.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 10000M
    |__ Port 2: Dev 4, If 0, Class=3DHub, Driver=3Dhub/4p, 10000M
        |__ Port 3: Dev 9, If 0, Class=3DMass Storage, Driver=3Duas, 10000M

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

