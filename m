Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 561CB4F1FBD
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 01:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232297AbiDDXEg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 19:04:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349039AbiDDXC1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 19:02:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD8156C939
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 15:22:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7B8B36165A
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 22:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFD92C2BBE4
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 22:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649110935;
        bh=kOM7fZZ8fyDtngRuUarq38mivh4DgITBwrATnjfuCeY=;
        h=From:To:Subject:Date:From;
        b=gZ0ohp96TJwvPFvLVbuaVudy93OlI2JNWMT6mjb6ypdvKu7FoRuqXw6dFKGD7Fjg/
         7gKkFenPQkYbsKlUAQ8NuKwTXovAmcl0AfizwnCAbtaA/CTYff6yQWjEaZPZELIirf
         fM/rpDS7qSUN56cacy4JFLZpRrICdFSIzQC0DR2xeLfarDNEQkCf6v112zeOUIHXtw
         rOUaasBM6sV7UblD2BoJrkSg7FkJYelkiwGfZXfnmKyVzpt0Hlq432zyUAEKxt5lVP
         8zB6n7rrKxwZ2pqY7DGQUC+CmcYFfdKM5cTMMIgTAQU7Wzl6xukFV6shdCD+XyoYIB
         e2p5di4Pu7mkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C3874C05F98; Mon,  4 Apr 2022 22:22:15 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215799] New: apple-mfi-fastcharge causes automatic pm
 hibernation entry, when iPhone gets attached
Date:   Mon, 04 Apr 2022 22:22:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: labre@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215799-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215799

            Bug ID: 215799
           Summary: apple-mfi-fastcharge causes automatic pm hibernation
                    entry, when iPhone gets attached
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.17.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: labre@posteo.de
        Regression: No

Created attachment 300695
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300695&action=3Dedit
dmesg log during a boot with an iPhone attached

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

If I attach an iPhone SE while the apple-mfi-fastcharge module is not
blacklisted, the kernel will immediately hibernate. Loading the module with=
out
an attached iPhone does not have this effect. dmesg is not very helpful in =
this
case, probably I need a higher debug level. I=E2=80=99ll attach it anyway w=
ith some
context.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Steps to reproduce
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
1. Attach an iPhone SE (don=E2=80=99t have any others) via USB-A to Lightni=
ng cable
while apple-mfi-fastcharge is either builtin, loaded, or can be loaded
automatically, i.e. is not blacklisted.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Actual behaviour
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The kernel automatically hibernates without user interaction.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Expected behaviour
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The kernel continues normal operation.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Additional information
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The cable has =CE=BCUSB=E2=86=92Lightning and =CE=BCUSB=E2=86=92USB C adapt=
ers attached. It works fine
with an Android phone and with the iPhone SE without the apple-mfi-fastchar=
ge
module loaded, so it is not faulty.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
