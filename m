Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA505B6207
	for <lists+linux-usb@lfdr.de>; Mon, 12 Sep 2022 22:12:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229577AbiILUMG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Sep 2022 16:12:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiILUMF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 12 Sep 2022 16:12:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA8B7205EE
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 13:12:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 769B5B80C68
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 20:12:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DA40C433D6
        for <linux-usb@vger.kernel.org>; Mon, 12 Sep 2022 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663013522;
        bh=EoWT2tRmrE0PNqQRz6MpZ0aZs5sRiCy31pNAjynjQuQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=FOwalxBFMSTS0POSNnFb57XawxXceCfG1r3mM9HdEOnC6EwbliMYyQZ1X8OyS0E6r
         feVH04rWLH0pg4j1XGaMpZQZt5AiwD9yeLnj6Fih57w1JbCmi3UDjVKC6GUg6WZiYf
         exRUjhm1tp96AMGiqsmt7GEOrLRnxsH1r9mTPO6X2miKPpak6680HTDr2juEnFenAi
         sfk5U4NTIjaG0olvJ1D/GDJCit/1tdxdhav6caxQ6DeXPZStDMhTZQbmCIWMWbuCIA
         csj2lSrTZ056q173NZ7CVOlbjIl7eLIhts2eGtBLw/SuwjKz4a//JDSP8Qw4t2vNza
         lhDDKrFQeyi/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 147BEC433E6; Mon, 12 Sep 2022 20:12:02 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 216470] [Regression] xhci_hcd 0000:08:00.2: xHC error in
 resume, USBSTS 0x401, Reinit
Date:   Mon, 12 Sep 2022 20:12:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-216470-208809-r6jGsV27VS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216470-208809@https.bugzilla.kernel.org/>
References: <bug-216470-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216470

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |mario.limonciello@amd.com

--- Comment #3 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
It's a new message as of 5.17-rc6 or later.

https://github.com/torvalds/linux/commit/8b328f8002bcf29ef517ee4bf234e09aab=
ec4d2e

The behavior however is not new; it's due to this quirk introduced a few ye=
ars
back for your model.

https://github.com/torvalds/linux/commit/a7d57abcc8a5bdeb53bbf8e87558e8e0a2=
c2a29d

I don't think we should be doing anything functionally here.  The only think
that might make sense IMO is downgrading the message to INFO or not showing=
 it
instead of WARN when `xhci->broken_suspend` is set.

Something like this:

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 38649284ff88..a7ef675f00fd 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -1183,7 +1183,8 @@ int xhci_resume(struct xhci_hcd *xhci, bool hibernate=
d)
        /* re-initialize the HC on Restore Error, or Host Controller Error =
*/
        if (temp & (STS_SRE | STS_HCE)) {
                reinit_xhc =3D true;
-               xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x, Reinit\n=
",
temp);
+               if (!xhci->broken_suspend)
+                       xhci_warn(xhci, "xHC error in resume, USBSTS 0x%x,
Reinit\n", temp);
        }

        if (reinit_xhc) {

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
