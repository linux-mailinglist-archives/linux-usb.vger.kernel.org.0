Return-Path: <linux-usb+bounces-2784-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD15A7E7D0C
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 15:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81804281103
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 14:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA8D614AA8;
	Fri, 10 Nov 2023 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/2Sl8LG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5998D18E04
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 14:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4E9EC433C7
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 14:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699627069;
	bh=NQDO+1kgNXcpqmlFyf2YJiCfNJC+kxADCtYCfHKAcuw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Y/2Sl8LGINCWxHOuQo7mc7VKys/6L9cIx0hXPcXQXY+8C9kFlRlIfGgjOLI3hpkSC
	 vjt+YGsuffNs//WaWEvuc2wimZbhEvJA+cjSqkWUuf8QxglHKboO38+wvg7A1zZLfW
	 i42HkPllip9zA7OxTfMYiGiU67zCo8nNSBBBU6G5WA2ktseHnCRr6y3rE9o8lwakqt
	 LfFt3JtOuScyNPdKDh3oatK32gllVgBmp1SEIU6gF1vg0toOsbloNBWDex4DmAIzs0
	 DZgsJR6DPMG8CNaSDweifhdOqee6A69J0D6gfR4H6ZXuxURTz48wuNw/iOxA+EPCaQ
	 /a/+6ZBFvM8iw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A9B54C4332E; Fri, 10 Nov 2023 14:37:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218118] USB3 port does not work on Chromebook XE303C12 with
 Linux kernel 6.5.11
Date: Fri, 10 Nov 2023 14:37:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218118-208809-4SLSavAfL3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218118-208809@https.bugzilla.kernel.org/>
References: <bug-218118-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218118

--- Comment #8 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
The debug output causes some latency, that could be one reason.

The log for example show that usb3 bus was just about to be suspended befor=
e it
detected something on the port:

[    2.337685] xhci-hcd xhci-hcd.6.auto: Get port status 3-1 read: 0x2a0,
return 0x100
[    2.337727] hub 3-0:1.0: state 7 ports 1 chg 0000 evt 0000
[    2.337745] hub 3-0:1.0: hub_suspend
[    2.337769] usb usb3: bus auto-suspend, wakeup 1
[    2.337780] usb usb3: suspend raced with wakeup event
[    2.337786] usb usb3: usb auto-resume
[    2.376930] xhci-hcd xhci-hcd.6.auto: Port change event, 3-1, id 1, port=
sc:
0xa0206e1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

