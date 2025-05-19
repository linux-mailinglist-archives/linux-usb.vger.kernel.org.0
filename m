Return-Path: <linux-usb+bounces-24073-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2374AABB296
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 02:03:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B44451727D8
	for <lists+linux-usb@lfdr.de>; Mon, 19 May 2025 00:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512E55223;
	Mon, 19 May 2025 00:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRf0lzLB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6BAA2D
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 00:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747612975; cv=none; b=Uztiy6VbpmP7OgsncIVXlLTlzEcRtkKb6wgtLhYd1TiGE8zBj3pZwvkM1TlvKkBYVn70YYc4D6Z4b6MC1Z1bxjnMQXK12VfppQU4/WKRxv7u5bpGQj2XivGAeXYXYFzDpgGh8AROfjYJRwsH/0TRN1qa3SgyBIapQ/FRwIyQQDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747612975; c=relaxed/simple;
	bh=E2SOy/JIN9r91BSB8Uk0v12gzM7Jf+MRhTF0+AQfAG4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QQYioOmBdaaRuhtIIDODeeDx94VQJtJAtwo2TP2wA/FnbBplEOTFhDm2iJAY/uAcuYe3WEsK6l/etOE5q6svYPYpp4JdFE9SPAq+GwhkiUGlGW9lRjrb4vPUU8oNM3sYkWdp53c3mKDhfHvYpHW+cOqTEl62zr4l0TM2ImHubC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRf0lzLB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 418DCC4CEF0
	for <linux-usb@vger.kernel.org>; Mon, 19 May 2025 00:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747612974;
	bh=E2SOy/JIN9r91BSB8Uk0v12gzM7Jf+MRhTF0+AQfAG4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NRf0lzLBmyTcxRXXiwB8hjrH1eVh5UJwiF0C882bPOO/2rDsyPE0oTd9mSNvAv2Af
	 KmoSdIP5ENAVVv0WN+XwYBRQZ0qIoRmfwav/iInE9V9wtM70cTxl8wP2sTu6J7k5C1
	 y9W2TqsAk7w+KgYS6Xh8Hk7MBfOqVbpX7qzrUgliZamuLc8BywZe32IVBfHrlYLabA
	 Qeqc62Jn6+/fzmmLCEDtzzlxwRc3ZscTzdruowL79Zg+Fap858BP6u9d11GJiFJxDu
	 yw5HfAxwXD2EVZzHna0aVOEAjGJ5nHVnsbc8to04Spio/OC4BK4s3Bm62kdpH8eIsC
	 rEKbjaGkcCwsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3473AC53BBF; Mon, 19 May 2025 00:02:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 19 May 2025 00:02:53 +0000
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
Message-ID: <bug-220069-208809-WKmnst0KMt@https.bugzilla.kernel.org/>
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

--- Comment #55 from Claudio Wunder (cwunder@gnome.org) ---
> And it's happening on 6.13.9 or newer, but not on 6.13.7? I have no
> explanation for that...

Well I can't say for 100% sure it wasn't on 6.13.7, but only that on the
periods of time I've tested it didn't happen.

> So the outcome of testing is that the problem occurs if both the unlucky =
hub
> and the unlucky webcam are present on the same X670 bus, and disappears if
> they are on different X670 buses at the same time?

Also on the limited amount of time, that's right, it didn't happen at all
during such circumstances (webcam on a separate bus); I didn't test webcam =
on
same bus, but connected directly on the bus (without the monitor hub); my
feeling is that the monitor hub is somehow the issue; I could focus on test=
ing
that aspect.

I also tested with the bootargs, this is the result:

```
bash-5.2# dmesg | grep xhci.*quirks
[    0.537829] xhci_hcd 0000:03:00.2: hcc params 0x0110ffc5 hci version 0x1=
20
quirks 0x0000000200000010
[    0.539340] xhci_hcd 0000:3b:00.0: hcc params 0x20007fc1 hci version 0x1=
10
quirks 0x0000000200009810
[    0.595976] xhci_hcd 0000:68:00.0: hcc params 0x0200ef81 hci version 0x1=
10
quirks 0x0000000200000010
[    0.653978] xhci_hcd 0000:6a:00.0: hcc params 0x0200ef81 hci version 0x1=
10
quirks 0x0000000200000010
[    0.656224] xhci_hcd 0000:6c:00.3: hcc params 0x0120ffc5 hci version 0x1=
20
quirks 0x0000000200000010
[    0.657094] xhci_hcd 0000:6c:00.4: hcc params 0x0120ffc5 hci version 0x1=
20
quirks 0x0000000200000010
[    0.658896] xhci_hcd 0000:6d:00.0: hcc params 0x0110ffc5 hci version 0x1=
20
quirks 0x0000000200000010
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

