Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D257761A2F4
	for <lists+linux-usb@lfdr.de>; Fri,  4 Nov 2022 22:13:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbiKDVNK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Nov 2022 17:13:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbiKDVNG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Nov 2022 17:13:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E61DB4D5F2
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 14:13:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6BD9F6233F
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 21:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0620C43140
        for <linux-usb@vger.kernel.org>; Fri,  4 Nov 2022 21:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667596384;
        bh=6VexYpOSeLd/J5gzOaleXoGlgM7DeT0BRMKtadjQi4c=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=UuKxVUUwL999n53l3ni43YexV/rJJ2jVkpr06g/rk6+CKBB3lVaCIpHYtjZO5M+Ql
         on4Zz24QM1JYq+tChTizZoTKDE9461q6PkDfDrCggzgRwu6AP+36jApFHXmO778vqd
         OEv/X71EhQdSxiAlq0LMHRE7m6O1O3QUi+BySCySvud0D0vzHrubO7WukI0pr7pDwa
         1xtNsxiaaNAwUNheSIDNJ89g+oKk/iRKIl98yT+X2sqfIYr0cPPF3RX++pLFev588s
         id4DiyTMKy5Ae7/NcAzxv4xAlnxwCJOm2f6Z8OWfLvxJULfon5IGrFiVxABl0Q0uHt
         tAlwmNrxlH5Bg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A5475C433E9; Fri,  4 Nov 2022 21:13:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Fri, 04 Nov 2022 21:13:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjorn@helgaas.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-nM1Q68IAak@https.bugzilla.kernel.org/>
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

--- Comment #31 from Bjorn Helgaas (bjorn@helgaas.com) ---
Thank you very much for all this work, Konrad!

I'm confused.  Comments #16 and #17 suggest that this DMAR issue was fixed =
by
https://git.kernel.org/linus/d341838d776a ("x86/PCI: Disable E820 reserved
region clipping via quirks"), which appeared in v5.19.  Can you confirm tha=
t?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
