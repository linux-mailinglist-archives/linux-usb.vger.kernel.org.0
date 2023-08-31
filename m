Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB2E178EB28
	for <lists+linux-usb@lfdr.de>; Thu, 31 Aug 2023 12:56:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238422AbjHaK4b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Aug 2023 06:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjHaK4a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Aug 2023 06:56:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A962CDD
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 03:56:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BBE2960EB0
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 10:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 246B6C433C7
        for <linux-usb@vger.kernel.org>; Thu, 31 Aug 2023 10:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693479387;
        bh=9AnvgvG1rGmy1KM35H92ag1XhzIEX2a1+GkTctPsCy0=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=lnKhFXa7J64y9MUMTxRwsl6Orc9q+52dNcdOZcPiVDqvVYWFaps1UCxH0kKq2twTQ
         LQT/UF0sO1Yf3LJ4Btt/L57Z7jnkEuwEI99LijhQ12U/jDFMfIXseSIKG2kGy0rP7d
         SzIdYMRiNl4MD/EyC2v9mUii/OhdzQTj7Od0WIwKFvfpMGTBGeJQrYdIboMdpt077N
         uCloM6RsTDJPaMutu2IbrbWmGLZnJFGNXO9RF61jRzi6kIQFHtyC4R6UsMfJ/lkkKs
         0j7dl1WkbkJ6QO3GYivDOT3PFKKPcptIM1XtYeZJ1Y4qUgqFZ6bH8XAKGGLZ070VbD
         PDqLwOwvnkZqQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 0B5D3C53BD0; Thu, 31 Aug 2023 10:56:27 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217670] dwc3: regression in USB DWC3 driver in kernel 5.15
 branch
Date:   Thu, 31 Aug 2023 10:56:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217670-208809-zkt1v3C6k8@https.bugzilla.kernel.org/>
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

--- Comment #12 from Greg Kroah-Hartman (greg@kroah.com) ---
On Thu, Aug 31, 2023 at 09:31:51AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217670
>=20
> --- Comment #11 from The Linux kernel's regression tracker (Thorsten
> Leemhuis) (regressions@leemhuis.info) ---
> Greg, guess it fell through the cracks on your side then. You afaics inte=
nded
> to apply these to 5.15.y to fix the regression that was caused by backpor=
ting=20
> 5c3d5ecf48a ("arm64: dts: imx8mp: Add snps,gfladj-refclk-lpm-sel quirk to=
 USB
> nodes") [v6.1-rc1] to 5.15.y:
>=20
> >>> 7bee318838890 usb: dwc3: reference clock period configuration
> >>> a5ae3cbe9dfcc usb: dwc3: Get clocks individually
> >>> 5114c3ee24875 usb: dwc3: Calculate REFCLKPER based on reference clock
> >>> 596c87856e08d usb: dwc3: Program GFLADJ
> >>> a6fc2f1b09278 usb: dwc3: core: add gfladj_refclk_lpm_sel quirk
>=20
> Thomas confirmed that they fix the regression here:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217670#c8

Those ids do not match up properly.  Can we please take this to email on
the stable@vger.kernel.org list?  I thought we resolved this there
already, if not, I need a real list of ids, in the correct order, to
apply please.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
