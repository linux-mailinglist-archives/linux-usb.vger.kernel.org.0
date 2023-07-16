Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8611B754DF8
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jul 2023 11:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229804AbjGPJKj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jul 2023 05:10:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbjGPJKi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jul 2023 05:10:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 127A0E50
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 02:10:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F35260C50
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 09:10:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0062DC433C7
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689498636;
        bh=8kgAVeiBA3Cy9e++zQZwH7t7YolUUH+h+7jzm+wGl5I=;
        h=From:To:Subject:Date:From;
        b=X+BuLHiKIux83851CFq7kXHD2XctboJXYv8dhLPkzCuk8wqcfFnfNuN3Ref3KogJ4
         HaWJQm6fS918LAwUTaTuW7XVOMsbfkMT85jugaexoyf2wKeTwAvtwNF3+MUTNKSzbC
         JPG8R6hG5YdY8pt0LBKKr8XUb35ZRUzbtW+c9UQZuSEazlt3BAjmg1caFoTs/v90ZR
         +wPB7WeJTA8Z+hih+D/6uEmsWZEOhgSMqKbuCb3PRiyW5ihhWX3OzwV7H8b3GpzKLU
         ECh6SkJ+A22wfUDDs9dw7LQS5waVtloxQ0bnfn3VURG0yMnntjfQmlHh31cbGTnS6L
         dzpg3VqqOmCRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C799FC4332E; Sun, 16 Jul 2023 09:10:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217674] New: Thunderbolt dock does not recognize displays
 connected via DP->HDMI cable
Date:   Sun, 16 Jul 2023 09:10:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: planetmarshalluk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217674-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217674

            Bug ID: 217674
           Summary: Thunderbolt dock does not recognize displays connected
                    via DP->HDMI cable
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: planetmarshalluk@gmail.com
        Regression: No

Created attachment 304641
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304641&action=3Dedit
lspci -v output

Summary
-------

When using a thunderbolt dock with 2x DisplayPort connectors, the displayys=
 are
not recognized when connected with DP->HDMI cables. Connecting over DP->DP
cables work as expected.

Expected Behaviour
------------------

Displays connected to the dock via DP->HDMI cables should be recognized.

Actual Behaviour
----------------

Displays connected to the dock via DP->HDMI cables are not recognized. The
following messages are reported in `dmesg`

```
[68022.156971] thunderbolt 0-2: new device found, vendor=3D0x6f device=3D0x=
12
[68022.156977] thunderbolt 0-2: StarTech.com TB3CDK2DP
...various USB connection messages...
[68139.834086] [drm] DMUB HPD callback: link_index=3D2
[68139.834859] [drm] DPIA AUX failed on 0x0(1), error 3
[68139.836167] [drm] DPIA AUX failed on 0x0(1), error 3
(etc)
```
USB ports and network connection functions as expected.


Steps to Reproduce
------------------

Laptop used is Asus G14 (2023) model GA402NV
Dock is Startech TB3CDK2DP
Reproduced on Linux Kernel 6.4.3 from stable repo

1. Connect laptop to dock over USB-C
2. Connect an external display with DP->HDMI cable
3. Open appropriate display settings to see if external display is recogniz=
ed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
