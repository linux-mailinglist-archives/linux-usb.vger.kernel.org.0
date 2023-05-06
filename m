Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96FB36F90F8
	for <lists+linux-usb@lfdr.de>; Sat,  6 May 2023 11:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230493AbjEFJjs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 6 May 2023 05:39:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231569AbjEFJjp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 6 May 2023 05:39:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E2042719
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 02:39:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2BACC61493
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 09:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C56AC433D2
        for <linux-usb@vger.kernel.org>; Sat,  6 May 2023 09:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683365968;
        bh=8hkc8WryhLpVCZPnZplxDAycpIAnZpBBx1J0bVLV5rk=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=s+bjIlDiHo0CoqprPd3URLVC2PR4Ia4rwMcCYSjzs4d1J0BS8OjZevSeGTAo/WeLU
         y0xBA0VT/JBkAWGam4vEScuQRy3RPA9Pr/r/jUFzFeNTVdJcO3BjV0h/fmBFTAy+bx
         3erAeFYXAmbQsFBlHPKfklSI1vOHNBHi2B3/gTBZ2UgFTZU436Mdjm24qdb49lkW1F
         U52GihbnilCoxN8GkzYnQFL0ZWjmqoRXd2mnzhsEJhBv76+cwC29WWhN8dan1Oi0N8
         ZRAULGJ1BEpJuoGjL3S0qa9yjI8/rZBLOWr3aF8feP2cy5ccKIouR4KY6vRiKxeTcF
         dZ9aH6RrljhWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 75D89C43143; Sat,  6 May 2023 09:39:28 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217399] Kernel OOPS on boot with Kernel 6.3(.1) and RTL8153
 Gigabit Ethernet Adapter
Date:   Sat, 06 May 2023 09:39:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: b.buschinski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217399-208809-wkiPvXLjgl@https.bugzilla.kernel.org/>
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

--- Comment #7 from Bernd Buschinski (b.buschinski@gmail.com) ---
Hi, I applied your patch to 6.3.0 and it works fine. I rebooted 3 times and=
 it
always worked.

Just to be sure, I reverted the Patch and it failed again.

So thanks for your work, it fixes my issue :)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
