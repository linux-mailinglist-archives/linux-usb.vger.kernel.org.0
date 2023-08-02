Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B357A76D3E2
	for <lists+linux-usb@lfdr.de>; Wed,  2 Aug 2023 18:41:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232589AbjHBQlM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Aug 2023 12:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231851AbjHBQlL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Aug 2023 12:41:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC1F32685
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 09:41:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 57E18619D7
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 16:41:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C04F6C433C7
        for <linux-usb@vger.kernel.org>; Wed,  2 Aug 2023 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690994469;
        bh=HPbXTxoe1ML8UoUOWVkXiGbLma2elLYHvvkYGrDdDJQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jnAggCLGukGsE32iWU0mAMDpxktUxU3vYgUEKzBtPoGYVyCmNyLLe4QbQ95Y+LzjT
         7xyrRq6YzWq7KYNX+AQpCQ4gqvjxN+AATL0TroaU9oxmrIsJyWE8Qm9o2DqEjiBmKu
         JW5D5TD/OUTLkxRjk6ExVVDS3y6xg26Gg/gy2XFjsW0oG8v3p/ZuGvRg2+9bhMZnKE
         JKJPBRHK9P+36j273tK1cNW9HIS31mCwPU6znQP8lLpUfJiNP53nvAwTCDZk41ys/0
         UH4iCTaaShx+8m4tIjYXoTWFgIySQZVqSusrorfd0hKtJRq2RBgrfRLYJ8w/X0QgMy
         4pF2ahGEPsB0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 956F4C4332E; Wed,  2 Aug 2023 16:41:09 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217122] Regression in xhci driver since 6.1 "Transfer event TRB
 DMA ptr not part of current TD"
Date:   Wed, 02 Aug 2023 16:41:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217122-208809-iiQee20d5Z@https.bugzilla.kernel.org/>
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

--- Comment #29 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
Try this patch.

https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git/comm=
it/?h=3Dnext&id=3D2353032d292e97005bebf346939841c6c008df7a

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
