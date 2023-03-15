Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89E0C6BB907
	for <lists+linux-usb@lfdr.de>; Wed, 15 Mar 2023 17:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbjCOQFy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Mar 2023 12:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232456AbjCOQFg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Mar 2023 12:05:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8FFC8C81F
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 09:05:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 68D58B81DFA
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 16:04:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FD45C433D2
        for <linux-usb@vger.kernel.org>; Wed, 15 Mar 2023 16:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678896290;
        bh=nWcUmuQPTA8jYl8KXR6e2oEhSP+amXZijzKeCjEroNI=;
        h=From:To:Subject:Date:From;
        b=Gn/rmRA2UhAauSJOmQnxDimglN5fK3R19OruszB+hVV8r7ClznPq1Lb84QL57r1e3
         0AVgUm0hJvJ7/zHaNz5hLZ96AzZ9KYrR8dWR16mlOJTxCODtXuiTwTVsNSPA/WJtKH
         pne5v03AssBsmY25ivMWwuuk6A/PQLdmoYhG4pTJrRydjs1UuweLXYDd0hGj/vwGFL
         gB37xFzwrt0AKUHF8XVdkxTvK3/cu6U5hQ9j6CZlqJQqX/A8O17hZvKw84u4SiuGHk
         GJC5m5wkvTfgffxwJkJzZP51UPqK+vWa2gu1zjnp5Xm4q3L73ItsAPQzn0pS64H4Gh
         WJd103wiME/NQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EA722C43142; Wed, 15 Mar 2023 16:04:49 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217204] New: ASIX AX88179 does not work in 6.X kernel
Date:   Wed, 15 Mar 2023 16:04:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: petr.bahula@artisys.aero
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217204-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEXHASH_WORD,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217204

            Bug ID: 217204
           Summary: ASIX AX88179 does not work in 6.X kernel
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.1
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: petr.bahula@artisys.aero
        Regression: Yes

After update from kernel 5.15.80 to 6.1.12 the USB ETH card ASIX AX88179 wh=
ich
is in USB-C dock is not accessible as eth1.

**!!! IMPORTANT !!!
If the HW is booted with good kernel and then rebooted (without losing powe=
r)
to bad kernel, it will still work. Only if it is booted with bad kernel from
cold state (total no power) then it will not work.**

```
Bisecting: 2 revisions left to test after this (roughly 2 steps)
[a41b17ff9dacd22f5f118ee53d82da0f3e52d5e3] dccp: put dccp_qpolicy_full() and
dccp_qpolicy_push() in the same lock
Bisecting: 0 revisions left to test after this (roughly 1 step)
[f56530dcdb0684406661ac9f1accf48319d07600] net: usb: make USB_RTL8153_ECM n=
on
user configurable
c67cc4315a8e605ec875bd3a1210a549e3562ddc is the first bad commit
commit c67cc4315a8e605ec875bd3a1210a549e3562ddc
Author: Hector Martin <marcan@marcan.st>
Date:   Sun Jul 31 16:22:09 2022 +0900

    net: usb: ax88179_178a: Bind only to vendor-specific interface

    The Anker PowerExpand USB-C to Gigabit Ethernet adapter uses this
    chipset, but exposes CDC Ethernet configurations as well as the
    vendor specific one. This driver tries to bind by PID:VID
    unconditionally and ends up picking up the CDC configuration, which
    is supposed to be handled by the class driver. To make things even
    more confusing, it sees both of the CDC class interfaces and tries
    to bind twice, resulting in two broken Ethernet devices.

    Change all the ID matches to specifically match the vendor-specific
    interface. By default the device comes up in CDC mode and is bound by
    that driver (which works fine); users may switch it to the vendor
    interface using sysfs to set bConfigurationValue, at which point the
    device actually goes through a reconnect cycle and comes back as a
    vendor specific only device, and then this driver binds and works too.

    The affected device uses VID/PID 0b95:1790, but we might as well change
    all of them for good measure, since there is no good reason for this
    driver to bind to standard CDC Ethernet interfaces.

    v3: Added VID/PID info to commit message

    Signed-off-by: Hector Martin <marcan@marcan.st>
    Link: https://lore.kernel.org/r/20220731072209.45504-1-marcan@marcan.st
    Signed-off-by: Paolo Abeni <pabeni@redhat.com>

 drivers/net/usb/ax88179_178a.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)
```

I've reverted changes made in the c67cc4315a8e605ec875bd3a1210a549e3562ddc
commit and gentoo-sources-6.1.12 works correctly now.

Patch which I use for new kernels now:
```
pet@petkub ~ $  cat
/etc/portage/patches/sys-kernel/gentoo-sources/ASIX_AX88179.patch=20
--- a/drivers/net/usb/ax88179_178a.c    2022-12-11 23:15:18.000000000 +0100
+++ b/drivers/net/usb/ax88179_178a.c    2023-02-23 10:04:47.534060336 +0100
@@ -1844,7 +1844,8 @@
 static const struct usb_device_id products[] =3D {
 {
        /* ASIX AX88179 10/100/1000 */
-       USB_DEVICE_AND_INTERFACE_INFO(0x0b95, 0x1790, 0xff, 0xff, 0),
+       /*USB_DEVICE_AND_INTERFACE_INFO(0x0b95, 0x1790, 0xff, 0xff, 0),*/
+       USB_DEVICE(0x0b95, 0x1790),
        .driver_info =3D (unsigned long)&ax88179_info,
 }, {
        /* ASIX AX88178A 10/100/1000 */
```

See also: https://bugs.gentoo.org/895720

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
