Return-Path: <linux-usb+bounces-3953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B99CF80BF46
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 03:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACD11C208C9
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 02:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81A06134B7;
	Mon, 11 Dec 2023 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o6i5ayTZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD66F7493
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 02:43:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A777C433C9
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 02:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702262580;
	bh=NrHjHKw01jqzBJFaX8sFxfH97ic4qsSyPJeRZSJwPiU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o6i5ayTZ/NPkcnID37iMzKwWomIXnwNAQSAF7i+Hfvky37krc8Gw5tWMlvxUupQLy
	 doouV+1ISfjcJdlQKOxi7nfk903kBWz2ZP8E2TG9320B/cUbaS/KwF8AKhMldVSUE5
	 CKMIZ/oP9WcgGemYCXM7QysFah22yRuGqVqFPRsy+OM9CYbkmNS5DWEeyyCVpHqc+m
	 lNIkP2AQtPFQOwwZ8C7/MfFa050J52bccLEpopZp4Ds5aLW8B6gEWTGqgwh793Kayo
	 eDd0WOjTaSus5Fx3HDt71U49TTeOnerQXkPosf24bzvpHt/ci2GeTD88bS2faEp7pb
	 +EfDtc0/gpCRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 37682C53BCD; Mon, 11 Dec 2023 02:43:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218249] Since kernel 6.3.1 Logitech MK260 Unifying Receiver not
 working properly
Date: Mon, 11 Dec 2023 02:43:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bagasdotme@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218249-208809-w2sN5nKE6s@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218249-208809@https.bugzilla.kernel.org/>
References: <bug-218249-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218249

Bagas Sanjaya (bagasdotme@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bagasdotme@gmail.com

--- Comment #1 from Bagas Sanjaya (bagasdotme@gmail.com) ---
(In reply to Jan Grobecker from comment #0)
> I also got hit by the kernel regression for logitech unify receiver (bug
> #217523). I hoped that Hans de Goede's fix
> (https://lore.kernel.org/linux-input/20231005182638.3776-1-hdegoede@redha=
t.
> com/) would fix my issue too. Alas, the fixes were only for
>=20
> >    This series has been tested on the following devices:
> >    Logitech Bluetooth Laser Travel Mouse (bluetooth, HID++ 1.0)
> >    Logitech M720 Triathlon (bluetooth, HID++ 4.5)
> >    Logitech M720 Triathlon (unifying, HID++ 4.5)
> >    Logitech K400 Pro (unifying, HID++ 4.1)
> >    Logitech K270 (eQUAD nano Lite, HID++ 2.0)
> >    Logitech M185 (eQUAD nano Lite, HID++ 4.5)
> >    Logitech LX501 keyboard (27 Mhz, HID++ builtin scroll-wheel, HID++ 1=
.0)
> >    Logitech M-RAZ105 mouse (27 Mhz, HID++ extra mouse buttons, HID++ 1.=
0)
> >=20=20=20=20
> >    And by bentiss:
> >    Logitech Touchpad T650 (unifying)
> >    Logitech Touchpad T651 (bluetooth)
> >    Logitech MX Master 3B (BLE)
> >    Logitech G403 (plain USB / Gaming receiver)
>=20
> whereas mine is Logitech MK260 Unifying Receiver USB id 046d:c52b.
>=20
> In my case the regression shows in the double click with the mouse wheel =
no
> longer working.
>=20
> I can see that it's a regression on that kernel series as it is not prese=
nt
> on a longterm kernel 6.1.65-200.fc39 from
> @copr:copr.fedorainfracloud.org:kwizart:kernel-longterm-6.1
> kernel-longterm-core.x86_64 that I use on another Fedora 39 machine.
>=20
> If you need further information from me please contact me. Thank you!
>=20

Can you check latest mainline (currently v6.7-rc5)?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

