Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75DF14AADF2
	for <lists+linux-usb@lfdr.de>; Sun,  6 Feb 2022 06:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbiBFF1s (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 6 Feb 2022 00:27:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiBFFZz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 6 Feb 2022 00:25:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D73C3C06173B
        for <linux-usb@vger.kernel.org>; Sat,  5 Feb 2022 21:25:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6634560EB0
        for <linux-usb@vger.kernel.org>; Sun,  6 Feb 2022 05:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6B0FC340F4
        for <linux-usb@vger.kernel.org>; Sun,  6 Feb 2022 05:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644125152;
        bh=RY2IC3j7yva/RSsF6mb3ln7ShcIsbBZp6cl5N4OCGKY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WJgGLfSK5GT1OKylTJsw/98Ysv0Nkj7wM/O98wBe8axSYlQ1UXfcAkI7mVoNNkLDa
         Beop6WNN+nEuIhqUN2NPSpqtuo9OR9Jw6ihRdwphMIv3kCTM4fMQdGmj8TvUIpIXD3
         2xr2uu/R8f/U6a3pIP0dj0JK5A89AMJVeQ2uoHBdQzQcdxpCWFdhK8+/DVVEGKpwZT
         MJ82jdrTOKX7DbjIzLbT6/r/DcZv02uf8e1HevOscWDxL9ah0R875XpTtGYo3/qkmw
         lMKnMkBNXRUcFNTkCUHVz1Di93XrRLHGSZnB91He46kOjYSZ7j18lCW4eQI54Bh2XR
         n0toy8oMXQZpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A5AC4C05FCE; Sun,  6 Feb 2022 05:25:52 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Sun, 06 Feb 2022 05:25:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: saipavanchitta1998@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-Zn2PE2Rgwp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

sai (saipavanchitta1998@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |saipavanchitta1998@gmail.co
                   |                            |m

--- Comment #9 from sai (saipavanchitta1998@gmail.com) ---
I have been facing this issue since the last two months or so. This problem=
 is
very troubling as the low battery indicators no longer showing up resulting=
 in
hard poweroffs and other issues. Could anyone also try to comment on the st=
atus
of this bug report?

My hardware is Lenovo Ideapad Flex 5 - 14ARE05. For a more detailed descrip=
tion
of my kernel and hardware this hardware probe can be helpful:
https://linux-hardware.org/?probe=3D981deab8ee

$ uname -a
Linux archlinux 5.15.19-1-lts #1 SMP Tue, 01 Feb 2022 17:37:22 +0000 x86_64
GNU/Linux

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
