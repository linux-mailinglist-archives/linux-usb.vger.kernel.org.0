Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3E3547656
	for <lists+linux-usb@lfdr.de>; Sat, 11 Jun 2022 18:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238956AbiFKQHd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 11 Jun 2022 12:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239031AbiFKQHa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 11 Jun 2022 12:07:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60CCA32A
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 09:07:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C7CC6B80976
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 16:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81A92C341C7
        for <linux-usb@vger.kernel.org>; Sat, 11 Jun 2022 16:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654963644;
        bh=jyDvL39YKL2hXRk3/YtbACV8x2hWKvKHZoZ4j4oHIIE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=uVFMkxPHXI9BKKgCNaLnPnBq7dDDUqn4fCT4FA4Gptdp0+K/f7pctY/cUatMvBsj5
         99xvjEY31JHNYjB4sBn1rkIhuF536Cy2izXyzjFMPw/1jleCt4XjcjVfM3bt77HoAR
         ZNsT4r87TG+gxVq1Yv234ABmLaauyVXF+PjWkQnUbKjFnS4FIWTQmf7NO/zM1uUk8K
         Ef613dwwl5Z32OCTloI+qEGLrHfgGLIzO//gIJ7JwafDepMyskDaYZzdNQ4boE1Fg2
         c82bN6NSZLppt2voFb+F5iCTsRao7CUfsAQFlAewso+GlDFA+CoiRX1hes+iYY1nqt
         A5bq2eDbXQ62Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 6DEABC05FD6; Sat, 11 Jun 2022 16:07:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 210425] Plugging in or unplugging power cord while system is
 suspended does not trigger updates
Date:   Sat, 11 Jun 2022 16:07:23 +0000
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
Message-ID: <bug-210425-208809-rZ4Htmhf7Q@https.bugzilla.kernel.org/>
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

--- Comment #16 from Bastian Rieck (bastian@rieck.me) ---
(In reply to Daniel Morgan from comment #15)
> (In reply to Bastian Rieck from comment #14)
> > Does not appear with Arch Linux 5.18.1-arch1-1 any more.
>=20
> Odd, I still experience the bug with Manjaro kernel 5.18.3-1. Plug in the
> charger, boot, sleep, unplug, wake from sleep, and the system reports it's
> still plugged in. I'm sticking with the 5.4 kernel series on my laptop un=
til
> this gets fixed.
>=20
> Are there any other Arch users out there (or users of other distributions)
> who have the problem solved on the 5.18 kernels?

I celebrated too early---the problem just re-appeared; I am now wondering
whether this might be indicative of a timing issue, because I could change
power status ~1=E2=80=932 times after waking up.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
