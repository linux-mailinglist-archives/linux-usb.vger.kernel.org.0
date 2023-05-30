Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4915A716DBA
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 21:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230176AbjE3TjK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 15:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbjE3TjI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 15:39:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF1A8106
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 12:39:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 77F2A60C69
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 19:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7A24C433EF
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 19:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685475546;
        bh=0UoDhaR9+lL9qwZ/qGouIQwb4SEw4m+1M0/LtUjZ6wc=;
        h=From:To:Subject:Date:From;
        b=HPW9RRTUrlsSZEyOMMx5dieldw8lFO8PnDID1BK0p7EKUmeJdqGOssXRxxFF/VXDS
         vy53P/8h0ZFH6fS0PkZSezf2/TQT1ugldUs724R7g1SLNoyN+oX/piFWnRwFJQqTq+
         X7e9E/zS23Q4GXHA8izC+2gXpiBQCwIrMbQ2EPchWAPCMkNQ6oBVfopSZI4p+FVee9
         Y9ELZc5koWbz2BlXrnQJSalXEI22oExBGSOCmy3lvzwqJCdcK3v6Xtyh5r+2RaJh4q
         CcIJAR6d4kUPGktcr0uAAh1VP1t9CNB+yHc9hYhoC5GBgRL4PRl2wO2if2DQ7nRZql
         mCKutUIxN57TA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B79B0C43142; Tue, 30 May 2023 19:39:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217511] New: HP Pavilion x2 - Charging over USB-C not working
Date:   Tue, 30 May 2023 19:39:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aaron@ephasic.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217511-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217511

            Bug ID: 217511
           Summary: HP Pavilion x2 - Charging over USB-C not working
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: aaron@ephasic.org
        Regression: No

I'm experiencing an issue where the laptop will not charge over USB-C while
booted into Linux.  If I shutdown then it will charge and I don't experience
this behavior in Windows.

Looking at dmesg I see when plugging in the charger:
    hp_wmi: unkown event_id 131073 - 0x0

There are no events when unplugging the charger.  The status LED never turns
orange which indicates charging while booted into Linux either.

Kernel: 6.3.3
Hardware: HP Pavilion x2 Detachable

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
