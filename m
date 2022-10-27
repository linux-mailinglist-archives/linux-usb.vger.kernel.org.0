Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ABFC60F3AF
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 11:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234683AbiJ0J3R (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 05:29:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235292AbiJ0J3D (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 05:29:03 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADC8F645C0
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 02:29:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id C49CFCE255F
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 09:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF047C433D6
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666862935;
        bh=JliE8WAH2H3ys+fziGgU035zIJJBBsp5xWVJ66FPinc=;
        h=From:To:Subject:Date:From;
        b=GK216DFok0K2mH6l0O0Ojbqg3PLNghGdiNGXDtlCslOG9zMcXk+aZILusoW2aNgZF
         WiUPNqaIeLk8GzTSlXOkSprj3RTrT/jpDlk4ORNA5PShAZcL8HybWhMX2oBQtgG/qx
         auJagGDQImKA85KZkfSuUScchUsRquHcMzVaGgCQDMc/GjUbQbMTrhxbwEfZnlz53j
         PZRZkQYyqSgMhKftbOw0xeKAAepyRePn88Ak3Xda9Rdmb6HVurRBVtQU1itLrBShwM
         iPgOzs5YHaoo4P+hkvHoYIzaWJh4/GuZtYWN94Jula+qGnclud7HfnV3K94dNuOUdv
         dI7SMPFGWvzXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B53A8C433E4; Thu, 27 Oct 2022 09:28:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216630] New: config 1 has an invalid interface number: 2 but
 max is 1
Date:   Thu, 27 Oct 2022 09:28:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216630-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D216630

            Bug ID: 216630
           Summary: config 1 has an invalid interface number: 2 but max is
                    1
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.0.5
          Hardware: AMD
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: aros@gmx.com
        Regression: No

I'm getting these messages on boot and I wonder if they are superficial,
there's a bug in the kernel or my HW is not working properly:

usb 3-6: config 1 has an invalid interface number: 2 but max is 1
usb 3-6: config 1 has no interface number 1

lsusb -tv

/:  Bus 03.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/6p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 5: Dev 2, If 0, Class=3DWireless, Driver=3Dbtusb, 12M
        ID 8087:0025 Intel Corp. Wireless-AC 9260 Bluetooth Adapter
    |__ Port 5: Dev 2, If 1, Class=3DWireless, Driver=3Dbtusb, 12M
        ID 8087:0025 Intel Corp. Wireless-AC 9260 Bluetooth Adapter
    |__ Port 6: Dev 3, If 0, Class=3DVendor Specific Class, Driver=3D, 12M
        ID 0b05:18f3 ASUSTek Computer, Inc.=20
    |__ Port 6: Dev 3, If 2, Class=3DHuman Interface Device, Driver=3Dusbhi=
d, 12M
        ID 0b05:18f3 ASUSTek Computer, Inc.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
