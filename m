Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA78E6C6A55
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 15:01:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231784AbjCWOB1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Mar 2023 10:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231486AbjCWOBH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 10:01:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1309838659
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 07:00:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 64DC7B812A5
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 14:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24045C4339B
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 14:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679580020;
        bh=dtamYj70ZKq1/7dg0U7BtzLyEFAdgsUp2JcryaR5Rv0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=oaBZmEqhdThkMdWCVRqEYRWjfCPgzG0wj9rgzKpHgCndOffkixKWlUKJAHuXGmjm4
         2OiWDdTZo6R5zCuRrJiRQZvWhG1oDy66ATMrrU9KxVf57c/E2h92leN0Qr0ZvXpiKJ
         h5o0RgtTpwWLkZAYm5VQKoX+6ToAKiYxBFT/sMuLGU1V9M5VYB5XbI78cwK/swQTkE
         Rskma/jXppcOZ7ZSFyRSMAuKpziOOVpQRAjRwevDkmi7SFeLY5bxj9SXoew+ZNPQri
         PluhYdPSRQQrQfMYa6/sRTVNZJVooXJ68A0gNbrDbpKR6/dehZ329INSHTpU6eV9Cx
         rv0v8Mbw32wNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0646CC43142; Thu, 23 Mar 2023 14:00:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Thu, 23 Mar 2023 14:00:19 +0000
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
Message-ID: <bug-217122-208809-tKe0pUnz0v@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #9 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to J=C3=BCrgen Herrmann from comment #8)

> So maybe the bug was backported from 6.2 to 6.1.y?

Quite possible.=20

Anyway, did your bisection make any progress? Or did the problem vanish on =
its
own?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
