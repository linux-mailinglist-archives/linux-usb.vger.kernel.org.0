Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10B37700A3D
	for <lists+linux-usb@lfdr.de>; Fri, 12 May 2023 16:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241503AbjELOX0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 May 2023 10:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241561AbjELOXT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 May 2023 10:23:19 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45FEE14E4D
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 07:23:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C556260D27
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 14:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 250A1C433EF
        for <linux-usb@vger.kernel.org>; Fri, 12 May 2023 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683901393;
        bh=Lx2VdgSEjSqBfRrrU/4ARTZO4iUXUt5Ww29ej/dqTzE=;
        h=From:To:Subject:Date:From;
        b=FrkJ/BLim5edp40w0mFULQZ4kVhwYXRX0+O7m1uyxB7i+sjT+t4ejNAWJq3q46bZt
         xitxOEe1hiezGYGhEH1cJsXwe08agEzmHp3/8gfjLWaRu5En8gBIVbtHG71sAmeQOF
         KsRJyVykC31AMt8G8t1vRbERwgIjXfdmV8hTNvlKO64lYN9p6U6SItLOWFblROjEA0
         IVAgTlwcj1PQH9YGD5KkxGYvb1h+PyKDWS8brlR7ePKXO5VLZ017VE/lyiLOLWkXnt
         ZR/eXWMvG2rcVe8byym5rREPk4coG/ZSMWTVV0Nd35lgW2hwrcynWkb2gjFJks9Gha
         GkoO8a6De0MTg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 058C5C43141; Fri, 12 May 2023 14:23:13 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217434] New: SuperSpeed+ speed reporting wrong from Asmedia
 ASM3242
Date:   Fri, 12 May 2023 14:23:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: james@ettle.org.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217434-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217434

            Bug ID: 217434
           Summary: SuperSpeed+ speed reporting wrong from Asmedia ASM3242
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: james@ettle.org.uk
        Regression: No

I have a PCIe plugin card with an Asmedia ASM3242 controller, PCI ID 1b21:3=
242,
that supports a 20Gbps transfer rate. SuperSpeed+ devices do connect at 10 =
and
20Gbps where supported, but lsusb -t always reports that they are connected=
 at
5Gbps.

The devices I've tested this with are:

 - 10Gbps USB hub
 - RTL9210B based NVME enclosure, 10Gbps
 - ASM236X based NVME enclosure, 20Gbps

I believe the NVME enclosures are connecting at the stated speeds from
observing their measured transfer rates (which would be impossible otherwis=
e).

This issue has been discussed already on linux-usb:

[1] https://marc.info/?l=3Dlinux-usb&m=3D161527212127481&w=3D2

and later when I encountered it:

[2] https://marc.info/?l=3Dlinux-usb&m=3D168046080403282&w=3D2

I applied Thinh's patch from the discussion under [1] ('capture the device
speed
from sublink speed notification') to Linux 6.2.9 and it corrected the
behaviour, but as noted in [2] this was a test-of-concept patch and a proper
xHCI quirk is needed. Unfortunately this is somewhat beyond this reporter's
ability -- hence I've made this KBZ entry, mainly so the issue doesn't get
lost.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
