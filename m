Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 413C837493C
	for <lists+linux-usb@lfdr.de>; Wed,  5 May 2021 22:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234091AbhEEUVV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 May 2021 16:21:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:40046 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234027AbhEEUVV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 5 May 2021 16:21:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id AA760613C7
        for <linux-usb@vger.kernel.org>; Wed,  5 May 2021 20:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620246024;
        bh=zgax8seyf+BKuxQaklElTl5ZGqce+ipCtYbz6byIaDc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=pm/n1SfAR2SHOZGnFXd97VZFnn8ZtQAZbFe2kN8gGJd77R7sL+lEW0mBZCWFvSU2q
         /xqrhrU6krnk4zlXV5w5F40mm6kRyd2HgRJwGnxRY7dxOSbPtMD5LdsDkhhnpoA/Ty
         gzOXr6uCOlzFm2YfX9Wsn+4S4y+Dll7y2vayOV6+lp9JY8F/RSLC1AjKCFW61wtmkG
         1jg54LxTTGL/RciB7BLsEy51LH7mibe5Bt8Xw8+u79PVznYsazR4IYXsBSE2YFvdDX
         V2ZNby0y+eDPeQ2yKx7JEe70S+RtFxUMlw6sXTfECfoWsCacP1TBTfFYIaoivD1aVI
         LlZ0rEEZcL4NA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 93DBC61284; Wed,  5 May 2021 20:20:24 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 212955] Possible kernel regression USB2 (not USB3) port EDIROL
 UA-101 (in USB 1.1 mode, not USB2) error -110
Date:   Wed, 05 May 2021 20:20:24 +0000
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
Message-ID: <bug-212955-208809-jBPK7fsAQf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212955-208809@https.bugzilla.kernel.org/>
References: <bug-212955-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D212955

--- Comment #1 from Alan Stern (stern@rowland.harvard.edu) ---
Something else you can do is to collect and attach a couple of usbmon traces
under a 5.12 kernel: a working trace (device attached to a USB-3 port) and a
non-working trace (device attached to a USB-2 port).  Comparing them might =
show
where the problem is.

In addition, before plugging in the device you should enable USB dynamic
debugging by doing:

    echo 'module usbcore =3Dp' >/sys/kernel/debug/dynamic_debug/control

and then afterwards attach the relevant parts of the dmesg logs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
