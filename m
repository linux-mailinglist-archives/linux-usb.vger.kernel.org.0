Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7CC57650BF
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 12:18:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbjG0KSJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 06:18:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233643AbjG0KSI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 06:18:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EDF187
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 03:18:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2719761E03
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 10:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89AA6C433C7
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690453086;
        bh=o8Koip8d0z9JK9LHHSnmtBDGq51F/zzqMdVCFtG+1Io=;
        h=From:To:Subject:Date:From;
        b=ph4BrziuvwxpPvHx+/jIv3kdUm0Vqa8XwSHRqzYWc0csNhk3c1zGVJas9/6LIKBam
         EcxzNeYrh3o9MFABLQFNsg+mvLDfpV0qDPgPQncd5GmoHR88aGDcnpUKOlyLyHxN+N
         OMAlf0+G6/Dq3hTwOyIquLg9lDVe6S96HP00a64JXOoSSHq6jzgwFQsUb5rELUjJ+m
         z+SvNqrIcdQC6mg9BWTqxZZk9pegYEVUGwJbUx+k3krARE8LD+EM1Fa8z/aUmlvcCm
         0YekkOJHlqhy7+6qZ0GAZtcj9ic1AofebuUfEg1Mq2o9WlxhnGrhGrGnkVsspzglAx
         qkJ50siu7o03A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 614F7C4332E; Thu, 27 Jul 2023 10:18:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217715] New: USB from Thunderbolt 2 dock disconnects (xHCI host
 not responding)
Date:   Thu, 27 Jul 2023 10:18:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youp1one1@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217715-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217715

            Bug ID: 217715
           Summary: USB from Thunderbolt 2 dock disconnects (xHCI host not
                    responding)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: youp1one1@gmail.com
        Regression: No

System details:

Operating System: openSUSE Tumbleweed=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
          Kernel: Linux 6.4.4-1-default
    Architecture: x86-64
 Hardware Vendor: Lenovo
  Hardware Model: ThinkPad P72
Firmware Version: N2CET65W (1.48 )
   Firmware Date: Mon 2022-08-01


I have an old Elgato Thunderbolt 2 dock connected to my laptop's Thunderbol=
t 3
port via the Apple TB2->TB3 adapter
(https://www.apple.com/shop/product/MMEL2AM/A/thunderbolt-3-usb-c-to-thunde=
rbolt-2-adapter).

I have some USB devices connected to that dock: keyboard, speakers (using U=
SB
audio).
The USB subsystem of the dock randomly disconnects with the following trace:

[50410.012153] xhci_hcd 0000:09:00.0: xHCI host controller not responding,
assume dead
[50410.012191] xhci_hcd 0000:09:00.0: HC died; cleaning up
[50410.012231] usb 5-4: USB disconnect, device number 2

It disconnects randomly less than one hour after fresh boot or hours later,
there is no identifiable pattern. It happens out of the blue while I'm using
the machine normally, usually playing audio to the connected speaker via USB
audio.
Replugging the TB3 cable usually makes USB work again for a while until it
disconnects again. A monitor is connected to this dock via DisplayPort and =
is
unaffected.
I noticed that issue starting with Kernel 6.3.4, although it could have
happened before.

Here's my initial bug report on openSUSE Tumbleweed issue tracker:
https://bugzilla.opensuse.org/show_bug.cgi?id=3D1212019

I can provide any additional info required.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
