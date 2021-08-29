Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB10A3FAE56
	for <lists+linux-usb@lfdr.de>; Sun, 29 Aug 2021 22:10:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233841AbhH2UKO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 29 Aug 2021 16:10:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231417AbhH2UKN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 29 Aug 2021 16:10:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6F34960F42
        for <linux-usb@vger.kernel.org>; Sun, 29 Aug 2021 20:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630267761;
        bh=qH2USJKYm76sL7DFX7v6l3dh4Yl9B94ZUu2YSmVQlHY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aHXSKiHu7J7Ir+Gb5Tib7m9W9zPLdgDr6uf2DO68kwJtTVJiJmwd22Ebdq4oE3RRQ
         DXp5+ARWp/TCpy47b+OzKG0rIL8BQLgw0S5wazoKT76cLlN2wOt/7RNskAbTNfM/RH
         JtXAJqTJ9p0IpqVTZWKGFjAoYo3PqjoFOAA4uxrTyUGYXkedgc+7fPkwkQFSvPOJQX
         jtLPiMpPJmNG/Bx1kw8B++AfD6MD4rS5FeuvxPH44YPUFKd9JxpfLtUWK6pk6lEwms
         fqWvF3wPDG22hsUBa/TpTjQH+uiqDvY4NnppU+/mGXZkMw+QyCsEu1uRiNZlFKFZnN
         Da087K7D7KOOQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 65DA660F49; Sun, 29 Aug 2021 20:09:21 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 207887] USB keyboard (and other devices) connected to Thinkpad
 Dock hangs after a while
Date:   Sun, 29 Aug 2021 20:09:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: iam@valdikss.org.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-207887-208809-g7eLh39mUe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207887-208809@https.bugzilla.kernel.org/>
References: <bug-207887-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D207887

ValdikSS (iam@valdikss.org.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |iam@valdikss.org.ru

--- Comment #17 from ValdikSS (iam@valdikss.org.ru) ---
(In reply to Marco Trevisan (Trevi=C3=B1o) from comment #5)
> (In reply to Alan Stern from comment #4)
> > What happens if you remove the jumper, so as to disable the USB storage=
 on
> > the keyboard?
>=20
> Sorry, I probably didn't explain this properly.
> The I always keep the jumper in "off" state (so there's no USB storage
> active), but I'm not sure if that's advertised anyways at HW level.

Just out of the blue, do you have pktcdvd module loaded?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
