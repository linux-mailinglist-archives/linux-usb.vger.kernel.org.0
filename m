Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78B706B505E
	for <lists+linux-usb@lfdr.de>; Fri, 10 Mar 2023 19:49:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbjCJSto (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Mar 2023 13:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjCJStn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Mar 2023 13:49:43 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE8F9111B07
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 10:49:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9FF3EB823B0
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 18:49:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 501B4C433EF
        for <linux-usb@vger.kernel.org>; Fri, 10 Mar 2023 18:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678474179;
        bh=DkzZNBoHyysunTZobhEyN4DiHaTl5v4DCc80Le8Pp+k=;
        h=From:To:Subject:Date:From;
        b=fll4TszRISV7iyQiYqVNwYpV1unceLgVvYeZJLj3k4lqFZ/R7cO5VLs8o6LbMfnnZ
         t0kS8rs65N4bv1E4Gx7GxR1W0aCJPZJHCTnR/TUpX3yyD7Frw/rg/cPWnBS/5RxvL3
         7imnfXZOkz/5EiPuj2AE3CtwBzleFb13JldQaHnUspOJgFXU5cAjT+omELtr7IF/Fi
         7DNRMlGeKujL+ZLeV4hNhL5iWzSvgtx4kJkGgCaqnhpm1u658dp+N2EZXQXYhFzknY
         UK4ZIETFDGBHPHK879Bv3u3qnP8AQoyU77Bp+Zzgkiy8RjZEYeS759IdHOaOW3CC8n
         8y+2F+xIQOHnw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 35BCAC43141; Fri, 10 Mar 2023 18:49:39 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217174] New: Plugging in usb external drive, mount and umount
 causes kernel Oops
Date:   Fri, 10 Mar 2023 18:49:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mike.cloaked@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217174-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217174

            Bug ID: 217174
           Summary: Plugging in usb external drive, mount and umount
                    causes kernel Oops
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.2.3
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: mike.cloaked@gmail.com
        Regression: No

Created attachment 303922
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303922&action=3Dedit
Kernel Oops for usb external drive umount with kernel 6.2.3

The problem I am about to describe does not occur with the kernel 6.2.2, as=
 the
current arch kernel in the repos.

With kerne. 6.2.3 if I simply plug in a usb external drive, mount it and um=
ount
it, then the journal has a kernel Oops as in the attached journal segment.=
=20
This was tested on three different machines, running arch kernel 6.2.2 and
6.2.3 (from arch testing), and is fully reproducible.  In all cases running
kernel 6.2.2 does not give this issue, and running kernel 6.2.3 causes the
kernel Oops as soon as the external usb drive is umounted.=20

Once the Oops had occurred then the machine will hang on shutdown and requi=
res
a hard reboot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
