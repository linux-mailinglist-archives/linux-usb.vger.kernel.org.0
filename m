Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A17D78E96E
	for <lists+linux-usb@lfdr.de>; Thu, 31 Aug 2023 11:31:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238583AbjHaJb5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Aug 2023 05:31:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231946AbjHaJb5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Aug 2023 05:31:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22161194
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 02:31:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id C10D6B8201C
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 09:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81D14C433C9
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 09:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693474311;
        bh=l52qP5FhJi7bpA7d21UZv4HDwNwri+FPtdC+Kr1Xr7g=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=X4xM+Vwgnwztl53mjjhS3qI393YltC/VmEUSGupYnkssTR3zZ4ElhJKKO3rMVdg0d
         v64HANUO/rrHQgqJY8b9Jlmo3kZAQG/OhSYGFewEnVq1WOn25yXK+4muvM1YEYIQNn
         ODSIesxPnAXXbRB7v39YuVnQA6ztjYVWbqSpSvaxEXOWTUGWURoFG3pM9WnVcpP+ST
         p8U08K7xlsd9bbfQ38UHUAIqg3eQWFqDKelddj6l47u+d5a97XvE4OIH7DqdiENRFX
         rK7JRMimsP/HZdKdufcOFVUlj6KpFwGr5QDlcBySTpH0cShRXim20BNZ8QVlVZLNsG
         TstSsG3d/1kiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 5E8EBC4332E; Thu, 31 Aug 2023 09:31:51 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Thu, 31 Aug 2023 09:31:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-mthqKYqLLi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217670-208809@https.bugzilla.kernel.org/>
References: <bug-217670-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D217670

--- Comment #11 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
Greg, guess it fell through the cracks on your side then. You afaics intend=
ed
to apply these to 5.15.y to fix the regression that was caused by backporti=
ng=20
5c3d5ecf48a ("arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to U=
SB
nodes") [v6.1-rc1] to 5.15.y:

>>> 7bee318838890 usb: dwc3: reference clock period configuration
>>> a5ae3cbe9dfcc usb: dwc3: Get clocks individually
>>> 5114c3ee24875 usb: dwc3: Calculate REFCLKPER based on reference clock
>>> 596c87856e08d usb: dwc3: Program GFLADJ
>>> a6fc2f1b09278 usb: dwc3: core: add gfladj_refclk_lpm_sel quirk

Thomas confirmed that they fix the regression here:
https://bugzilla.kernel.org/show_bug.cgi?id=3D217670#c8

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
