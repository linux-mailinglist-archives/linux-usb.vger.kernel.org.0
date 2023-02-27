Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608F96A3F13
	for <lists+linux-usb@lfdr.de>; Mon, 27 Feb 2023 11:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjB0KDX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Feb 2023 05:03:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229595AbjB0KDV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Feb 2023 05:03:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3EAC128
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 02:02:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B269860DC1
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 10:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A990C433EF
        for <linux-usb@vger.kernel.org>; Mon, 27 Feb 2023 10:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677492165;
        bh=o17RXPFoo7KG3eq0Ksam5afh+x8qCb+uvAlsg8gaDwk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lpl/xp6xQJUPoR+GploMF36B/iB7lADUau9B9zzE42a4OG14drIJ6ki32p+CjjQk9
         E0aK/I7yxIvmGaWAfYdJVW/t/3eInDunxhBOjLzBPMMH/jBpbQsdcq6s6nDGXc0pu2
         2uoT1/z3u2HRHRVi8Avwv6fEEzlCRe4yy6NOj2bpny7k6QeAQ3vpfPjUL1c730LIoC
         eLcVldlhjxIb8eBhHjqjxH3879ynQ6fytpa6KL9D2rpd5acdguWzi4mPJLWUpaByZO
         jiqMLmIxJxQ86z1FLput6gtvPTJUBR4CHMm9auCgkiitALHnerJQ8v5BNOupZZaujT
         k9rIDbDEtnWWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F12B3C43142; Mon, 27 Feb 2023 10:02:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Mon, 27 Feb 2023 10:02:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaufmich@valino.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-yZdj9CNUta@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #4 from valino (kaufmich@valino.info) ---
there is an issue on github, you might find useful information there too.=20
https://gist.github.com/timnugent/ed65a79b2bd6c63788bfada3624756a4

thanks for your help. will do everything possible to help you

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
