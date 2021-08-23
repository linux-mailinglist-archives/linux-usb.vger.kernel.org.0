Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0571A3F4733
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 11:16:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235677AbhHWJPe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 05:15:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:55722 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235764AbhHWJPb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Aug 2021 05:15:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 7C62461374
        for <linux-usb@vger.kernel.org>; Mon, 23 Aug 2021 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629710089;
        bh=ZSchOQ2J53iG06TgGb2xqyFQp+MmndY50OKitLWtYhA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nxsSSo2n092MhAP9BKISQuxB4uO6GZRdXMflJF1lZYqXGLdtQncVZHA3gl0mYs7LH
         2EhM9K4bsj59IARjngLEoAPEuZahEbRzaMg+1qgMMwr8otUY5Ng2BgNYgjZQDFjZhg
         OTXU5kAh+l43dkdUl1VsrcdtstSPUroBnKCrb7/LXh/PwR5koDUY+dxx2AHt8tnwzv
         Dze+q5vKYmJU8NMqkddmnv8afVhikiStChqTfbLZHUYLqsdeMZ/63bidlqLMW1ihx0
         Y6XNRU0s1n74YcPrOeCzF4k7MrKtWNNmVhU2bYRM02ef084AI8aW+HJ1ukUtnelAOk
         Um33olkRdp+1g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 7996C60F94; Mon, 23 Aug 2021 09:14:49 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214131] ch341 communication problem
Date:   Mon, 23 Aug 2021 09:14:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pb.g@gmx.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214131-208809-j9da9chxlu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214131-208809@https.bugzilla.kernel.org/>
References: <bug-214131-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214131

--- Comment #5 from Paul Gr=C3=B6=C3=9Fel (pb.g@gmx.de) ---
I agree, I couldn't find any enumerate related symptoms here:

dmesg:

[ 7572.641499] usb 3-3.4: new full-speed USB device number 7 using xhci_hcd
[ 7572.731906] usb 3-3.4: New USB device found, idVendor=3D1a86, idProduct=
=3D7523,
bcdDevice=3D 2.63
[ 7572.731910] usb 3-3.4: New USB device strings: Mfr=3D0, Product=3D2,
SerialNumber=3D0
[ 7572.731912] usb 3-3.4: Product: USB2.0-Serial
[ 7572.788929] ch341 3-3.4:1.0: ch341-uart converter detected
[ 7572.802958] usb 3-3.4: ch341-uart converter now attached to ttyUSB0

lsusb -v see attachment above

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
