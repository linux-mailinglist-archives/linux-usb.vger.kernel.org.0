Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD6662D498
	for <lists+linux-usb@lfdr.de>; Thu, 17 Nov 2022 09:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbiKQIEc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Nov 2022 03:04:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbiKQIEa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 03:04:30 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AF4C776
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 00:04:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C10B461F74
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 08:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24D3CC433C1
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 08:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668672269;
        bh=5moBPAWS/j5XQNcPb7FMO3itAmtdrTj2/ilpL5i+urw=;
        h=From:To:Subject:Date:From;
        b=g5LHVmEhpGUIzujG23HfJQajZN16Yqq4Wj3GIp21hUoQ2ZVW6dduymVf2BEHZ59qq
         B/hBnOyaCqL8e7XbduFk4ho0FrhT6A7T8kFqF2p18tSLRvjDb/v4x1ZcZHL7REwPfj
         DvohTcW/V4Z2PFJo9kqZe+8CBEgGjMSU6hGbqPc1w/GX1kbMQYbIQwSSoljBoKN3Sr
         xH1q1+XXGst1zVhPu7tFwokbTwd0KodELdFCjzxNXbxOq5YqQFTIdCEq/VofNjvf3J
         F0XZXvsWGT+walwHrCb4Nia5P+WDYaKYAAExGUyq+J/B5m4e7zlEB8MeGFZHd1+sc5
         aGSNSxfP9L1fA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 083EBC433E6; Thu, 17 Nov 2022 08:04:29 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] New: Resume from suspend stopped working
Date:   Thu, 17 Nov 2022 08:04:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: denis@speran.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

            Bug ID: 216697
           Summary: Resume from suspend stopped working
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.7
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: denis@speran.info
        Regression: No

Created attachment 303190
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303190&action=3Dedit
photo of errors on resume

It seems like changes made here [1] breake resume from suspend on my laptop=
.=20
Archlinux kernel 6.0.6: resumes fine
Archlinux kernel 6.0.7 - 6.1.0-rc5-1-mainline: hangs on resume, laptop appe=
ars
to stuck, nothing works except GUI displayed but not updated and I get erro=
rs
saying something like
RIP: 0010:ucsi_resume+0x2a/0x70
see attached photo

Lenovo ThinkBook 13s-IML

If it's inappropriate to report such issue here, could you please guide me =
how
to report, I'm totally new to kernel issue reporting.

1. - https://bugzilla.kernel.org/show_bug.cgi?id=3D210425

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
