Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 821BF4366A0
	for <lists+linux-usb@lfdr.de>; Thu, 21 Oct 2021 17:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231572AbhJUPpI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Oct 2021 11:45:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:54610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230272AbhJUPot (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 21 Oct 2021 11:44:49 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DC81D611CE
        for <linux-usb@vger.kernel.org>; Thu, 21 Oct 2021 15:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634830953;
        bh=YA7Dv0PiHK0+jEK2k1/bh74TjeW9NZulEIjzNEwfyDA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SqAUiEHIEUKtm0wKkAnTINSb4MjBPaF/6dzGcdSSyZWvwCMWFv98+JIlrCEgkGViv
         cf/1oIzqz/cNtHTf4FRgQmAXKFYEs/u/ZYhtI150NlWAjRXMc7l2AbC5p/AQKyeMtQ
         TdzAMxbKXDiUBM7PpehOUIzUhtiZA0D2ZrTrlTw/wLtLli/yWXra4DRqFU1mJUY/el
         IqDwBW5AbA9xTWANY9rnnYyzOZx86Hmm+hm7vrdJpxuQIxhxT+3ZYZut3dxELYs/ph
         5WzlZ8dTzwKSTSVLiaMKOBUaz70m+jJY3udajeVuk8WnaC7CbQm5UM5UruxJDQb9kq
         5OY4vf/ix544w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id CC88560E8C; Thu, 21 Oct 2021 15:42:33 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214789] ehci-hcd.c ISR
Date:   Thu, 21 Oct 2021 15:42:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: scott.c.arnold@nasa.gov
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214789-208809-seqwIf3kil@https.bugzilla.kernel.org/>
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

--- Comment #2 from Scott Arnold (scott.c.arnold@nasa.gov) ---
Hello,
The driver is for a Symmetricom bc635pcie Time and Frequency Processor. Dri=
ver
developed in house for ISS simulations.
Works fine on 5.3 and prior kernels.
Works fine with 5.11 if not using shared IRQ's. No interrupts with shared
IRQ's.
Machine is a HP dl580 G9 w/ 72 Intel(R) Xeon(R) CPU E7-8867 v4 @ 2.40GHz.
We only have a few of these machines the rest are G10's and work fine (not
sharing IRQ's with timing cards).
I am having the card moved to another slot to try and get a unshared IRQ.
Unfortunately MSI does not seem possible with this card.
Thanks
Scott

-----Original Message-----
From: bugzilla-daemon@bugzilla.kernel.org <bugzilla-daemon@bugzilla.kernel.=
org>=20
Sent: Thursday, October 21, 2021 12:56 AM
To: Arnold, Scott C. (JSC-CD13)[SGT, INC] <scott.c.arnold@nasa.gov>
Subject: [EXTERNAL] [Bug 214789] ehci-hcd.c ISR

https://gcc02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.kernel.org%2Fshow_bug.cgi%3Fid%3D214789&amp;data=3D04%7C01%7Cscott.c.arno=
ld%40nasa.gov%7C149886803eb94e8808d708d994577fa2%7C7005d45845be48ae8140d43d=
a96dd17b%7C0%7C0%7C637703925801703360%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DgC=
bZYRYzD3U0wbZswfjv%2FGeEe3Y3VEua%2BmqL1opeCOM%3D&amp;reserved=3D0

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) --- On Thu, Oct 21,
2021 at 04:29:42AM +0000, bugzilla-daemon@bugzilla.kernel.org
wrote:
>=20
> Change in ehci_irq from spin_lock_irqsave/irqrestore to=20
> spin_lock/unlock broke shared IRQ's

What shared irq broke exactly?  For what hardware platform?  And what kernel
version worked for you and now does not work?

thanks,

greg k-h

--
You may reply to this email to add a comment.

You are receiving this mail because:
You reported the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
