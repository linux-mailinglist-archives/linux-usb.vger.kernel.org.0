Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 77F3F5265F2
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 17:22:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381908AbiEMPWY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 11:22:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381925AbiEMPWW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 11:22:22 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB7C68308
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 08:22:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0A62F60C9B
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 15:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69AD3C34100
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 15:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652455340;
        bh=06gm5Q+6f3rf2lLoXDlXN1J7zlJvSWKx5c4rhZXDGng=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FEgQlDvTlRQvIIaExkNNsj+QsWq7kNCp2su/ZjXnrYTwkVlc8qvpRqEdMJ2XSqv6s
         i+9lwKdVAqtBwex0CcdOFcN4lh4i2N/humtqY4s4rEopWq92HbMtgMHykRfvR3TuBv
         z5cfc99RfCwNu9Q9G5b4W9hf7IdTjVdEGd1iV7A3OR57xE3WOboHLuW1eV71xKD/i5
         RlLjuWPM+EzxHVAYMejmpPHKHLHoqjifXOtqg/NopD5Ip5557qGDnSK+NCCYDS8jj9
         DcjRH+Fy+7j1eNj7iLrnQDFT8chHbKyMMO603KA/c07akUolA7KGzNGEcQMWbXgUOp
         pGZnCthrW9aGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4DF07CAC6E2; Fri, 13 May 2022 15:22:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215890] Regression in 5.18: bcm5974 trackpad causes error:
 xhci_hcd rejecting DMA map of vmalloc memory
Date:   Fri, 13 May 2022 15:22:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: satadru@umich.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215890-208809-pId9z87FTN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215890-208809@https.bugzilla.kernel.org/>
References: <bug-215890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215890

--- Comment #14 from Satadru Pramanik (satadru@umich.edu) ---
I can confirm that the patch resolves the problem!  Thanks so much!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
