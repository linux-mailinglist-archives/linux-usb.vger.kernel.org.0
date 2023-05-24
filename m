Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B78070F1BD
	for <lists+linux-usb@lfdr.de>; Wed, 24 May 2023 11:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240172AbjEXJFM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 May 2023 05:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240314AbjEXJFJ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 May 2023 05:05:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C443D132
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 02:05:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5072E62DBD
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 09:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3D28C4339B
        for <linux-usb@vger.kernel.org>; Wed, 24 May 2023 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684919106;
        bh=1gubJl0zdt0iG3Qx2UpMaAzTHqtHlZGO2E1AH5uYvgM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eYQJw0pHpnfmc/kQLzEJRc7lJOCFw3wSTbc5m9h0/rAFmBBYmql7r76BBK5Ip+kmG
         yhX1NyCzvb/qR/LT2tod8m0fRDXNYkeGbCvU4fWib8ZvkX0hBEHXPQJSOaTmd6DnF6
         lUgenVrZgX8P9Y297adpmMH6nIiFyTwW4RXi//0cqtD7JNGTTPB9oE1cItSQW/6exZ
         2QIDJUHi3l36oiv3gVBhIqyX15g7nVZSjQ8K1p9RQiU+EkfhhoqjZqD2coQphTXbhs
         nIdaBJhZyegTNsyzv5hXONVV4V7FySo9toG0cni1EaovaUICZyCsoXEqUVm9Fv3uzk
         SfZnAcYBv37vg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 9CC30C43141; Wed, 24 May 2023 09:05:06 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217475] Foxconn / Hon Hai Bluetooth adapter 0489:e0cd stops
 working on ThinkPad T14s AMD Gen1
Date:   Wed, 24 May 2023 09:05:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: berto@igalia.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217475-208809-UsyUCgQHcF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217475-208809@https.bugzilla.kernel.org/>
References: <bug-217475-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217475

--- Comment #2 from Alberto Garcia (berto@igalia.com) ---
I have always had this problem with this computer. Linux got support for th=
is
Bluetooth adapter in 5.14 if I'm not wrong (64832df2ac05) and I probably tr=
ied
it for the first time with 5.15.3. I never saw it working fine, and I have
tried lots of kernels and firmware versions since then. The most recent one=
 was
6.3.3 as I mentioned in the bug report.

Since I can make it work with a Windows VM using USB passthrough I assume t=
hat
there's some problem with the initialization of the adapter, the HCI or
something like that, but that's all I can guess with my limited knowledge of
USB.

To make it clear: when I talk about using a VM I'm talking about the scenar=
io
where

1) I cannot use Bluetooth in my Linux system because of one of the errors t=
hat
I mentioned earlier ("hci0: Failed to get device id (-108)"). The device is=
 not
detected by the Bluetooth stack although it does appears in lsusb.
2) I launch a Windows VM using QEMU right away, without rebooting the compu=
ter
or doing anything else. The BT adapter works in that VM always.
3) If I launch a Linux VM instead it tends to work, not always in this case=
 but
I have a higher success rate than if I remove and reload the btusb module on
the host.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
