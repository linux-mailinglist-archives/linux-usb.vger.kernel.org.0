Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2683CCEB5
	for <lists+linux-usb@lfdr.de>; Mon, 19 Jul 2021 09:44:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234789AbhGSHr1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Jul 2021 03:47:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:53318 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233759AbhGSHr0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Jul 2021 03:47:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 6FAB161019
        for <linux-usb@vger.kernel.org>; Mon, 19 Jul 2021 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1626680667;
        bh=qIBQj+xdy1TV2jeFvsWU1UMwII5m4G65WGs8qr0yV+c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Ro54cVEnh2mgWzhnXnzm/zPQFqzslHlXxVKtpUqqneFvJitT5/z/j8GWnLTvXIKXo
         1PhH0C1v+/ET8addBg0quiSA29qaS2WtyKvA7rB0RrjzexsSNKEndSkoI91cpwDzEA
         FolVJJVyhfuSS7g9Ax9wGFFKjyYK5xyE932r0HeFabCIKSNxSY9i/rui8P4MwitZIX
         6TnCOB00KFwwZ5r/uU83WIeQXvVys7mFTI6frxOOZuv9Pps4z1nJjSkduiyudQiEy9
         QUtEZTkGWlUzxtyHYHvVHurA7qG64pFb/zjBJOUYWeUTQSreV8J2kW6Bzf5rt+qTbf
         dfdgMCHNkP7fw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 6289D61186; Mon, 19 Jul 2021 07:44:27 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213771] ch341 USB-Serial converter receives but does not send
Date:   Mon, 19 Jul 2021 07:44:27 +0000
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
Message-ID: <bug-213771-208809-nqvVqlQHCv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213771-208809@https.bugzilla.kernel.org/>
References: <bug-213771-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213771

--- Comment #1 from Johan Hovold (johan@kernel.org) ---
On Sat, Jul 17, 2021 at 07:21:37PM +0000, bugzilla-daemon@bugzilla.kernel.o=
rg
wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D213771
>=20
>             Bug ID: 213771
>            Summary: ch341 USB-Serial converter receives but does not send
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.12-rc3
>           Hardware: All
>                 OS: Linux
>               Tree: Mainline
>             Status: NEW
>           Severity: normal
>           Priority: P1
>          Component: USB
>           Assignee: drivers_usb@kernel-bugs.kernel.org
>           Reporter: luzemario@gmail.com
>         Regression: No
>=20
> Please see Ubuntu bug
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1919051.
>=20
> Tested with Alpine Linux alpine 5.10.16-0-lts kernel too.
>=20
> Possibly still exists in the latest (5.14) kernel.

Please provide some more details to make this report self-contained
(i.e. don't just add a link to another bug tracker).

Also, has this device ever worked with Linux and if so which version?

Johan

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
