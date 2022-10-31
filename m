Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F39F36138F7
	for <lists+linux-usb@lfdr.de>; Mon, 31 Oct 2022 15:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231381AbiJaO35 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Oct 2022 10:29:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231596AbiJaO34 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Oct 2022 10:29:56 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D27865B1
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 07:29:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 5E4FCCE168C
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 14:29:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70E6CC43145
        for <linux-usb@vger.kernel.org>; Mon, 31 Oct 2022 14:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667226591;
        bh=RwoprIFeVuZBUKVMUEDwyRgiLUGSqI5ruGW8f2b1PDk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=GX3vbrRlTUmJG/SjS+TnAlvJJuRmPYl048eTAVHaJPiz1qFTzSU9icp7W4n5wJ/+e
         x0CBIcgwpF1qgeTCNZ8V9tUFrarAuYH+WL1ee16ojyr76zOj4JqUN6oY+28NA9Mnul
         iK/jiZfh9MUn9eM+y4l0TmEfB5I60KhrEy1CnpPU4lEkC+DRv1/Bw8bwp09v0t27x7
         Lj3h4UmIyEL5QxJV5WPRpU6ScTsIelAibkyY18VDNFTnZUd0KqcZ/GLPfe8XuvDvh6
         rsi6chhlToNagdWnEMHxsdNLAggyAczUHX8PAOfDZGn1wWty5Lk8s1mLCryoyhbcxg
         6U6TtV/5jlphA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 62D4AC433EA; Mon, 31 Oct 2022 14:29:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 203419] Logitech Group USB audio stopped working in 5.1-rc6
Date:   Mon, 31 Oct 2022 14:29:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jk@kifmann.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203419-208809-pJrOb6nKZr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203419-208809@https.bugzilla.kernel.org/>
References: <bug-203419-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D203419

jk@kifmann.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jk@kifmann.net

--- Comment #51 from jk@kifmann.net ---
Same issue here when I switched from 4.19 to 5.4. The original patch regard=
ing
0x0882 did not resolve it for me. So I tried the extended patch by Peter,
adding also 0x0857, and that made my setup work again. Any chance to get th=
at
patch accepted?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
