Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0E80754E07
	for <lists+linux-usb@lfdr.de>; Sun, 16 Jul 2023 11:18:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbjGPJSg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 Jul 2023 05:18:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjGPJSg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 16 Jul 2023 05:18:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE35210C
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 02:18:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 539A260959
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 09:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3146C433C7
        for <linux-usb@vger.kernel.org>; Sun, 16 Jul 2023 09:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689499113;
        bh=yrmgsaKRBBmBRL+kPPbXZuuZ86xAvXkGRZ7ocCAfD9Q=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=K3fJ+/akrdT8/13tDcW1XQ+rcE9WCU1owL/2B8h89CQmJSojLh48aviLdRTdKnrGL
         gDhpuEot1YZYih/Wl4qgKj3ZXof+bSHx92swCgb9csqd0X/qoTopTxvTvp9xOio9ns
         J3FzbNz1RR4d186PHXlYzU5lvA1kiWeHcOVaFiYcsog407uasUv636nPI9JwvotGei
         oMzRSPutS+dG/ra1H7Ihy4GnVKhTYSm1duYFh2B8Ngi54WztEBhkPQYma+6P3iA/nt
         YvDGWIgnokaJ+rrxWT3cxVBW7z2qFKnoIztBoSZiwEY5MQ12JAdJk560f2fbVf7gt7
         cFI/beQ5dOSoQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A0D3BC4332E; Sun, 16 Jul 2023 09:18:33 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217674] Thunderbolt dock does not recognize displays connected
 via DP->HDMI cable
Date:   Sun, 16 Jul 2023 09:18:33 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217674-208809-5QdbSXh1AS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217674-208809@https.bugzilla.kernel.org/>
References: <bug-217674-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217674

--- Comment #2 from Andew Marshall (planetmarshalluk@gmail.com) ---
Created attachment 304643
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304643&action=3Dedit
kernel config

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
