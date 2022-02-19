Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78F4A4BC7D3
	for <lists+linux-usb@lfdr.de>; Sat, 19 Feb 2022 12:20:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236554AbiBSLLx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 19 Feb 2022 06:11:53 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbiBSLLx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 19 Feb 2022 06:11:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A9E1C914
        for <linux-usb@vger.kernel.org>; Sat, 19 Feb 2022 03:11:33 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 3260560CBA
        for <linux-usb@vger.kernel.org>; Sat, 19 Feb 2022 11:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AC3BC340EF
        for <linux-usb@vger.kernel.org>; Sat, 19 Feb 2022 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645269092;
        bh=2FA5ZvIW3HXZNF4k19lpxMuHM+760UoX9hx4Bn4in0A=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OXPiw3YKIuA3wHo4KBHXB0Md0Ip4zZU3KV3SwQ0qAx6fN8bAhmejrxri2McgvkLS9
         phXevnhnZgtZKFI+5sWmEdaGAlHgYXIwKGah7L5MAW8mElaf+xdHV/nIBShea5gXIZ
         WS51Eo1zjNj8+JJsgB9P7maNNSQt3ROCxM6yv+pUGuQJwzOhjc/SCOGSNyBNGkHTP5
         riRSYJ+HoVpKA6YTQ0CNGNemBjM+07JIEBHWq/B/Bcvh/nww7fcN+q7+uHyqduYnr5
         JJzG5W4Ege3u5aTxZFvm8oO2zQW7b3A57lU7fk7oLiKI4x+54H8enXW0GToJM56mh4
         1kgqyL88oQmow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 8AA95CAC6E2; Sat, 19 Feb 2022 11:11:32 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 209555] dwc2 driver stops working after sudden disconnect
Date:   Sat, 19 Feb 2022 11:11:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t123yh@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209555-208809-MonAkoCMUH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209555-208809@https.bugzilla.kernel.org/>
References: <bug-209555-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D209555

--- Comment #33 from Yunhao Tian (t123yh@outlook.com) ---
Hi,

Just discovered the real issue of my case. dwc2_gadget_enter_clock_gating
doesn't seem to be working for my RK3308, so disabling clock_gating does the
trick for me.=20

Specifically, I added=20

  p->no_clock_gating =3D true;=20

in dwc2_set_rk_params, and everything now works.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
