Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 559C06D34CD
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 00:17:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229711AbjDAWRc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 1 Apr 2023 18:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjDAWR3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 1 Apr 2023 18:17:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FBA6265A9
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 15:17:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C5B49B80DBB
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 22:17:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7605BC433D2
        for <linux-usb@vger.kernel.org>; Sat,  1 Apr 2023 22:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680387445;
        bh=8k8ETyhm4Nvzn0j1ToGuHbtLK7Dn5OuOhO/cq1q13Yg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DMcteTLMaohsFBoKNorJSf737I/cJrv40bxxGPJYJtKFYGX6XQSSbBAY9WsPAT3M1
         SXOfcuvecATcBaVF3wuPuPP3yR5YzBXXL9FP4GeH01+ndW6RaA7G3a1AEBbiYY7olC
         zZFYwLKfuw1XI0yhuAQKAhb0UW4MmU1oKik9fbJBe+l9n+Akv1qOC1RPzHfJLijD7j
         aL+Acu521/by91XWoA5aIFzVM5Bl9GzgPKb8JBys2RHjSueL3/oQa/eWy9EPCT9liO
         Ahg5NP+KlZAtI02HZdF5Z7I9wt24cV6BA6PmqY7JLnO+x0qKoyT+I6CYIcS5oqE01h
         Kp8OouwAVxAdA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 56D78C43142; Sat,  1 Apr 2023 22:17:25 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Sat, 01 Apr 2023 22:17:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: austin.domino@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-LGiVP9fz4d@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #6 from Austin Domino (austin.domino@hotmail.com) ---
(In reply to Austin Domino from comment #4)
> The setup that created the output in the previous two attached log files =
is
> described in more detail in related posts on:
>=20
> Ubuntu Forums -> https://ubuntuforums.org/showthread.php =E2=80=A6 st1413=
6903
> and
> Ubuntu's Launchpad Bug Page -> https://bugs.launchpad.net/ubuntu/+sour =
=E2=80=A6
> ug/2013390
Try 3 (I wish I could edit posts, but I should not have pressed "Save Chang=
es"
so quickly. Sorry about this comment and my incompetence):

Here are the actual links:

Ubuntu Forums ->
https://ubuntuforums.org/showthread.php?t=3D2485480&p=3D14136903#post141369=
03
and
Ubuntu's Launchpad Bug Page ->
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2013390

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
