Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63ED34011E4
	for <lists+linux-usb@lfdr.de>; Mon,  6 Sep 2021 00:21:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238385AbhIEVzY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 5 Sep 2021 17:55:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:56876 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238309AbhIEVzX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 5 Sep 2021 17:55:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1004160F21
        for <linux-usb@vger.kernel.org>; Sun,  5 Sep 2021 21:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630878860;
        bh=j6kq16kCTUMSgYzLx6q6EDU9qjssGMwwabPhVLgIanc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=TBwE5aRHRVc3UHY6SauS01Tntoq3zwsbrmbcDYRzNMDTJtKE9DcFDyNneXuFt0rjW
         jnj2n8TgnrIfS8E+sM8wHWxgfb63btJxCzAl+fQcUX3FEqgghY/p7hE+1l2wdsWyO+
         gmiandLATEZvRJ8bDly60Q+pJVQ5C56LpPInTM/hZNVlc0GAZSiwOXIODufKa9JwSe
         S04ymGQ13xmj82dXleyTMV7i8OoOq8HGSFbNSvHKCUQ2/hmiycBeeLgT65soWD2Rjt
         jiFPor1KJFC2lPNrVDy8yHzdlhg2V6CbvLS4KUafgwyRp3/QBSFLtycIDG78SdYBLz
         5RjZRGa0/Wq5A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id EFC7C60F3A; Sun,  5 Sep 2021 21:54:19 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214313] APC UPS USB connection is causing hid-generic errors:
 usb_submit_urb(ctrl) failed / control queue full
Date:   Sun, 05 Sep 2021 21:54:19 +0000
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
Message-ID: <bug-214313-208809-OktIRCOiZD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214313-208809@https.bugzilla.kernel.org/>
References: <bug-214313-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214313

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
This problem has been fixed by commit 5049307d37a7 ("HID: usbhid: Fix flood=
 of
"control queue full" messages") in the current upstream tree.  The commit w=
ill
be part of 2.15-rc1 and it will appear in the earlier -stable kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
