Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B79B76771EF
	for <lists+linux-usb@lfdr.de>; Sun, 22 Jan 2023 20:34:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbjAVTer (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 22 Jan 2023 14:34:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229807AbjAVTeq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 22 Jan 2023 14:34:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD961A953
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 11:34:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 879C060C96
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 19:34:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE871C4339B
        for <linux-usb@vger.kernel.org>; Sun, 22 Jan 2023 19:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674416084;
        bh=/y2WTyHvMU8uIi1jM+8439kofRRe7KW4xuyiFSVSWa8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Pe6Q4VF5Xf+cdMiitex47/wyEMO21AsuzBWnl2M45Jj8oP6G/sbJbcL7Pl/yAjBIw
         b3bEwL4Z3r4QoFa8zRWEaj1FwtXhfQnWLY+iCgAVnVbj6+NZaP8wNT2ps6OuN1Y8Kl
         S0r+QbCmGZaELCAQuKX1GMHidTclfB/QB0cFUjk/QcFwlpk4Z001zgtU8Z5XtypCsL
         wUnVs0OGKXitUUJoM195ek3g+zf5iJpFkMCpqW8U6A+QW4H3aTaKs2crTp+cJKRicb
         6+BdGiVMrGg0yKWl8orEPokyWk5OWczwVbHwkzg+A0N3jFKxFhQlqeLMn/ccTHjN6x
         DbLXhCEOPxUiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C905CC43142; Sun, 22 Jan 2023 19:34:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216810] uvc_video: 0010:uvc_video_decode_meta+0x29a/0x2b0
 [uvcvideo]
Date:   Sun, 22 Jan 2023 19:34:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: andy.shevchenko@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc component assigned_to
Message-ID: <bug-216810-208809-vM42MuhNgG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216810-208809@https.bugzilla.kernel.org/>
References: <bug-216810-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216810

Andy Shevchenko (andy.shevchenko@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |andy.shevchenko@gmail.com
          Component|USB                         |Other
           Assignee|drivers_usb@kernel-bugs.ker |drivers_other@kernel-bugs.o
                   |nel.org                     |sdl.org

--- Comment #2 from Andy Shevchenko (andy.shevchenko@gmail.com) ---
Reassign to Laurent.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
