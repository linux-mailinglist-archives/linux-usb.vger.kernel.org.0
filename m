Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1E9A61DD2A
	for <lists+linux-usb@lfdr.de>; Sat,  5 Nov 2022 19:28:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229889AbiKES2v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Nov 2022 14:28:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKES2u (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Nov 2022 14:28:50 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90B12DFE6
        for <linux-usb@vger.kernel.org>; Sat,  5 Nov 2022 11:28:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2F3F960B7A
        for <linux-usb@vger.kernel.org>; Sat,  5 Nov 2022 18:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7C4AEC433B5
        for <linux-usb@vger.kernel.org>; Sat,  5 Nov 2022 18:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667672928;
        bh=Ty1mOBa2tUqEVXCtEZ5RqfeLVbr9dI4diLWc4mztVlw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QrguZD9onGZgb1HCVrsAfwB3VtsTBCR4h4HPMWQI/M8H+aIUa1ghqIIeVI4Sh4SgJ
         +KhiRJcOvaaAOanwrJjzI02PuW8awQxf6tyXlPJu6mbs8UxVHHRjIc5Y5Aax2G9wh+
         PjvRU2HULq/M22a4g3GAJyuTXWq/Z7+L4P8aDpnw6aITdqRaBQu7XM0eT6Stvi9aRo
         RUFq64GWaCPlMR59V5vsyQueRK3udRrC8QSMUm+MoBIo2JJWKL9XvrQzMxwhnBy6CY
         LU8DZlSf36ymWmstka4A0bWXm4X7HdKDrM6XNghsLZ5I1bLLAE9w8g0W5pf+a7u0YF
         8ZtEMGwhT5Zfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 61928C433E7; Sat,  5 Nov 2022 18:28:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Sat, 05 Nov 2022 18:28:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-syexvownDX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #32 from Konrad J Hambrick (kjhambrick@gmail.com) ---
Bjorn --

You're welcome.=20=20

I was unable to successfully apply those patches against 5.15.y and then I
believe the patches were reverted or partially reverted in 5.19.y.

I will consider running a newer Long-Term Kernel when it is announced next
month, especially if it fixes Discrete Thunderbolt and especially since 5.1=
5.y
will go EoL in Oct 2023.

Thanks for all you do for the Linux Kernel, Bjorn !

-- kjh

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
