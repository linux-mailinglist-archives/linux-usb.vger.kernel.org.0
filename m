Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A637F658A6F
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 09:22:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233160AbiL2IWt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 03:22:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiL2IWq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 03:22:46 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03BC11A16
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 00:22:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7776F61722
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 08:22:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA41AC433F0
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 08:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672302164;
        bh=HOlApPiApwvXcPJ/hqSeBo5CweZ+ND4RGROhDLRG934=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=apTLhnc0RnO5GrLyqppRUNbkTYsa8xYBiDNrEb6jFAEdbqbnfsII+IcxmzBy70+mS
         FPAlLYxuaSPfmsx62xVXM88G/5BZFPtXPsnMn9MbXvC0a1HDncvys8HdQY2CWhuIwJ
         cr1LUCdaRZJD/ai2BNgLjok8nznYTC5PwFht4ArJeZswBpIvXW9BTGqeYOdIeYO6PC
         Rnx3iLBiqy/F6NfqjR9+XRRFazy0XuLGooCoXwmGpa5J7tcjAoO6np0cTY1wvM33NS
         t5ToO8oX8qbIx+2OsSU/WImfpROCWZCWwH52s8X9AB7CJpZOogDSCrtvL1QxUWMADf
         tf2rKbVjYtlDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C0506C43143; Thu, 29 Dec 2022 08:22:44 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216474] Dell XPS 13 9360/Dell DA300: USB Type-C: PCIe Bus
 Error: severity=Corrected, type=Data Link Layer, (Receiver ID)
Date:   Thu, 29 Dec 2022 08:22:44 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216474-208809-DCIdyojnTp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216474-208809@https.bugzilla.kernel.org/>
References: <bug-216474-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216474

Frederick Zhang (frederick888@tsundere.moe) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |frederick888@tsundere.moe

--- Comment #1 from Frederick Zhang (frederick888@tsundere.moe) ---
I recently purchased a Thunderbolt 4 dock and started seeing something simi=
lar
with 6.0 & 6.1 kernels on my Thinkpad.

Dec 29 18:51:05 FredArch systemd[1]: Starting System Suspend...
Dec 29 18:51:05 FredArch systemd-sleep[31007]: Entering sleep state
'suspend'...
Dec 29 18:51:05 FredArch kernel: PM: suspend entry (s2idle)
Dec 29 18:51:07 FredArch kernel: Filesystems sync: 1.566 seconds
Dec 29 18:52:30 FredArch kernel: Freezing user space processes ... (elapsed
0.001 seconds) done.
Dec 29 18:52:30 FredArch kernel: OOM killer disabled.
Dec 29 18:52:30 FredArch kernel: Freezing remaining freezable tasks ...
(elapsed 0.001 seconds) done.
Dec 29 18:52:30 FredArch kernel: printk: Suspending console(s) (use
no_console_suspend to debug)
Dec 29 18:52:30 FredArch kernel: ACPI: EC: interrupt blocked
Dec 29 18:52:30 FredArch kernel: ACPI: EC: interrupt unblocked
Dec 29 18:52:30 FredArch kernel: pcieport 0000:00:1d.0: AER: Multiple Corre=
cted
error received: 0000:21:01.0
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0: PCIe Bus Error:
severity=3DCorrected, type=3DData Link Layer, (Transmitter ID)
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:   device [8086:1136]
error status/mask=3D00001100/00002000
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:    [ 8] Rollover
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:    [12] Timeout
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0: AER:   Error of this
Agent is reported first
Dec 29 18:52:30 FredArch kernel: pcieport 0000:23:00.0: PCIe Bus Error:
severity=3DCorrected, type=3DData Link Layer, (Transmitter ID)
Dec 29 18:52:30 FredArch kernel: pcieport 0000:23:00.0:   device [8086:0b26]
error status/mask=3D00001000/00002000
Dec 29 18:52:30 FredArch kernel: pcieport 0000:23:00.0:    [12] Timeout
Dec 29 18:52:30 FredArch kernel: pcieport 0000:00:1d.0: AER: Corrected error
received: 0000:21:01.0
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0: PCIe Bus Error:
severity=3DCorrected, type=3DData Link Layer, (Transmitter ID)
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:   device [8086:1136]
error status/mask=3D00001100/00002000
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:    [ 8] Rollover
Dec 29 18:52:30 FredArch kernel: pcieport 0000:21:01.0:    [12] Timeout

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
