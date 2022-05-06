Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AAF251DC90
	for <lists+linux-usb@lfdr.de>; Fri,  6 May 2022 17:50:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1443178AbiEFPxm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 6 May 2022 11:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1443053AbiEFPxY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 6 May 2022 11:53:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1030E6D87D
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 08:49:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9A56862221
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 15:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1AF6C385A9
        for <linux-usb@vger.kernel.org>; Fri,  6 May 2022 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651852180;
        bh=HvUOVZsieNwZInGXKsfy113D37O9Y6eMEAAWqo/Wy4M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=R9CKCMWigShsmxECgYzUoDPCfN78wXshUdi++t6/5baR/vc38OU4qD1/g6b3WuPiY
         x5FSRo0DnpTADS1O1sB43G6pbVfieX6bVA3YUP/Tw0TxttIGJKOJW3CcUJWNlXHqv+
         /i0U/PicIKWhJCf2vgBgZMaRMIJwO6szy0dhPO5pNlPOQwIQ1Z4EcRFcQAFo4kRTO0
         zMgSBUtyIUQdp7o6woUrUV2IxRuuXYN1QrUmZ/i9v4o2t5XMiWUM0sj1WmJwSUyLgs
         FoKOr122H1n9uVHCszKVJZ6r7zkUd+QRoxP2lfWOyEqIU1I2whrgItXweIhVrqKnHX
         xJxHjx/EJsVrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CBDE6C05FCE; Fri,  6 May 2022 15:49:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date:   Fri, 06 May 2022 15:49:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: qba100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-timuBWGNUy@https.bugzilla.kernel.org/>
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

--- Comment #4 from Piotr Pi=C3=B3rkowski (qba100@gmail.com) ---
I've misled you a bit by saying that the bug didn't occur on the 5.13 kerne=
l. I
tried bisecting on the upstream kernel and it turns out that the problem al=
so
occurs on the 5.13 - I build it using ubuntu default config from kernel
5.15.0-27.

So far, the only kernel build I haven't noticed a problem with (excluding
kernels 5.4 from Ubuntu 20.04 LTS) is kernel 5.13.0-28-generic form Ubuntu.

Interestingly, I found the sources of this kernel on git kernel.ubuntu.com =
and
built this kernel using this config from kernel 5.15 and the problem also
occurred.

It was only when I built this kernel using the default config for this kern=
el
that I stopped seeing the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
