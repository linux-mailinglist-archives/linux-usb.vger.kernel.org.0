Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2753A482746
	for <lists+linux-usb@lfdr.de>; Sat,  1 Jan 2022 11:36:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232241AbiAAKgo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Jan 2022 05:36:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229624AbiAAKgo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Jan 2022 05:36:44 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C93DFC061574
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 02:36:43 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 18BCEB81DE5
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 10:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1142C36AE7
        for <linux-usb@vger.kernel.org>; Sat,  1 Jan 2022 10:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641033400;
        bh=6cKdgmmiUA1WTq2YBOPpxtxnPRuRx26Sv6l7MNlPi78=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XDxvwzOzUEbEDDPod10ulK4jKxDAUY3mSIGRDkWTFVmRNCwb68S9iAx1Pb/3+8nhe
         anwR6a/DTdB+SdAUsAYJmh0X4dajadsHcVaRTyyhmqT2LwZfniJq6C8Gr7FO5VXzRj
         Wlo/EBeXbhX6+MbTX+BuP6eyHtPVE/BEhDxSF9SevktWRuLs1AQedi34BLzT0Y8nnQ
         d7NNQuXwTYeS0KfdlDm9VlWYJSz6FkwNuwfSWuhzrkLxtKQOfFyWR+cZUrzfNEIgbI
         s2VP5f6gx8x9pASoL72muhiFjUheLkvIYrqiF0WKPE7i+YRmMYxCLDoBeR7Ebp1mOC
         G+MAMD6oAn27w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9FC30CBF85E; Sat,  1 Jan 2022 10:36:40 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 213839] XHCI 7 port usb hub does not work correctly
Date:   Sat, 01 Jan 2022 10:36:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: noodles@earth.li
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213839-208809-4wxs0Fa6uN@https.bugzilla.kernel.org/>
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

--- Comment #11 from Jonathan McDowell (noodles@earth.li) ---
Autosuspend appears to be the issue; if I disable it using the echo command
provided then the additional ports on the hub work ok and the flash drive is
detected.

Looking at my kernel config (this is Debian 11/bullseye, their stock 5.10.7=
0-1
kernel) I see:

CONFIG_USB_AUTOSUSPEND_DELAY=3D2

Which according to drivers/usb/core/Kconfig is the default.

However hub_probe in drivers/usb/core/hub.c forces the suspend delay for a =
hub
to 0ms as long as autosuspend is enabled.

As an experiment, theorising if the first hub chip didn't get put immediate=
ly
to sleep devices off the 2nd hub chip would be seen, I tried plugging in the
hub, plugging a flash drive into a port on the first chip (which is seen, as
expected) and then plugging a flash drive into a port on the second chip (w=
hich
would normally not be seen). Both drives are correctly detected.

I'll attach all 3 dmesgs now but it seems like the 0 delay in hub.c is what=
's
causing the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
