Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E965638407
	for <lists+linux-usb@lfdr.de>; Fri, 25 Nov 2022 07:34:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbiKYGeS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Nov 2022 01:34:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiKYGeP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Nov 2022 01:34:15 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 582FD29839
        for <linux-usb@vger.kernel.org>; Thu, 24 Nov 2022 22:34:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D7053622B1
        for <linux-usb@vger.kernel.org>; Fri, 25 Nov 2022 06:34:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DEBAC433C1
        for <linux-usb@vger.kernel.org>; Fri, 25 Nov 2022 06:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669358050;
        bh=rLtY6rW7nIlLfyGzDSD1fBv4MSTx9+AbsKU61MznPDw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=PttFY1LxSa4LUdFe2S9QD/0AcP9ax0kvcq2o9ZznA0SqDmNTDBu/oTxnxAH8M/qpg
         KuHC1YKVoFkpR9GmiuqvWkIkLHxzzdgw6Cdn/9MQdrKtEb5JV+cuhnaPEECIa+Emvf
         o0f3BCGuZSb3maL+wsmdOz9mxpcxyXcINQ6tzSSlT0krAPsMIif1f8G5SxHPeGmWAz
         R8TXde/AQNY3Ws5m7wkwLDgA4xj2endrYluuE0aC5wb+V5hleJu2jDEP8La4unKHoV
         voC4NOYaDiAHPj8EcnkwW3GkSksCIeRf6NA57OAQ7kIQrASfcQW2zrXiQNdCT8Uz5D
         gxI3MrzlMNQLw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 220BDC433E6; Fri, 25 Nov 2022 06:34:10 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Fri, 25 Nov 2022 06:34:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-70BtpQZDfn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

--- Comment #5 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Thanks. It looks like the PCIe link to the xHCI is down:

03:02.0 PCI bridge: Intel Corporation JHL7540 Thunderbolt 3 Bridge [Titan R=
idge
4C 2018] (rev 06) (prog-if 00 [Normal decode])
        Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B- DisINTx+
        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort- <T=
Abort-
<MAbort- >SERR- <PERR- INTx-
        Latency: 0
        Interrupt: pin A routed to IRQ 127
        Bus: primary=3D03, secondary=3D38, subordinate=3D38, sec-latency=3D0
...
                LnkSta: Speed 2.5GT/s (ok), Width x4 (ok)
                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-

I have not seen this one before. What's the firmware version? You can find =
this
out by reading /sys/bus/thunderbolt/devices/0-0/nvm_version.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
