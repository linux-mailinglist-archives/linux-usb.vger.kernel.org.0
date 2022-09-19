Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E921D5BCE55
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 16:16:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbiISOQB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 10:16:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiISOP6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 10:15:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B925D32ABB
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 07:15:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1D4C961D1A
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 14:15:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79E88C43470
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 14:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663596954;
        bh=bX1g8+BxMkssqj2UhVgwgVQFAhwWjWQmkuQn52thFj8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=KNV85hthlInH1G8RZYvcXfqWiZoKCVjTg+rW6x9hIZ78RLw31yzxwlyzLbYQbq1va
         gNYkkk77EoujTVCAV9NCzA9CGMkJGouHSeu0GAYcYoBkRDmfG6RsGCVJ3Y21O2in+W
         UKnUnqgVDJhnZlf3fUMIe46YvnEjV3stBd/EYD1OU8WORza4lXb/6s8pBUnS8fJ5ty
         4D//uJycOofrT3d5U9xmBEwmIjK1RlssYqMQRTS5xz7S71XkZgCC1hOHIBCzBnD8wq
         gZiL870jHyP6k5Gh6eUAgITJAsepvPh0W3gkm19J6wBS05MZ5shLBF9vFVgTdJ9h2G
         ILWv8DRRHmZkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 62754C05FD6; Mon, 19 Sep 2022 14:15:54 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Mon, 19 Sep 2022 14:15:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jason@montleon.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216497-208809-e1azE5sRyA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

Jason M. (jason@montleon.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jason@montleon.com

--- Comment #6 from Jason M. (jason@montleon.com) ---
I am seeing similar except my wireless is broken because the firmware can't
load.
https://bugzilla.redhat.com/show_bug.cgi?id=3D2127753

Among the errors from my dmesg attached over there:
Sep 18 14:28:02 kernel: DMAR: DRHD: handling fault status reg 2
Sep 18 14:28:02 kernel: DMAR: [INTR-REMAP] Request device [01:00.0] fault i=
ndex
0x8080 [fault reason 0x25] Blocked a compatibility format interrupt request

After running through a bisect reverting just
9516acba29e322202674d18f4dc383879f7813a5 fixes it.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=
=3Dlinux-5.19.y&id=3D9516acba29e322202674d18f4dc383879f7813a5

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
