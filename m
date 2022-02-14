Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DACAA4B44EA
	for <lists+linux-usb@lfdr.de>; Mon, 14 Feb 2022 09:53:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242323AbiBNIxX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Feb 2022 03:53:23 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242379AbiBNIxV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Feb 2022 03:53:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56C6F5F8F5
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 00:53:14 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E628060DFA
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 08:53:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4E476C340EB
        for <linux-usb@vger.kernel.org>; Mon, 14 Feb 2022 08:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1644828793;
        bh=NFZDq9WIcRoJz5gkxIXMUlqCt4FJ1fPwy7UnUTS5030=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=msYshuzsG5C/0as4AJZK7mugoUh2isw3CmjBbqFhT3h5m9T2NuISXqV0B5fXtXMax
         dJbwV93Cxd+rRqqy2nM3vSaEqdKLv4GNOqyM1Qvh6GKHtbU8+BUefFSKi2eUqjmQZw
         JBEFjPM2KfHxiU3E86NnTquZXwGgCrSsAvP9zF7YZVOwQC256skBFQFwm5eGJ9GTBa
         L2oEHwjhjVgA9tj+eXb6GVFkDhQd5vGt4FQ865YYXWXnfPclI7cNS1SgnR2fj7WFuE
         kUyW8BkdtrUE5a06SAH+7xkZvM8Q7EFRcU33YqUsRSn+PfHSimXltPeUElHv6kPK2K
         b5dj61ytJTyRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2F452C05FD0; Mon, 14 Feb 2022 08:53:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215561] snd-usb-audio:reset_resume error -22 after suspend
Date:   Mon, 14 Feb 2022 08:53:12 +0000
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
Message-ID: <bug-215561-208809-avDYfRq5ts@https.bugzilla.kernel.org/>
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

--- Comment #9 from Takashi Iwai (tiwai@suse.de) ---
Also, with the broken kernel, did you get a warning message like below at t=
he
probe time:
  X:Y: failed to get current value for ch X (X)?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
