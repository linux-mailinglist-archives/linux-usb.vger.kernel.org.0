Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B396053751C
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 09:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232588AbiE3FfM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 01:35:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbiE3Fey (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 01:34:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A9B532EC
        for <linux-usb@vger.kernel.org>; Sun, 29 May 2022 22:34:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 27C246101E
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 05:34:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73BB3C3411A
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 05:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653888892;
        bh=WM1l3RDjII000/V9isYd3Dha5GJeuiuGzXN7Ocy6KBo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=JSfR4I2kLXc62xDKVF8rsEDLmF7dXeMW8C2C6K82buj1cRzKFDzy/7NnJidl8hJ+c
         3LrD1qVkKGgzGStZHzjxiPPAGD+JtlMoq7KTr/nHSRjXW6OEHn9OveEzYXfibIFEKD
         Tz/4bSLWxoIIHS0r5NTyNj3EsP2S5HAVtVyQ3iH56VdYs/eQ64/G9IGjhgPxbsjAQG
         WcbhZ0PIcd2opZ8RYC/E26J0pbBS23S3UwA0gYV+PF7j2iyiiMay52AXh8R+z5kZco
         FoIhzTK+jReDJ5r4SGgzafM0qOJOl5ozE55R6lAWCcxHRAcWePsqHvFXEZaF3VE0wM
         hCHP5y1d9th2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5552CC05FD4; Mon, 30 May 2022 05:34:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214875] USB 3.1 device cannot be detected
Date:   Mon, 30 May 2022 05:34:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mr.yming81@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214875-208809-kSCU1euz7S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214875-208809@https.bugzilla.kernel.org/>
References: <bug-214875-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214875

--- Comment #6 from Walt Jr. Brake (mr.yming81@gmail.com) ---
(In reply to Michele Tucci from comment #5)
> My USB 3 external hard drive cannot be detected after this fix.
>=20
> To get it working again, I restored to 10 (20ms) the value of
> desc->bPwrOn2PwrGood in drivers/usb/host/xhci-hub.c:347.
>=20
> This is how the device looks like from lsusb:
> ```
> Bus 004 Device 002: ID 174c:55aa ASMedia Technology Inc. ASM1051E ...
> ```

Maybe you should using the reply to instructions from=20
https://lore.kernel.org/all/1618017645-12259-1-git-send-email-chunfeng.yun%=
40mediatek.com/
to raise the issue on the linux-usb mailing list.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
