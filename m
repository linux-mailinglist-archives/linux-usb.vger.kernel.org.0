Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8654775560C
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jul 2023 22:47:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232716AbjGPUrB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jul 2023 16:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232720AbjGPUq5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jul 2023 16:46:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17D0E58
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 13:46:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B12F660EA2
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 20:46:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22BB2C433C9
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 20:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689540415;
        bh=8Six4nC3U/8gKF+79fAwu9POFchwYKcnEUdaI8ER41Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=eGlcLPU/gXN8G2MsrJq4TPbVvIbwq0JiW/b7STlQ3SECzV1DJctHBxpKlWIMrO09d
         5RhXg9w8k3uLBlnlE2E1t+T5lCW5u5nob9kRZvX0OfMczvycLcolS7emOBHncgcVKM
         TwCSvVqk7K3IBFZ3XItaN1CUzXPMKpyoFsmO4z84Pd2M8oPL8YHlRicX4whg3Kc6bP
         Mf4HZ4aFwOoXTZCxppahn9ilDVV5gK4HlaKI/DKobvfHdqrWoSJLQJeNB2Lq5MK7GD
         VjKuX2lgc3ZKfa1Jud2kgGxgWGHEeBfqNpo0D25UD8IoJHbUemlAUIA/glJAY5Tpv1
         ceiX2NQY5Qmew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 099E8C4332E; Sun, 16 Jul 2023 20:46:55 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217674] Thunderbolt dock does not recognize displays connected
 via DP->HDMI cable
Date:   Sun, 16 Jul 2023 20:46:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: planetmarshalluk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217674-208809-qh8fD15vic@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217674-208809@https.bugzilla.kernel.org/>
References: <bug-217674-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217674

--- Comment #4 from Andew Marshall (planetmarshalluk@gmail.com) ---
(In reply to Bagas Sanjaya from comment #3)

>=20
> Do you have this issue on v6.1 stable series?

I tried v6.1 and I get the same issue, although there are no drm errors in =
the
log. Just the one message:

```
[  214.332514] [drm] DMUB HPD callback: link_index=3D2
```

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
