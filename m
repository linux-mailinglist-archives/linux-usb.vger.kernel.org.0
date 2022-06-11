Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB9385473A7
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jun 2022 12:16:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230372AbiFKKQs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jun 2022 06:16:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiFKKQr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jun 2022 06:16:47 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA5A689A6
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 03:16:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 7F21ECE0930
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 10:16:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC8CDC341C5
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 10:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654942600;
        bh=ePsQXKK6HbZNy+5+10ZixuRzsNmQcJceP54jlzgHpmY=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LBbH272gZIq12Bun5pRbqBXTxENhc3WPOTWmAdVqsOT7RDEcUbdXn+Vh9O2gqqeEy
         YviOcw/DskolXsuOKJ3UPbDgdlRt2REfUnoWvb+QOSy73kj7f8oQvRCKr+24oDCDLr
         X0fedCy2nftvECbPJmi7Vkf78w5tBDhzvGQHvx95aNLIzUrI8Vf0YGTNx2Q1rucamG
         fnEGbEw7BV5z1a3oIO8UAbmoe5X/mhibsLpZhInmAqdWMIEM2vRQZs5XG9xKnL8rQT
         y89CSkUM5SWEI+iIiwgBJAqV4YpF3eKbS2FKM4MjbpqHjjp4Z8bEAv1kYHb3vqLkKL
         0TbwG/adNCWYg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D9D29CC13B1; Sat, 11 Jun 2022 10:16:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Sat, 11 Jun 2022 10:16:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: danielmorgan@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210425-208809-E27eZ8ILcH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210425-208809@https.bugzilla.kernel.org/>
References: <bug-210425-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

danielmorgan@disroot.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |danielmorgan@disroot.org

--- Comment #15 from danielmorgan@disroot.org ---
(In reply to Bastian Rieck from comment #14)
> Does not appear with Arch Linux 5.18.1-arch1-1 any more.

Odd, I still experience the bug with Manjaro kernel 5.18.3-1. Plug in the
charger, boot, sleep, unplug, wake from sleep, and the system reports it's
still plugged in. I'm sticking with the 5.4 kernel series on my laptop until
this gets fixed.

Are there any other Arch users out there (or users of other distributions) =
who
have the problem solved on the 5.18 kernels?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
