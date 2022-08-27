Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB185A3A05
	for <lists+linux-usb@lfdr.de>; Sat, 27 Aug 2022 22:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiH0UsK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Aug 2022 16:48:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbiH0UsJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Aug 2022 16:48:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58CC7422C6
        for <linux-usb@vger.kernel.org>; Sat, 27 Aug 2022 13:48:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DFE8060E99
        for <linux-usb@vger.kernel.org>; Sat, 27 Aug 2022 20:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 442CBC433D6
        for <linux-usb@vger.kernel.org>; Sat, 27 Aug 2022 20:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661633287;
        bh=9Rxy2UpOFCzEJEd9E+6RECUku5ad8/KRY1Pyo2yxj+s=;
        h=From:To:Subject:Date:From;
        b=X/8I/uiWex4wrzJea1IRGdOGbbmLXiAR5jBERLCY4o4LSXm3Xc4xb1DVHt5+yjOPk
         o6tZJx7IMfvedm4emK4GLY95N/Yg73AoDnxL9MPkdYpW4dVwLaFgF65k7f6jVUTqod
         7YIneOEafMuD6LdvoA0WryP508dk8TmKagFxXG9lcjs4W0H/7FIrOAwWbCWXV+SnQw
         DGcnzW0o+y3p2gEnV+k9l3PsodUiucL+awQWc10xtMpzVLeYDi0cVJ/e1gPtDl89Fq
         bP3QiIung+4hnQHkxlajkUe4d5PC97OfBIKhRLTyZUXEjwrvAAddqgyFu1Mx73C0iC
         jiawopyN+Rf+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 2C163C433E6; Sat, 27 Aug 2022 20:48:07 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216422] New: BUG: kernel NULL pointer dereference, address:
 0000000000000000
Date:   Sat, 27 Aug 2022 20:48:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kernel-bugzilla@janbruckner.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216422-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216422

            Bug ID: 216422
           Summary: BUG: kernel NULL pointer dereference, address:
                    0000000000000000
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.18.0-rc1-1-00059-g87d0e2f41b8c
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: kernel-bugzilla@janbruckner.de
        Regression: No

Created attachment 301686
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301686&action=3Dedit
dmesg with NULL pointer dereferences.

Hi,

Several users including me are experiencing an issue with Thinkpads becoming
completely unresponsive after several hours. This seems to happen more often
shortly after the system has been idle for some time.
The issue only occurs when the Thinkpad is already connected to a USB C doc=
king
station before booting.

dmesg shows regular
"BUG: kernel NULL pointer dereference, address: 0000000000000000"
that do not cause a crash however.
These only show up, when the systemd upower.service is running.

In the attached dmesg.txt, I booted with upower.service disabled and starte=
d it
manually which immediately lead to the NULL pointer dereference (but no cra=
sh).

We bisected and found the offending commit in
https://bbs.archlinux.org/viewtopic.php?id=3D279027

Please see the attached bisect-log.txt .

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
