Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C386A381BF0
	for <lists+linux-usb@lfdr.de>; Sun, 16 May 2021 03:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232005AbhEPBVm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 15 May 2021 21:21:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231608AbhEPBVm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 15 May 2021 21:21:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 450216117A
        for <linux-usb@vger.kernel.org>; Sun, 16 May 2021 01:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621128028;
        bh=+IXPs0RBIldAsdbidTzmnYIo/1tnnioj0r7k1KIwYao=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ul+PHF+GwltY5TqPhFz1uGA1BPdI453jYM0DTsrtRuOZWOK5dT5FvziHYv3rsmNiB
         +DO/cS+ccmABs1V0akiK1SMO1FrJ8ubLG1bDQnjZnTgHpLYbRWu9S+zOLGcRnu9wYR
         1V5T+WigjAeIP8lMdzR7TZqWY9iA/dTlnm4I7Xj7d/IA3mU/168N8jrcNqX6V+AAum
         CrANBDlMlw9Tw2Uoffcb9MIRJO6sMbu0T7ARvjN0gRsAu7pVdbXKnagvtgmJ2glpV1
         9SIlzik2jqPcV36bIFpbyveWYBhObAUiHVHR4nePUoucCckTAGZcD0nmCk1RATsY/F
         oz2jBwfKeINYg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 34FDD610A4; Sun, 16 May 2021 01:20:28 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213081] usb-storage / uas Genesys Logic Card Reader no longer
 working on 5.12
Date:   Sun, 16 May 2021 01:20:27 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213081-208809-xfXyX2J5ey@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213081-208809@https.bugzilla.kernel.org/>
References: <bug-213081-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213081

--- Comment #6 from Alan Stern (stern@rowland.harvard.edu) ---
Here's where the difference shows up.  In the 5.11 log:

ffff8881259c3540 48224904 S Bo:6:004:2 -115 31 =3D 55534243 03000000 600000=
00
80000603 00000060 00000000 00000000 000000
ffff8881259c3540 48224939 C Bo:6:004:2 0 31 >
ffff888102854900 48224942 S Bi:6:004:1 -115 96 <
ffff888102854900 48225040 C Bi:6:004:1 -121 18 =3D 70000200 0000000a 000000=
00
3a000000 0000
ffff8881259c3540 48225042 S Bi:6:004:1 -115 13 <
ffff8881259c3540 48225112 C Bi:6:004:1 -32 0
ffff8881259c3540 48225115 S Co:6:004:0 s 02 01 0000 0081 0000 0
ffff8881259c3540 48225522 C Co:6:004:0 0 0
ffff8881259c3540 48225525 S Bi:6:004:1 -115 13 <
ffff8881259c3540 48225598 C Bi:6:004:1 0 13 =3D 55534253 03000000 4e000000 =
00

In the 5.12 log:

ffff88812366e6c0 273105524 S Bo:6:010:2 -115 31 =3D 55534243 03000000 60000=
000
80000603 00000060 00000000 00000000 000000
ffff88812366e6c0 273105551 C Bo:6:010:2 0 31 >
ffff88815e5c5c00 273105558 S Bi:6:010:1 -115 96 <
ffff88815e5c5c00 273105676 C Bi:6:010:1 -121 18 =3D 70000200 0000000a 00000=
000
3a000000 0000
ffff88812366e6c0 273105682 S Bi:6:010:1 -115 13 <
ffff88812366e6c0 273105860 C Bi:6:010:1 0 0
ffff88812366e6c0 273105864 S Bi:6:010:1 -115 13 <
ffff88812366e6c0 303293804 C Bi:6:010:1 -104 0

In both of these, the computer asks for a 96-bytes of sense data and the de=
vice
responds with only 18 bytes.  Then when the computer asks for a status code,
the device is supposed to respond with a STALL (code -32 in the trace).  Th=
is
does happen (in the sixth line) under 5.11, but under 5.12 the STALL isn't
reported.  Things get worse from there.

This appears to be a bug in the xhci-hcd driver.  I can't tell you how to d=
ebug
that driver; your best approach is probably to use bisection to find the co=
mmit
between 5.11 and 5.12 responsible for introducing the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
