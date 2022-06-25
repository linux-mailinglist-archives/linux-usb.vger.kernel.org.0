Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5F455A707
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jun 2022 06:26:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbiFYE00 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jun 2022 00:26:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbiFYE0Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jun 2022 00:26:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C1BD107
        for <linux-usb@vger.kernel.org>; Fri, 24 Jun 2022 21:26:21 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFD6360C0D
        for <linux-usb@vger.kernel.org>; Sat, 25 Jun 2022 04:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1603CC341C0
        for <linux-usb@vger.kernel.org>; Sat, 25 Jun 2022 04:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656131180;
        bh=JjCueDt69AJKgFNcFxntJGJCuqsRDWvKxExJWDbqRGA=;
        h=From:To:Subject:Date:From;
        b=D9wMa2Ch9VGJUVMK0GJnqg6clkdSdfOjbws9lVd5EZcUAC6qqFWeChNUZCDQ4VmqE
         8FLWgb6jKkj/koBUVkjBlupOn87Ffvp7ZJHEjmUapkyt3ZaB7929UY44NKH4kEtkNT
         lfagK+TLq7f+IfU0sspV5Z53swn8NVWxrI8/zTPfAncM2Lpwq2K+wt/bi8Rc1+w2gL
         p1d8eTHWtLWEoVM8vPHGNQMS/wWMzxcPCuOzjqXCiOim83uehLhuB6QgoOjD3O/o2c
         TACZ2kga/SuvxVGJ3hJM/0stTL9397ve3Dk0Ks2n0wD8kFAT8vTqQpdtpxk7Tu7pBr
         e1WVLt+RMaW4Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 03544C05FD2; Sat, 25 Jun 2022 04:26:20 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216170] New: Ideapad Yoga freezes on USB removal
Date:   Sat, 25 Jun 2022 04:26:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rawat.arnav@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216170-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216170

            Bug ID: 216170
           Summary: Ideapad Yoga freezes on USB removal
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: rawat.arnav@gmail.com
        Regression: No

On (any) USB device removal from a Yoga 9i laptop, the system completely lo=
cks
up, needing a hard restart. The kernel does not write any relevant logs to =
disk
when the lockups occur, making debugging difficult. I am open to suggestion=
s on
how to debug this problem, and about any kernel options I can apply to iden=
tify
the cause of the lockup.

The kernel parameters for hardware watchdogs and hard lockup panic do not w=
ork.
Neither do sysrq keys. The lockup does not behave as a kernel panic - kexec=
 is
not used, and neither does the caps light blink.

Model: Yoga 9i 14ITL5 82BG
Kernel: 5.18.4

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
