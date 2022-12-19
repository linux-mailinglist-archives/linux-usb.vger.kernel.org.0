Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59F666506D9
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 04:40:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231230AbiLSDkD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 22:40:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbiLSDkB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 22:40:01 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F04FAA475
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 19:39:59 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7756260DD0
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 03:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9B7AC433EF
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 03:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671421198;
        bh=v6deGrlXb/JIWOfujoA+v6am9mpwJQKEZgloL6lYeF8=;
        h=From:To:Subject:Date:From;
        b=mJNbeUF9ImJ3qjh5iTmQTpwfxBzm3exKoEE4UHGY769PMGcoe/DpmiMgpywZ1srxb
         Qi9Ab4IRc3PKI+E13+QdfXvTJ3LYxtyfPZpq+Mufi3nKnUqD3WMO96JDdjfi5X1hpG
         TmQD7AsxJ7UrC/TMw9a0lU/A1Zs2ViRpe62J8NgPPhW/9CuiyuSW17QcKE6O2fRHzB
         rUAkF8b1bWd6kZVSqr1mOndF7Y+ag6WzBOmKgjE9OYvWITHds1F/Fn3hWkl0FeOcyq
         e+QMeZ+YRWDXc0k/O+6H1qKnuH4PDabBRG5yIfxncBkhlkUjlvBMagvA+d5cxWidqv
         izeToW1yjmI+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id AEB21C43141; Mon, 19 Dec 2022 03:39:58 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216822] New: Thunderbolt USB Controller (Maple Ridge) and its
 upstream pcie port fail to runtime resume
Date:   Mon, 19 Dec 2022 03:39:58 +0000
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
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-216822-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216822

            Bug ID: 216822
           Summary: Thunderbolt USB Controller (Maple Ridge) and its
                    upstream pcie port fail to runtime resume
           Product: Drivers
           Version: 2.5
    Kernel Version: kernel 6.0 and later
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

Created attachment 303426
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303426&action=3Dedit
output of lspci -vt

The xHCI host controller(8086:1138) of the TBT4 add-on card fail to detect =
any
USB-C devices after boot. After forcing the runtime resume by `echo 'on' >
'/sys/bus/usb/devices/usb4/power/control`, the connected usb-c device can be
detected.
After turn on PCI_DEBUG and DEBUG of the usbcode/xhci_hcd, there seems no
problem when the usb port go into runtime suspend
```
[  579.488151] xhci_hcd 0000:13:00.0: set port remote wake mask, actual port
4-1 status  =3D 0xe0002a0
[  579.488221] xhci_hcd 0000:13:00.0: set port remote wake mask, actual port
4-2 status  =3D 0xe0002a0
[  579.488239] hub 4-0:1.0: hub_suspend
[  579.488260] usb usb4: bus auto-suspend, wakeup 1
[  579.488283] xhci_hcd 0000:13:00.0: xhci_hub_status_data: stopping usb4 p=
ort
polling
[  579.488306] xhci_hcd 0000:13:00.0: config port 4-1 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[  579.488316] xhci_hcd 0000:13:00.0: config port 4-2 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[  579.488323] xhci_hcd 0000:13:00.0: config port 3-1 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[  579.488328] xhci_hcd 0000:13:00.0: config port 3-2 wake bits, portsc:
0xa0002a0, write: 0xa0202a0
[  579.488333] xhci_hcd 0000:13:00.0: xhci_suspend: stopping usb3 port poll=
ing.
[  579.488359] xhci_hcd 0000:13:00.0: // Setting command ring address to
0x11aa08001
[  579.488536] xhci_hcd 0000:13:00.0: hcd_pci_runtime_suspend: 0
```

but no messages in kernel after plug in a usb device. I expect to see the
runtime resume first on the upstream port pcieport 0000:00:1d.0, and then t=
he
xhci_hcd 0000:13:00.0 but nothing. Please refer to the attached lspci output
for the device information and suggest what we should do next to find out t=
he
cause. Thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
