Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D80846F6994
	for <lists+linux-usb@lfdr.de>; Thu,  4 May 2023 13:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjEDLL1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 May 2023 07:11:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229904AbjEDLL0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 May 2023 07:11:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1791726A9
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 04:11:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A8316632AE
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 11:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11FF8C433EF
        for <linux-usb@vger.kernel.org>; Thu,  4 May 2023 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683198685;
        bh=qat2sdPO85wV+PEijlQbspYX5MIQ1t0fzY/ZdQFfu6c=;
        h=From:To:Subject:Date:From;
        b=OboM7ArEVhn2L9pipHKFmMVjiT7/i0WZYy/YFrNNY5rc2OG9bwnxUUkh9FGUdFR69
         gZJyR28Evg51wPO5y4dkOXtKQrsw3p5fi2S0pvaIupTHVj+C4HBY1xK97Pky9u+5Rg
         SHHTnpLlyPyGpJ4SkhPszFvabNA37cL01k5OPFsCNJzW1dxiuN4kh6nKL8UE5SS0gR
         N3ndkFym8qpOvvdPeygQg3SonlV3q1OxeDLmXO4aP+RtkIZgT/fK91vANOH7ml70eQ
         x7ky0cn13W21waeinKHPGyZWme/rjk/ryoRtZbsxY35hihDhuW38ArOQosE8d4+ojg
         wpTNM7VZpVKjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EE1ACC43141; Thu,  4 May 2023 11:11:24 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217399] New: Kernel OOPS on boot with Kernel 6.3(.1) and
 RTL8153 Gigabit Ethernet Adapter
Date:   Thu, 04 May 2023 11:11:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: b.buschinski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217399-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217399

            Bug ID: 217399
           Summary: Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
                    Gigabit Ethernet Adapter
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: b.buschinski@gmail.com
        Regression: No

Created attachment 304215
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304215&action=3Dedit
Kernel OOPS on boot

Hello,

on my laptop with kernel 6.3.0 and 6.3.1 fails to correctly boot if the usb=
-c
device "RTL8153 Gigabit Ethernet Adapter" is connected.

If I unplug it, boot and the plug it in, everything works fine.

This used to work fine with 6.2.10.

HW:
- Dell Inc. Latitude 7410/0M5G57, BIOS 1.22.0 03/20/2023
- Realtek Semiconductor Corp. RTL8153 Gigabit Ethernet Adapter


Call Trace (manually typed from the image, typos maybe be included)
- bpf_dev_bound_netdeuv _unregister
- unregister_netdevice_many_notify
- unregister_netdevice_gueue
- unregister_netdev
- usbnet_disconnect
- usb_unbind_interface
- device_release_driver_internal
- bus_remove_device
- device_del
- ? kobject_put
- usb_disable_device
- usb_set_configuration
- rt18152_cfgselector_probe
- usb_probe_device
- really_probe
- ? driver_probe_device
- ...


For the full output, please see the attached image.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
