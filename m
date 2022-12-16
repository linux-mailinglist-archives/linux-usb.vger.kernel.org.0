Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6918064E7ED
	for <lists+linux-usb@lfdr.de>; Fri, 16 Dec 2022 08:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229453AbiLPHwG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Dec 2022 02:52:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiLPHv7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Dec 2022 02:51:59 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47D8B20986
        for <linux-usb@vger.kernel.org>; Thu, 15 Dec 2022 23:51:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8C0661CFF
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 07:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F08CC433EF
        for <linux-usb@vger.kernel.org>; Fri, 16 Dec 2022 07:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671177117;
        bh=/1eGmHtruvR9j8+Ztis9ltxBZypYeZ+5iaOJWFhGQ3M=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=DsgJiE0po0bsfqnQSVTP0jibLCsUrrvXRoWN6dYIc3WEG6fos3GcU2MeHr8n60XW4
         VBxYVSYOHZTJX+EyhWhklZt0BUscjt9ImIPzWisOFLL6wCWLK+X2R71OVpTBLtF34b
         6nxmIRPVBqAIZZpkiOmnOhUHPrdgsaD4JislTn/2a9m7qYEQIsqWF2e3O+UpjhpQ9v
         hIdqzLZCVZokypD+g760n/lNKCpuZ9Tn9rKGBOBOpKXWmxxwY2TRCq6BhH5+bQr8ym
         bnH5Sz+IH066Msk/GW8g7Eiz0tePmVHn5EgxJVpLW+8mA9bSD/lrZv6cFjlRM3oXxy
         FctDFFmMTMvPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 27DABC43143; Fri, 16 Dec 2022 07:51:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Fri, 16 Dec 2022 07:51:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: liang_xiao1@dell.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-zQYmIqgBYk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Xiao Liang (liang_xiao1@dell.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |liang_xiao1@dell.com

--- Comment #20 from Xiao Liang (liang_xiao1@dell.com) ---
Dell can provide a machine to you for issue further debug, is it ok for you?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
