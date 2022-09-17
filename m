Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BB0E15BBAE1
	for <lists+linux-usb@lfdr.de>; Sun, 18 Sep 2022 00:42:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbiIQWlk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Sep 2022 18:41:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiIQWlj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Sep 2022 18:41:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AD02AC49
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 15:41:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4EC8A61202
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 22:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA50DC433C1
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 22:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663454496;
        bh=VqJxLMXpYp+RxPKga1QGOP3WKwAmqA39EHmEQwIlxCg=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=U0YGY6N4iUxrsiYgwKz0GsEUBWGaR8gIUgKIeWCuo/A0UukYDqGiPH7WQ3OlXN03E
         lNr06r6qmF50IjCxunH029LPJ4lAIzY7V0Y+h5A2k8mSacOwUI7L4Ofaxl32FIVVjw
         sHIf3ULbV8OwTBIhpKiVFmUuc7adJFSGCHY6hkoziNIqtr0LDZh0iJa5/ZShqDDDKq
         92P9vtnChkhihu7Mv3rI6uJ6keJ4v4bTOpkEOpDHQq3laPZM7Q3vx3kxmHcrqMdSD5
         HDJPoFSpKBv2X4PyPrS6L7a0LCLZiAs5MOqswFxQnG+0MAGVRJVQkqZZTOgCordsCJ
         ASchoHT+EkWdw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 89B2EC433E6; Sat, 17 Sep 2022 22:41:36 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] USB connections through thunderbolt dock broken
Date:   Sat, 17 Sep 2022 22:41:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216497-208809-BSqHVpEP85@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216497-208809@https.bugzilla.kernel.org/>
References: <bug-216497-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

Mark Blakeney (mark.blakeney@bullet-systems.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mark.blakeney@bullet-system
                   |                            |s.net

--- Comment #2 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
Myself and another person have this bug also as discussed here:
https://bbs.archlinux.org/viewtopic.php?pid=3D2057791

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
