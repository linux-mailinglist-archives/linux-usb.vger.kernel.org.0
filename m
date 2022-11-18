Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8853C62FEBF
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 21:24:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbiKRUYa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Nov 2022 15:24:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbiKRUYS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Nov 2022 15:24:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2901C2B609
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 12:24:17 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D2D02B82522
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:24:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DC66C433C1
        for <linux-usb@vger.kernel.org>; Fri, 18 Nov 2022 20:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1668803054;
        bh=++47GUKYJv35bc5RDRACk4fH/3/jdjXbClAysrgwhWQ=;
        h=From:To:Subject:Date:From;
        b=U5oWreHOKgzUP5zR6+7WdWabnmytXRlUxElO/68j2NfAC/BAuMFADSLBzhTCKWJzg
         /qnfPFtnToshZHitb+KYnN/RHjp/z9d06bZQTvx90Hj0tMBiqyAz73TevPNuAAubtU
         R+ls4ZmqwIXNnU1QMu0RMIdJw/khhv3/ME/byTEJHWBwxlk9csvplmoBxllRnVBqRD
         7j6DOX53xZ7hlRc3YF893tJzt4uL5Neu547tVFvpW7hcOcATzQntrixe8BVybFYY4F
         UPnvHV1Vglut+EF5GjEJqLBrs6dcypk3FsS08+sIN/w+KhGMRK+IqskfqXnrFVBIzt
         2Y55bg0dXwc0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 642F1C433E4; Fri, 18 Nov 2022 20:24:14 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216706] New: USBC resume callback takes far too long, between
 650ms and 1200ms
Date:   Fri, 18 Nov 2022 20:24:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter blocked cf_regression
 attachments.created
Message-ID: <bug-216706-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216706

            Bug ID: 216706
           Summary: USBC resume callback takes far too long, between 650ms
                    and 1200ms
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.0-rc2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: todd.e.brandt@intel.com
            Blocks: 178231
        Regression: No

Created attachment 303218
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303218&action=3Dedit
lenb-Dell-XPS-13-9310_freeze.html

The new USBC resume callback is taking far too long in the resume phase. I
bisected the behavior to this commit:

[10402] 4e3a50293c2b21961f02e1afa2f17d3a1a90c7c8 is the first bad commit
[10402] commit 4e3a50293c2b21961f02e1afa2f17d3a1a90c7c8
[10402] Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
[10402] Date:   Fri Oct 7 13:09:51 2022 +0300
[10402]
[10402] usb: typec: ucsi: acpi: Implement resume callback
[10402]
[10402] The ACPI driver needs to resume the interface by calling
[10402] ucsi_resume(). Otherwise we may fail to detect connections
[10402] and disconnections that happen while the system is
[10402] suspended.
[10402]
[10402] Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D210425
[10402] Fixes: a94ecde41f7e ("usb: typec: ucsi: ccg: enable runtime pm
support")
[10402] Cc: <stable@vger.kernel.org>
[10402] Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
[10402] Link:
https://lore.kernel.org/r/20221007100951.43798-3-heikki.krogerus@linux.inte=
l.com
[10402] Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I have timelines from 7 separate machines that are now affected but this
behavior. We have a guidline that neither suspend or resume should take lon=
ger
than a second, and this is causing us problems.


Referenced Bugs:

https://bugzilla.kernel.org/show_bug.cgi?id=3D178231
[Bug 178231] Meta-bug: Linux suspend-to-mem and freeze performance optimiza=
tion
--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
