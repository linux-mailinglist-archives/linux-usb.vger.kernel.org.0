Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 343EC6F898E
	for <lists+linux-usb@lfdr.de>; Fri,  5 May 2023 21:39:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbjEETi6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 May 2023 15:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjEETi5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 5 May 2023 15:38:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC1F2127
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 12:38:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 59E3063066
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 19:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B12B3C433D2
        for <linux-usb@vger.kernel.org>; Fri,  5 May 2023 19:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683315535;
        bh=bPo6/ufVSv3vNkVDy8uF4u339U65xuz/FhR5iGxsBbw=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=Y5Xtn97nuj0kE9IJe9AUXThj+TO+15paZk5+GN0jRiWMbhmU/yURu9P8UITBJp2IG
         Wvmby97Lb84a2ovvqujKp15kEy7U4FUex77xt1e3B31d+9uCgRwDPXTCjoqrid2+kK
         t28/M/nk8Ai37+2rB1E/gDaAU6Etrvtl+XeKAKX2Ke0H0XnLIaGKVQHSQIQvNmwO+F
         G4kdohS6LsfUgEH3zYWszp3/NuvaJE9wMNnw+cJqn/uow7XqKAbryypYnRXMvmMj7S
         vNVP5mzM8WurZ6MVOKrksfUQnYhDUxdIIfOrc9WsPJYYAgh3nIOxC3bXkkYZvrUySy
         sfdGcTFO13dYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 963CAC43142; Fri,  5 May 2023 19:38:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217399] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Date:   Fri, 05 May 2023 19:38:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kubakici@wp.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217399-208809-zjyQckWXK7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217399-208809@https.bugzilla.kernel.org/>
References: <bug-217399-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217399

Jakub Kicinski (kubakici@wp.pl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kubakici@wp.pl

--- Comment #5 from Jakub Kicinski (kubakici@wp.pl) ---
Hi Bernard, are you able to compile your own kernel to see if this simple e=
dit
would fix the problem for you?

diff --git a/kernel/bpf/offload.c b/kernel/bpf/offload.c
index d9c9f45e3529..8a26cd8814c1 100644
--- a/kernel/bpf/offload.c
+++ b/kernel/bpf/offload.c
@@ -859,4 +859,4 @@ static int __init bpf_offload_init(void)
        return rhashtable_init(&offdevs, &offdevs_params);
 }

-late_initcall(bpf_offload_init);
+core_initcall(bpf_offload_init);

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
