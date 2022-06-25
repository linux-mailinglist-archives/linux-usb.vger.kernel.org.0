Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D69E455ABB9
	for <lists+linux-usb@lfdr.de>; Sat, 25 Jun 2022 19:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbiFYRTv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Jun 2022 13:19:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbiFYRTu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Jun 2022 13:19:50 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2B9E120A2
        for <linux-usb@vger.kernel.org>; Sat, 25 Jun 2022 10:19:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 663B8B80BEB
        for <linux-usb@vger.kernel.org>; Sat, 25 Jun 2022 17:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05A5FC3411C
        for <linux-usb@vger.kernel.org>; Sat, 25 Jun 2022 17:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656177587;
        bh=ost0gG3jvoUGLxTxQJnxlxxJs3n6+StPf2kOBn9gKQw=;
        h=From:To:Subject:Date:From;
        b=av2RCMHGeX2JndRFKbEuPbM6rZBr9GLJ4TkPkHo6OPJKtrsTbuVuPuMJEML1VqAbN
         wKe8N3TUtKMfufEU9/sCqs12fEP50yGk8ehoZEYpnwQ75GK76OEj/S2eycTazf153S
         tFCxc8U+MX5oZWbA5IYAvfBVeY5grqkdkt3ROp7xdtRXp73mn10LguUmSBNTgyCa+/
         yIkx4OEK039xAL4ulUwru7FtuDUPdumouDro3VtLfV56J0N5Xqc371LFmrkKHonIHV
         anpAGZHQwf3jlMP3WbF50Kn4pMcrRVtEwJZI7ocJ7F9Y7GdN9BsGOlqkqgddnHjoub
         E0jGwE7bPLv0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id DE3B0C05FD2; Sat, 25 Jun 2022 17:19:46 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216171] New: Hibernation not working because of xhci_hcd
Date:   Sat, 25 Jun 2022 17:19:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: prz.kopa@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216171-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216171

            Bug ID: 216171
           Summary: Hibernation not working because of xhci_hcd
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.6-arch1-1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: prz.kopa@gmail.com
        Regression: No

Created attachment 301268
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301268&action=3Dedit
Dmesg log with failed hibernation attempt

Starting from 5.18.4 my notebook (Dell Latitude 3340) won't hibernate -
hibernation fails with dmesg errors related to xhci_hcd. I'm attaching dmesg
log with failed hibernation attempt. Problem goes away after reverting comm=
it
63acaa8e9c65dc34dc249440216f8e977f5d2748 (USB: hcd-pci: Fully suspend across
freeze/thaw cycle). After reverting this commit on linux 5.18.6 my system c=
an
again successfully hibernate.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
