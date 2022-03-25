Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8795A4E6F72
	for <lists+linux-usb@lfdr.de>; Fri, 25 Mar 2022 09:30:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345556AbiCYIbz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Mar 2022 04:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244130AbiCYIby (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Mar 2022 04:31:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 675933CA4C
        for <linux-usb@vger.kernel.org>; Fri, 25 Mar 2022 01:30:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DEF9661AF9
        for <linux-usb@vger.kernel.org>; Fri, 25 Mar 2022 08:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5022EC340F5
        for <linux-usb@vger.kernel.org>; Fri, 25 Mar 2022 08:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648197019;
        bh=qpR3YZspHru5ZYFibQJM3beH+9JrHRRWSht910y4/bs=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=LEbjlZMOEuZ+Bhm7fFea3juw7XVyNOLIULjnghmBgePbMdSENXewtY5trYzlb+QvA
         OJmJBGfZr4USpowBo2YBb6mA0IoEm99Sp0czxcqnJn2Xj9lu40OY/tMANa1YpKYEiH
         EcsOQZNRNnNPzAYWM1oGjmFdV8iAeXxVWZbVCv89sMilKQw7FG8EhrIKLZlDEkWizk
         Aq5HX81RkZhwg0YklQhZTyNVQDH0evT8pcqkcEQ7ZoxfHAat/y6vXRC+xIpvLIKqne
         cX5An8UCKi/VOAzXk6ivqvD9l8++TXWfys1UxLdB378CaGpowU1YGowvkTO3SuCSnj
         rUUhjaz6/op2Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 356ACCC13B0; Fri, 25 Mar 2022 08:30:19 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Fri, 25 Mar 2022 08:30:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tilman@imap.cc
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214021-208809-ZcR5kwNzlD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

Tilman Schmidt (tilman@imap.cc) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |tilman@imap.cc

--- Comment #16 from Tilman Schmidt (tilman@imap.cc) ---
Any progress on this? This is getting fixed/circumvented and rebroken
repeatedly in downstream releases like Ubuntu. A definitive fix would be hi=
ghly
appreciated.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
