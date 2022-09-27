Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E60995EC462
	for <lists+linux-usb@lfdr.de>; Tue, 27 Sep 2022 15:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232506AbiI0NXx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Sep 2022 09:23:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232788AbiI0NXW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Sep 2022 09:23:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17CFB1B34AE
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 06:19:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5CFB7B81BB6
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 13:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13B5CC43145
        for <linux-usb@vger.kernel.org>; Tue, 27 Sep 2022 13:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664284724;
        bh=i/T8y8O3VMWQcjv5ftbcXOgbKgA2CfgEcWGXBrHWJoc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qM7Gj8rq7oIhO5xYg2oBeCyUiQJwg9kp5ZIhHmI9wGM8Nu8I+demFJL7kHLbHKlBH
         Axc1sZXtiX8wd+9pteHUTb7MQRFcyXCz7QqFYiO0XYVBJbxRgQCuauLykZRlRtlzAn
         r9bKRWO5TCvNjh2mtxPEqnVH0I/LSQqfD0pRi1knhWoHnpi4pJYIrV2VMxNWNKhJSN
         tII5/rCECjeON8KQKl0yHKxAg9h9nt+O8L+gKuWTuvj4b62xh4iq06uguBJT8Hm9B1
         GlDmQXmCCrFCxZMq/euG6ar7wBPunQktQpXzj3m3p9fSTpDU4tVnRgtBgAqCNPPjAi
         yOL+HZe254YVQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F37F0C05FD4; Tue, 27 Sep 2022 13:18:43 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Tue, 27 Sep 2022 13:18:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bastian@rieck.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-0bzXl5m4Ul@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #35 from Bastian Rieck (bastian@rieck.me) ---
Dear Heikki,

Thanks for your great work. I was unable to reproduce the DP bug so far. Wi=
ll
try some more.

Best,
  Bastian

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
