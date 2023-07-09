Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B482774C83D
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jul 2023 22:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbjGIUkO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jul 2023 16:40:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229564AbjGIUkN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Jul 2023 16:40:13 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A98A100
        for <linux-usb@vger.kernel.org>; Sun,  9 Jul 2023 13:40:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F33EB60BC4
        for <linux-usb@vger.kernel.org>; Sun,  9 Jul 2023 20:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A4F0C433C9
        for <linux-usb@vger.kernel.org>; Sun,  9 Jul 2023 20:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688935210;
        bh=zh1ZffibEdewmnAriJrKk6+lLnNhqMAiz85ztLyRvA0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eDrvJsnYQiixgLpFNAsMnHsAbxK8iUnK+ebJ3lGdvTJPgb/18Ka3BXpe5EY3GUAE5
         n9Ju8K+ImEEREmV4gOKCTrQDIX8rv3D/HE8Y4uYEjni0VOc8SGYNZrCJUBCvDc/S/f
         sgDq6U67PaBfauPscen6MuP/fClp/7CGBEdTsHk5V8lnRW5biQShYYodJIugV300zM
         WIMw0o62NTpnW9v4K/elPSvK5XtkEZTRWR7gpq3aMN1y2qqMlPiNMp4KQ7VvLj0Gs2
         C5nWeeNdNgAwd68SnHnzwjrGDEl7n33+BsiR8qFRBFQI6vXBO3p1YmS51Le3VlfXUU
         nxP90uZGUTlCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3009EC4332E; Sun,  9 Jul 2023 20:40:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217632] 3 more broken Zaurii - SL-5600, A300, C700
Date:   Sun, 09 Jul 2023 20:40:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bids.7405@bigpond.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-217632-208809-eP94ZQIQvv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217632-208809@https.bugzilla.kernel.org/>
References: <bug-217632-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217632

Ross Maynard (bids.7405@bigpond.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bids.7405@bigpond.com

--- Comment #3 from Ross Maynard (bids.7405@bigpond.com) ---
Created attachment 304576
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304576&action=3Dedit
proof-of-concept patch

Tested makeshift patch and it fixed the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
