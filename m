Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDD2E5ABD6D
	for <lists+linux-usb@lfdr.de>; Sat,  3 Sep 2022 08:25:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbiICGZC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 3 Sep 2022 02:25:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiICGZB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 3 Sep 2022 02:25:01 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E08F92ED62
        for <linux-usb@vger.kernel.org>; Fri,  2 Sep 2022 23:25:00 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7D34D60C9B
        for <linux-usb@vger.kernel.org>; Sat,  3 Sep 2022 06:25:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD2BDC43143
        for <linux-usb@vger.kernel.org>; Sat,  3 Sep 2022 06:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662186299;
        bh=PHa/xhk4w3e0LIKbPJgn5PRYo2AGQYJ3BPovy+PGUJ0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=X9IWpglm7sh07wfogJeuq3O8bCH1uncKR0aBA+UL2T03SFHLAJqsXcrpu45IuHZph
         2KbOS0vckuUnz8LccpdbTxkmvEZXu1rg0wcjuTBpPS3hdwIrUDlYPUSZcks5TbYExQ
         QYCaG4Wp5c5r8PWc63ImXQlcV5qsBZwdsmItmjcdJJs8wUZivbcj901izMTJMqZZKZ
         8pJp6ot8kehs4xSxUPhz9G21J1xJiSbSJHhfAGLdSXct7JOR/8ecmTe1thpppD8ErS
         W1WfWbvqY+M5G2bSWoYurKSvp+bBGDkYImHe/LfJ+zOVM+zYFhQ9qJeE39zBUrFF3D
         PwTAqi53IS3aw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BBCF9C433E7; Sat,  3 Sep 2022 06:24:59 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Sat, 03 Sep 2022 06:24:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: grzegorz.alibozek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210425-208809-2ytiCPReEK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--- Comment #25 from Grzegorz Alibo=C5=BCek (grzegorz.alibozek@gmail.com) -=
--
Heikki, it looks like it is solving the problem after waking up,
Thanks :)=20

I have one more case:

1. reboot
2. plug in the power adapter
3. plug out the power adapter

 . after going to sleep and waking up, the state is now set correctly

it is possible?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
