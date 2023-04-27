Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED266F0D50
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 22:37:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344095AbjD0Uhe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Apr 2023 16:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229790AbjD0Uhc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Apr 2023 16:37:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2228D3ABC
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 13:37:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B03DA63FBB
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 20:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00E9AC4339C
        for <linux-usb@vger.kernel.org>; Thu, 27 Apr 2023 20:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682627837;
        bh=Sh3OhffyvfniT/HeEFJ/uRc8cXUnK3zCBN43nFyO6jQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=SU73kJiCg3Y/oqVg7NPKE0jGDFzHUKdtw0+W5kHacCaKQPUH+k2/X+5DtQGNFJMex
         OwTkJFeyP/uWGSixR4Sq5IWJhiMMPgscYnMCMHl0pVpPhZBFNO99Bpmk2vQag9pSvx
         u0A/Zg0V9Qhp8fObEucqQ6Hfmb/55tTV7p2w5wBXPNKfINFK6QnpX3ZalQNwORqE/k
         NYoA2B6VPhy3BEMHNfZs7x7qCecBysUCrETcRN9gEfCsDhU4VTnFez8mU9wAzgqCJr
         we69sp74IymHarV9FgSdr+wO0eQ4u02OnePOwqgE/tRmSCwYUYONVHwYJ7+FilLzWM
         Tz6ijQlZ6D0xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id D4B2AC43143; Thu, 27 Apr 2023 20:37:16 +0000 (UTC)
From:   bugzilla-daemon@kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 217242] CPU hard lockup related to xhci/dma
Date:   Thu, 27 Apr 2023 20:37:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: miller.hunterc@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217242-208809-Reao6S5nA0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217242-208809@https.bugzilla.kernel.org/>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217242

--- Comment #33 from Hunter M (miller.hunterc@gmail.com) ---
Will be running most computers with the real patch in the fix_ring_expansion
branch for a couple of weeks to verify.

I'll run a few of them with the larger rework next week and post results wh=
en I
get a chance.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
