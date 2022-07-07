Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1FC6856AD4E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 23:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236649AbiGGVQx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 17:16:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236225AbiGGVQw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 17:16:52 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1038F30F46
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 14:16:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A7A0B623F9
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 21:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 125CCC3411E
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 21:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657228611;
        bh=c+3xk/0bufybb9z0NZ/duP+y6OyrKQA3fR26Gcdb8zQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Lv8dd42pqnjT1StfRgxXaW4krkJq98/vckczgd635OlaDOCbIIYwyW0k7+HjoWXMi
         9wZ/iRB6ZOhd/p+vBcinhKT1j3t70LDzastj5o88xFjW8g6xSSB9dhZ3FBytX9nVCT
         dXcFe6FeZ6vE6LMulRXi6EXOSJbiUwmI1efkrUvnQH2Bsr0pL4dpuvZRrU81Cpc4dd
         kC/MKer+87VryffF1DsLrGJuoCJQbVeJ0ptsikO0MSu5uWfTG48vTlG+eqPprnW9b2
         8TJWhmpN+oEovxgqFppEjAhejt2SUEZ0pSmCFp1afK23bmfMU9u1Odn2jeICE1RxKn
         BZ7nybibh/hTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id EECEFC05FD6; Thu,  7 Jul 2022 21:16:50 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Thu, 07 Jul 2022 21:16:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-uEdU4RZ0De@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #22 from Konrad J Hambrick (kjhambrick@gmail.com) ---
(In reply to Konrad J Hambrick from comment #21)
> Hans --
>=20
> I have exactly the same Hardware and when I Enable my Discrete ThunderBolt
> in the BIOS, I experience a series of TimeOut delays during Boot.
>=20
> I am running 5.15.53 on Slackware64 15.0 ...
>=20
> I don't have a Dock for my LapTop so I am not sure this bug is a duplicate
> of https://bugzilla.kernel.org/show_bug.cgi?id=3D206459
>=20
> Q1: Is your Patch Series still viable ?
>=20
> If so, your second link above for the patch series no longer works:=20=20
> https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=3D=
pci/
> resource
>=20
> Q2:  Was this patch ever included in the kernel source tree ?
>=20
> If so, what version should I try ?
>=20
> Thanks !
>=20
> -- kjh

p.s. this is my dmesg with the Discrete Thunderbolt Enabled:

[    9.359600] input: SynPS/2 Synaptics TouchPad as
/devices/platform/i8042/serio2/input/input15
[   27.953327] DMAR: DRHD: handling fault status reg 2
[   27.959653] DMAR: [DMA Write NO_PASID] Request device [07:00.0] fault ad=
dr
0x69935000 [fault reason 0x05] PTE Write access is not set
[   48.433330] DMAR: DRHD: handling fault status reg 2
[   48.438777] DMAR: [DMA Write NO_PASID] Request device [07:00.0] fault ad=
dr
0x69935000 [fault reason 0x05] PTE Write access is not set
[   68.913306] DMAR: DRHD: handling fault status reg 2
[   68.919850] DMAR: [DMA Write NO_PASID] Request device [07:00.0] fault ad=
dr
0x69935000 [fault reason 0x05] PTE Write access is not set
[   89.387726] thunderbolt 0000:07:00.0: failed to send driver ready to ICM
[   89.394835] thunderbolt: probe of 0000:07:00.0 failed with error -110

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
