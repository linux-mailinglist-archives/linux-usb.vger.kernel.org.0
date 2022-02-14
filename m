Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63B364B44DE
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 09:50:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242425AbiBNItb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 03:49:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:49132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242421AbiBNIta (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 03:49:30 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE4B85F8F7
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 00:49:23 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6505DB80DBA
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 08:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D900C340F3
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 08:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644828561;
        bh=5zeIg4UkVowQ6A0O6ZYOIFGg5FP/hKmGpcrBv1oHOHw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=EtDo1vbsuXsmReINqFv0wdMTwYypFMtz1cDp7RVH9kXcgumFdME7WRGjiqIt+4T41
         pbDAXBG77ItN9MO85KpVJLYM/Vi5aF8xlzfmhvTh37A7uincr3AvIpFt3GFwgwFN35
         IGandGOwvm9g5JWvE715rLkxvVCykKPVC4HxQoLavxLj5mmAI0HX8/c+fgrhpTBQK/
         PBtF3BXDeSVyrV61KVkrUDiToti4fDz3twCsr1V+47wLBRtXoPqQMhexhUVCMWQ5IT
         fBtNB9D4f9w+aEOOVySS+ZjsXyTz8seGSmxQBUx/beecurHhW3sNt4irnc4DDCBLwo
         H7bf+pBgkVgtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 198C9CC13A6; Mon, 14 Feb 2022 08:49:21 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Mon, 14 Feb 2022 08:49:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tiwai@suse.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215561-208809-6u9mCbEd7V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215561-208809@https.bugzilla.kernel.org/>
References: <bug-215561-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215561

--- Comment #8 from Takashi Iwai (tiwai@suse.de) ---
Thanks!  That's an interesting result.  This was thought to stabilize the
behavior, but it doesn't seem to have some side-effect.

I guess the bug gets fixed if you revert the commit?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
