Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E83F6A16F4
	for <lists+linux-usb@lfdr.de>; Fri, 24 Feb 2023 08:11:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229494AbjBXHLR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Feb 2023 02:11:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbjBXHLQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Feb 2023 02:11:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 352B316AE6
        for <linux-usb@vger.kernel.org>; Thu, 23 Feb 2023 23:11:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A3392B81B01
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 07:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54B67C433D2
        for <linux-usb@vger.kernel.org>; Fri, 24 Feb 2023 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677222673;
        bh=czLp3CPBISodeBtrVjbiU8lQqj6VHvzGSOEUSIs7Rks=;
        h=From:To:Subject:Date:From;
        b=KkphZDa3y/zb/Cu4E9ShodU/mZyJSTAwbNAgKJ3RqP+OJ8ZwpGrbbonRAS3TWqlim
         ISzu/x+sWFprZv60tE/TPmtsMk8JypfRchmB9ra4pwfQClk9KhbohRBcC6zrLgxDxb
         /qUr3RSWA+fR3QiQUeEjKyK9VA7K1o8hYCvQVwetXSeHZMt+uGRHl5AqWn+P5uLT+O
         L6VEyV5mn0bPpCz8xGk2Z0aajDKas9mDIVQ23ZIGHL5yIPJD5Hch3UkIEYFTIJvkIZ
         MoSByKuyjy1gb04dQIod8tvyCL7Mkgk+Y+k2U8YnQ5h3GKKYiWpmGAUSF9YsyjIjqd
         W3/Sz5rd6wKHw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 334ECC43142; Fri, 24 Feb 2023 07:11:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217081] New: miss kzalloc check in mv_udc_probe
Date:   Fri, 24 Feb 2023 07:11:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: 1527030098@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217081-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217081

            Bug ID: 217081
           Summary: miss kzalloc check in mv_udc_probe
           Product: Drivers
           Version: 2.5
    Kernel Version: latest
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: 1527030098@qq.com
        Regression: No

miss a null check at
https://elixir.bootlin.com/linux/latest/source/drivers/usb/gadget/udc/mv_ud=
c_core.c#L2232

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
