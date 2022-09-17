Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 860A95BB4F6
	for <lists+linux-usb@lfdr.de>; Sat, 17 Sep 2022 02:25:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229462AbiIQAY7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 16 Sep 2022 20:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbiIQAY4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 16 Sep 2022 20:24:56 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF5A436DCB
        for <linux-usb@vger.kernel.org>; Fri, 16 Sep 2022 17:24:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8F2A3B829C8
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 00:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38E59C433C1
        for <linux-usb@vger.kernel.org>; Sat, 17 Sep 2022 00:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663374293;
        bh=JgVWRpvcR82QJssAN2hmYZ3/GCITbyUAhGeqfqzl3qg=;
        h=From:To:Subject:Date:From;
        b=SqYr1whQD1k/jPo0G/KAdClkqm75KTqopCyzwG8OKHh4oVdZPUeLtpbycAltE8Dfd
         j4zMHduwK82aH9ydjBzAfGNLxnPyDI+XS/JMlsOlxkE5/w87+nKo8J1RhZ/861TbDf
         ri9GZSVUhxkkPU0vYeRH8Tn2Pe60UbIG/fqxi4WKNVFTNVJsjfcfHo3ePiIFMhRKzO
         /lVEP2zX5vtnvmJBxR0oiGEkiFnZucHB9DyOztoqgJzWUGP9w+XLg3eRUoye6TWDGn
         y2r8dtqh8c5rSQtxH5vpuAcchJv7MwN+Y2++Vwh8jbvgumr7zUJ3XvRBWbPjPAE2PM
         hZPkxj9YsJQZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 1DFA1C433E6; Sat, 17 Sep 2022 00:24:53 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216497] New: USB connections through thunderbolt dock broken
Date:   Sat, 17 Sep 2022 00:24:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhnmlkvch9@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216497-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216497

            Bug ID: 216497
           Summary: USB connections through thunderbolt dock broken
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.19.9-arch1-1 #1 SMP PREEMPT_DYNAMIC Thu, 15 Sep 2022
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: jhnmlkvch9@gmail.com
        Regression: No

Created attachment 301819
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301819&action=3Dedit
dmesg log for thunderbolt dock re-plug

After updating to kernel v5.19.9-arch1-1, usb ports on HP Thunderbolt Dock =
G2
stopped working. dmesg is getting flooded with the message:

xhci_hcd 0000:30:00.0: Error while assigning device slot ID
xhci_hcd 0000:30:00.0: Max number of devices this xHCI host supports is 64.
usb usb6-port1: couldn't allocate usb_device

Obviously I don't have 64+ devices connected. Strangely, if I boot with the
thunderbolt dock connected, everything works fine. Unplugging and re-pluggi=
ng
the dock again results in unrecognized usb.

I'm attaching the part of dmesg where I unplug and re-plug the thunderbolt
dock. Note that all usb devices that are connected are correctly enumerated
while unplugging.

Rolling back to previous version of the kernel fixes the issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
