Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98E7C630AED
	for <lists+linux-usb@lfdr.de>; Sat, 19 Nov 2022 04:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231409AbiKSDCW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 22:02:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231524AbiKSDCV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 22:02:21 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13D4DAA473
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 19:02:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C3411B8255D
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 03:02:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AF3BC433C1
        for <linux-usb@vger.kernel.org>; Sat, 19 Nov 2022 03:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668826937;
        bh=3H042drw468bnebOHYVZNixrtRxiZvRnYHbFgRP/MnQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eOm/cbi2XAKE2xGP6hIx73+ty5lRUeViaMR485Js2NW4ygVS9H3FBjpFr9WqhOV8c
         JcIYylrYg+f5dAi14e/7vmN06Y4lNYbbcUSawXT34hmlABasWWlUpagy7e2sTCKYow
         GiBwbR6NANX2LdyhzVebNE4N+mqdnTqR8fQWpfuO8k6LNYVGJBcGWp6zdQoTSt5505
         2x1zp3gSf/RYlqTYORT10k0q0LGPLheH14ngPwVd6JU+eFFXiRrH4MEidZUP/l/zMX
         PyPl1LhafeTo4HdyqwvmNxNET4OcNke7Z2mYf7Epuf4GlVo6Z/52HtpCkTDOyBgfJx
         1bTwi2d53AJWQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 600B7C433E4; Sat, 19 Nov 2022 03:02:17 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Sat, 19 Nov 2022 03:02:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: roman.sstu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216697-208809-BVO8OX6vwU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

Roman Belikin (roman.sstu@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |roman.sstu@gmail.com

--- Comment #3 from Roman Belikin (roman.sstu@gmail.com) ---
Hi, I got the similar issue, that I've explained here -
https://bbs.archlinux.org/viewtopic.php?id=3D281375
Blacklisting this module also helps me

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
