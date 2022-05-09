Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE34351F439
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 08:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233747AbiEIFyM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 01:54:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234975AbiEIFq1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 01:46:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DE2515C1BE
        for <linux-usb@vger.kernel.org>; Sun,  8 May 2022 22:42:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6342261168
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 05:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE91FC385AB
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 05:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652074923;
        bh=DuxTUND8L6WoH+r0JORUn5QrjAlxjoJLz0YTqVoWNKY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=jvSGoUf8po0n6uCOB5XBtaChF1CiWNHEVbVjMXn1aVg/FL6Gqd+vrI3ZvSz7lUGgE
         MhYS1FKq8QswtinSCEyTTjYS4wNrs8C+fU9rfB7aVEybmvt2M/cyI/QorYvwIgiMKB
         pRyw7Zb9NE0LA7o61nAiOxKOAGFM0pwYi3esWpcHgmkfO3U0pR29iI8BCwpxemwKDb
         WghyP8XYjnASKF1x8hzRaOzdhDBgu8b56aDvNNlUNZYfv5SroqH8dtzIxHwxju7et7
         XmfBiaYrKxp+CR2pEnFndsL5+Au8e3OObPtI7BVUnRgw6dzzrBAjhoB8D2Zwi5ibAd
         bvTx0IygESosw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ACB16C05FE2; Mon,  9 May 2022 05:42:03 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date:   Mon, 09 May 2022 05:42:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-w1iJq0zdAl@https.bugzilla.kernel.org/>
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

--- Comment #5 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Sorry, this is starting to get confusing and hard to follow.

If there is something that used to work with an Ubuntu kernel and stops wor=
king
there, you might want to report it to the Ubuntu developers, but not here.

This bug tracker care mainly about upstream kernel (see front page), so what
happens with a kernel build from the Ubuntu sources (which are known to be
modified a lot) is irrelevant and even just mentioning that makes things ha=
rd
to follow. :-/

Regarding your problem: I'm not familiar with the code that might cause thi=
s,
but to me it looks a lot like Ubuntu switched on a kernel configuration opt=
ion
that is causing this. If that's the case the problem doesn't qualify as
regression, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

The developers nevertheless might be interested in fixing this, but might n=
eed
more details from you (like the config option that is causing this)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
