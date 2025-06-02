Return-Path: <linux-usb+bounces-24421-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49841ACAE01
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 14:25:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18B2716A3A5
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 12:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F74A213255;
	Mon,  2 Jun 2025 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQC0A3Jn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3FF7485
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 12:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748867139; cv=none; b=UzanQ+nMxYkUD0FScZ7UuIkIP2qpEypzDV4zsY1yXxYC0BJ5PJ1mDxfh8viCtFJK4vqDxE3rYzuwaf/DKsGuqmTu3Lft+SeSRRUiJEK0wbdm9U/8gMsuLSh/UuXdm/fJKMh50Wsz/8zuAJM6ISO/6zP2ehEeeTm11Oi2i9HibOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748867139; c=relaxed/simple;
	bh=N0vYwOF0g4wQJErju/FMb5hkzk7+gYOW8rKP9EkkXi8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cdh51CNWmX4EERwjVPzEBSCZ8SEZltwEwqDriStoF/10tVn2rGh1X58r3LNa/mq/azvP0iSu3xw4HzCcWXew3KtxOZvzHHl0iPOO0QH9uros8Z0BwfrEikQDIP8R57Te/D0vF7VS3PdKi6BLlMLvA0DwGCXO2wAik3Y1a9MmK+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQC0A3Jn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BB0FC4CEF1
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 12:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748867139;
	bh=N0vYwOF0g4wQJErju/FMb5hkzk7+gYOW8rKP9EkkXi8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=VQC0A3JnCjTbW635r6KntNtmjvkiqrsfJGZWQ6wDNq6VGQdkhIjDVh/UOasGjUQNF
	 o1u5XnEphvUgyEz3UYGfk0c5zF91qijMh7/+KUQNyl1X8/FKmsFKMELX/0RPoPrZp2
	 Ryetv18uAt/8/P1AwAw+LZRin/RctGgzC5srvzwCnG04lgpKuNHyOeL7NP9racy6c8
	 JWSJR9vVJ7lyAUJmu+wMXn5GB3g10yYycrZKDeHyzsh2s8FNOuRwiULCTSqvlB8WAu
	 i9Bp4KZmDS7bpE0EDKHVFq4Lizqhg0QoAt/5SgeHXMYM4TJ2ydtIQi0knZh1/Ix796
	 U/ard5oOsynHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2D936C41612; Mon,  2 Jun 2025 12:25:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Mon, 02 Jun 2025 12:25:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: 6svcyk03@rokejulianlockhart.addy.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-220181-208809-JzGMWGNwGp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

Mr. Beedell, Roke Julian Lockhart (RJLB) (6svcyk03@rokejulianlockhart.addy.=
io) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |https://koji.fedoraproject.
                   |                            |org/koji/rpminfo?rpmID=3D4=
290
                   |                            |0892

--- Comment #5 from Mr. Beedell, Roke Julian Lockhart (RJLB) (6svcyk03@roke=
julianlockhart.addy.io) ---
"`sudo ls /sys/kernel/debug/usb/xhci/`" returns "`0000:5a:00.0`":

```
0000:08:00.0  0000:54:00.0  0000:56:00.0  0000:59:00.3  0000:59:00.4=20
0000:5a:00.0
```

...so I tried the problematic port (and a random alternative):

```
#!/usr/bin/env sh
sudo cat /sys/kernel/debug/usb/xhci/0000:08:00.0/reg-ext-protocol:00
sudo cat /sys/kernel/debug/usb/xhci/0000:08:00.0/reg-ext-protocol:01
```

For the problematic port, solely the first command returns:

```
EXTCAP_REVISION =3D 0x02000402
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x00180101
EXTCAP_PORTTYPE =3D 0x00000000
```

For the second command, the file supposedly doesn't exist:

> cat: '/sys/kernel/debug/usb/xhci/0000:5a:00.0/reg-ext-protocol:01': No su=
ch file or directory

This somewhat perplexes me, considering that the random alternative at "`su=
do
cat /sys/kernel/debug/usb/xhci/0000:08:00.0/reg-ext-protocol:01`" quite hap=
pily
works:

```
EXTCAP_REVISION =3D 0x03101402
EXTCAP_NAME =3D 0x20425355
EXTCAP_PORTINFO =3D 0x80000203
EXTCAP_PORTTYPE =3D 0x00000000
EXTCAP_MANTISSA1 =3D 0x00050134
EXTCAP_MANTISSA2 =3D 0x000a4135
EXTCAP_MANTISSA3 =3D 0x04e00126
EXTCAP_MANTISSA4 =3D 0x09c00127
EXTCAP_MANTISSA5 =3D 0x13800128
EXTCAP_MANTISSA6 =3D 0x05b10129
```

At least, this appears to demonstrate that one port exists, although apolog=
ies
if I've misunderstood. For reference, I'm using
`kernel-6.14.9-300.fc42.x86_64`.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

