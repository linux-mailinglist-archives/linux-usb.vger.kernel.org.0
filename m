Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC864F8A16
	for <lists+linux-usb@lfdr.de>; Fri,  8 Apr 2022 00:15:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbiDGWNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 18:13:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230525AbiDGWNA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 18:13:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2A592F233A
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 15:10:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8682F6200A
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 22:10:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2978C385A8
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 22:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649369458;
        bh=tIAV/xUVxYW5zk0Txvc8rFDML5isM2JC3s3rhKcUfVc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hJJ6jJqwGMKzm0wf6rLoklyFSAKXgRh7+/EZlK5tqmWZC0Y6aHu8jztbBAjYwCoZA
         YrTcbIzRudALgZpb5l9ulEU6APoHnCVXdrloQLPW2/w1TgPG6mriajmXlsz+j1s+6K
         SakCmZYTIiyNbXsJHGSJ802A2HirpTGYhJHwCrWvPDQoisU5tlwW9LFtzT6wQg01kW
         mkQeRcFVX/BWViXVijjY2UIBeD/qnHJWoZKTYG21MFTiyV6BNExdmJZR0r/EHsv+Ko
         /Wf3LXfOpsyCmq6kXa7s6HrkOQuX3itxqg9Vv4LIMv35BiavYuEG+xu/vroAHmbQtO
         dc+SK9eqP+xWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id CB40DCAC6E2; Thu,  7 Apr 2022 22:10:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] apple-mfi-fastcharge causes automatic pm hibernation
 entry, when iPhone gets attached
Date:   Thu, 07 Apr 2022 22:10:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: labre@posteo.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-215799-208809-Gr2utJHU6F@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215799-208809@https.bugzilla.kernel.org/>
References: <bug-215799-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215799

Manuel Ullmann (labre@posteo.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|CODE_FIX                    |INVALID

--- Comment #10 from Manuel Ullmann (labre@posteo.de) ---
> (In reply to Manuel Ullmann from comment #8)
> > It just allows to change the charging type (Fast|Trickle).
>=20
> This is one of the things that power_supply class devices can do. They do=
n't
> have to report battery information if it's not available. Guess I have to=
 try
> this out with my laptop for comparison.

And userspace has to handle that. I get your point. I can implement the sco=
pe
handling, if I find any documentation on this.

> If you want to read the battery information of iOS devices, it's available
> in upower after at least one user has paired with the device.
Okay, thanks for the hint.

Changing this to invalid, since userspace has to handle that.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
