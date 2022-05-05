Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC6A551BC4F
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 11:40:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348604AbiEEJnr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 05:43:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240726AbiEEJnq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 05:43:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D1B52B1BC
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 02:40:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ED4026119C
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 09:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DF45C385A4
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651743606;
        bh=9F189vkMhVx8NOx1qOodw7tuc8NDlgHY+VeKmKI6e1c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oMzh+YPuVWqCsfTPFjq/uaJc6QLZ9Ycw3Oprt7lUbK6sjkYNxeGYJeXMQhpp8d683
         0dTfrZRYNXw3WXJQGhL1/UZ8g6Im+LejCgce03WacSj+G1rXrZuveuklRfatv4EgFH
         J8o7Xt+MIRH02A4ZYfCOVcy3EvOD3rCx0vkvYrCqKgjqi9GHP7TXrofgMHXe/LI0VJ
         FezaVrmYnwu4+hSbgpQlExikPewKq8u6d2SOeiUSABt2iA8q1bFby1XBs8DPYO5gU3
         Ynafwnpq98GxzyilaeWt8G5zHISkB5R81xYZTiGqQd5Yz2Doq55A5JRHtM34ifb7x6
         ayrbGD4++sFzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 28283C05FD5; Thu,  5 May 2022 09:40:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date:   Thu, 05 May 2022 09:40:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215906-208809-Zb7Q5gXvYB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #2 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
I wanted to add this issue to the regression tracking and poke the maintain=
ers,
but noticed there is a patch that is being backported right now that might =
or
might not be related (not my area of expertise):
https://lore.kernel.org/all/20220504153117.726462014@linuxfoundation.org/

It's already in 5.18-rc5; could somebody please give it a quick try before I
proceed with my initial plan?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
