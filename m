Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CFD6633A1B
	for <lists+linux-usb@lfdr.de>; Tue, 22 Nov 2022 11:31:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233155AbiKVKa5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Nov 2022 05:30:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233294AbiKVKaU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 22 Nov 2022 05:30:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49C6F10FF0
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 02:25:27 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E303A61617
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 10:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 518BFC433D7
        for <linux-usb@vger.kernel.org>; Tue, 22 Nov 2022 10:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669112726;
        bh=+Vz7FHgqVHpdBonBij5PfudCnlaProZMvQfzyigkWig=;
        h=From:To:Subject:Date:From;
        b=QMm0KgAQVDl2/iD7Fz3AqSyra+u1py3S694uhvHhsfOyzETN25M0W+VTJniTxIX85
         +G2D6QFS9fAP34/EamnbJEdJ+0pYez5gArK4ZPHZu0MVb6LsnDAcajCJW8Y14w3NrY
         iE0jQs0Y4bYRGaTBw84MJD5IUC+v8gWOCsaYbUgHm+VjyVixyfgWz6/Awdy1zXbTv0
         UBupxCZc4r1HO+kitLmNaF9ioK4bhSfPMM5PQ5iB/UPoTRGZIOPMAikUkxm3AMLwOQ
         LsoQxKhNfoFXuta1K+sJ/4jli8FAEp3J1dqZZf9W8MgCyvCfckJYPMRLjhWU0LEyIP
         ilrEY6cy9OhxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 3943AC433E6; Tue, 22 Nov 2022 10:25:26 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] New: Thunderbolt USB Controller died after resume on
 Intel CometLake platform
Date:   Tue, 22 Nov 2022 10:25:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chris.chiu@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

            Bug ID: 216728
           Summary: Thunderbolt USB Controller died after resume on Intel
                    CometLake platform
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1-rc
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: chris.chiu@canonical.com
        Regression: No

We found few Intel CometLake laptops with Thunderbolt USB controller
(8086:15ec) failed to function after resume, the plugged usb devices are fa=
iled
to be detected. We found a easier way to reproduce as follows.
1. Put the system into suspend first
2. Plug a type-C usb device (or a type-C docking with USB device attached) =
to
the port managed by thunderbolt usb controller.
3. Resume the system

The kernel log on 1 laptop shows as follows. The system resume automatically
after plug in the type-C port
[ 583.424555] xhci_hcd 0000:38:00.0: Unable to change power state from D3co=
ld
to D0, device inaccessible
[ 583.424575] xhci_hcd 0000:38:00.0: Controller not ready at resume -19
[ 583.424576] xhci_hcd 0000:38:00.0: PCI post-resume error -19!
[ 583.424577] xhci_hcd 0000:38:00.0: HC died; cleaning up
[ 583.424580] xhci_hcd 0000:38:00.0: PM: dpm_run_callback():
pci_pm_resume+0x0/0xb0 returns -19
[ 583.424585] xhci_hcd 0000:38:00.0: PM: failed to resume async: error -19

The other laptop didn't automatically resume, but the following messages st=
ill
shows after manually resume
[ 1393.737519] xhci_hcd 0000:39:00.0: Refused to change power state, curren=
tly
in D3
[ 1393.737638] xhci_hcd 0000:39:00.0: Controller not ready at resume -19
[ 1393.737638] xhci_hcd 0000:39:00.0: PCI post-resume error -19!
[ 1393.737639] xhci_hcd 0000:39:00.0: HC died; cleaning up
[ 1393.737643] dpm_run_callback(): pci_pm_resume+0x0/0xb0 returns -19
[ 1393.737645] PM: Device 0000:39:00.0 failed to resume async: error -19


The have 1 thing in common, the controller refused to change power state and
host controller died after resume. Please help to find out the cause why the
thunderbolt controller refuse to change power state and died after resume.
Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
