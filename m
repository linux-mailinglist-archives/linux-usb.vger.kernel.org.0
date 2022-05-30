Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D68895374C5
	for <lists+linux-usb@lfdr.de>; Mon, 30 May 2022 09:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230527AbiE3GJW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 May 2022 02:09:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229999AbiE3GJV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 May 2022 02:09:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBE3B2F398
        for <linux-usb@vger.kernel.org>; Sun, 29 May 2022 23:09:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6093061042
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 06:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD4E2C385B8
        for <linux-usb@vger.kernel.org>; Mon, 30 May 2022 06:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653890958;
        bh=JSdnl7kRstx2JsuMq9s3nN5NYfyI3aQiQUohycD1lEw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aiP1ClnPedCe4OfYfxOkbVFxEL84BQmU5vaLy3sL3LzDpcm+6R7O03FsrwA3GEt6H
         RI+h5IbUbZ9mMHplx/vJMl23h+uAKpSKdMozvb/nMksvdyCHQ9m5BzrieI53UEohBA
         xxON/PqyoiUVYqZLTaKxFNAX6DlxGdWZZJoMRc3B9MUSgTCPPNecQkCIClNvrMweSv
         8uPNvFZmWHwd9uxGVGM6PukEm20V4azkRTnRka1MdezetLANJjuKccUVfwzEwhtFNt
         yyFj5C4lcgAjpxJu0a13fJbFu39B/mUx9E0L4HIyoCKdMQUn1uB3PlmJ10fZ4bNkYZ
         45cnTVR41nkFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A2984CAC6E2; Mon, 30 May 2022 06:09:18 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214875] USB 3.1 device cannot be detected
Date:   Mon, 30 May 2022 06:09:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: chunfeng.yun@mediatek.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214875-208809-jG93K1JQFI@https.bugzilla.kernel.org/>
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

--- Comment #7 from Chunfeng Yun (chunfeng.yun@mediatek.com) ---
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

Then will be reproduced if revert below patch?
https://lore.kernel.org/all/1618017645-12259-1-git-send-email-chunfeng.yun%=
40mediatek.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
