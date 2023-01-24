Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9584A679E24
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jan 2023 17:02:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbjAXQCa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Jan 2023 11:02:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233185AbjAXQC2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Jan 2023 11:02:28 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41EF15C95
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 08:02:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6E308B812A9
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 16:02:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0ECEEC433A0
        for <linux-usb@vger.kernel.org>; Tue, 24 Jan 2023 16:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674576145;
        bh=7MRF36AZn3Wqws0yTUFrhZbLzLS7b3Q12/0Gl85U0Pg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=p0GrNeIb/q3XP4Qjkf25TwHrhhkF6l4fi0CdhLHDn6bJnCiPlDoAw8j9VilOAlI2W
         ULftxp0yaWwtfMQnN+QizZ42RWump1xOj1kFYQX00P5lXGTHyTSqUIg+QKW8etC7HM
         wiSXqLXhECI+IyPS7tbh/JkCkpOYnRJPvssy9bn3Mzk+MKxVVvSbDh8PoEU8e18r/N
         Z0jyvdMDd5L2X7gupGniaLu63pVweZjKPCd12pgg9HHq4bttjlls+zH7F/QrVn5Q2F
         ++oHlFjPe4CSkNX0uELT1xHIPZ6RabRTs6twDyVQiEqv/Qx4ZW3MM2+vpJf696J0+y
         uqRUJoSnr/EDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EFC70C2BCF4; Tue, 24 Jan 2023 16:02:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Tue, 24 Jan 2023 16:02:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: fancieux@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216697-208809-6EJkcB8AsY@https.bugzilla.kernel.org/>
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

fancieux@outlook.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |fancieux@outlook.com

--- Comment #11 from fancieux@outlook.com ---
I also got a similar issue, I've explained here.
<https://bbs.archlinux.org/viewtopic.php?pid=3D2081073>.

In https://bugzilla.kernel.org/show_bug.cgi?id=3D216706, it has been report=
ed
that USBC resume callback takes far too long, between 650ms and 1200ms.
However, after the same commit mentioned there, my laptop just freezes inst=
ead
of taking a long time to resume.

Noticed you merged a patch in 6.2-rc5, but I just tried 6.2-rc5 and it didn=
't
work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
