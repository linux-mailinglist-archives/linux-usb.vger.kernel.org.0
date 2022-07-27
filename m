Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F260581D07
	for <lists+linux-usb@lfdr.de>; Wed, 27 Jul 2022 03:21:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233158AbiG0BVs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 21:21:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbiG0BVr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 21:21:47 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCB5733E06
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 18:21:46 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 89282B81EB3
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 01:21:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 452ADC433D7
        for <linux-usb@vger.kernel.org>; Wed, 27 Jul 2022 01:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658884904;
        bh=IcSlFqvgS9FNnAuW8kCpGdQ+nQ3+7UXkfMsY3tVm05A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=l9MmNneCg1WbSgkUBiF8z7Lit4hkgQ2jxdx2IuqBVo9+BBE84w9eUCXJKo9Nd5Z8B
         iZZAyWVjyaxvQJaQwQtWcXyr19wOIkDOgN2hRx/hevo/7agLaiEavBSz56I8BCCH/3
         yP0yXUp+/BM9AGRsayymN5xiuPE03B2JUxnDR8wSEE2VlMSG42puCN21VklWJnSxlh
         uGU8KCC7IsS8mxD8fhEoQAXJp0kkW5AYYY9Fb1mhRPLf/GbBNQBsAPLNGxRpXJx70R
         UtYNrKfAvD9tj12bhl+WsiZ3arSSWnPHNrBJ8X5cTBgivpt8PPAmC7DYzWRxFjj4H+
         LhKP6lb3/9xpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2820FC433E6; Wed, 27 Jul 2022 01:21:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216282] usb-mass storage
Date:   Wed, 27 Jul 2022 01:21:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216282-208809-f6jqqcvLau@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216282-208809@https.bugzilla.kernel.org/>
References: <bug-216282-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216282

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stern@rowland.harvard.edu

--- Comment #12 from Alan Stern (stern@rowland.harvard.edu) ---
I don't understand that error message.  Regardless, what you want is the
directory on which a debugfs filesystem is mounted.  On my system that's
/sys/kernel/debug:

$ mount
...
debugfs on /sys/kernel/debug type debugfs
(rw,nosuid,nodev,noexec,relatime,seclabel)

Maybe you need to change the command line to:

   mount -t debugfs debugfs /sys/kernel/debug

Or maybe debugfs is already mounted somewhere else.  Or maybe your kernel w=
as
built without support for debugfs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
