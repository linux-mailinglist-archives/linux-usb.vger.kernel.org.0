Return-Path: <linux-usb+bounces-8435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1680488CF0E
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 21:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C1A0BB2B4FB
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 20:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7D913D532;
	Tue, 26 Mar 2024 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ic/iS+oz"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8702313D61B
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 20:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711485197; cv=none; b=qrvIdfnYi3nfFE01eF3vtJGmmm2c1k3wAieC03JtwTkNcAJxO/Kh38r2Wf7WLX/MAPq6LHDWNWQIf8mTJrhkG/ZtgqMdUuPcY1bUd0b4g9xvGuS07c6GRq9+h9YGsU3U/Nz62hPSu15+zfYV2Nt3o5lSleFn5dNjDlQ6sEbDFIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711485197; c=relaxed/simple;
	bh=J+GLoR3cvvT56/5mW4W4K+iu+JHHCMi10rK4Ny87KXE=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=C+OqqvvQVU8eTJoouh6pfkFa036t1LaBadnAwt/80G3/mslX3MUeWd52nlvDQxYa8fW60xgU3pi3on3FBgY/B8TGqSWbunTGJMIPoI+IXWqKqCaHjvpOxoyLaJzNHx9rfX87oXeqJIOAL9s9a6n0NZXpElnBTDJy8jqF+1XtAWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ic/iS+oz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17BBAC433F1
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 20:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711485197;
	bh=J+GLoR3cvvT56/5mW4W4K+iu+JHHCMi10rK4Ny87KXE=;
	h=From:To:Subject:Date:From;
	b=Ic/iS+ozkKrN3SSC0rhW/FR9u3H8gndl4oNcqYwEDd+3uF18QZpPiIryahkyeAAX5
	 7s70zAXR9OLWnd8I1HH7eDknjaU133/UoJ1USPaOzt4euFfKFYy1uMgYlDT1rvmdRH
	 bboMsXoY8hVAbgYDFWZnzGRV7M6mFrkXVt+CaqNKul+/0ILOUZR8VU0T/0+4bkoN3d
	 7T9FEBVlumi21gx/VKfpgh6SGCzbUYjtX3pmJTPg8Hi06tFcd0xBnMIaeqcP5eWM3V
	 6wwqr4//gVv4Wq/48TjIKxNSBCvygXw+MIkMihIRtZNzW/DsQY0EwBL8RQnH4VC+JM
	 B7ia0AgfJHwiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F005DC4332E; Tue, 26 Mar 2024 20:33:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218646] New: Problem with search driver or this is guide how
 search driver.
Date: Tue, 26 Mar 2024 20:33:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: swojskichlopak@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218646-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218646

            Bug ID: 218646
           Summary: Problem with search driver or this is guide how search
                    driver.
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: swojskichlopak@wp.pl
        Regression: No

I noticed that USB drivers are in=20
https://github.com/torvalds/linux/blob/master/drivers/hid/

And there is Kconfig which I can read.

This is a very useful file.=20
Bravo you, congratulations and thank you very much.
I wish you lots of free coffee :D

Because I can check there
- Is the hardware supported=20
( " Ctrl + F " in Firefox to search hardware )
- which driver supports my hardware.
And then I can try check if driver exist in my system.
The name driver will be in lower case with "_" or "-" .
For files I recommend using " - " because it is more popular.

Char " - " is 2D in hex

printf "%x\n" "'-"
2d

I mention it because are many signs.

Coming back to the driver,=20
this is an example.
In Kconfig file I can find that PS4 is supported=20
for example by " HID_PLAYSTATION "
then I can search this driver inside system

$ find /lib/modules/$(uname -r) -type f -name '*.ko' | grep -i "playstation"
/lib/modules/5.15.0-91-generic/kernel/drivers/hid/hid-playstation.ko

And hid-playstation.ko this is the driver.

Problem I see with HyperX hardware.
Is not in HID so I can not find in Kconfig file.

Quote from wiki:
The HID standard was adopted primarily to enable innovation in PC input dev=
ices
and to simplify the process of installing such devices. Prior to the
introduction of the HID concept, devices usually conformed to strictly defi=
ned
protocols for mouse, keyboards and joysticks

I download source code of linux,
then unpack
and I tried search HyperX driver and info.

$ grep -ri hyperx
sound/usb/quirks.c:     DEVICE_FLG(0x0951, 0x16ad, /* Kingston HyperX */
drivers/input/joystick/xpad.c:  { 0x03f0, 0x038D, "HyperX Clutch", 0,
XTYPE_XBOX360 },                  /* wired */
drivers/input/joystick/xpad.c:  { 0x03f0, 0x048D, "HyperX Clutch", 0,
XTYPE_XBOX360 },                  /* wireless */
drivers/input/joystick/xpad.c:  { 0x03f0, 0x0495, "HyperX Clutch Gladiate",=
 0,
XTYPE_XBOXONE },
drivers/input/joystick/xpad.c:  { 0x03f0, 0x07A0, "HyperX Clutch Gladiate R=
GB",
0, XTYPE_XBOXONE },
drivers/input/joystick/xpad.c:  { 0x03f0, 0x08B6, "HyperX Clutch Gladiate",=
 0,
XTYPE_XBOXONE },         /* v2 */
drivers/input/joystick/xpad.c:  { 0x03f0, 0x09B4, "HyperX Clutch Tanto", 0,
XTYPE_XBOXONE },
drivers/input/joystick/xpad.c:  XPAD_XBOX360_VENDOR(0x03f0),            /* =
HP
HyperX Xbox 360 controllers */
drivers/input/joystick/xpad.c:  XPAD_XBOXONE_VENDOR(0x03f0),            /* =
HP
HyperX Xbox One controllers */

I suspect that the first one is the headphone driver.
The second with joystick in path is driver for controller.

I can also try search in my system.

$ find /lib/modules/$(uname -r) -type f -name '*.ko' | grep -i "quirks\|xpa=
d"
/lib/modules/5.15.0-91-generic/kernel/drivers/input/joystick/psxpad-spi.ko
/lib/modules/5.15.0-91-generic/kernel/drivers/input/joystick/xpad.ko

Conclusions:
- I can find the driver in the system
quirks driver not exist in my system because is added from 5.16 kernel.
I know this from=20
https://github.com/torvalds/linux/blob/master/sound/usb/quirks.c
--> History link to the right  --> oldest patch -->=20
--> below description=20
--> I can expand the link "  6.9-rc1 ... v5.7-rc1 "
and I can see that the oldest kernel containing this file is 5.16
Such knowledge is very helpful.

Can you share any tips about drivers?
Maybe you know some interesting guides how to solve problems with drivers?
What linux distro do you recommend for testing the latest linux drivers?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

