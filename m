Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88165749216
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jul 2023 01:53:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbjGEXxA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Jul 2023 19:53:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGEXw7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Jul 2023 19:52:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB31CF
        for <linux-usb@vger.kernel.org>; Wed,  5 Jul 2023 16:52:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6527A61804
        for <linux-usb@vger.kernel.org>; Wed,  5 Jul 2023 23:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC8EAC43391
        for <linux-usb@vger.kernel.org>; Wed,  5 Jul 2023 23:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688601177;
        bh=lf9RD2o2Vdjfnox/bUtL4lYb1VMBRXJL4lcT6l9O2lk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=XJR5hNppIPJ2soDFNT3vEeg1z3DjhJPZyogqv8+4h8ZQ/SvjkfSr6hXIJuSWXhcRx
         UNtK1tzQMXslYPbUe3gdIblVy4YUuRF0D5nrvcLCrlmdq/PQUu6qpWNSyBDZ3OG6d0
         ED4RN8zcQAgNNOp8Rac8AZbteDXgry3sc3ZKg8IN06w1I1IHSSa1EOi46asY2cydng
         X4fqCzUOz/nGHhM751/7cFlAWb4+tyx9J4F8S5GakkitfeZZREdFpONg8LJm6b8eNC
         AwvOYWHs7OZ7y50l0MoeobJZnFTeH8tYCoIk6fMOUHfLpSRzscUSN2I1QYMONTIo+r
         zi2asWBaA2HkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id BF5EFC53BD2; Wed,  5 Jul 2023 23:52:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date:   Wed, 05 Jul 2023 23:52:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: kernel@dinvlad.dev
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216728-208809-MAw9dBGF7c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

Denis Loginov (kernel@dinvlad.dev) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernel@dinvlad.dev

--- Comment #34 from Denis Loginov (kernel@dinvlad.dev) ---
fwiw, I'm still seeing this issue even with
https://www.spinics.net/lists/linux-pci/msg138650.html applied to 6.4.1

Moreover, this happens even without suspend/resume by just issuing `lspci` =
upon
cold boot. It hangs either immediately or after a few successive lspci's in=
 a
row, with `Unable to change power state from D3cold to D0, device inaccessi=
ble`
appearing shortly after.

The only thing that seems to help is `pcie_aspm=3Doff`. Strangely, it *was*
working even without that previously - I haven't updated the kernel or
BIOS/hardware configuration, and then it started appearing again, even thou=
gh
the patch seems to have worked previously.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
