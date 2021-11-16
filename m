Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15A43453A4E
	for <lists+linux-usb@lfdr.de>; Tue, 16 Nov 2021 20:41:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240107AbhKPTnx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Nov 2021 14:43:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:60634 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236700AbhKPTnx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Nov 2021 14:43:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id E6CF363215
        for <linux-usb@vger.kernel.org>; Tue, 16 Nov 2021 19:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637091655;
        bh=kFNIvcXwiJzf9g6Z5vszVzs7JHtFsWBlyZvJtBHnN3c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WCwZjijOSeiLgNFLyS8umwdpD8cD8/+rRY++1rgo54Cv3zimX9ehdVVA1Mu8g89xU
         tUjrCa3X2GhWr3jf/Zchfy4ue7KoMhLOg+x7l82u/cfKDzkM+ekgupFlOnc6otnNoZ
         PMNu7uNxdRbQ5LOmiwC5+knaNuey+gORDJoXgbTmVkkM+L/+WrWCk4lAZH3pB4CxU2
         XDbFBrlZeFyLfMo3+1veYnz4l7q0GIRPahpkA060kSttIrjpTU6Yj0iAygLa48pRfH
         GohU3UdXtHlFF4jikpQn75EXh+iTum7Llvnk86ch47y8RVoIwLhdpLndvWbmG4jWBd
         JvIc0CAk/EXog==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D122960FC4; Tue, 16 Nov 2021 19:40:55 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Tue, 16 Nov 2021 19:40:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kw@linux.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-aQRfqjpPbh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214789-208809@https.bugzilla.kernel.org/>
References: <bug-214789-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214789

--- Comment #25 from Krzysztof Wilczy=C5=84ski (kw@linux.com) ---
[+CC Sean using his other e-mail address]

Hi Alan,

> > https://bugzilla.kernel.org/show_bug.cgi?id=3D214789
> >=20
> > --- Comment #22 from Scott Arnold (scott.c.arnold@nasa.gov) ---
> > Hello,
> > This caused problem:
> >
> https://patchwork.kernel.org/project/linux-pci/patch/20200214213313.66622=
-2-sean.v.kelley@linux.intel.com/
> > Scott
>=20
> This is commit b88bf6c3b6ff ("PCI: Add boot interrupt quirk mechanism=20
> for Xeon chipsets").
>=20
> Sean and linux-pci readers, please take a look at this bug report=20
> (Bugzilla #214789).

Sean might not have been able to see this message, as he is no longer
working for Intel and his old e-mail would bounce.

I am added Sean using a different one I've found, perhaps it would work.

        Krzysztof

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
