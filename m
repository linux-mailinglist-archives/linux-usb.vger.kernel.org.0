Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24998482645
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 02:49:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231846AbiAABtr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Dec 2021 20:49:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231722AbiAABtq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Dec 2021 20:49:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 699EDC061574
        for <linux-usb@vger.kernel.org>; Fri, 31 Dec 2021 17:49:46 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A4BB5B81D57
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 01:49:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2FFE7C36AED
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 01:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641001783;
        bh=WNThEOjIQkYC/YTmtmXVnU94D2GQf646bcS8fshobxo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=gYEdsH9Fics9Q5I/DSb2Bmvw/MyNSyv1WIlFi4fyC15p0sDd43F8//rwED0Q9hQHf
         ILp6uq1lxigah3LH9ZbS1ZuaBy/Vno86Cm/YCa0FsCcAOqAMfcdH1cl3jOLRI076EO
         Kg9G2eVLCzjcV+F10vejXZXuWh6H93/MPlusv0f1mXCYKzUzHKgCSa6IwggTv9OtCG
         oQYvJY+5iNteQmQ62EptSvPA+0m8+Gy2cDxwAHRt6Wx1IENenusF6NH5ha7+0Kmr29
         uPYRZrkWkyyv0zo+seTwz26aAgQvBgeaYNbJKOBb64zUaxy62SbcHdrnNLhfOYeS8M
         eDu/7x0t/wi4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0B19CC05FC8; Sat,  1 Jan 2022 01:49:43 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 01 Jan 2022 01:49:42 +0000
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
Message-ID: <bug-213839-208809-ZAzRDmozII@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213839-208809@https.bugzilla.kernel.org/>
References: <bug-213839-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D213839

--- Comment #10 from Alan Stern (stern@rowland.harvard.edu) ---
So far I have only looked at the Linux trace.  It shows two unusual things I
don't understand.

One is that some process (I don't know which) re-reads the hub's device and
configuration descriptors while the second device is being initialized, and
apparently as a result of this the process decides to reset the hub.  Why d=
oes
this happen?

The second is that when the descriptors are re-read, the hub's config
descriptor has changed!  The original bmAttributes value is 0xe0, as shown =
in
the lsusb output above.  But the bmAttributes value in the trace is 0xc0; t=
he
changed bit is the flag for Wakeup support.  Most likely this is a bug in t=
he
hub's firmware.

Perhaps additional debugging information will help.  You can enable dynamic
debugging and snooping for USB by doing:

  echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control
  echo 1 >/sys/module/usbcore/parameters/usbfs_snoop

Clear the kernel log buffer by doing:

  dmesg -C

Then plug in the hub and and plug in a device to one of the non-working por=
ts.=20
Let's see what the dmesg log shows after that.

Another unusual thing shows up clearly in the trace: The autosuspend_delay_=
ms
time is set to a very low value; it looks like 20 ms.  You might get better
results leaving the delay set to its default value of 2 seconds.  Or turn U=
SB
autosuspend off entirely by doing:

  echo -1 >/sys/module/usbcore/parameters/autosuspend

before plugging in the hub.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
