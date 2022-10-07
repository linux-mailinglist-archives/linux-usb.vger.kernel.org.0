Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D4E25F7947
	for <lists+linux-usb@lfdr.de>; Fri,  7 Oct 2022 15:54:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbiJGNyE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Oct 2022 09:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbiJGNyD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Oct 2022 09:54:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A6101B7B8
        for <linux-usb@vger.kernel.org>; Fri,  7 Oct 2022 06:54:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2357C61D30
        for <linux-usb@vger.kernel.org>; Fri,  7 Oct 2022 13:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80716C43142
        for <linux-usb@vger.kernel.org>; Fri,  7 Oct 2022 13:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665150841;
        bh=rjnd0jY9mW9sfTaeTOFRlG5bUFom4b9sFA6CaivBZ4w=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PV8ulzfokpGBmDCucIjAbWdzvjYKnK8+Mf8ZHsUGOkfzogHUCz8e5jmIpXspjSI83
         Jx2Q1VCNWk4UmzLmHrdm//1xicKFdhWoGhoAz0rckc7JL+7vqDHSaotoNCiAmaXip0
         zWlZJ+Qv37FCjCSpH7rzyE5p7QKJZP2aaKxTR0n+eJTUlYRMQ1CZlvdyPsSUmAswna
         wzXOQgWs3RFazsKbIxRR7kFMj9BNDlH9tn71RGUMsE1dGpX1Gapn5CjggkN0D/aZg7
         B29y0gxnSqgOpf0fl8uGA9wUw3+ghJO+OsRFZsfiKdQOBf+fIAyifr2tkkUtCqi1o7
         lRzZC41hncv3Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 56340C433E9; Fri,  7 Oct 2022 13:54:01 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Fri, 07 Oct 2022 13:54:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel.marvin@gudel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216497-208809-iQBS2tm8xY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

Marvin Gudel (kernel.marvin@gudel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel.marvin@gudel.org

--- Comment #14 from Marvin Gudel (kernel.marvin@gudel.org) ---
Also confirming this bug.

Fedora kernel-5.19.9-200.fc36.x86_64 on a Dell XPS 13 9370.

Both Thunderbolt capable usb-c ports are affected.
The third one works (I belive its not Thunderbolt capable).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
