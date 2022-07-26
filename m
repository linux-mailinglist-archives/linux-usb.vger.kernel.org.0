Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 325EB581623
	for <lists+linux-usb@lfdr.de>; Tue, 26 Jul 2022 17:12:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbiGZPMM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 26 Jul 2022 11:12:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231784AbiGZPML (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Jul 2022 11:12:11 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C82312F00E
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 08:12:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 5F314CE19E8
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 15:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 907BFC433B5
        for <linux-usb@vger.kernel.org>; Tue, 26 Jul 2022 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658848325;
        bh=eT6ePSAw0AXByDde07Eip3pRO7e71D60fnpBRWNow4E=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=N4ilJB6fZOuyIBI2V7xg3lZUIp2kgjajrFaPElOhCWAvI++tGnNRTOPvCxdsA9ZCJ
         wNWPy0XSLZ9ZLxm1C9db6uK5l7elO4zuZp3ltrI/yIbzoCVkAEeMDQZWu96kpEIVhm
         jrvnysHbjnIw8yvNh3s861rwwEYoiNSCBuMKhVuNofm5atJn/FQO/ivXrequGBdpCN
         nPwXURV5F1+yfECdWJYpDQKW8new8XhnEj2xegOcGvsTjTQuv0B4BRt64yuiOlS5kO
         O8hdY+3jxCMFHMeI1/bngDWTMd6IDbuqxN/hOeSoeYgeO6uB/rF+oiRStxlklQQA1I
         mPUgZIdRwMNqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 76528C433E4; Tue, 26 Jul 2022 15:12:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Tue, 26 Jul 2022 15:12:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215890-208809-MkUdBsh7Rt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

Satadru Pramanik (satadru@umich.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|REOPENED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
