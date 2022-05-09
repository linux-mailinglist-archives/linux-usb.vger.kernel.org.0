Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 864D251F7E3
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 11:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbiEIJ1k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 05:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236183AbiEIJFp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 05:05:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAC1D1B3BAA
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 02:01:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 54200614C3
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 09:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1C8BC385A8
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652086825;
        bh=6HbtAJTGfSbmA7xr7u4ZhmjVEBsm8YTOPVqHb5xDzIU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=VPQ52ZRRDPlHLzYsL0QxWR/1onQpS7aTZ/lFa9PqirP5wH0xpaV6W37wcPdK95niX
         mF5tzVh1fYTEZtNKyzFgUJgByO/qyyxH7sff0Md1/MJ2wWfTNQJ5IidgSmsWBpEcvx
         jNgVJxaI93DiwmEY+Hd6TQnN+IaRckMHrftjG3CbXE5zrcpFpTeBNhR5YLtJmzPGAv
         BK+293F3H97r0yCx+MesaBWy0fuKUIz2nR4w1Fg5G4BMz4QeSujwRaq1EuIrjuLPoc
         l0NBsPhZKsINLE6yWoq/xPv0IXRQM4EwDQSGMDwcPRkB7sRMllmG/iGCdTLoey8/49
         brqj1nf4tO1IA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5F397C05F98; Mon,  9 May 2022 09:00:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date:   Mon, 09 May 2022 09:00:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: qba100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-iwEkzBZFiS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #7 from Piotr Pi=C3=B3rkowski (qba100@gmail.com) ---
@Thorsten Leemhuis sorry for misleading you but when adding this bug here, I
didn't know it wasn't an upstream regression - at first look it looked that
way, as I also observed the problem on the upstream.

So far we only know that in one of the kernel configurations the problem do=
es
not occur - but this does not mean that the problem does not exist.

> Any chance you could bisect this on upstream kernel?

I'll try to do it this week

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
