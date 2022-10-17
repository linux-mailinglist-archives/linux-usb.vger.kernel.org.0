Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D8DA6015D9
	for <lists+linux-usb@lfdr.de>; Mon, 17 Oct 2022 19:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbiJQR75 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Oct 2022 13:59:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230399AbiJQR7v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Oct 2022 13:59:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C40102A95C
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 10:59:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D352611E8
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 17:59:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6218C433D6
        for <linux-usb@vger.kernel.org>; Mon, 17 Oct 2022 17:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666029588;
        bh=wPA+RdcP0HUl8YjHROlbbi2FIW1gxL5t1CHTvz0R1MQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=U08qsHNUBRbg2dfmoss4iTUsdsd42g/R7qQInO5zZHcaz2r+LlYYeKUfFUlHNYT3P
         u2Y6O+WneRqK83m8ylGHZEwfJiZrYjB4PO7nsElXdVnBhVmz3vZoMye2h76KAgepLi
         mumDsIH9fP1dlcfmJtlBuJVO57P07eL1RpxUjNs4ZMdOf62GWcRrhD1ENUuAbs8qZO
         jX9eQJMYuMKXnaI/J3R50GK0UNNDEw+4IbK3YCZIYBMhgN0U2vH/LZSrLV3Bp6kSSM
         hAgdUDW+HrFu9yJjXTNWWAXP1Vs3pMUkldwR8NZjK9hiu3pTIVBankbgsYFHLb6bsL
         t4eJ9lmjmo7xw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 94B7AC433E4; Mon, 17 Oct 2022 17:59:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216543] kernel NULL pointer dereference usb_hcd_alloc_bandwidth
Date:   Mon, 17 Oct 2022 17:59:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nazar@mokrynskyi.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216543-208809-AR52CPrAl3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216543-208809@https.bugzilla.kernel.org/>
References: <bug-216543-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216543

--- Comment #7 from Nazar Mokrynskyi (nazar@mokrynskyi.com) ---
Created attachment 303022
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303022&action=3Dedit
Kernel log with uvc-trace patch applied

I'm on 6.0.2 and seemingly get this even more frequently with good cable an=
d no
extra adapters. So I patched 6.0.2 with uvc-trace above and reproduced it
within a few minutes.

USB seems to reset, often camera stops or freezes in the browser, but the l=
ight
on the camera itself remains on. Sometimes I can enable/disable/enable came=
ra
for it to reboot, but the last time I did that in the log I got null pointer
de-reference again.

Please let me know if there is any other information I can provide and what
could be the root cause of this annoying behavior.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
