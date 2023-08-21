Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD607782935
	for <lists+linux-usb@lfdr.de>; Mon, 21 Aug 2023 14:35:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234900AbjHUMfD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Aug 2023 08:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbjHUMfC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Aug 2023 08:35:02 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1DA6BE
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 05:35:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 38CF8634B8
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 12:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E939C43391
        for <linux-usb@vger.kernel.org>; Mon, 21 Aug 2023 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692621299;
        bh=BhWHuX0mnF/Xgek/frkRrDJ577/VXrnK/UUdWXkdEm4=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HYHszZ8BGJdgu01+E7aAvUr0yX1/GX6T2zEapWkLWDVblD7HaYVrDh0tMzpRTxJoY
         cy+hXhNG1cgUzF3WzYeezgiMKP6IpjosAqUEcABOdUR4527eqeNhnZ5sdaCEJOLQbX
         wDB4PMuzLg1WY6gRpXmOH8DzZmE+H56Bl4v5F4mjkhdOzOAASG8DkA/R4UdvxgMaHd
         i5CKcNUYHqLTbsfxgidLSoxpC4XNeejdnVk4TanzZBTrhunCveIe8DRfUC+Tg3pIAj
         TWycg5lWC1D00GT7dh8zed6zlUiJVsN4B1V9U2OVvtXtxqmQj8ahB0wrJXtQjDRuAk
         YJdfKUA5/t0CQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4D9D5C53BD0; Mon, 21 Aug 2023 12:34:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Mon, 21 Aug 2023 12:34:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kparal@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-0wwBKmG45d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Kamil Paral (kparal@redhat.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kparal@redhat.com

--- Comment #35 from Kamil Paral (kparal@redhat.com) ---
Hello, a fix for this bugzilla ticket seems to have caused a regression on =
my
hardware. A Thinkpad T480s laptop with a Thinkpad Thunderbolt 3 Dock connec=
ted
can no longer resume from suspend. I reported the issue on the linux-pci and
regressions lists:
https://lore.kernel.org/linux-pci/CA+cBOTeWrsTyANjLZQ=3DbGoBQ_yOkkV1juyRvJq=
-C8GOrbW6t9Q@mail.gmail.com/T/#u
https://lore.kernel.org/regressions/CA+cBOTeWrsTyANjLZQ=3DbGoBQ_yOkkV1juyRv=
Jq-C8GOrbW6t9Q@mail.gmail.com/T/#u

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
