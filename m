Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6066A69AA
	for <lists+linux-usb@lfdr.de>; Wed,  1 Mar 2023 10:20:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjCAJUU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Mar 2023 04:20:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCAJUS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Mar 2023 04:20:18 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993012DE6B
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 01:20:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D655CCE1BFA
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 09:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F146FC4339B
        for <linux-usb@vger.kernel.org>; Wed,  1 Mar 2023 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677662414;
        bh=tkU1b51L9xWINAS5pFPhw/byz+k9T/KsPmOgeanSLaM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=dfSk7WN5JoA8bRKvBc74tK3DG/zNr8B2Sxms320UFrQxABJmZjzMAl62jT1e+CjlH
         WGWAFSoIcpsMgBGxIqO5JfU53sKHmO7u7Y5uZXcTWrv1MvUDmh2HBs+/qqJScMthyG
         h90uwNmU8mz0WuYLuexKxoZYQ1jBxzHO6KP3qJOpO0XdL8V+p7HW2DuLbTHjPetoG+
         NCov1sSNi7MVY0kac5g7kDZ9qheBzl7X3u1Hi45pxY0K1QZGLQqsOBTq0M3pRv6EhY
         TVtcws0vu7JXP7WoB3rUYIqNJkIc3Jm0wWq9mw1aqNHRCnBgvkwW5LGRjANhMgbC15
         +zyhAppWnvITg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D74E6C43143; Wed,  1 Mar 2023 09:20:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217089] xone23c mixer
Date:   Wed, 01 Mar 2023 09:20:13 +0000
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
Message-ID: <bug-217089-208809-N6iIPFTne6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217089-208809@https.bugzilla.kernel.org/>
References: <bug-217089-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217089

--- Comment #19 from Pierre Germain (pierre2008@gmail.com) ---
Thanks Alan,
I will contact the manufacturer by varius means, with some luck they send my
inquiry to the correct team.
Pierre

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
