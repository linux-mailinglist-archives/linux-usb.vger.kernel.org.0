Return-Path: <linux-usb+bounces-10537-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE808CEF2A
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 15:54:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 54FFB28196E
	for <lists+linux-usb@lfdr.de>; Sat, 25 May 2024 13:54:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CF4B4AEF4;
	Sat, 25 May 2024 13:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FWcyfBpM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9618AB652
	for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 13:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716645242; cv=none; b=bDSbW7lCJpmnzp9CsjWHEw2e3htyjtlfH4xQ79f8omcvbt2eL4Sm5yW+cqlG/1ksrdII26swgZkuDILiX0+ynbGZq6Bvt+KsB3CqDUh2KWKpRtpdAii4TcMngGntJADBUa4dSlw5yR9Kd56rXyHnWtchiCsHtQYq0goZsFnrvR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716645242; c=relaxed/simple;
	bh=pb7ubj4E+zSG0hP5dpKcCaDhiFjPX1UCIwWg6wfV2D4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TPV4c9eZ+XS+smlUcrdo0EhLhPlxct/zTxAFnGtuD2ysZW0/iOFvkbEi/xaK49WjVV7r3ib79UYj4FlpX09b+NA2E0OdVdhzVDnsWaQa3dNuuqc1n7nT19J7iomOh91gveOQPdXTyhGrIBT9OXBO/y2xJ0dHrfHueaXP7PHSEzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FWcyfBpM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15417C2BD11
	for <linux-usb@vger.kernel.org>; Sat, 25 May 2024 13:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716645242;
	bh=pb7ubj4E+zSG0hP5dpKcCaDhiFjPX1UCIwWg6wfV2D4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FWcyfBpMOjySNny4d2KRDKw5rqtQcu+/jnyiq1h3Yde+5Wk8Eaw0XsN/njJq9GtKI
	 QjJsDGG2iCr0DTExUA3EgJ1jBJJXR7qo9J6XWFMaxJ6k67m0nw+Xh2OGv569YOcHcI
	 iKfdCvjRuB9p77sNHOHAVB2N8EPM1g7o7xo4Na33CT/hjSgBsHsf7IB0O0ZG0xVUCI
	 b1EQvZD1pLnitjHesX7MP0OhFrqsnP/qTC5P/vZa2/TcswwbmG/DtN1ALR5qDqpBoC
	 kz5ot7G9OlGUtslG6NZIeBy2RXR498ZD27Fmd06MfhXWHuhbRediq2sC4+52DrCQ07
	 /0TIQbVPArwAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 05E24C53B73; Sat, 25 May 2024 13:54:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Sat, 25 May 2024 13:54:01 +0000
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
Message-ID: <bug-218890-208809-PqTq1EYsm7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
There are at least two very suspicious-looking things in the usbmon trace:

ffff9244d6cf5000 1301812804 S Ci:6:004:0 s 80 06 0301 0409 00ff 255 <
ffff9244d6cf5000 1306956154 C Ci:6:004:0 -2 255 =3D 00000000 00000000 00000=
000
00000000 00000000 00000000 00000000 00000000
ffff9244d6cf5000 1306956185 S Ci:6:004:0 s 80 06 0301 0409 0002 2 <
ffff9244d6cf5000 1310626032 C Ci:6:004:0 0 2 =3D 2a03

The first two lines show the computer asking the drive to send one of its
string descriptors and the transfer timing out after 5 seconds.  The trace =
says
that the device sent 255 bytes of zeros, which seems unlikely, but if it is
true it should have caused the transfer to end right away.  The second two
lines show the computer asking for just the first two bytes of the string
descriptor and the response arriving correctly, but not until an additional=
 3.7
seconds have passed.

ffff9244d6cf5300 1311630806 S Bo:6:004:2 -115 31 =3D 55534243 05000000 0002=
0000
80000a28 00000000 00000001 00000000 000000
ffff9244d6cf5300 1311630823 C Bo:6:004:2 0 31 >
ffff9244ea669300 1311630835 S Bi:6:004:1 -115 512 <
ffff9244ea669300 1342568184 C Bi:6:004:1 -104 512 =3D 00000000 00000000 000=
00000
00000000 00000000 00000000 00000000 00000000

This shows the computer trying to read the first sector of the drive.  The
transfer times out after 30 seconds (again after 512 bytes of zeros are
apparently received), and this error is what causes the reset.

It's possible that the problem is in the device, but more likely the proble=
m is
in the kernel.  You've made a good start by finding that the 6.6.1 kernel w=
orks
properly and the 6.7.7 kernel doesn't.  You should try doing a git bisectio=
n to
find out which commit in the interval between those kernels caused the prob=
lem
to appear.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

