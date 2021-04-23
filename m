Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DE24368EDC
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 10:31:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241361AbhDWIca (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 04:32:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241477AbhDWIc3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Apr 2021 04:32:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 36B36613F6
        for <linux-usb@vger.kernel.org>; Fri, 23 Apr 2021 08:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619166713;
        bh=vgBiOrEmkoB1KClYYO3m0bmjLltc+y5lSexXA41XMhA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=bSkJEqGKuaCc2lX8R8FscjL9T5FjojMIVrwl2w2vxw8qv4BsYe3glS4UnsT9ge6xL
         hEe6iomnqyJ4ey9Huq9JcML+IVx7/1y40rZMGFFZokZ1DC4vnkUaOFPOT/XazDV5Yk
         h7bevKcqpSrAixxsppEePaGeGbr4esVs4cUjPo/Kzop+XQ2fxqjhHfxlHXGMfHUTR0
         FGnugUliJNiar3HHFX4/YH8KZr+1nosZz2H3medZ68R3wBmzrX2mHoAyp5BwP1UPpE
         8z4PddAwt9cLzWNmRCwGSrcj8zINroQged/DaRYU4pGFT11iDUqV2DxTuTUm89/v7E
         ooR6qG02Eg2Tw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 31F9761104; Fri, 23 Apr 2021 08:31:53 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212751] acm_port_activate - usb_submit_urb(ctrl irq) failed
 after kernel update
Date:   Fri, 23 Apr 2021 08:31:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: johan@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212751-208809-p76zBXG9im@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212751-208809@https.bugzilla.kernel.org/>
References: <bug-212751-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212751

--- Comment #1 from Johan Hovold (johan@kernel.org) ---
On Thu, Apr 22, 2021 at 04:32:51PM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D212751
>=20
>             Bug ID: 212751
>            Summary: acm_port_activate - usb_submit_urb(ctrl irq) failed
>                     after kernel update
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.10.30
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: johann.wilhelm@wilhelm.consulting
>         Regression: No
>=20
> Something between 5.10.26 and 5.20.30 broke (at least) the USB CDC
> implementation by ST Microsystems on their STM32 devices.
>=20
> On opending of the device following error occurs:
> [ 1333.790160] cdc_acm 1-10:1.0: acm_port_activate - usb_submit_urb(ctrl =
irq)
> failed
>=20
>=20
> 5.10.26 works - 5.10.30 does not.

This is likely due to commit 6069e3e927c8 ("USB: cdc-acm: untangle a
circular dependency between callback and softint") which had a bug that
was just fixed by commit a8b3b519618f ("USB: CDC-ACM: fix
poison/unpoison imbalance").

You can try applying the latter yourself but it will otherwise show up
in stable soon.

Johan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
