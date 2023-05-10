Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E06F6FE4CD
	for <lists+linux-usb@lfdr.de>; Wed, 10 May 2023 22:07:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235889AbjEJUG5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 May 2023 16:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235731AbjEJUG4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 May 2023 16:06:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865263593
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 13:06:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2295663E2C
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 20:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BE81C4339B
        for <linux-usb@vger.kernel.org>; Wed, 10 May 2023 20:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683749213;
        bh=opCKHYuun+3Pe5tP2D5fTLVZZ49KZkKPcyHJU8IXNDU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=QCR66f8uGr8XWQlZEh1oZPEE6HE1thjNS1d2nyh7otwyRQS6pzSwKcIv5yrPwpMvB
         ncE0hm45rTk//cpynqBf+OPujqzpwQHC5dS4cRNbtU3MCL+xkHdeAvwnDPogRahsUi
         8CAYZoa404BslNNJP9jDakBZhBdvQa4Itftum+PeVAMi8Ao3ZeM3l5VmqTTnpfH6d2
         F2Zibd4kz5DwrrQa7cIOv5WFNvmyFTdIv8hycCco3A+GJDYWlBfVLxtLIosd0iLkSu
         lf429DvExmSsrn0xLxdSTV+LgKRFnO1ZbhNlqcBajuMBf5LbH4SeWTqP9/flwyXTqC
         X2eOzKjUnrD6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 588CDC43141; Wed, 10 May 2023 20:06:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 10 May 2023 20:06:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t-5@t-5.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-1Fic7BvIGM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217122-208809@https.bugzilla.kernel.org/>
References: <bug-217122-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217122

--- Comment #13 from J=C3=BCrgen Herrmann (t-5@t-5.eu) ---
Another round of bisecting is done. I'm quite sure this result is useless, I
will post it here nonetheless. Please comment!

$ git bisect good
b006c439d58db625318bf2207feabf847510a8a6 is the first bad commit
commit b006c439d58db625318bf2207feabf847510a8a6
Author: Dominik Brodowski <linux@dominikbrodowski.net>
Date:   Thu Sep 22 15:59:31 2022 +0200

    hwrng: core - start hwrng kthread also for untrusted sources

    Start the hwrng kthread even if the hwrng source has a quality setting
    of zero. Then, every crng reseed interval, one batch of data from this
    zero-quality hwrng source will be mixed into the CRNG pool.

    This patch is based on the assumption that data from a hwrng source
    will not actively harm the CRNG state. Instead, many hwrng sources
    (such as TPM devices), even though they are assigend a quality level of
    zero, actually provide some entropy, which is good enough to mix into
    the CRNG pool every once in a while.

    Cc: Herbert Xu <herbert@gondor.apana.org.au>
    Cc: Jason A. Donenfeld <Jason@zx2c4.com>
    Signed-off-by: Dominik Brodowski <linux@dominikbrodowski.net>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

 drivers/char/hw_random/core.c | 36 ++++++++++--------------------------
 1 file changed, 10 insertions(+), 26 deletions(-)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
