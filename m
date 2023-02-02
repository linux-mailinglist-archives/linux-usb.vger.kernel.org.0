Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC357687846
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 10:07:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjBBJHx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 04:07:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBBJHw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 04:07:52 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E9963D0BC
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 01:07:51 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0391F61A2D
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 09:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 653CCC433A7
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 09:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675328870;
        bh=G/ywNFC3S6xJcMQs5ePDM66VnCiiYZrexjf6cixKPXc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=CcNn8+/YpRKJ3ANDw2T9+Ap94dsHcjaDG5r1vGOsPTXmeG65CSRAWOdzqb/4zVori
         5bBRnjhuDHToXu6nnIdYleJBvBDC9KVsBryQa3vmUGA1v88FBrxJHDX5+N/IQY5SGZ
         hJqOBst157L4vuhFufHxLHvBgACBzHgbWekHnqoyk3NsXGsxvL2N6AtsGMYGqB6hYL
         84h05PJ1K3fwCRxzeQlKPMuEO1Xk6MU7Zj+P1ly1im/oixIYdPKSrS9SXVbGxuWpy7
         bDxyTBSx3m+d4T4FaojZjPBMj7Kuye+1ICEULW7uja+FbzPgXkbtl/k9MU+vW1TcB2
         vnE928hFBQOuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 50C2AC43165; Thu,  2 Feb 2023 09:07:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Thu, 02 Feb 2023 09:07:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: oliver@diereehs.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-WA9I7NhU8m@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #16 from Oliver Reeh (oliver@diereehs.de) ---
The fix in kernel 6.1.9 doesn't work.

02.02.23 09:59  darkstar        kernel  RIP: 0010:ucsi_resume_work+0x2e/0x80
[typec_ucsi]

The system hangs after resuming from suspend.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
