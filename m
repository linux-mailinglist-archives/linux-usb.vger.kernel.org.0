Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0AC4D44D8
	for <lists+linux-usb@lfdr.de>; Thu, 10 Mar 2022 11:40:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241345AbiCJKlv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Mar 2022 05:41:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241131AbiCJKlu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 10 Mar 2022 05:41:50 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFC60139136
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 02:40:48 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7137E60A6E
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 10:40:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D31E3C340E8
        for <linux-usb@vger.kernel.org>; Thu, 10 Mar 2022 10:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646908847;
        bh=ij0ozH6RDR26MYPPsF/vP0ck2RNBhtvbD7OoECka39A=;
        h=From:To:Subject:Date:From;
        b=dGB+TNBXo5PTLbkT/8E9tf8jqjvmwD/YUZ2jOW5m+lNUCZg69SoRFlHq1HNE0y9ae
         0tQnuPSU+/RcCT4U1Xf2NZELw8U9CMQx+WXxIpmxzwhu02VYsq1jB1FiNzKIjnjD8e
         kbaNtWIRsl011b5D+TFn/Ynn6uQA+Hubkbio7dzjpj4iTVqnHr1ueys0qpfMdaGXEg
         x24qp4cyNfnYe57t+htExNEmlzMdGp873AO23/GoJDxH8BsQyYBLKPIx+lwK3+vIoa
         VosFnM/9kNouAo+ZXV1lgz52u77tPeeTG7J+uqxEampWYUl9oBfLs3JLqztgt3g4YT
         GljX9Wlo1786A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B77E4C05F98; Thu, 10 Mar 2022 10:40:47 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 215672] New: CalDigit TS4 Audio Port Errors
Date:   Thu, 10 Mar 2022 10:40:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: juergen@steitz.work
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-215672-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D215672

            Bug ID: 215672
           Summary: CalDigit TS4 Audio Port Errors
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.15.26-1-lts (Archlinux)
          Hardware: Intel
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: juergen@steitz.work
        Regression: No

Got myself a CalDigit TS4 Dockingstation.=20=20
Connecting a PreSonus Eris Studio monitors to the back or front audio port =
and
playing music throws repeated errors and the music is scratched (?), while
other connected USB devices (Apple Magic Trackpad) stop working correctly.=
=20=20

This also happens with all tested headphones that I own.


```
[49139.289286] usb 5-1.1.2.5: new full-speed USB device number 12 using
xhci_hcd
[49139.433288] usb 5-1.1.2.5: New USB device found, idVendor=3D2188,
idProduct=3D6537, bcdDevice=3D 1.13
[49139.433300] usb 5-1.1.2.5: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[49139.433306] usb 5-1.1.2.5: Product: CalDigit TS4 Audio - Front
[49139.433310] usb 5-1.1.2.5: Manufacturer: CalDigit,Inc.
[49139.511072] input: CalDigit,Inc. CalDigit TS4 Audio - Front as
/devices/pci0000:00/0000:00:1b.0/0000:01:00.0/0000:02:01.0/0000:04:00.0/000=
0:05:00.0/0000:06:00.0/usb5/5-1/5-1.1/5-1.1.2/5-1.1.2.5/5-1.1.2.5:1.3/0003:=
2188:6537.0033/input/input79
[49139.579897] hid-generic 0003:2188:6537.0033: input,hidraw9: USB HID v1.11
Device [CalDigit,Inc. CalDigit TS4 Audio - Front] on
usb-0000:06:00.0-1.1.2.5/input3
[49140.479258] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 36
[49140.479277] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2480
trb-start 000000030e8c2490 trb-end 000000030e8c2490 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49140.582249] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49140.582263] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2ac0
trb-start 000000030e8c2ad0 trb-end 000000030e8c2ad0 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49140.829272] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49140.829280] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5faa70
trb-start 00000004ca5faa80 trb-end 00000004ca5faa80 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49140.949630] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49140.949645] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c21d0
trb-start 000000030e8c21e0 trb-end 000000030e8c21e0 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49141.100293] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49141.100308] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2b30
trb-start 000000030e8c2b40 trb-end 000000030e8c2b40 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49141.196319] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49141.196334] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5fa180
trb-start 00000004ca5fa190 trb-end 00000004ca5fa190 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49141.350226] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49141.350239] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5faae0
trb-start 00000004ca5faaf0 trb-end 00000004ca5faaf0 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49141.446326] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49141.446340] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2130
trb-start 000000030e8c2140 trb-end 000000030e8c2140 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49141.548382] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49141.548397] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2770
trb-start 000000030e8c2780 trb-end 000000030e8c2780 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49142.065367] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49142.065381] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c27e0
trb-start 000000030e8c27f0 trb-end 000000030e8c27f0 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49142.332397] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49142.332412] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5fa8a0
trb-start 00000004ca5fa8b0 trb-end 00000004ca5fa8b0 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49142.449466] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49142.449480] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5fafe0
trb-start 000000030e8c2000 trb-end 000000030e8c2000 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49142.534410] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49142.534424] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2530
trb-start 000000030e8c2540 trb-end 000000030e8c2540 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49142.684397] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49142.684411] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2e90
trb-start 000000030e8c2ea0 trb-end 000000030e8c2ea0 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49142.732314] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49142.732329] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5fa1c0
trb-start 00000004ca5fa1d0 trb-end 00000004ca5fa1d0 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49143.030209] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49143.030219] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2490
trb-start 000000030e8c24a0 trb-end 000000030e8c24a0 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49143.148261] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49143.148272] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2be0
trb-start 000000030e8c2bf0 trb-end 000000030e8c2bf0 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49143.249376] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49143.249391] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5fa230
trb-start 00000004ca5fa240 trb-end 00000004ca5fa240 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49143.348252] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49143.348267] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5fa870
trb-start 00000004ca5fa880 trb-end 00000004ca5fa880 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49143.449317] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49143.449336] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5faeb0
trb-start 00000004ca5faec0 trb-end 00000004ca5faec0 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49143.548250] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49143.548265] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2500
trb-start 000000030e8c2510 trb-end 000000030e8c2510 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49143.647277] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 36
[49143.647291] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2b40
trb-start 000000030e8c2b50 trb-end 000000030e8c2b50 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49143.734319] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49143.734334] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5fa080
trb-start 00000004ca5fa090 trb-end 00000004ca5fa090 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49143.830141] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49143.830156] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5fa6c0
trb-start 00000004ca5fa6d0 trb-end 00000004ca5fa6d0 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49143.916404] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49143.916420] xhci_hcd 0000:06:00.0: Looking for event-dma 00000004ca5fac00
trb-start 00000004ca5fac10 trb-end 00000004ca5fac10 seg-start 00000004ca5fa=
000
seg-end 00000004ca5faff0
[49144.017421] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49144.017436] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2250
trb-start 000000030e8c2260 trb-end 000000030e8c2260 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49144.065305] xhci_hcd 0000:06:00.0: ERROR Transfer event TRB DMA ptr not =
part
of current TD ep_index 1 comp_code 1
[49144.065319] xhci_hcd 0000:06:00.0: Looking for event-dma 000000030e8c2570
trb-start 000000030e8c2580 trb-end 000000030e8c2580 seg-start 000000030e8c2=
000
seg-end 000000030e8c2ff0
[49144.100010] usb 5-1.1.2.5: USB disconnect, device number 12
[49144.102251] usb 5-1.1.2.5: Unable to submit urb #2: -19 at
snd_usb_queue_pending_output_urbs
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
