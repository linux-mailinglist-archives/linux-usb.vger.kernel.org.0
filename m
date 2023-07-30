Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A3262768721
	for <lists+linux-usb@lfdr.de>; Sun, 30 Jul 2023 20:34:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjG3Sed (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 30 Jul 2023 14:34:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjG3Sed (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 30 Jul 2023 14:34:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D28B10DF
        for <linux-usb@vger.kernel.org>; Sun, 30 Jul 2023 11:34:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8B73660C98
        for <linux-usb@vger.kernel.org>; Sun, 30 Jul 2023 18:34:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCE56C433C7
        for <linux-usb@vger.kernel.org>; Sun, 30 Jul 2023 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690742070;
        bh=2voImRoBji7YZrxm8fO2gCgAbkpBW7fLlfcjA47XAZM=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=l6AyWAqk4p+PzzXadKzUI9Wi+GsnuTqyPVjMOh+fx0x6sdr+WZNILdCTWVNPkDb9F
         YUDQoXPXJ9DLpKSIKqXDHA4VbB5J7qJE8qPMEU/E4HYM8aotHkq9HpBMJdBLWn3Dol
         xllbHTeFhqD2sDNcEPQmRLJifBtZzzn27bGvyCTH08gF6VszdMgGt+QS28eoTWBcxG
         SAow7jMCMmXnkVoPgPINRkIO7ie+43Ak6+rjs1cDxQygF8FVh6TWT9wHhV76XWwC2e
         mq0hKAcyad05dgQQBxFmGe7j3ZyDeBwea1Wm2m2fccuu+1FrMc98rztOhKLbHirBXl
         a3uaRGz3qJEBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id C4A0CC4332E; Sun, 30 Jul 2023 18:34:30 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217715] USB from Thunderbolt 2 dock disconnects (xHCI host not
 responding)
Date:   Sun, 30 Jul 2023 18:34:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217715-208809-TDRIVxiAb7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217715-208809@https.bugzilla.kernel.org/>
References: <bug-217715-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217715

--- Comment #5 from youp1one1@gmail.com ---
I've been testing with v6.5-rc3 and it has been promising, with no
disconnections during several hours.

For the time being, I had to revert to the distro's current kernel for other
reasons (some third party modules not being compiled for 6.5) but I will be
able to definitely tell is v6.5 fixes this issue when Tumbleweed is updated=
 to
it, I suppose in a few weeks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
