Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9D1F4F0496
	for <lists+linux-usb@lfdr.de>; Sat,  2 Apr 2022 17:47:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357420AbiDBPtc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 2 Apr 2022 11:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238316AbiDBPtb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 2 Apr 2022 11:49:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D91177D35
        for <linux-usb@vger.kernel.org>; Sat,  2 Apr 2022 08:47:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 59016B80315
        for <linux-usb@vger.kernel.org>; Sat,  2 Apr 2022 15:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24009C340EE
        for <linux-usb@vger.kernel.org>; Sat,  2 Apr 2022 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648914457;
        bh=DcIP0udA6EkXhMiTE3qxcLXiahdOC856QCGt0Kq6eIk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=u5ar6Hfgyr6qsQRG7j8ATPjhZnmhX6U+BU5k0LFzaHSaIneiio+SE5h9/0T3BxNDh
         //V8qOr0Sj/sgbKxx5KEDKeY1Bx/tuIXZogr7xCJirtlxkTOGDxfq0lzFpICbwE4Pa
         P4hEGTBsdUXyUOGsqI251C418eHuZ4KtxLXUBtODYoPGyz+KIacKmPfInoJBzy+O1l
         +5Hgiznsfr7brreQh2ggDICWCBkFUbKIFL25bxgNY8oVk1vSoAnqYqfD2Qt1/s+IMn
         fxPdZATICkO8ZOgSZfkoM9lXisUNEgvNc7rsa5SlCB9xmrW/X5EZ08CrUj1CXkJ4M3
         p44B4ABGgjpEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0EA65C05FD5; Sat,  2 Apr 2022 15:47:37 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214875] USB 3.1 device cannot be detected
Date:   Sat, 02 Apr 2022 15:47:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: tucci.michele@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214875-208809-JNPG5NmZzT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214875-208809@https.bugzilla.kernel.org/>
References: <bug-214875-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214875

Michele Tucci (tucci.michele@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tucci.michele@gmail.com

--- Comment #5 from Michele Tucci (tucci.michele@gmail.com) ---
My USB 3 external hard drive cannot be detected after this fix.

To get it working again, I restored to 10 (20ms) the value of
desc->bPwrOn2PwrGood in drivers/usb/host/xhci-hub.c:347.

This is how the device looks like from lsusb:
```
Bus 004 Device 002: ID 174c:55aa ASMedia Technology Inc. ASM1051E ...
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
