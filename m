Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 30C0F56AD49
	for <lists+linux-usb@lfdr.de>; Thu,  7 Jul 2022 23:13:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236656AbiGGVNV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Jul 2022 17:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236225AbiGGVNU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Jul 2022 17:13:20 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CBCE20180
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 14:13:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 19C02B823D3
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 21:13:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2CACC3411E
        for <linux-usb@vger.kernel.org>; Thu,  7 Jul 2022 21:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657228396;
        bh=UHyGgaqOCBfbl2Tab22LxeFPzAEK90nLaJxU/flHpuc=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=aLUgTlQbaquJPSR4u9TVrM1WZ6ymrdkZPJ9jm7WTA6VtNtya9ixYorNYL0TaFwRuR
         YpDy/+D8Ti4gpwJtpAzeZEANyQHMVSNjMy9Ri2oZGGiAegezoPPOunseXxIDxEzyWp
         TikO29A7Q4pYOFtEHLzF5agGaWukdN1i7ID6aHcOVEU3+y0HpryqEjNejXcX2Pvuv2
         oWxjGONVsqP5WAlQF+YLdo5CNIzhhFqvo4resisafwhaHG+6E+CO8Qa/QUEdnBIESn
         Vd5PWvOdtj9gAGZd4vj9DV8KxfGIqhfzJMztKbCHO0M+2k6WhJdSZXBtVdSM/PwcUF
         sFWA1GXwGecpA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id B94B0CC13B0; Thu,  7 Jul 2022 21:13:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214259] Discrete Thunderbold Controller 8086:1137 throws DMAR
 and XHCI errors and is only partially functional
Date:   Thu, 07 Jul 2022 21:13:16 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214259-208809-LTIlGw1PQz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214259-208809@https.bugzilla.kernel.org/>
References: <bug-214259-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214259

Konrad J Hambrick (kjhambrick@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kjhambrick@gmail.com

--- Comment #21 from Konrad J Hambrick (kjhambrick@gmail.com) ---
Hans --

I have exactly the same Hardware and when I Enable my Discrete ThunderBolt =
in
the BIOS, I experience a series of TimeOut delays during Boot.

I am running 5.15.53 on Slackware64 15.0 ...

I don't have a Dock for my LapTop so I am not sure this bug is a duplicate =
of
https://bugzilla.kernel.org/show_bug.cgi?id=3D206459

Q1: Is your Patch Series still viable ?

If so, your second link above for the patch series no longer works:=20=20
https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/log/?h=3Dpc=
i/resource

Q2:  Was this patch ever included in the kernel source tree ?

If so, what version should I try ?

Thanks !

-- kjh

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
