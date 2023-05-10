Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 800C16FE63F
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 23:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236032AbjEJV0Y (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 17:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236339AbjEJV0L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 17:26:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5585729A
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 14:25:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6C256640AA
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 21:25:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5ECFC4339B
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 21:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683753949;
        bh=l1JEX2fjZzth8AW9jZjRpzJvF9to6uHN8u0jo3hFR2k=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=MZT9L9D/7ISQ2mjD399fy0Wa/rO89mwrId4OmJE+1jzEImjgtEPmjkk8uByLbi1BJ
         9+cqyuVlV5vJezWn9zRsx3NPjqqz7qm+wQQx3Bp7RFGOnkox3SN+RKmpwgujRcI008
         kATRgebuipELqWBXNVkXdc+XIiMIp07+liMZfvK3+rzAM1bYidCBND8iNm6LzzIKqA
         4ojNAMuKx1k1M2UnpY+SbFlIRk66WZl/x4P712ijWqjqTHxE86RwM0W5jf4jLubtCi
         Z7RfRiG5aR2gWYEDu5VbStOWyaQjU5s/3P8yGPhY2PjwD3rWyQ3OyhUnD/awdHRP+m
         zntxtdRT0Sgfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A769EC43142; Wed, 10 May 2023 21:25:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 21:25:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-dmKxer9fUC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #15 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
And, if you don't have that knob in your BIOS can you please try to apply=20
f1324bbc4011 ("tpm: disable hwrng for fTPM on some AMD designs")
to a kernel that otherwise fails?

Does that help?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
