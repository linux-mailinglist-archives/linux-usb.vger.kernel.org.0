Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A73A756D75
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jul 2023 21:38:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjGQTiI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Jul 2023 15:38:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231628AbjGQTh7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Jul 2023 15:37:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80BFC9D
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 12:37:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1EEA761234
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 19:37:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 797EFC433C8
        for <linux-usb@vger.kernel.org>; Mon, 17 Jul 2023 19:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689622677;
        bh=BU9zKoDvUNMpcq1l0qnZlazYvoiiwQGgLJTBbmsysho=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HnkLv1zEJt3HBlU+N7lL9ckMywupwv74lF1LNav0YT6ZQDR+eOaQQhIFET4H4eW7k
         yzfb6LFs8RCeItsLpNlzWKCfUfZR10byVMi6A44DsdAKMxXvcGbMqIAHNx5miL51iK
         Mew+Sn79XKaK4K3+QXQmfcnPVSUyPBP/WYVnNnQjb2QGwOtKYwTaruSBfBe+lmp7lD
         tNR1UIbblQ1nd5+/zCKFF9Lj0p9drNIzVyCSeRo0bbW3RASJbZChTd8zHFl4uo8O+u
         7fK3BjCjW90lgyoAZuGORUp1JZXK2xjBXBMZdaymNr2SIlOLUWU1gnI9e0YddWtcy+
         3OmhFO9L6rwqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 56A8AC53BCD; Mon, 17 Jul 2023 19:37:57 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217674] Thunderbolt dock does not recognize displays connected
 via DP->HDMI cable
Date:   Mon, 17 Jul 2023 19:37:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217674-208809-C58KJo7eKy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217674-208809@https.bugzilla.kernel.org/>
References: <bug-217674-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217674

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #5 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
This is very likely a GPU driver or GPU microcode bug.  Can you please bring
the issue to https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
