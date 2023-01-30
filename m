Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B997A681A1C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 20:14:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238356AbjA3TOY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 14:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238385AbjA3TON (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 14:14:13 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A963E38B6C
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 11:14:08 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id DFDFECE1928
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 19:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19913C433A4
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 19:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675106045;
        bh=sopm4pvyymCB89K1YakRwawaLabXNmjv3CKL2hkqeUw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=C/2XF9HEe6c27GvP43IPXK3YIkD2mON2OVxYze1APBk2czuAoMmiW3UCR3Q3D9YER
         8dZE4F/xJSmMxh3+5prU1+buqkACUMu6WseAVUg9Un1l7MhPrlZnRFI20kqa1zVJCO
         OBwivWiZTDUywKcTdS/3Ioc9L1Evkto4L9sBISPj95rpVVAq2IxQYN/2TgVkBMHkuo
         8yzjjjzk057CglR2HPdkLVOj5CAqfqxQuAJrNMU2QgaC/AfOIhkiSZPUM64SIEelpS
         xDtGzskKwOBxexokQBk+K3b7fz4XBm7mztpKh9lHZyA76RD+3A4j4jSiUKouj+2h7f
         E0q3KY437gTWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 085C6C43141; Mon, 30 Jan 2023 19:14:05 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216697] Resume from suspend stopped working
Date:   Mon, 30 Jan 2023 19:14:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: oliver@diereehs.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216697-208809-yfY4SpJgn5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216697-208809@https.bugzilla.kernel.org/>
References: <bug-216697-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216697

--- Comment #15 from Oliver Reeh (oliver@diereehs.de) ---
I figured that already ...

I'm running a patched kernel 6.1.8 for two days with lots of USB-C/Thunderb=
olt
plugging and unplugging without any issues.
No more lockups after suspend and no more kernel oops in the logs.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
