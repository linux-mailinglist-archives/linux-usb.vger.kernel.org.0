Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3360402FD1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Sep 2021 22:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239567AbhIGUiy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Sep 2021 16:38:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:45632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1345954AbhIGUiv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Sep 2021 16:38:51 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E3B41606A5
        for <linux-usb@vger.kernel.org>; Tue,  7 Sep 2021 20:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631047064;
        bh=EMRc6dXz+eWKIt6TzPLkQ2WO92VXjFzTJ1Yet7e0WgY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=ZB4dI8d6Vf0DqY9sK42We/R56kIdNQwsLktgISCoDGX2NOL1n6uEu3VYKbYjJWDUp
         a9dMs18U3P1RGKuk7AZvKa/khkx4KyLcRIFfK5bRI7MJB+rha6hB8EB1movsr9m9QZ
         jmyUXHlfKNYx7qMvf2dOnm+PYv3Z2u5ecJsMddTKcCNQjjom99roQZV9O+8Q0X1gpU
         ZfSeHUHuV3zfsosZAzws9YwlUe9Gc8TegUTFEGTYdzpHYPKulBqNFDQ1fs1geHGY6X
         wPeYaz+46tOngwSSCahNFv8lMoZqfhBV2Kl0j8Wbegx3K2kquQbiUKvhWOhT1sZup/
         2FOw8xmWgOT/A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id D6D5060FC3; Tue,  7 Sep 2021 20:37:44 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214137] USB randomly stops working, starting with mouse
Date:   Tue, 07 Sep 2021 20:37:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tameimpalafan123@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214137-208809-DroyT5YTtS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214137-208809@https.bugzilla.kernel.org/>
References: <bug-214137-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214137

Simeon Duwel (tameimpalafan123@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tameimpalafan123@gmail.com

--- Comment #5 from Simeon Duwel (tameimpalafan123@gmail.com) ---
Could you give us the output of lsusb -v and the kernel logs related to usb
around when the USB ports stop working (with sudo cat /var/log/kern.log | g=
rep
usb for example)?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
