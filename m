Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFC1F5E97AE
	for <lists+linux-usb@lfdr.de>; Mon, 26 Sep 2022 03:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbiIZBYy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 25 Sep 2022 21:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232918AbiIZBYw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 25 Sep 2022 21:24:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C987012775
        for <linux-usb@vger.kernel.org>; Sun, 25 Sep 2022 18:24:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 86202B81133
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 01:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37BE1C43141
        for <linux-usb@vger.kernel.org>; Mon, 26 Sep 2022 01:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664155488;
        bh=EaIxf/9GCQ5N7SmlRwFr43/B7wE1IADN4MIow2XkkM0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dkSGVBfHay+f0+W9B3jEGlJY67PeyC24vJtgqNnQwgYeFXSxG209bsi3b4kT/N3hk
         u7QCezGjHSVLAYL7uy/ZQxzwOSbFtDkaWhh5i9DFvh+IS9yj1bGJAdfUPtK0wtdhUh
         R3Qhtq352+u0seet88dgEyX6kHgalCP+MSDIm5hEZ8lNG9gzzR2KkRfeAbwk1iqi0A
         W9r4+RFRJMYAYeGV68U14/REwEhG5E8Tvk+gHotNQtF88uj7kwo1HRS2ZumJ1UyEPA
         Ob0g5S/8ke7dVa9fTMSp0bIpMfLuYHUkSh1YNOfeV3/oS+xmrMG2Rxc4BiyiJDpo79
         4t2ohEKjJB20Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 26EF3C433E4; Mon, 26 Sep 2022 01:24:48 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Mon, 26 Sep 2022 01:24:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhnmlkvch9@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216497-208809-5U8x63bHmj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

--- Comment #11 from Jonny Mako (jhnmlkvch9@gmail.com) ---
I can confirm this issue is fixed in 5.19.11-arch1-1. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
