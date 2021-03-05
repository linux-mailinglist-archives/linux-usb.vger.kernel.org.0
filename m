Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29B7B32E68C
	for <lists+linux-usb@lfdr.de>; Fri,  5 Mar 2021 11:38:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbhCEKiF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Mar 2021 05:38:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:58286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229497AbhCEKhv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Mar 2021 05:37:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id D695164FD3
        for <linux-usb@vger.kernel.org>; Fri,  5 Mar 2021 10:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614940670;
        bh=v5rJSakz/k9Lp/bx7m/Tti6G5FEfjAD64CD/4WEKd9Y=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gHWe5EGkXmwumawUt4vFtE+w1cdPto/+1cIX//13NpJKyxOlh/LHBVcI4lBaZRoYS
         OIil84lTPVRuBEu2xa1K7jFZ4XyDAqHMIBocMMnH3Mpam3b3+SYYikG4Kn7f+du2Qs
         ntmp/3xx0M1TEcQ334z5PqAyO5xPJh5Nn6l1f7OjmJDYhYH4z1vJIwToyAznVasCHL
         zLBJfFqxJQPo4ZugXinw+2usEdrkuRpxgRxquDP8cA4coyvxiIUZm9AZDEBiqJank+
         2xXa1zer6l9j3XNbYcF+wKqurLIIA0yBPwL1P4S0cj4/Mrgntw4tFlFWp/Ld59DBb8
         Ojbr9ayQVTHoQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id C408A65307; Fri,  5 Mar 2021 10:37:50 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212045] dwc2 gadget mode read call blocks
Date:   Fri, 05 Mar 2021 10:37:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz@grobelny.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212045-208809-ZiNUZNm0g9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212045-208809@https.bugzilla.kernel.org/>
References: <bug-212045-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212045

--- Comment #5 from Tomasz Grobelny (tomasz@grobelny.net) ---
The files that functionfs exposes are ep0 (for reading, events), ep1 (for
writing, direction: to host) and ep2 (for reading, direction: to gadget). N=
ot
sure how and why they are named in dmesg. You can find the gadget configura=
tion
here:
https://github.com/tomasz-grobelny/AACS/blob/master/AAServer/src/descriptor=
s.cpp
- line 75 and 84:
                    .bEndpointAddress =3D 1 | USB_DIR_IN,
                    .bEndpointAddress =3D 2 | USB_DIR_OUT,

The code that fails/hangs is readWraper function here:
https://github.com/tomasz-grobelny/AACS/blob/master/AAServer/src/AaCommunic=
ator.cpp:493

select succeeds for ep2 and the read blocks. Exactly same function works ok=
 for
ep0 for all 3 hosts that I tested on and the code works fully ok for 2 out =
of 3
hosts that I tested on. I also know that in principle the 3rd host also sho=
uld
work because it works with other devices.

Maybe lack of ep2 in the logs is something interesting?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
