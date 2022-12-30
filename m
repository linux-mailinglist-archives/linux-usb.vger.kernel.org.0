Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32B5E659B4C
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 19:09:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235509AbiL3SJh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 13:09:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235557AbiL3SJV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 13:09:21 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE2611E3D2
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 10:08:11 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5ED3761B2D
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 18:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8AC2C43396
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672423684;
        bh=jNoBXTOn97sBTMyhzG6fhr6Pz3HAQpUlQGQoNwh7BBI=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=S7ZiCPFjqWa7PaRZq0g76mR2KCpVvc8y+dXegzVIJG1FcUlBoZ7QzznkBlf2dHfaQ
         Br7lr23+vABKFnPxbAlWTN7h92PkX63TPUpAkgcR10p3Hu4B9dEoX6l3XWXAxkjtWB
         t8p8trD7YaCcd3TkB34WNcjjTWSngZOcr2CnDWsq5SxGW9dES/spfwqFthtB1q9+lX
         an2HfJphthM42yljWmiPBvIbin5krd7wSUUS4NEmMPbviKBv4wF6beXlutB2NeT3DH
         KRkulGVIUJWZFHGpu2owVfZGOIY2RsIolILbCHDVo6MFhEO1uax1XLjhBcavL43Y4M
         ijK9piPyG9lNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9D168C43141; Fri, 30 Dec 2022 18:08:04 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216863] ThinkPad X1 Extreme Gen 5: PCIe Bus Error:
 severity=Corrected, type=Data Link Layer, (Transmitter ID) after resuming
 from sleep
Date:   Fri, 30 Dec 2022 18:08:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: frederick888@tsundere.moe
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216863-208809-F4JGKx725u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216863-208809@https.bugzilla.kernel.org/>
References: <bug-216863-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216863

--- Comment #2 from Frederick Zhang (frederick888@tsundere.moe) ---
I just realised that pcie_aspm=3Doff broke most of my dock's functions. I
still had Ethernet but wake-on-lan stopped working. The dock's
Thunderbolt ports, USB Type-A/C data ports, SD card slots all stopped
working too (no logs at all after plugging in things).

Then I tested pcie_aspm.policy=3Dperformance. The dock started working
again but the warning logs were also back.

Also tried applying quirk_disable_aspm_l0s_l1 on the Thunderbolt bridges
but unfortunately I still had the logs.

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 285acc4aaccc..495e976606b6 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2393,8 +2393,11 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev
*dev)
  * disable both L0s and L1 for now to be safe.
  */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080,
quirk_disable_aspm_l0s_l1);

+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1136,
quirk_disable_aspm_l0s_l1);
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x0b26,
quirk_disable_aspm_l0s_l1);
+
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
  * Link bit cleared after starting the link retrain process to allow this
  * process to finish.

And I noticed that the warning logs stopped once I plugged something in
(NVMe enclosure or SD card), and started again once I ran `udisksctl
power-off`. This was without any parameters or patches.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
