Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15C856BE3D2
	for <lists+linux-usb@lfdr.de>; Fri, 17 Mar 2023 09:37:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjCQIhg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Mar 2023 04:37:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjCQIhR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Mar 2023 04:37:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EBBE17CE8
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 01:36:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DA86EB824F2
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F15DC4339B
        for <linux-usb@vger.kernel.org>; Fri, 17 Mar 2023 08:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679042181;
        bh=dPdJHrm7rqj2jFrp3rsyZKFMBJ1qYkmhyO8zV0RnKcY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=rfepU6xUfP1AHcVazJzZYQGiES7R09YSb7OOlbtQRffxImymqKCK2zp1uJV+6Q/F0
         DInYLdrCwN5/LdtjRxm6WcMqX1+MrZpQeNjU8+qhycugWSeCsrY7dIsuxtHgouaL22
         mjGjTSs1QsPkcAC+rnKvG1iWeXcjMtnvX3CySP1JEFPPwvieMpiOei/s/Msx8oZPOA
         k5UqvnKJaJ5Wii0QdWPXRaPqZaIZbPQHhB5udp/vOvLFaNu6OlJF5HIwwhbJNH0wD3
         Nq+6UcikEBQPtf1Emd6L12jDW7pv6jFrmtspkw8QxvPGZ9/9rOaPN4FIsNemdmVzRH
         Dhlw6GBFPQBKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6D930C43141; Fri, 17 Mar 2023 08:36:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217204] ASIX AX88179 does not work in 6.X kernel
Date:   Fri, 17 Mar 2023 08:36:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: marcan@marcan.st
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217204-208809-OdUvUXaRKO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217204-208809@https.bugzilla.kernel.org/>
References: <bug-217204-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217204

Hector Martin (marcan@marcan.st) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |marcan@marcan.st

--- Comment #1 from Hector Martin (marcan@marcan.st) ---
I mentioned this by email, but to keep things in the bug tracker: Do you ha=
ve
CONFIG_USB_NET_CDC_NCM enabled? If not, please enable it. That driver is the
correct driver to use for standard CDC NCM Ethernet devices.

I would also like the output of `lsusb -v -d 0b95:` (with NCM or in the
not-working state, NOT with the old kernel or your patched one) to see exac=
tly
what your device is reporting by default.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
