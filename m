Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62F996A6FED
	for <lists+linux-usb@lfdr.de>; Wed,  1 Mar 2023 16:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjCAPj7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 10:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjCAPj6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 10:39:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D548B38004
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 07:39:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7B1B1B80FE1
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 15:39:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 160C8C4339B
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 15:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677685187;
        bh=H93sCPNvIOrVekx6OzDbGEnGfY7KNEJa5IeEXdc/aPc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=tRTv1YjQtnvHj/25QnxkIMD9gB6zgSVwpB4iXzpRFdTKPN87aRTSJv1nIbsYB0ato
         jo0MG/U71w/ufQf08KN3WNgyWD3jbZ8LTh3gWFGHC8jejY7XBZoOiVn9w1n7rDcprO
         Gilmrkpev5lSaaEDDgEHk3MpDQeU3W+/CbHVKQe9HJBzyrFlu1g0T0pZjV/9AhfdCj
         nKOHm0dy5M83qPM7Ka6IqdC2OV3VoOchqgz2+4P++W2MUgmSIHNIlRio7R/gDrckkU
         ADtVGBuWkdHQudlxd26NUCOAt7Wl1z0t55JrKyyaExZOXO7g335d/Fb3oB9RTJijFO
         lq/M1xpRb6zpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id F094AC43143; Wed,  1 Mar 2023 15:39:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Wed, 01 Mar 2023 15:39:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217089-208809-Mdum6v1pXz@https.bugzilla.kernel.org/>
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

--- Comment #21 from Pierre Germain (pierre2008@gmail.com) ---
(In reply to Alan Stern from comment #20)
> In the meantime, you can mark this bug report closed.

Sorry Alan, I don't see that option, I think I would need more permissions.
There should be a Edit link next to Status: NEW but I don't have that optio=
n.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
