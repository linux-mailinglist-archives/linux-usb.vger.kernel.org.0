Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1F556C8096
	for <lists+linux-usb@lfdr.de>; Fri, 24 Mar 2023 16:00:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232230AbjCXPAg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Mar 2023 11:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjCXPAf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Mar 2023 11:00:35 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BFEA199E3
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 08:00:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 95463CE263F
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 15:00:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8FC8C433D2
        for <linux-usb@vger.kernel.org>; Fri, 24 Mar 2023 15:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679670030;
        bh=+OdAtJkCemdnuEk/mIup+GRfvqY0QyiTWwt4cRykBzk=;
        h=From:To:Subject:Date:From;
        b=KcDAspe8Rz/MiRPaxtdLzA88I4ntSbEVf/2zOCYoYxP+QtB5nwNh58aBfpqmg7tDD
         s6PiaxwDZx8H2a5wdfEaCOtYHluya/1ilRvkmlHnmxsThzUvtqiwLebR9tTspiyBoH
         AwowGMZC0RuizHToNUzU3k0X5Ec0DXHKp+XzzsrfDoaghER7t1Zjme/MfzXckm7IMS
         5Okg9svINGAPL3MaxPXbrv5EWLZYKR79JsrltKlJ7SV/XtldQwyesSN0Vmw4bHTmuL
         i9eT1HbOgX0XbtH2opZiTKw7XOIevBm/BHYCAv+S9083Z5iJ28YekJqzd3gMOmbbVf
         LVzDJJXsVx+CA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id ADF23C43142; Fri, 24 Mar 2023 15:00:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] New: CPU hard lockup related to xhci/dma
Date:   Fri, 24 Mar 2023 15:00:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217242-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

            Bug ID: 217242
           Summary: CPU hard lockup related to xhci/dma
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1.14-1-lts
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: miller.hunterc@gmail.com
        Regression: No

Created attachment 304018
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304018&action=3Dedit
cpu hard lockup

Utilizing Intel NUC11ATKC4 computers, there is an issue of CPU hard lockups
that occurs seemingly randomly. Typically the issue arises every 1-5 days,
though sometimes the issue does not arise for a week plus.=20

Of note: These computers are constantly communicating via serial communicat=
ion
(request-reply pattern) to an embedded device via USB to UART cable. Unsure=
 if
that may contribute - will start test next week to see if issue still arises
when serial communication does not occur.

This issue has been seen as far back as linux-lts 5.15.62 (not saying that's
when the issue started, just that is the earliest release that these comput=
ers
have ran).

This is on Arch Linux.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
