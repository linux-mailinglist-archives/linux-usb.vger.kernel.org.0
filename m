Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75977618609
	for <lists+linux-usb@lfdr.de>; Thu,  3 Nov 2022 18:19:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbiKCRTk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Nov 2022 13:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231182AbiKCRTj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Nov 2022 13:19:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7082C1001
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 10:19:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1B01CB82963
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 17:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8FBF7C433C1
        for <linux-usb@vger.kernel.org>; Thu,  3 Nov 2022 17:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667495975;
        bh=uF7PNzESX8zmFtf8qJcgAuvEFgHmWop99tEYz1PYU64=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=c1x9k3DCeHCT3bfFSxdXTavc4iz/aPtCs/6J5JlOsh+HJ7YFOqAyKw3cLDhtSiMLf
         G2bhomrtT80Oyon6uzm08DVEiuYWUeFPCLw7a05/d3wcg9K4jYQAMCh6Bg1EHKrDWe
         KbJH9iQBS9rTcRxWRuDJnBPlMVYf3MhQUTEN4cY3UH3QIRVV0gT+X2Y6CuWfchZ2oi
         oBL3XntKFWDeCIO79eANvIb5JfCdcvSBUx2OW4ZX3ekBQ/l0dvzXB4avIemp6afCRW
         x0FIqIRCJsZMEfr8SgzOCoxl+NzaCFHTGxTLtBNKdEH2MdIi/OFXu3OsyHRPL7/YpM
         D25b/5nCywOxg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 785C0C433E7; Thu,  3 Nov 2022 17:19:35 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Thu, 03 Nov 2022 17:19:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kjhambrick@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214259-208809-waby6hCGT3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

--- Comment #26 from Konrad J Hambrick (kjhambrick@gmail.com) ---
Bjorn --

The referenced efi_mmio-2 Patch applied cleanly on 5.15.77 and I am buildin=
g a
5.15.77_bjorn_p Kernel now.

I'll have to wait until after work to install and boot but I'll enable Disc=
rete
Thunderbolt in my Insyde EFI Bios and boot 5.15.bjorn_p

Thank You !

-- kjh

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
