Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2179753BA4
	for <lists+linux-usb@lfdr.de>; Fri, 14 Jul 2023 15:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235494AbjGNNSd (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 14 Jul 2023 09:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233638AbjGNNSc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 14 Jul 2023 09:18:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34825134
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 06:18:31 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BD9DC61BD5
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 13:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29FC3C433C7
        for <linux-usb@vger.kernel.org>; Fri, 14 Jul 2023 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689340710;
        bh=rA/Xeky57nl5qoRyb8RUdyukYKXAPGKd3dttbYlzw4k=;
        h=From:To:Subject:Date:From;
        b=TSymN/oE6dEBHr7Ofvpce+ROM+eLSPhVG0/j3V8uIBWkO+jBLuGzn5eHTwcll2neT
         ydUicU54WfcsP/8eoE+YobNtn7LMF7Cs/tAhtoflh9mc9w0tigpfINzeZN8L0f7pEU
         n9Y/CzLUiq0/gLZCSk5Ofcdcmxn5k3X7ADkLzvsbR9RypZV8MEahd02yfcLg52GUUn
         AqTb31BICSf0ZrQmhjkxC2/3rn+bM+YDmwffBGwXuJ7ixFZolPlcOeRRf6eLcPBvDt
         XZq8sC6xgLWCzLo6oDyZmJSdquGrsjY+YJHalKoOSzh/NvwqvASUtLAnnlCWOkjvut
         A6ueLQRs6hF9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0A719C4332E; Fri, 14 Jul 2023 13:18:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] New: Regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Fri, 14 Jul 2023 13:18:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomasz.rostanski@thalesgroup.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

            Bug ID: 217670
           Summary: Regression in USB DWC3 driver in kernel 5.15 branch
           Product: Drivers
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: tomasz.rostanski@thalesgroup.com
        Regression: No

The backport commit to 5.15 branch:
9d4f84a15f9c9727bc07f59d9dafc89e65aadb34 "arm64: dts: imx8mp: Add
snps,gfladj-refclk-lpm-sel quirk to USB nodes"  (from upstream commit
5c3d5ecf48ab06c709c012bf1e8f0c91e1fcd7ad)
switched from "snps,dis-u2-freeclk-exists-quirk" to
"snps,gfladj-refclk-lpm-sel-quirk".

The problem is that the gfladj-refclk-lpm-sel-quirk quirk is not implemente=
d /
backported to 5.15 branch.

This commit should be either reverted, or the commit introducing
gfladj-refclk-lpm-sel-quirk needs to be merged to 5.15 kernel branch.

As a result of this patch, on Gateworks Venice GW7400 revB board the USB 3.x
devices which are connected to the USB Type C port does not enumerate and t=
he
following errors are generated:

[   14.906302] xhci-hcd xhci-hcd.0.auto: Timeout while waiting for setup de=
vice
command
[   15.122383] usb 2-1: device not accepting address 2, error -62
[   25.282195] xhci-hcd xhci-hcd.0.auto: Abort failed to stop command ring:
-110
[   25.297408] xhci-hcd xhci-hcd.0.auto: xHCI host controller not respondin=
g,
assume dead
[   25.305345] xhci-hcd xhci-hcd.0.auto: HC died; cleaning up
[   25.311058] xhci-hcd xhci-hcd.0.auto: Timeout while waiting for stop
endpoint command
[   25.334361] usb usb2-port1: couldn't allocate usb_device

When the commit is reverted the USB 3.x drives works fine.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
